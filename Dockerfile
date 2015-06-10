FROM justincormack/rumprunxen-nginx-lua

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua-test

WORKDIR /usr/src/rump-nginx-lua-test

RUN \
  genisoimage -l -r -o etc.iso etc && \
  genisoimage -l -r -o data.iso data
 
CMD rumprun -d -i -W xennet0,inet,dhcp -b /etc,etc.iso -b /data,data.iso xen /usr/local/bin/nginx -- -c /data/conf/nginx.conf
