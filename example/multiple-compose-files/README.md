# Multiple compose files

The containers we're building here are based on the (dockprom)[https://github.com/stefanprodan/dockprom] project although a little contrived we're going to split up the building and running of the stack in two separate files `docker-compose.build.yml` for building the images and `docker-compose.yml` for running the entire stack.

# Building and running the stack

After generating the compose files

```bash
# Creating our images 
$ docker-compose --file ./docker-compose.build.yml build

# Running everything
$ docker-compose up --detach
```

# Generating the compose files

```

```
