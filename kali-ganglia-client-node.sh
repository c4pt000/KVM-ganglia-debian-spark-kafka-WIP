export XDG_RUNTIME_DIR=/run/user/%I && /usr/lib/systemd/systemd --user &


docker run -it -d  --network="host" --restart="always" --privileged=true \
--name "kali-ganglia-a-node-client" \
--device /dev/snd \
-e DISPLAY=$DISPLAY \
--stop-signal=SIGRTMIN+3 --cap-add=SYS_ADMIN --security-opt=seccomp:unconfined \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--entrypoint "/sbin/init" \
c4pt/kali-ganglia-client-node:a_client_node

docker exec -it kali-ganglia-a-node-client /bin/bash &

echo 'to connect run "docker exec -it kali-ganglia-a-node-client /bin/bash" '
