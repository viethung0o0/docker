# Chatbot AI - Socket.io

## System Requirements

Packages:

* [Redis](https://redis.io/topics/quickstart)

* [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server)

* [PM2](https://github.com/Unitech/pm2)

The following are required to function properly.

*   Laravel 5.3+
*   Node 6.0+
*   Redis 3+

Additional information on broadcasting with Laravel can be found on the
official docs: <https://laravel.com/docs/master/broadcasting>

## Getting Started

1. Install Redis [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis)

2. Install NodeJs
```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

nvm install node
```

3. Install npm package with the following command:

``` shell

$   npm install

```

### Run The Server

The tool will load a laravel-echo-server.json file
This file will be loaded by the server during start up. You may edit this file later on to manage the configuration of your server.

Run the command in your project directory:

``` shell
$   node_modules/.bin/pm2 start echo.json -i max
```
### Configurable Options

Edit the default configuration of the server by adding options to your **laravel-echo-server.json** file.


| Title              | Default              | Description                 |
| :------------------| :------------------- | :---------------------------|
| `authEndpoint`     | `/broadcasting/auth` | The route that authenticates private channels  |
| `authHost`         | `http://localhost`   | The host of the server that authenticates private and presence channels  |
| `database`         | `redis`              | Database used to store data that should persist, like presence channel members. Options are currently `redis` and `sqlite` |
| `databaseConfig`   |  `{}`                | Configurations for the different database drivers [Example](#database)|
| `host`             | `null`               | The host of the socket.io server ex.`app.dev`. `null` will accept connections on any IP-address |
| `port`             | `6001`               | The port that the socket.io server should run on |
| `protocol`         | `http`               | either `http` or `https` |
| `sslCertPath`      | `''`                 | The path to your server's ssl certificate |
| `sslKeyPath`       | `''`                 | The path to your server's ssl key |
| `sslCertChainPath` | `''`                 | The path to your server's ssl certificate chain |
| `sslPassphrase`    | `''`                 | The pass phrase to use for the certificate (if applicable) |
| `socketio`         | `{}`                 | Options to pass to the socket.io instance ([available options](https://github.com/socketio/engine.io#methods-1)) |
| `apiOriginAllow`   | `{}`                 | Configuration to allow API be accessed over CORS. [Example](#cross-domain-access-to-api)|

#### API Clients



### Redis
For example, if you wanted to pass a custom configuration to Redis:

``` json

{
  "databaseConfig" : {
    "redis" : {
      "port": "3001",
      "host": "redis.app.dev"
    }
  }
}

```

## Nginx

```shell
location /socket.io {
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_http_version 1.1;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
    proxy_pass http://websocket;
}

upstream websocket {
    ip_hash;
    server 127.0.0.1:6001;
}
```

### Tips
#### Socket.io client library
You can include the socket.io client library from your running server. For example, if your server is running at `app.dev:6001` you should be able to
add a script tag to your html like so:

```
<script src="//app.dev:6001/socket.io/socket.io.js"></script>
```

Next, you will need to instantiate Echo with the socket.io connector and a host.
```javascript
import Echo from "laravel-echo"

window.Echo = new Echo({
    broadcaster: 'socket.io',
    host: window.location.hostname + ':6001'
});

window.Echo.channel('chat-room').listen('ChatEvent', (e) => {
    console.log(e);
});
```
