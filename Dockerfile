FROM golang:1.22

WORKDIR /app

# по хорошему наверное надо положить файл базы tracker.db в отдельный каталог и смонтировать его как VOLUME
# чтобы файл базы сохранялся
COPY go.mod go.sum tracker.db .

RUN go mod download

COPY *.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o ./parcel_service

CMD ["/app/parcel_service"]
