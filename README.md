# Osmocom-BB Docker

TODO...

```
docker run -ti --net=host -e DISPLAY=$DISPLAY --privileged -v /dev/bus/usb:/dev/bus/usb -v /dev/ttyUSB0:/dev/ttyUSB0 robertod91/osmocombb ./host/osmocon/osmocon -m c123 -p /dev/ttyUSB0
```
