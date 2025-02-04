FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
FROM base as stage
COPY . .

FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY . .
