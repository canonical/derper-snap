# A Snap for the Tailscale DERP Relay server

This repository provides a snap package for running a  [Tailscale](https://tailscale.com) [Custom DERP relay](https://tailscale.com/kb/1118/custom-derp-servers).

## Usage
Just install the snap with 
```bash
sudo snap install derper
```
This installs the DERP server and starts it automatically. You can modify configuration options with `sudo snap set`. The following configuration options are currently supported:
| Option         | Default       | Comment |
|----------------|---------------|---------|
| hostname       | `hostname -f` |         |
| verify-clients | true          |         |
| stun-port      |               |         |
| address        |               | `-a` option for derper |

Example:
```bash
sudo snap set derper hostname="myderper.mydomain.com" address=":1443"
```

The DERP server with will restart listening on all interface on 1443 and generate a certificate for the specified hostname.
