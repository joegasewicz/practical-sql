docker-create-volumes:
	docker volume create --name=main_db_volume

docker-rm-volumes:
	docker rm main_db_volume

docker-compose:
	docker-compose up


add_csv1:
	docker cp us_counties.csv practical-sql-main_db-1:/tmp

add_csv2:
	docker cp supervisor_salaries.csv practical-sql-main_db-1:/tmp

add_csv3:
	docker cp pls_fy2009_pupld09a.csv practical-sql-main_db-1:/tmp

add_csv4:
	docker cp pls_fy2014_pupld14a.csv practical-sql-main_db-1:/tmp