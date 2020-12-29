FROM ubuntu
LABEL Author="rchd"
RUN apt update && apt install vim -y
RUN apt install git -y
ADD ./init.vim ~/
CMD ["vim"]
