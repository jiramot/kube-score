build:
	docker buildx create --use
	docker buildx build --push --build-arg KUBESCORE_VERSION=1.14.0 --build-arg HELM_VERSION=v3.9.2 --platform linux/arm64/v8,linux/amd64 -t ghcr.io/jiramot/kube-score:v3.9.2 .