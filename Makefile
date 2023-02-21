docker-create-volumes:
	docker volume create --name=main_db_volume

docker-rm-volumes:
	docker rm main_db_volume

docker-compose:
	docker-compose up