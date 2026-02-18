FROM node

WORKDIR /frontend/express-server
COPY express-server/package*json express-server/.env express-server/*.js .
COPY express-server/routes/ routes/
RUN npm install

WORKDIR /frontend/react-client
COPY react-client/package*json .
COPY react-client/public/ public/
COPY react-client/src/ src/
RUN npm install
RUN npm run build

WORKDIR /frontend/express-server
EXPOSE 3000
CMD [ "node", "server.js" ]
