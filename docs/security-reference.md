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

WARNING: Derper acts as an open relay by default.
Please see the "Verify client connections" section in the security hardening guidance below
for instructions for restricting access.

## Security hardening guidance

### Listen address and protocol

With the default snap config of `a` (the server listen address),
Derper will bind to all interfaces, listening on port 443, and request a certificate from Letsencrypt to use HTTPS.

If the listen port is changed to something other than 443,
Derper will not request a certificate, and will listen on HTTP instead.
It's recommended to leave the port as 443 to ensure HTTPS will be used.

It is possible to change the bind address, while keeping the port on 443, which will also still use HTTPS.
For example:

```
sudo snap set derper a=10.0.0.3:443
```

### Verify client connections

By default, Derper runs as an open relay.
Derper does provide a `-verify-clients` mode to restrict access to traffic on your tailnet only.
To turn on this mode in the snap:

1. Ensure the Tailscale snap is also installed on the same machine.
2. Ensure the `socket` interface on the Tailscale snap is connected to the `tailscale-socket` interface on the Derper snap.
3. set `verify-clients=true` on the Derper snap config.

For example:

```
sudo snap install derper
sudo snap install tailscale
sudo snap connect derper:tailscale-socket tailscale:socket
sudo snap set derper verify-clients=true
```
