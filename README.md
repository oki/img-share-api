# README

## Description

Simple self-hosted image hosting service with image api sharing.

* Rails 7
* Postgres 14

## Development

```
docker-compose up -d
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s
```

Go to the [Active Admin Panel](http://localhost:3000/admin)

## Production
### Docker compose
```
docker-compose up -d
docker-compose exec web bundle exec rails db:migrate
docker-compose exec web bundle exec rails db:seed
```

### Kubernetes



