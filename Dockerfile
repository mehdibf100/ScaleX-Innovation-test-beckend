FROM node:20-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (omit dev for production)
RUN npm ci --omit=dev

# Copy source code
COPY . .

# Build the app
RUN npm run build

EXPOSE 4000

CMD ["node", "dist/index.js"]
