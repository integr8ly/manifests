to push a changed manifest to your quay.io application repository:

- Install [helm](https://helm.sh/docs/using_helm/).
- Install [operator-courier](https://github.com/operator-framework/operator-courier#installation).
- Get an auth token, run:
```
export QUAY_USERNAME=QUAY USERNAME
export QUAY_PASSWORD="QUAY PASSWORD”
AUTH_TOKEN=$(curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '
{
    "user": {
       "username": "'"${QUAY_USERNAME}"'",
       "password": "'"${QUAY_PASSWORD}"'"
    }
}' | jq -r '.token')
```

Run:
```
make push AUTH_TOKEN="${AUTH_TOKEN}"
```