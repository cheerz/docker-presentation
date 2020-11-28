FROM node:14

ARG BUNDLE_INSTALL_FROZEN='true'

WORKDIR /nodeApp

COPY package.json .

RUN npm install

EXPOSE 80

CMD ["npm", "start"]