Iocage [bazarr](https://github.com/morpheus65535/bazarr) plugin for freenas. 


# Testing manually

In freenas shell run:

* `fetch https://raw.githubusercontent.com/fulder/iocage-plugin-index/master/bazarr.json`
* `iocage fetch -P bazarr.json --name bazarr ip4_addr="<INTERFACE>|<IP>/<MASK>" vnet=off`

where `<INTERFACE>` is the name of the ethernet interface and `<IP>/<MASK>` is a static IP address in local network range
 