
export XDG_RUNTIME_DIR=/run/user/%I && /usr/lib/systemd/systemd --user &


docker run -it -d  --network="host" --restart="always" --privileged=true \
--name "kali-ganglia-cluster-main" \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--entrypoint "/sbin/init" \
c4pt/kali-gangila-cluster-main
docker exec -it kali-ganglia-cluster-main /bin/bash &

firefox http://127.0.0.1/ganglia
