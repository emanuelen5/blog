---
title: 'SSH port forwarding'
what: |
    ```bash
    ssh -L 8055:<host>:80 <user>@<host>
    ```
why: Forward a local port to a remote application over SSH
date: 2025-02-10
tags: [ssh]
---

# What
```bash
ssh -L 8055:<host>:80 <user>@<host>
```

# Why
This way we can forward network traffic to an application on a remote host. Let's say you want to connect with your web browser to a web server on another computer.

<figure class="image" markdown="1">
```asciiart
┌──────────────────────┐         ┌──────────────────────────────────┐
│     My computer      │         │           <user>@<host>          │
│                      │         │                                  │
│             :8055    │  ssh    │               ┌───────────────┐  │
│            ─────────►├────────►│ ────────┐     │               │  │
│                      │         │         │     │  application  │  │
│                      │         │         │     │               │  │
│                      │         │         └────►│: port 80      │  │
│                      │         │               │               │  │
│                      │         │               └───────────────┘  │
│                      │         │                                  │
└──────────────────────┘         └──────────────────────────────────┘
```
<figurecaption>(generated using <a href="https://asciiflow.com">AsciiFlow</a>)</figurecaption>
</figure>

After running this incantation, when you open a web browser toward the local port <http://localhost:8055> it will connect to the web server on the remote host. This works even if the remote host has not opened port 80 (e.g. due to a firewall rules).

# Fun fact

I use this daily when I develop with VS code. It has a built-in utility for forwarding ports to the remote host. [1]

# References
From the man pages:

## [ssh(1): `-L`](https://man7.org/linux/man-pages/man1/ssh.1.html)
>    ```
>    -L [bind_address:]port:host:hostport
>    -L [bind_address:]port:remote_socket
>    -L local_socket:host:hostport
>    -L local_socket:remote_socket
>    ```
> Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be
> forwarded to the given host and port, or Unix socket, on the remote side.  This works by allocating a
> socket to listen to either a TCP port on the local side, optionally bound to the specified
> bind_address, or to a Unix socket.  Whenever a connection is made to the local port or socket, the
> connection is forwarded over the secure channel, and a connection is made to either host port
> hostport, or the Unix socket remote_socket, from the remote machine.
>
> Port forwardings can also be specified in the configuration file.  Only the superuser can forward
> privileged ports.  IPv6 addresses can be specified by enclosing the address in square brackets.
>
> By default, the local port is bound in accordance with the GatewayPorts setting.  However, an explicit
> bind_address may be used to bind the connection to a specific address.  The bind_address of
> "localhost" indicates that the listening port be bound for local use only, while an empty address or
> '*' indicates that the port should be available from all interfaces.
>

## Other references
* [[1]\: Visual Studio Code: Local port forwarding][vscode]

<!-- References !-->
[vscode]: https://code.visualstudio.com/docs/editor/port-forwarding