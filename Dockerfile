FROM justincormack/rumprunxen-nginx-lua

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua-test

WORKDIR /usr/src/rump-nginx-lua-test

RUN \
  genisoimage -l -r -o etc.iso etc && \
  genisoimage -l -r -o data.iso data
 
CMD rumprun xen -d -i -W xennet0,inet,dhcp -b etc.iso,/etc -b data.iso,/data /usr/local/bin/nginx -- -c /data/conf/nginx.conf
