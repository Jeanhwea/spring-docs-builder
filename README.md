## Get Spring Framework Docs

Get builder results
```shell
docker run --name builder \
       -v /srv/builder/shares:/assets/shares \
       jeanhwea/spring-docs-builder
```

Enter container
```shell
docker run --name builder \
       -it --entrypoint bash \
       -v /srv/builder/shares:/assets/shares \
       jeanhwea/spring-docs-builder
```

## BUILD

| Date       | Version |
|------------|---------|
| 2021-01-24 | v1.0.4  |
