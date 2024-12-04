# Tailscale DERP Relay server (derper) snap

This repository provides a strictly confined snap package for running a [custom DERP relay](https://tailscale.com/kb/1118/custom-derp-servers) for [Tailscale](https://tailscale.com).
It packages the derper tool from the source available at <https://github.com/tailscale/tailscale>.

Please see the listing for [Derper on the Snap Store](https://snapcraft.io/derper) for user documentation.

## Local development

You can build the snap locally with:

```
snapcraft --use-lxd
```

The locally built snap must be installed in dangerous mode (because there are no signatures from the Snap Store):

```
sudo snap install --dangerous derper_*.snap
```

A trick to directly interact with the `derper` command,
useful for debugging:

```
$ sudo snap run --shell derper
root@derper:/home/ubuntu# derper -h
Usage of derper:
  -a string
  ...
```

## License

This packaging repository is released under the BSD 3-Clause "New" or "Revised" license.

Tailscale is released under the BSD 3-Clause "New" or "Revised" license.
Please see the upstream repository for more information: https://github.com/tailscale/tailscale/
