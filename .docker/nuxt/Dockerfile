# syntax=docker/dockerfile:1.4
FROM node:20-alpine3.20 as installer

WORKDIR /nuxt

COPY ./frontend/package.json ./frontend/yarn.lock  ./

RUN yarn install \
    && yarn cache clean --mirror \
    && rm -rf $(find node_modules -maxdepth 2 | grep -i -E "^.*/readme.md|.*/tests?|.*/licence|.*/changelog.md$")

FROM node:20-alpine3.20 as builder

WORKDIR /nuxt
COPY --from=installer --link /nuxt/node_modules node_modules
COPY ./nuxt .

ENV NUXT_ENVIRONMENT: ${NUXT_ENVIRONMENT}

RUN yarn build

FROM node:20-alpine3.20 as production

ENV NODE_ENV production
ENV HOST 0.0.0.0
ENV PORT 3000

EXPOSE ${PORT}

WORKDIR /nuxt
COPY --from=builder --link /nuxt/.output .output

CMD ["node", "./.output/server/index.mjs"]

FROM node:20-alpine3.20 as development

ENV NODE_ENV development
ENV HOST 0.0.0.0
ENV PORT 3000
EXPOSE 3000

WORKDIR /nuxt
COPY --from=installer --link /nuxt/node_modules node_modules
ENV PATH ./node_modules/.bin/:$PATH

COPY ./frontend .

CMD ["yarn", "dev"]
