FROM alpine

ARG TARGETOS
ARG TARGETARCH
ARG KUBESCORE_VERSION

ENV KUBESCORE_VERSION="${KUBESCORE_VERSION:-1.14.0}"
ENV HELM_VERSION="${HELM_VERSION:-v3.9.2}"

RUN apk add --update --no-cache wget git bash curl yq && \
    wget "https://get.helm.sh/helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz" -O - | tar -xz && \
    mv ${TARGETOS}-${TARGETARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf ${TARGETOS}-${TARGETARCH}
RUN chmod +x /usr/bin/helm

WORKDIR /apps

RUN apk add openssl && \
    wget "https://github.com/zegl/kube-score/releases/download/v${KUBESCORE_VERSION}/kube-score_${KUBESCORE_VERSION}_${TARGETOS}_${TARGETARCH}" && \
    mv kube-score_${KUBESCORE_VERSION}_${TARGETOS}_${TARGETARCH} kube-score && \
    chmod +x kube-score && \
    mv kube-score /usr/local/bin
