FROM ubuntu
LABEL Author="rchd"
RUN apt update && apt install vim -y && apt install openssh-server -y
ENTRYPOINT ['/usr/bin/sshd -t']
