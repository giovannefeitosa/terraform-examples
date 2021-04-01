FROM node:alpine
WORKDIR /app
COPY ./react/package.json /app/package.json
ENV PATH ./react/app/node_modules/.bin:$PATH
RUN yarn
COPY ./react/public /app/public
COPY ./react/src /app/src
CMD ["yarn", "start"]
# CMD ["echo", "$PWD"]
