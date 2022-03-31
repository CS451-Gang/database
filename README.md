# database
Database layout for test data on students, faculty, courses, etc.

## Docker Setup

### Container
1. Build the docker image.
2. Run the container.
   - `-p 3306:3306` maps local port 3306 to the container's port 3306
   - `-d` means "detached" = run in the background

```console
$ docker image build -t umkcdb .
$ docker run -p 3306:3306 --name=umkcdb -d umkcdb
```

I ran into a problem with a different MySQL instance already listening on port 3306, so I found its process ID (969, yours will be different) and stopped it with these commands.

```console
$ sudo netstat -pna | grep 3306
tcp        0        0 0.0.0.0:3306        0.0.0.0:*        LISTEN 969/mysql
$ sudo kill 969
```

Now we should be able to connect to the MySQL server from outside of the container from something like MySQL Workbench.