FROM node:14

ARG BUNDLE_INSTALL_FROZEN='true'

WORKDIR /nodeApp

COPY . .

RUN npm install

EXPOSE 80

CMD ["npm", "start"]