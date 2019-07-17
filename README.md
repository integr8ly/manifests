to push a changed manifest to your quay.io application repository:

- Install [helm](https://helm.sh/docs/using_helm/).
- Install [operator-courier](https://github.com/operator-framework/operator-courier#installation).

Do not push these manifests to the integreatly repo, ever, as these manifests cannot be modified after they have been pushed.

Run (**N.B. REPO must always be set, and never set to "integreatly"**):
```
make push/<product|all> REPO=<your quay.io username> AUTH_TOKEN="$(make token/generate QUAY_USERNAME=<username> QUAY_PASSWORD=<password>)"
```

To see these operators in your operator hub, create the included operator source:
```asciidoc
oc create -f operator-source.yml
```

To use your own application source from quay.io, change the value of `registryNamespace` in the operatorSource to your quay.io username.

When master is merged, travis will automatically run:
```asciidoc
make push/all
```

So be sure you have added your components to that and kept the Makefile upto date!