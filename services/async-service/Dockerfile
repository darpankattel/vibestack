# Multi-stage build for Node.js/Express
FROM node:25-alpine AS base

# Set working directory
WORKDIR /app

# Install dependencies for native modules (if needed)
RUN apk add --no-cache libc6-compat

# Copy package files
COPY package*.json ./

# Development stage
FROM base AS development

# Install all dependencies (including devDependencies)
RUN npm ci

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Development command with nodemon for auto-reload
CMD ["npm", "run", "dev"]

# Production dependencies stage
FROM base AS production-deps

# Install only production dependencies
RUN npm ci --only=production

# Production stage
FROM base AS production

# Copy production dependencies
COPY --from=production-deps /app/node_modules ./node_modules

# Copy application code
COPY . .

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 && \
    chown -R nodejs:nodejs /app

USER nodejs

# Expose port
EXPOSE 3000

# Production command
CMD ["node", "server.js"]