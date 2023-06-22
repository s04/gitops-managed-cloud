# SlimKloud / MinKloud

The idea is to create a very minimal GitOps based cloud provider with a Git based frontnend.

Initially only providing managed, best practice kubernetes.

Users Provide a Hetzner API Key initially via their own repo so we don't have to handle KubeCost/FinOps stuff in version 0.1.

No "free master/control node" bullshit. They pay for what they use.

Charge a 9.99(???) a month/cluster subscription for provisioning, TF managment and "easy of use".

# How to use
- Create new repo
- Create folder called clusters
- Create config.yaml for each cluster you want
- Create 2 secrets in Github Repo
  - "Hetzner API" Key
  - "SlimKloud API" Key
- Create .github/workflows/provision_clusters.yaml

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

User FrontEnd:
1. Static Site Generator (Hugo) with Form/Payment (easy subscriptions/forms available) link ["Stripe Payment Link"])https://stripe.com/en-de/payments/payment-links)
2. Git/Github Repo with config.yaml 

Management/Provisioning Backend v0.1:
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- https://digger.dev/ for Terraform State management
  

Management/Provisioning Backend v0.2:
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- ArgoCD Core Cluster Management (ArgoCD stripped of GUI, becomes flux) ["ArgoCD Core Demo"](https://github.com/alexmt/argocd-core-cluster-management)

Management/Provisioning Backend v0.3:
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- ArgoCD Core Cluster Management (ArgoCD stripped of GUI, becomes flux) ["ArgoCD Core Demo"](https://github.com/alexmt/argocd-core-cluster-management)
- ClusterAPI Hetzner ("ClusterAPI Hetzner Provider")[https://github.com/syself/cluster-api-provider-hetzner]

# Customer Cluster Stack v0.1

## Base

- Kube-Hetzner (SUSE MicroOS + K3s, on Hetzner ["Kube-Hetzner"](https://github.com/kube-hetzner/terraform-hcloud-kube-hetzner)

## CD/Secrets

- ArgoCD
- External Secrets Operator

## Networking

- Cilium (as Ingress and using GatewayAPI feature)
- Klipper as an on-metal LB or the Hetzner LB (supported by Kube-Hetzner TF provider)

## Storage

- Encryption at rest fully functional in both Longhorn and Hetzner CSI

## Monitoring / Logging (not provided/optional/roadmap 0.2)

- Open Telemetry
- Prometheus / Thanos
- Loki
- Grafana

# Customer Cluster Stack v0.3

?? OpenShift on Hetzner using OKD.
