output "tunnel_data" {
  value = scm_ipsec_tunnel.this
}


output "rn_to_tunnel_data_restructure" {
  value = { for k, v in scm_ipsec_tunnel.this :
    split("-", k)[0] => merge(v, { name = k })...
  }
}