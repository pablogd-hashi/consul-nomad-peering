# Consul Nomad Peering Demo

This README provides a guide for demonstrating Consul and Nomad peering, focusing on failover configurations with and without Sameness Groups.

We'll start from the point where the following are already configured in the repository:

* **Peered clusters** are established.
* **Exported services** are configured.
* **Intentions** are deployed correctly.

You should be able to see everything running correctly via the API Gateway UI: [API Gateway UI](http://34.175.116.125:8080/ui/)

---

## Demo Steps

### 1. Verify Services and Nomad Jobs

* **List Services**:
    * Open the Consul UI for both clusters (DC1 and DC2) and confirm the list of services.
* **Show Nomad Job Code**:
    * Display the Nomad job definitions used for the services.

### 2. Confirm Peered Configuration

* **Consul Peering**:
    * Navigate to the Consul UI for **DC1** and show the established peer.
    * Navigate to the Consul UI for **DC2** and show the established peer.
* **Nomad Jobs**:
    * Access the Nomad UI for **DC1**: [Nomad DC1 UI](http://hashi-hashistack-gcp.hc-a7228bee27814bf1b3768e63f61.gcp.sbx.hashicorpdemo.com:4646) and show the running jobs.
    * Access the Nomad UI for **DC2**: [Nomad DC2 UI](http://hashi-hashistack-gcp-2.hc-a7228bee27814bf1b3768e63f61.gcp.sbx.hashicorpdemo.com:4646) and show the running jobs.

### 3. Review Exported Services

* **CLI Verification**:
    * From **DC2**, run `consul services exported services` to list the exported services.
* **Code Review**:
    * Open `peering/default-exported.hcl` in your code editor (e.g., VS Code) and show its content.
* **Consul UI Verification**:
    * In the Consul UI for **DC1**, verify that the exported services are listed in the Services Catalog.
    * (Optional) If you haven't already, verify imported and exported services within the Peering UI configuration.

### 4. Examine Intentions

* **Consul UI**:
    * Show the configured intentions in the Consul UI for both clusters.
* **Code Review**:
    * Open `peering/private-api-intentions.hcl` in your code editor and show its content.

### 5. Demonstrate Intention Denial and Recovery

* **Deny Intention**:
    * Modify `peering/private-api-intentions.hcl` in your code editor to `deny` the intention, or delete it using `consul config delete -filename peering/private-api-intentions.hcl`.
    * Apply the change: `consul config write peering/private-api-intentions.hcl`.
* **Verify Connectivity Loss**:
    * Reload the API Gateway UI ([http://34.175.116.125:8080/ui/](http://34.175.116.125:8080/ui/)) and observe that connectivity is **red** and the service is unreachable.
* **Recover Intention**:
    * Re-create the intention or change its status back to `allow`.
* **Verify Connectivity Restoration**:
    * Reload the API Gateway UI and confirm that connectivity is restored.
* **Access