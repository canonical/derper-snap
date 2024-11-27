# Tailscale DERP Relay server (derper) snap

This repository provides a snap package for running a [Custom DERP relay](https://tailscale.com/kb/1118/custom-derp-servers) for [Tailscale](https://tailscale.com).

## Build the snap


You can build the snap locally with:

```
snapcraft --use-lxd
```

## Usage

Install the snap:

```bash
sudo snap install derper
```

This installs the DERP server and starts it automatically.
You can modify configuration options with `sudo snap set`. The following configuration options are currently supported:

| Option         | Default       | Comment |
|----------------|---------------|---------|
| `hostname`       | ("derp.tailscale.com") | LetsEncrypt host name, if addr's (`a`) port is :443 |
| `a`              | (":443") | server HTTP/HTTPS listen address, in form ":port", "ip:port", or for IPv6 "[ip]:port". If the IP is omitted, it defaults to all interfaces. Serves HTTPS if the port is 443 and/or certmode is manual (default certmode is "letsencrypt", otherwise HTTP. |
| `stun-port`      | ("3478") | The UDP port on which to serve STUN. The listener is bound to the same IP (if any) as specified in the `a` option. |
| `verify-clients` | false | verify clients to this DERP server through a local tailscaled instance |

The config options correspond to the similarly named command line flags to `derper`.
Options that don't have support to be configured through the snap
will be left at their default.
See the `derper` command [source code](https://github.com/tailscale/tailscale/tree/main/cmd/derper) for more technical information.

Example of setting an option:

```bash
sudo snap set derper hostname=myderper.mydomain.com
```

To view the available config options and their current values:

```
$ sudo snap get derper
Key             Value
hostname
verify-clients  false
...
```

Derper must be restarted manually when you wish the changed config to take affect.

## License

This packaging repository is released under the BSD 3-Clause "New" or "Revised" license.

Tailscale is released under the BSD 3-Clause "New" or "Revised" license.
Please see the upstream repository for more information: https://github.com/tailscale/tailscale/
