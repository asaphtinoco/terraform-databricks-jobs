
data "databricks_node_type" "node_memory_photon_large" { # Create the cluster with the "smallest" amount
  local_disk            = true
  photon_driver_capable = true
  min_cores             = 16
  min_memory_gb         = 128
}