# Quickstart
- Create new repo (or fork template repo)
- Create folder called clusters/
- Create /clusters/cluster1/config.yaml for each cluster you want

```yaml
# config.yaml

# Master node count
master_node_count: 1

# Worker node count
worker_node_count: 3 

# Master node type
master_node_type: CAX21

# Worker node type
worker_node_type: CAX11

# Load balancer type
# Possible values: Klipper, Hetzner LB
load_balancer_type: Klipper

# Kubernetes version
kubernetes_version: 1.26

# Optional packages toggles

# Cilium or Istio or None
# Possible values: cilium, istio, None
CNI: cilium
version: X.X.X
# Set to none for default values
cilium_values: clusters/cluster1/cilium_values.yaml
# Set to none for default values
cilium_values: None

# ArgoCD (Full or Core) or Flux or None
# Possible values: argocd-full, argocd-core, Flux, None
cd: argocd-full
version: X.X.X

# external secrets operator or csi secrets driver
external_secrets_operator: true
csi_secrets_driver: false

# Storage configuration
# Possible values: longhorn_hetzner_csi, Rook (not supported yet)
storage: longhorn_hetzner_csi

# Logging configuration (alpha)
observability:
  opentelemetry: 
    enabled: true
    values: "path/"
  prometheus:
    enabled: true
    values: "path/"
    thanos:
      enabled: true
      values: "path/"
  loki:
    enabled: true
    values: "path/"
  grafana:
    enabled: true
    values: "path/"
```

## Create 2 github secrets in personal cluster config repo

1. "Hetzner API" Key
2. "SlimKloud API" Key

## Create .github/workflows/provision_clusters.yaml

```yaml
name: Provision Clusters
on:
  push:
    branches:
      - main

jobs:
  provision_clusters:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Provision Clusters
        uses: gitops-managed-cloud/slimkloud-provisioner@v1
        with:
          hetzner_api_key: ${{ secrets.hetzner_api_key }}
          slimcloud_api_key: ${{ secrets.slimcloud_api_key }}
          clusters_dir_path: "./clusters/"
```
