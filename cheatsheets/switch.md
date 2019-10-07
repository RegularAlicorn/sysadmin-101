# Switch

## HP ProCurve
### Activate SSH
```shell
<Switch> system-view
# Generate RSA and DSA key pairs and enable the SSH server.
[Switch] public-key local create rsa
[Switch] public-key local create dsa
[Switch] ssh server enable
# Configure the switch to use AAA for SSH users.
[Switch] user-interface vty 0 4
[Switch] authentication-mode scheme
# Configure the user interfaces to support SSH.
[Switch] protocol inbound ssh
[Switch] quit
```
