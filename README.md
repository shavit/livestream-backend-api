# Video Chat

> Self hosted video chat server and API

## Before You Start

Add the server address to the `inventory` file

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
