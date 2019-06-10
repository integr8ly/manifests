MANIFEST=integreatly
REPO=integreatly
VERSION=1.0.0

push:
	operator-courier verify $(MANIFEST)
	operator-courier push $(MANIFEST)/ $(REPO) $(MANIFEST) $(VERSION) "$(AUTH_TOKEN)"
