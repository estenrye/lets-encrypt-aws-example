mkdir -p /opt/traefik
touch /opt/traefik/acme.json
chmod 600 /opt/traefik/acme.json
if [ -z $(docker network ls --filter name=public --format {{.ID}}) ]; then
  docker network create public --driver overlay && docker stack deploy -c dns-01.yml dns01
else
  docker stack deploy -c dns-01.yml dns01
fi