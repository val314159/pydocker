# pydocker

This is an example of a docker dealio that has a ton of cool python stuff in it.

Including, but not limited to:

  * gevent
  * nginx
  * consul
  * consul_ui
  * cassandra-driver
  * python-consul
  * honcho

----

### Quickstart

To build the new image:

```sh
docker build .
```

To run the new image *(interactive, listening to ^C)*:

```sh
docker run -it $(docker images | head -2 | tail -1 | cut -c41-49)
```

To run another shell in the new image:

```sh
docker exec -it $(docker ps | head -2 | tail -1 | cut -d\  -f1) bash
```
