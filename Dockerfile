FROM node:16
# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
COPY . .

RUN npx prisma db pull
RUN npx prisma generate

EXPOSE 8088

CMD [ "npx", "ts-node", "index.ts"]