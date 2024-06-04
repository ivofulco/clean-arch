create-migration:
	migrate create -ext=sql -dir=sql/migrations -seq $(name)

migrate:
	migrate -path=internal/sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up

rollback:
	migrate -path=internal/sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose down

go-run: migrate
	cd ./cmd/ordersystem/; 	go run main.go wire_gen.go

docker-up: 
	docker compose up -d;

install-migrate:
	curl -s https://packagecloud.io/install/repositories/golang-migrate/migrate/script.deb.sh | sudo bash ;
	sudo apt-get update -y ;
	sudo apt-get install migrate -y

install-protobuf:
	sudo snap install protobuf --classic

pre-req: install-migrate install-protobuf


requests: post get

post:
	curl -X POST -d '{"id": "xpto","price": 100.5, "tax":0.5}' http://localhost:8000/order

get:
	@sleep 3s ;
	curl -X GET http://localhost:8000/order

desafio: docker-up go-run



docker-clean:
	sudo docker rm -f $(docker ps -a -q)
	sudo docker rmi -f $(docker images -q)
	sudo docker system prune -af
	sudo docker volume prune -f