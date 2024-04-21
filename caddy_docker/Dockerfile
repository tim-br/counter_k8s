# Use the caddy builder official image
FROM caddy:2-builder AS builder

# Build Caddy with the Route53 DNS provider plugin
RUN xcaddy build \
    --with github.com/caddy-dns/route53

# Use the official Caddy image for the runtime base
FROM caddy:2

# Copy the custom-built Caddy binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Set up your Caddyfile and any other necessary files
##COPY Caddyfile /etc/caddy/Caddyfile

# Set up volumes for certificates (Caddy will use these directories to store certificates)
VOLUME /data
VOLUME /config
