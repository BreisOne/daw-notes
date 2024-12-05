# Use a lightweight web server image
FROM nginx:latest

# Copy the project files
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx in foreground mode
CMD ["nginx", "-g", "daemon off;"]