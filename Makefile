AMQONLINE_VERSION=0.28.0
INTEGREATLY_VERSION=1.8.4
3SCALE_VERSION=1.9.7
AMQSTREAMS_VERSION=1.1.0
RHSSO_VERSION=1.8.2
CODEREADY_VERSION=1.2.2
FUSEONLINE_VERSION=7.4.0
NEXUS_VERSION=0.9.0
TUTORIAL_WEB_APP_VERSION=0.0.27
LAUNCHER_VERSION=0.1.2
MOBILE_SECURITY_SERVICE_VERSION=0.4.1

AUTH_TOKEN=$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')

push/all: push/integreatly push/amqstreams push/3scale push/fuse push/rhsso push/codeready push/amqonline push/nexus push/launcher push/solution-explorer push/mobile-security-service

push/integreatly:
	operator-courier verify integreatly
	-operator-courier push integreatly/ $(REPO) integreatly $(INTEGREATLY_VERSION) "$(AUTH_TOKEN)"

push/amqstreams:
	operator-courier verify integreatly-amq-streams
	-operator-courier push integreatly-amq-streams/ $(REPO) integreatly-amq-streams $(AMQSTREAMS_VERSION) "$(AUTH_TOKEN)"

push/3scale:
	operator-courier verify integreatly-3scale
	-operator-courier push integreatly-3scale/ $(REPO) integreatly-3scale $(3SCALE_VERSION) "$(AUTH_TOKEN)"

push/launcher:
	operator-courier verify integreatly-launcher
	-operator-courier push integreatly-launcher/ $(REPO) integreatly-launcher $(LAUNCHER_VERSION) "$(AUTH_TOKEN)"

push/rhsso:
	operator-courier verify integreatly-rhsso
	-operator-courier push integreatly-rhsso/ $(REPO) integreatly-rhsso $(RHSSO_VERSION) "$(AUTH_TOKEN)"

push/codeready:
	operator-courier verify integreatly-codeready-workspaces
	-operator-courier push integreatly-codeready-workspaces/ $(REPO) integreatly-codeready-workspaces $(CODEREADY_VERSION) "$(AUTH_TOKEN)"

push/fuse:
	operator-courier verify integreatly-fuse
	-operator-courier push integreatly-fuse/ $(REPO) integreatly-syndesis $(FUSEONLINE_VERSION) "$(AUTH_TOKEN)"

push/amqonline:
	operator-courier verify integreatly-amq-online
	-operator-courier push integreatly-amq-online/ $(REPO) integreatly-amq-online $(AMQONLINE_VERSION) "$(AUTH_TOKEN)"

push/nexus:
	operator-courier verify integreatly-nexus
	-operator-courier push integreatly-nexus/ $(REPO) integreatly-nexus $(NEXUS_VERSION) "$(AUTH_TOKEN)"

push/solution-explorer:
	operator-courier verify integreatly-solution-explorer
	-operator-courier push integreatly-solution-explorer/ $(REPO) integreatly-solution-explorer $(TUTORIAL_WEB_APP_VERSION) "$(AUTH_TOKEN)"

push/mobile-security-service:
	operator-courier verify integreatly-mobile-security-service
	-operator-courier push integreatly-mobile-security-service/ $(REPO) integreatly-mobile-security-service $(MOBILE_SECURITY_SERVICE_VERSION) "$(AUTH_TOKEN)"
