from golang as builder

workdir /app
copy . .

run go get -d ./... && \
    go install ./...

run CGO_ENABLED=0 GOOS=linux go build -a -o permissions .

from golang:alpine

workdir /app
copy --from=builder /app/testdata testdata 
copy --from=builder /app/permissions .

cmd ["/app/permissions"]

