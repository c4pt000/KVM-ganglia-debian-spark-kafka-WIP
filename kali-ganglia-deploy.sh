export XDG_RUNTIME_DIR=/run/user/%I && /usr/lib/systemd/systemd --user &


docker run -it -d --network="host" --restart="always" --privileged=true \
--name "kali-ganglia-mainunit" \
--device /dev/snd \
-e DISPLAY=$DISPLAY \
--stop-signal=SIGRTMIN+3 --cap-add=SYS_ADMIN --security-opt=seccomp:unconfined \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--entrypoint "/sbin/init" \
-p 80:80 \
-p 8649:8649 \
c4pt/kali-ganglia-main-monitor-unit:web-main-unit

docker exec -it c4pt/kali-ganglia-main-monitor-unit:web-main-unit /bin/bash
