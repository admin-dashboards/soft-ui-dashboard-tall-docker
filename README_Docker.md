# Docker-Compose

### I. Setup docker

Install docker on your local machine: https://www.docker.com/products/docker-desktop/

### II. Build

```
cp .env.example to .env
docker-compose up -d --build
```

### III. Setup

#### If you want to set up automatically, just run:

```
sh start.sh
```

If a prompt is displayed, type yes.

Access to: localhost:8000 then enjoy it!

#### If you want to setup as manual, let's run each command under:

- Install npm & php packages: 

```
docker-compose exec workspace sh -c 'composer install && npm install && npm run build'
```

- Create app key:

```
docker-compose exec workspace sh -c 'php artisan key:generate'
```

- Create the database tables and seed the roles and users tables

- create the storage symlink

```
docker-compose exec workspace sh -c 'php artisan migrate && php artisan db:seed --force'
```


If a prompt is displayed, type yes

Would you like to create it? (yes/no) [no]
❯ yes


```
docker-compose exec workspace sh -c 'php artisan storage:link'
```

- Assign permission folder:

```
docker-compose exec workspace sh -c 'chmod -R 777 storage bootstrap/cache'
```

### IV. Access

Access to: localhost:8000 and enjoy it!

You can access to workspace container:

```
docker-compose exec -it workspace bash
```

After the installation is complete, the next times you just need to type:

```
docker-compose up -d
```
