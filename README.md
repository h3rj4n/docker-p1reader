ARM Docker p1reader image
==========

This docker image can be used to read the p1 port trough a serial connection.

Example
=====

Build this repository.

```
docker build -t herjan/p1reader .
```

Running the image as daemon. The example below links the image to a homeassistant where data is send.

```
docker run -d -ti --device /dev/ttyUSB0:/dev/ttyUSB0 \
	--privileged --link homeassistant:homeassistant \
	herjan/p1reader:latest \
	-c 1 -s homeassistant -o mqtt \
	-a true -u homeassistent -p randompassword
```