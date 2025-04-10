.PHONY: build-x86 build-arm64 push all

# Build Vars
IMAGENAME=habolanos/netshoot
VERSION=1.0.0


.DEFAULT_GOAL := all

build-x86:
	    @docker build --platform linux/amd64 -t ${IMAGENAME}:${VERSION} .
build-arm64:
		@docker build --platform linux/arm64 -t ${IMAGENAME}:${VERSION} .
build-all:
		@docker buildx build --platform linux/amd64,linux/arm64 --output "type=image,push=false" --file ./Dockerfile .
push:
	 	@docker push ${IMAGENAME}:${VERSION} 
all: build-all push