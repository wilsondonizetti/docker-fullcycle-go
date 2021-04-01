FROM golang:1.14-alpine AS builder

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/fullcycle

#RUN go build main.go

FROM scratch
# Copy our static executable.
COPY --from=builder /bin/fullcycle /bin/fullcycle
# Run the hello binary.
ENTRYPOINT ["/bin/fullcycle"]