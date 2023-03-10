.PHONY: all build push

IMAGE	?= ricardocermeno/samcli
LATEST ?= latest

ifeq ($(shell test -e VERSION && echo -n yes),yes)
    VERSION = $(shell cat VERSION)
endif

all: build push-latest gen-version tag-version push-version

build:
	docker build -t  $(IMAGE):$(LATEST) .

push-latest:
	docker push $(IMAGE):$(LATEST)

gen-version:
	docker run $(IMAGE):latest sam --version | awk '{print $$NF}' > VERSION

tag-version:
	docker tag $(IMAGE):$(LATEST) $(IMAGE):$(shell cat VERSION)

push-version:
	docker push $(IMAGE):$(shell cat VERSION)


# Development tasks

run: command ?= ash
run:
	@docker run --rm -it $(IMAGE) $(command)

aws: command ?= --version
aws:
	make run command="aws $(command)"

sam: command ?= --version
sam:
	make run command="sam $(command)"

test:
	@docker run --rm -it $(IMAGE) help