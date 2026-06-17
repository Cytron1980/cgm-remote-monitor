FROM node:14

LABEL maintainer="Nightscout Contributors"

RUN mkdir -p /opt/app
ADD . /opt/app
WORKDIR /opt/app
RUN chown -R node:node /opt/app
USER node

RUN npm install && \
  npm run postinstall && \
  npm run env
  

EXPOSE 10000

CMD ["node", "lib/server/server.js"]
