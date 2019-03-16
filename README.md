## pause

This container does nothing but pause waiting for signals.
It will gracefully terminate immediately when it receives one.

It is designed for use in diagnosing Kubernetes, e.g. you
can create a pod with this, it will stay running,
and then exec into it as needed.

The alternative would be a command of 'sleep' or 'tail -f /dev/null'
but these do not terminate gracefully.
