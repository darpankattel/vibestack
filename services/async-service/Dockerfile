FROM node:25-alpine AS base

WORKDIR /app
# Install dependencies for native modules (if needed)
RUN apk add --no-cache libc6-compat
COPY package*.json ./

FROM base AS development

RUN npm ci
EXPOSE 3000
CMD ["npm", "run", "dev"]

# Production dependencies stage
FROM base AS production-deps

RUN npm ci --omit=dev

FROM base AS production

COPY --from=production-deps /app/node_modules ./node_modules

COPY . .

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 && \
    chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

CMD ["node", "src/server.js"]