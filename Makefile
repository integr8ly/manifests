REPO=integreatly
INTEGREATLY_VERSION=1.0.0
3SCALE_VERSION=0.8.0
AMQSTREAMS_VERSION=1.1.0
RHSSO_VERSION=1.3.5

push/all: push/integreatly push/amqstreams push/3scale push/rhsso

push/integreatly:
	operator-courier verify integreatly
	operator-courier push integreatly/ $(REPO) integreatly $(INTEGREATLY_VERSION) "$(AUTH_TOKEN)"

push/amqstreams:
	operator-courier verify integreatly-amq-streams
	operator-courier push integreatly-amq-streams/ $(REPO) integreatly-amq-streams $(AMQSTREAMS_VERSION) "$(AUTH_TOKEN)"

push/3scale:
	operator-courier verify 3scale
	operator-courier push 3scale/ $(REPO) 3scale $(3SCALE_VERSION) "$(AUTH_TOKEN)"

push/rhsso:
	operator-courier verify rhsso
	operator-courier push rhsso/ $(REPO) rhsso $(RHSSO_VERSION) "$(AUTH_TOKEN)"