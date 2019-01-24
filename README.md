# Video Chat

> Self hosted video chat server and API

Real-time authorization for gamers and webcam streamers.

## Before You Start

Add the server host address to the `inventory` file

```
cat <<EOF >> inventory
[api]
<SERVER_ADDRESS> ansible_connection=ssh ansible_port=22
EOF
```

# Installation

```
make install_server
```
