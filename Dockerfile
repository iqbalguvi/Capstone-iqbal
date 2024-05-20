# Use the official Apache HTTP Server image
FROM nginx:alpine

# Copy the HTML files into the default Apache directory
COPY . /usr/share/nginx/html/

EXPOSE 80
