# MySQL for Domibus Access Point

Container image based on [`docker.io/mysql`] that installs [Domibus Access
Point] database definitions on initialization of a new instance.

## Building

No special preparation is needed on the host system:

```console
podman build -t domibus-mysql .
```

## Configuration

You will need to either set `MYSQL_ROOT_PASSWORD` or
`MYSQL_RANDOM_ROOT_PASSWORD` to be able to run the container.

`MYSQL_PASSWORD` should be overridden from the default value of `edelivery`
for production usage.

## Usage

Example usage:

```console
podman build -t domibus-mysql .
podman run --rm -e MYSQL_RANDOM_ROOT_PASSWORD=true domibus-mysql
```

Bit more realistic:

```console
podman build -t domibus-mysql .
podman network create domibus
podman volume create domibus-mysql
podman run -d --name mysql \
  -e MYSQL_RANDOM_ROOT_PASSWORD=true \
  --network domibus \
  -v domibus-mysql:/var/lib/mysql
  domibus-mysql
```

[Domibus Access Point]: <https://docs.edelivery.tech.ec.europa.eu/domibus/>
[`docker.io/mysql`]: <https://hub.docker.com/_/mysql>
