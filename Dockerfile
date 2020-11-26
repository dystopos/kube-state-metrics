ARG GOVERSION=1.15
FROM golang:${GOVERSION} as builder
ARG GOARCH
ENV GOARCH=${GOARCH}
WORKDIR /go/src/k8s.io/kube-state-metrics/
COPY . /go/src/k8s.io/kube-state-metrics/

RUN make build-local

FROM gcr.io/distroless/base@sha256:c04ec1216dd804d8db825372eb9f5a434473778c4185cbec698aa54cb9ec1eb3
COPY --from=builder /go/src/k8s.io/kube-state-metrics/kube-state-metrics /

USER nobody

ENTRYPOINT ["/kube-state-metrics", "--port=8080", "--telemetry-port=8081"]

EXPOSE 8080 8081
