## pause

This container does nothing but pause waiting for signals.
It will gracefully terminate immediately when it receives one.

It is designed for use in diagnosing Kubernetes, e.g. you
can create a pod with this, it will stay running,
and then exec into it as needed.

The alternative would be a command of 'sleep' or 'tail -f /dev/null'
but these do not terminate gracefully.

## Usage

You can run this from docker:
`docker run --rm -it agilicus/pause`

but the most likely use is to create a long-lived Kubernetes pod.

You can do this with `kubectl run`:

`kubectl run debug --restart=Never --image=agilicus/pause`

You can also do this declaratively:

```
cat << EOF | kubectl create -f -
---
apiVersion: v1
kind: Pod
metadata:
  name: debug
spec:
  containers:
  - name: debug
    image: agilicus/pause
EOF
```

When done, run `kubectl delete pod/debug`

There are no tools installed in the container. To add them, run `apt-get update; apt-get install <tool>`.

Simple tools you might want:

- curl
- fping
- tcpdump
- jq
- python3

## License

All files in this directory are made available under the
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

