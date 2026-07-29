.PHONY: build up down clean rebuild shell logs lint build-app astro-check

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

clean:
	docker compose down --rmi local -v
	rm -rf .astro
	rm -rf node_modules

rebuild: clean build up

shell:
	docker compose exec app sh

logs:
	docker compose logs -f

lint:
	docker compose exec app npm run lint

build-app:
	docker compose exec app npm run build

astro-check:
	docker compose exec app npm run astro check
