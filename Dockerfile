FROM node:20-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy built files
COPY dist ./dist

EXPOSE 4000

CMD ["node", "dist/index.js"]
