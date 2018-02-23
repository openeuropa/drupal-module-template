# OpenEuropa module-skeleton
[![Build Status](https://travis-ci.org/ec_europa/module-skeleton.svg?branch=master)](https://travis-ci.org/ec_europa/module-skeleton)


## Start development of a new module
Start building a new module
```
$ composer create-project openeuropa/module-skeleton oe_my_new_module
```

### Replace all occurrences of `module-skeleton` with the module name.
@todo

### Rename the info file.
@todo

### Remove the reference to this script from the composer manifest and delete it.
@todo

## Development setup

You can build the test site by running the following steps.

* Install all the composer dependencies:

```
$ composer install
```

* Customize build settings by copying `runner.yml.dist` to `runner.yml` and
changing relevant values, like your database credentials.

* Setup test site by running:

```
$ ./vendor/bin/run drupal:site-setup
```

This will symlink the theme in the proper directory within the test site and
perform token substitution in test configuration files such as `behat.yml.dist`.

* Install test site by running:

```
$ ./vendor/bin/run drupal:site-install
```

Your test site will be available at `./build`.

### Using Docker Compose

Alternatively you can build a test site using Docker and Docker-compose with the provided configuration.

Requirements:

- [Docker](https://www.docker.com/get-docker)
- [Docker-compose](https://docs.docker.com/compose/)

Run:

```
$ docker-compose up -d
```

Then:

```
$ docker-compose exec -u web web composer install
$ docker-compose exec -u web web ./vendor/bin/run drupal:site-setup
$ docker-compose exec -u web web ./vendor/bin/run drupal:site-install
```

Your test site will be available at [http://localhost:8080/build](http://localhost:8080/build).

To run the behat test:

```
$ docker-compose exec -u web web ./vendor/bin/behat
```
