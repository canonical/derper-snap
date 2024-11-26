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
| hostname       |               |         |
| verify-clients | false         |         |

Example:

```bash
sudo snap set derper hostname=myderper.mydomain.com
```

The DERP server with will restart listening on all interface on 1443 and generate a certificate for the specified hostname.

## License

This packaging repository is released under the BSD 3-Clause "New" or "Revised" license.

Tailscale is released under the BSD 3-Clause "New" or "Revised" license.
Please see the upstream repository for more information: https://github.com/tailscale/tailscale/
