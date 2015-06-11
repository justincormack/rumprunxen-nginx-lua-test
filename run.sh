#!/bin/sh

export RUMPRUN_WARNING_STFU=please

docker run justincormack/rumprunxen-nginx-lua-test cat /usr/local/bin/nginx > nginx
docker run justincormack/rumprunxen-nginx-lua-test cat /usr/src/rumprun/app-tools/rumprun > rumprun
docker run justincormack/rumprunxen-nginx-lua-test cat /usr/src/rump-nginx-lua-test/data.iso > data.iso
docker run justincormack/rumprunxen-nginx-lua-test cat /usr/src/rump-nginx-lua-test/etc.iso > etc.iso

chmod +x rumprun

./rumprun  -S xen -i -M 128 -N rumprun-nginx-lua -I iftag,xenif -W iftag,inet,dhcp -b etc.iso,/etc -b data.iso,/data ./nginx -c /data/conf/nginx.conf
