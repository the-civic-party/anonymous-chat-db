FROM node:14-alpine

RUN apk add dumb-init

USER node

RUN mkdir /home/node/code
WORKDIR /home/node/code

COPY --chown=node:node package-lock.json package.json ./

RUN npm ci

COPY --chown=node:node tsconfig.json ./
COPY --chown=node:node src/ ./src

CMD ["dumb-init", "npm", "run", "start"]