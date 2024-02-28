# Utility Script to Push Candidate configuration to Prisma Access
# Spec information can be found here: https://pan.dev/access/api/prisma-access-config/post-sse-config-v-1-config-versions-candidate-push/
# This script is designed to be used with Terraform to push candidate configuration to Prisma Access

import requests
import json
import sys
import os
import time
from time import sleep
from tqdm import tqdm
import logging
import urllib3
import session
import click

pa_session = session.PanApiSession()
pa_session.authenticate()

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s %(message)s')
logger = logging.getLogger(__name__)

# Set up URL
base_url = "https://api.sase.paloaltonetworks.com"
url = base_url + '/sse/config/v1/config-versions/candidate:push'


@click.command()
@click.option('--f', default='Remote Networks', help='List of string of folders')
@click.option('--timeout', default=100, help='Integer of timeout in seconds')
def push_candidate_config(f, timeout):
    """Push candidate configuration to Prisma Access
    :param f: List of folders to push candidate configuration to
    :param token: Access token
    :return: Job ID
    """
    folders = f.split(sep=",")
    payload = {
        'description': "Terraform Pushed Candidate Configuration",
        'folders': folders
    }
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {pa_session.access_token}'
    }
    logger.info(f'Pushing candidate configuration to Prisma Access for folders: {folders}')
    r = requests.post(url, headers=headers, data=json.dumps(payload), verify=False)
    response = r.json()

    if r.status_code == 200:
        job_id = response['job_id']
        logger.info(f'Successfully pushed candidate configuration to Prisma Access with job_id: {job_id}')
        logger.info('Starting progress status check')
        sleep(5)
        check_status(pa_session.access_token, job_id, timeout)
    else:
        logger.error(f'Failed to push candidate configuration to Prisma Access for folders: {folders}')
        logger.error(f'Status Code: {r.status_code}')
        logger.error(f'Response: {r.text}')
        sys.exit(1)


def check_status(token, jobid, timeout):
    """Check status of candidate configuration push
    :param timeout: Timeout in seconds
    :param token: Access token
    :param jobid: Job ID
    :return: None
    """
    url = base_url + f'/sse/config/v1/jobs/{jobid}'
    timeout = time.time() + timeout
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {token}'
    }
    with tqdm(total=100, desc='Percent pushed to Prisma Access') as pbar:
        while True:
            r = requests.get(url, headers=headers, verify=False)
            if r.status_code == 200:
                response = r.json()
                body = response['data'][0]
                details = json.loads(body['details'])
                percent = int(body['percent'])
                if percent == 100:
                    logger.info('Successfully pushed candidate configuration to Prisma Access')
                    sys.exit(0)
                elif len(details['info']) > 0:
                    if 'fail' in details['info'][0]:
                        logger.error('Failed to push candidate configuration to Prisma Access')
                        logger.error(f'Status Code: {r.status_code}')
                        logger.error(f'Response: {r.text}')
                        sys.exit(1)
                elif time.time() > timeout:
                    logger.error('Timeout exceeded')
                    logger.error(f'Status Code: {r.status_code}')
                    logger.error(f'Response: {r.text}')
                    sys.exit(1)
                else:
                    pbar.update(percent - pbar.n)
                    time.sleep(5)
            else:
                logger.error('Failed to push candidate configuration to Prisma Access')
                logger.error(f'Status Code: {r.status_code}')
                logger.error(f'Response: {r.text}')
                sys.exit(1)


if __name__ == '__main__':
    push_candidate_config()
