FROM alpine:latest
COPY docker-proxy /bin/docker-proxy
ENTRYPOINT ["/bin/docker-proxy"]
CMD ["-h"]
