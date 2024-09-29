# Install dependencies

FROM node:20-alpine AS deps

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

# Rebuild the source code only when needed

FROM node:20-alpine AS builder

WORKDIR /app

COPY . .

COPY --from=deps /app/node_modules ./node_modules

RUN yarn build && yarn install --production --ignore-scripts --prefer-offline && yarn cache clean

# Release

FROM node:20-alpine AS runner

WORKDIR /app

RUN addgroup -g 1001 -S appgroup
RUN adduser -S appuser -u 1001

COPY --from=builder /app/public ./public
COPY --from=builder --chown=appuser:appgroup /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

USER appuser

CMD ["yarn", "start"]
