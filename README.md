# Contest

## Setup

### Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (included with Docker on Windows and macOS)

### Building

To setup the project, run the following commands:

```
$ cp client/src/env.js.example client/src/env.js
$ docker-compose build
$ docker volume create --name=pgdata
$ docker-compose run client npm install
$ docker-compose run server bundle install
$ docker-compose run server rails db:create
$ docker-compose run server rails db:migrate
```

After that, the project can be started with `docker-compose up` and it will be available at `http://localhost:8080`. Any changes made to the `client` or `server` directories will be automatically picked up by the project while running. So any changes to source code shouldn't require a server restart.
