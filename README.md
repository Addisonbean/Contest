# Contest

## Setup

### Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (included with Docker on Windows and macOS)

### Building

Before your your first time building the project, run `docker-compose build` in the project root. Then to install the node modules, run `docker-compose run client npm install`.

To setup the server, run `docker-compose run server rails db:create`, then `docker-compose run server rails db:migrate`.

After that, the project can be started with `docker-compose up`. Any changes made to the `client` directory will be automatically picked up by the npm build server. So any changes to source code shouldn't require a server restart, but updating configuration files like `package.json` will.

The initial step (`docker-compose build`) will only need to be repeated whenever any of the `Dockerfile`s change.

Now the site should be available at `http://localhost:8080`.
