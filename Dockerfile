FROM node:14.15.3-alpine

ENV APP_ROOT /web
WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}
RUN npm ci
RUN npm run build

# expose 3000 on container
EXPOSE 3000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=3000

CMD ["npm", "run", "start"]
