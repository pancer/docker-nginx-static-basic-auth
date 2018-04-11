# Nginx basic auth for static content

## Run nginx with basic http auth and serve static content from mounted volume

### Environment variables:
1. BASIC_AUTH_USERNAME

2. BASIC_AUTH_PASSWORD

3. PORT (defaults 80)

4. WORKER_PROCESSES (defaults auto)

5. CLIENT_MAX_BODY_SIZE (defaults 1m)


Based on [dtan4/nginx-basic-auth-proxy](https://github.com/dtan4/nginx-basic-auth-proxy) and [carlosflorencio/docker-nginx-static-spa](https://github.com/carlosflorencio/docker-nginx-static-spa)
