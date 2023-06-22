# SlimKloud / MinKloud

The idea is to create a very minimal GitOps based cloud provider with a Git based frontnend.

## Features

- Managed, best-practice, Kubernetes Clusters
- K3s, ArgoCD, ExternalSecrets, Cilium (Ingress + GatewayAPI), Longhorn + HetznerCSI
- digger.dev terraform state management
- No hidden costs, no "free master/control node" bullshit. Pay for what you use.
- On Hetzer
- Easy setup. Only need:
  - Github Repo
  - Hetzner API Key
- Easy to handle for a management perspective => no KubeCost/FinOps headache in version 0.1
- Cost: $9.99(???) a month/cluster subscription for provisioning, TF managment and "easy of use"

# Installation Guide / Quickstart

Check it out here: ["Installation / Quickstart"](docs/quickstart.md)

# Design

## Customer FrontEnd
1. Static Site Generator (Hugo) with Form/Payment (easy subscriptions/forms available) link ["Stripe Payment Link"](https://stripe.com/en-de/payments/payment-links)
2. Git/Github Repo with config.yaml

## Customer Cluster Stack v0.1

### Base

- Kube-Hetzner (SUSE MicroOS + K3s, on Hetzner ["Kube-Hetzner"](https://github.com/kube-hetzner/terraform-hcloud-kube-hetzner)

### CD/Secrets

- ArgoCD
- External Secrets Operator

### Networking

- Cilium (as Ingress and using GatewayAPI feature)
- Klipper as an on-metal LB or the Hetzner LB (supported by Kube-Hetzner TF provider)

### Storage

- Encryption at rest fully functional in both Longhorn and Hetzner CSI

### Monitoring / Logging (not provided/optional/roadmap 0.2)

- Open Telemetry
- Prometheus / Thanos
- Loki
- Grafana

### Customer Cluster Stack v0.3

?? OpenShift on Hetzner using OKD.

# Management Stack / Backend

## Management/Provisioning Backend v0.1
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- https://digger.dev/ for Terraform State management

## Management/Provisioning Backend v0.2:
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- ArgoCD Core Cluster Management (ArgoCD stripped of GUI, becomes flux) ["ArgoCD Core Demo"](https://github.com/alexmt/argocd-core-cluster-management)

## Management/Provisioning Backend v0.3:
- Github Actions for running Terraform Plan/Apply => Emailing/download link to on GithubPages KubeConfig(?)
- ArgoCD Core Cluster Management (ArgoCD stripped of GUI, becomes flux) ["ArgoCD Core Demo"](https://github.com/alexmt/argocd-core-cluster-management)
- ClusterAPI Hetzner ("ClusterAPI Hetzner Provider")[https://github.com/syself/cluster-api-provider-hetzner]
