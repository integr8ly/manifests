REPO=integreatly
INTEGREATLY_VERSION=1.0.1
3SCALE_VERSION=0.8.0
AMQSTREAMS_VERSION=1.1.0

push/all: push/integreatly push/amqstreams push/3scale

push/integreatly:
	operator-courier verify integreatly
	operator-courier push integreatly/ $(REPO) integreatly $(INTEGREATLY_VERSION) "$(AUTH_TOKEN)"

push/amqstreams:
	operator-courier verify amq-streams
	operator-courier push amq-streams/ $(REPO) amq-streams $(AMQSTREAMS_VERSION) "$(AUTH_TOKEN)"

push/3scale:
	operator-courier verify 3scale
	operator-courier push 3scale/ $(REPO) 3scale $(3SCALE_VERSION) "$(AUTH_TOKEN)"