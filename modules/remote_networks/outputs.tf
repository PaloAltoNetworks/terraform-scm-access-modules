output "remote_networks" {
  value       = scm_remote_network.this
  description = "The remote networks that are created and managed by the Palo ALto Networks scm service"
}

#output "ike_crypto_profiles" {
#  value       = scm_ike_crypto_profile.this
#  description = "The IKE crypto profiles that are created and managed by the Palo ALto Networks scm service"
#}
#
#output "ipsec_crypto_profiles" {
#  value       = scm_ipsec_crypto_profile.this
#  description = "The IPSec crypto profiles that are created and managed by the Palo ALto Networks scm service"
#}