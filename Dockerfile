#FROM node:alpine

#WORKDIR /usr/src/app

#COPY . /usr/src/app

#RUN npm install -g @angular/cli

#RUN npm install

#CMD ["ng", "serve", "--host", "0.0.0.0"]

FROM node:alpine AS app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install

RUN npm run build



FROM nginx:alpine

COPY --from=app /usr/src/app/dist/angular-docker/browser /usr/share/nginx/html

RUN ls /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
