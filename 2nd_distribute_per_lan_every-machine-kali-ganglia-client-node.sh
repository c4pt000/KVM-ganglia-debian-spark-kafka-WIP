export XDG_RUNTIME_DIR=/run/user/%I && /usr/lib/systemd/systemd --user &


docker run -it -d  --network="host" --restart="always" --privileged=true \
--name "kali-ganglia-a-node-client" \
--entrypoint "/sbin/init" \
c4pt/kali-ganglia-client-node:a_client_node

docker exec -it kali-ganglia-a-node-client /bin/bash &

echo 'to connect run "docker exec -it kali-ganglia-a-node-client /bin/bash" '
