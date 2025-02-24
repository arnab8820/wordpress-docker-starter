# Wordpress Docker Starter
This repo contains the dockerfile, docker-compose file, alongwith necessery PHP and nginx config files to let you deploy Wordpress in minutes. 

## Usage

1. Clone the repo
2. Update the .env file with your credentials
3. Open a terminal window in the project folder
4. Run `docker-compose up -d` and wait for the containers to start. Continue with the next items if you want SSL enabled
45. Run `docker-compose ps` and check if certbot container has exited with status 0 and others are running. Otherwise check the container logs and fix the issue.
6. Change `--staging` flag to `--force-renewal` under certbot command
7. Recreate certbot container by running 
```
docker-compose down certbot
docker-compose up --force-recreate --no-deps certbot -d
```
8. Pull the updated security config for nginx
```
curl -sSLo nginx/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
```
9. Update `your_domain` with your domain name in `nginx/nginx-with-ssl.conf` file and replace `nginx/nginx.conf` file with it.
```
cat nginx-with-ssl.conf > nginx/nginx.conf
```
10. Restart `webserver` container again for changes to take effect
```
docker-compose restart webserver
```
11. All set, go to `https://your_domain` and complete the setup