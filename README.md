OpenTelemetry Auto-Instrumentation: eBPF + SDKs
===============================================

Demo for the [Grafana & Friends Munich Meetup](https://www.meetup.com/de-de/grafana-and-friends-munich/events/313186738/) on Feb 26, 2026.

Blog post: [Why OpenTelemetry instrumentation needs both eBPF and SDKs](https://grafana.com/blog/why-opentelemetry-instrumentation-needs-both-ebpf-and-sdks/).

How To
------

Assuming you have Kubernetes running, deploy as follows:

```
./scripts/deploy-all.sh
```

After a while, port-forward the Grafana server:

```
kubectl port-forward $(kubectl get pods -lapp=grafana -o=name) 3000:3000
```

and access Grafana on [http://localhost:3000](http://localhost:3000) (user: _admin_, password: _admin_).
