INTEGREATLY_VERSION=1.1.0
3SCALE_VERSION=0.8.0
AMQSTREAMS_VERSION=1.1.0
RHSSO_VERSION=1.6.1
CODEREADY_VERSION=1.2.2
FUSE_VERSION=1.7.0

push/all: push/integreatly push/amqstreams push/3scale push/fuse push/rhsso push/codeready

push/integreatly:
	operator-courier verify integreatly
	-operator-courier push integreatly/ $(REPO) integreatly $(INTEGREATLY_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"

push/amqstreams:
	operator-courier verify amq-streams
	-operator-courier push amq-streams/ $(REPO) amq-streams $(AMQSTREAMS_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"

push/3scale:
	operator-courier verify 3scale
	-operator-courier push 3scale/ $(REPO) 3scale $(3SCALE_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"


push/rhsso:
	operator-courier verify rhsso
	-operator-courier push rhsso/ $(REPO) rhsso $(RHSSO_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"

push/codeready:
	operator-courier verify codeready-workspaces
	-operator-courier push codeready-workspaces/ $(REPO) codeready-workspaces $(CODEREADY_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"

push/fuse:
	operator-courier verify fuse
	-operator-courier push fuse/ $(REPO) syndesis $(FUSE_VERSION) "$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')"