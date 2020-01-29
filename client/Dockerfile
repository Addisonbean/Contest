FROM node:lts-alpine

# install simple http server for serving static content
# RUN npm install -g http-server

WORKDIR /ceapp/client

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

# `npm run build` for production
CMD npm run serve

# CMD [ "http-server", "dist" ]
