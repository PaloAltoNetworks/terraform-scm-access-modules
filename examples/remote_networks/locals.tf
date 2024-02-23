#locals {
#  spns = {
#    for spn in data.scm_bandwidth_allocation_list.this.data :
#    spn.name => {
#      spns      = spn.spn_name_list   #### Currently not supported in the new SCM provider
#      allocated = spn.allocated_bandwidth
#    }
#  }
#}