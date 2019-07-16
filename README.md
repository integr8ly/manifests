# Integreatly manifests

To push a changed manifest to your quay.io application repository:

- Install [helm](https://helm.sh/docs/using_helm/)
- Install [operator-courier](https://github.com/operator-framework/operator-courier#installation)

Do not push these manifests to the integreatly repo, ever, as these manifests cannot be modified after they have been pushed.

Run (**N.B. REPO must always be set, and never set to "integreatly"**):
```sh
make push/<product|all> REPO="<quay username>" QUAY_USERNAME="<username>" QUAY_PASSWORD="<password>"
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

So be sure you add your components to that and keep the Makefile up to date!

## Generating a CSV
To generate a Cluster Service Version (CSV) manifest, from the operator directory run the `operatork-sdk olm-catalog gen-csv` command. For more information, see the operator-sdk CLI reference [here](https://github.com/operator-framework/operator-sdk/blob/master/doc/sdk-cli-reference.md#gen-csv).
