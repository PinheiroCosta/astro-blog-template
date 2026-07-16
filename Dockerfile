# Dockerfile exclusivo para ambiente de desenvolvimento.
# O código da aplicação é montado via volume pelo Docker Compose.
FROM node:22-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci
EXPOSE 4321
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
