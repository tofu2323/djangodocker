## Dev
```bash
docker-compose up
```


## Test
```bash
$ docker-compose run  -e DJANGO_SETTINGS_MODULE=djangodocker.settings.testing --no-deps --rm app py.test
```