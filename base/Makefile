build:
	docker build $(BUILD_ARGS) --build-arg JITSI_RELEASE=$(JITSI_RELEASE) -t $(JITSI_REPO)/base -f Dockerfile.$(shell uname -m) .

.PHONY: build
