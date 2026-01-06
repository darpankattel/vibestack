FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Create directories for static files
RUN mkdir -p /usr/share/nginx/html/dashboard && \
    mkdir -p /usr/share/nginx/html/website

# Expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]