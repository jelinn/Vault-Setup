listener "tcp" {
  address     = "192.168.1.40:8200"
  tls_disable = 1
}
storage "raft" {
  path = "/opt/raft"
  node_id = "raft_node_1"
}
cluster_addr="http://192.168.1.40:8201"
api_addr="http://192.168.1.40:8200"
ui=true
