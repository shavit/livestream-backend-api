# Video Chat

> Self hosted video chat server and API

# Configuration

Add the server address to the `inventory` file

```
cat <<EOF >> inventory
[api]
<SERVER_ADDRESS> ansible_connection=ssh ansible_port=22
EOF
```
