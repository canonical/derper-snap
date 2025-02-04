# Security

Derper provides a way to negotiate direct connections between devices running tailscale,
or acting as a full relay server if no direct connection is possible.
Derper never sees the content of traffic it relays, as all data is end to end encrypted already by Tailscale using Wireguard on the end devices.
Please see the upstream documentation for more security information about derper.

The snap is strictly confined, with interfaces limited to:

* `network`: general network access.
* `network-bind`: required for the service to listen on an interface.

This snap has some thin wrapper logic around derper
The snap logic does not use any cryptographic functionality directly;
it simply provides a managed way to configure the derper service, by providing some scripts and interacting with `snapctl`.

On first run, derper generates a secret key and writes it to file at `$SNAP_COMMON/derper.key`. This file is only readable or writeable by the root user.
Note that derper refers to this file as the config file.

WARNING: Derper acts as an open relay by default,
and the snap does not currently support the `--verify-clients` mode that can restrict traffic to your tailnet.
Please see https://github.com/canonical/derper-snap/pull/4 for more information and the work in progress.

## Security hardening guidance

### Listen address and protocol

With the default snap config of `a` (the server listen address),
Derper will listen on port 443, and request a certificate from Letsencrypt to use HTTPS.
If the listen port is changed to something other than 443,
Derper will not request a certificate, and will listen on HTTP instead.
It's recommended to leave the port as 443 to ensure HTTPS will be used.

It is possible to change the bind address, while keeping the port on 443, which will also still use HTTPS.
For example:

```
sudo snap set derper a=10.0.0.3:443
```

### Open relay warning

By default, Derper runs as an open relay.
Derper does make it possible to restrict access to traffic on your tailnet only,
by using its `--verify-clients` mode.
However, this is not currently supported by the snap.
Please see https://github.com/canonical/derper-snap/pull/4 for more information and the work in progress.
