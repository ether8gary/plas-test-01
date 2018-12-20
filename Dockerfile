#Plastiq Test

#Pull Alpine image and Nginx
FROM nginx:alpine

#Commands

#Move html files to nginx home
COPY html/index.html /usr/share/nginx/html/index.html
