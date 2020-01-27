
export XDG_RUNTIME_DIR=/run/user/%I && /usr/lib/systemd/systemd --user &



docker run -it -d  --network="host" --restart="always" --privileged=true \
--name "ganglia-kali-server" \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--stop-signal=SIGRTMIN+3 --cap-add=SYS_ADMIN --security-opt=seccomp:unconfined \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
--entrypoint "/sbin/init" \
c4pt/ganglia-kali-server

docker exec -it c4pt/ganglia-kali-server /bin/bash &
firefox http://127.0.0.1/ganglia

