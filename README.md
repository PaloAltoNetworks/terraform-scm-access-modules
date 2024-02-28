[![license](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE) [![support](https://img.shields.io/badge/Support%20Level-Community-yellowgreen)](./SUPPORT.md)
![CI/CD](https://github.com/PaloAltoNetworks/terraform-scm-access-modules/actions/workflows/ci.yml/badge.svg)


### Instructions on how to use the SCM Terraform Provider
Go Here &rarr; [General Release Provider](https://registry.terraform.io/providers/PaloAltoNetworks/scm/latest/docs)


# Terraform Modules for Palo Alto Networks Strata Cloud Manager


## Overview

A set of modules for using **Palo Alto Networks SCM Terraform Provider** to provide control and protection
to your applications and users on Strata Cloud Manager. These modules support the management and provisioning
of policy, objects, remote networks, services connections and more.

Examples provided try to follow along the SCM/Prisma SASE Architecture and usage guides.
* [What is Strata Cloud Manager and how do I use it?](https://docs.paloaltonetworks.com/cloud-management)
* [SASE for Users Architecture Guide](https://www.paloaltonetworks.com/resources/guides/prisma-access-for-users-architecture-guide)
* [SASE for Securing Internet Design Guide ](https://www.paloaltonetworks.com/resources/guides/sase-securing-internet-design-guide)
* [SASE for Securing Private Apps Design Guide](https://www.paloaltonetworks.com/resources/guides/sase-securing-private-apps-design-guide)

For copyright and license see the LICENSE file.

## Structure

This repository has the following directory structure:

* `modules` - this directory contains several standalone, reusable, production-grade Terraform modules. Each module is individually documented.
* `examples` - this directory shows examples of different ways to combine the modules contained in the
  `modules` directory.

## Compatibility

The compatibility with Terraform is defined individually per each module. In general, expect the earliest compatible
Terraform version to be 1.4.6 across most of the modules.

## Roadmap

We are maintaining a [public roadmap](https://github.com/orgs/PaloAltoNetworks/projects/52/views/1) to help users understand when we will release new features, bug fixes and enhancements.

## Versioning

These modules follow the principles of [Semantic Versioning](http://semver.org/). You can find each new release,
along with the changelog, on the GitHub [Releases](https://github.com/PaloAltoNetworks/terraform-scm-access-modules/releases) page.

## Getting Help

[Open an issue](https://github.com/PaloAltoNetworks/terraform-scm-access-modules/issues) on Github.
