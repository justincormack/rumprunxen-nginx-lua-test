#!/bin/sh

docker pull justincormack/rumprunxen-nginx-lua-test

docker run justincormack/rumprunxen-nginx-lua-test cat /usr/local/bin/nginx > nginx
docker run justincormack/rumprunxen-nginx-lua-test cat /usr/src/rumprun/app-tools/rumprun > rumprun
docker run /usr/src/rump-nginx-lua-test/data.iso > data.iso

./rumprun xen -d -i -W xennet0,inet,dhcp -b etc.iso,/etc -b data.iso,/data /usr/local/bin/nginx -- -c /data/conf/nginx.conf
