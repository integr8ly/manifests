AMQONLINE_VERSION=0.28.0
INTEGREATLY_VERSION=1.3.0
3SCALE_VERSION=0.3.0
AMQSTREAMS_VERSION=1.1.0
RHSSO_VERSION=1.7.0
CODEREADY_VERSION=1.2.2
FUSE_VERSION=1.7.0
NEXUS_VERSION=0.8.1
AUTH_TOKEN=$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')

push/all: push/integreatly push/amqstreams push/3scale push/fuse push/rhsso push/codeready push/amqonline push/nexus

push/integreatly:
	operator-courier verify integreatly
	-operator-courier push integreatly/ $(REPO) integreatly $(INTEGREATLY_VERSION) "$(AUTH_TOKEN)"

push/amqstreams:
	operator-courier verify amq-streams
	-operator-courier push amq-streams/ $(REPO) amq-streams $(AMQSTREAMS_VERSION) "$(AUTH_TOKEN)"

push/3scale:
	operator-courier verify 3scale
	-operator-courier push 3scale/ $(REPO) 3scale $(3SCALE_VERSION) "$(AUTH_TOKEN)"

push/rhsso:
	operator-courier verify rhsso
	-operator-courier push rhsso/ $(REPO) rhsso $(RHSSO_VERSION) "$(AUTH_TOKEN)"

push/codeready:
	operator-courier verify codeready-workspaces
	-operator-courier push codeready-workspaces/ $(REPO) codeready-workspaces $(CODEREADY_VERSION) "$(AUTH_TOKEN)"

push/fuse:
	operator-courier verify fuse
	-operator-courier push fuse/ $(REPO) syndesis $(FUSE_VERSION) "$(AUTH_TOKEN)"

push/amqonline:
	operator-courier verify amq-online
	-operator-courier push amq-online/ $(REPO) amq-online $(AMQONLINE_VERSION) "$(AUTH_TOKEN)"
	
push/nexus:
	operator-courier verify nexus
	-operator-courier push nexus/ $(REPO) nexus $(NEXUS_VERSION) "$(AUTH_TOKEN)"
