# Docker-Compose

### Setup docker

Install docker on your local machine: https://www.docker.com/products/docker-desktop/

### Setup project

```
cp .env.example to .env
docker-compose up -d --build
```

After docker setup everything, then run each command bellow:

- Create app key:

```
docker-compose exec workspace sh -c 'php artisan key:generate'
```

- Create the database tables and seed the roles and users tables

- create the storage symlink
```
docker-compose exec workspace sh -c 'php artisan migrate --seed'
```


If a prompt is displayed, type yes

Would you like to create it? (yes/no) [no]
❯ yes


```
docker-compose exec workspace sh -c 'php artisan storage:link'
```

Access to: localhost:8000 and enjoy it!

### Access

You can access to workspace container:

```
docker-compose exec -it workspace bash
```

