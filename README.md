# alpine base image

## tips and tricks

### Using crond
If you need schedueled tasks. Busybox comes with a simple `crond`, just create a service to start it.
Something like `exec /usr/sbin/crond -f -l 2` should do the trick.

### crond run lock
Busybox also comes with a version of `flock`. If you want your example your crond script to run every 15 minute, but not if already running.
Just create a script like this

```sh
#!/bin/sh

(flock -nx 200 ||  exit 2

# your script inside here...

)200>/var/lock/scriptname.lock
```
