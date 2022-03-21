# database
Database layout for test data on students, faculty, courses, etc.

## Docker Setup

### Container
1. In your shell, build and run a new Docker container named `umkcdb`.
   - `-d` runs the container in the background (detached).
   - `-p 3306:3306` just maps `localhost:3306` to the same port on the container.
2. MySQL will generate a random password stored in the Docker logs, it can be pulled out with `grep`.
3. Copy the password and use it to authenticate with the third command, which starts a MySQL session in the Docker container.

```console
$ docker run -p 3306:3306 --name=umkcdb -d mysql/mysql-server:latest
$ docker logs 2>&1 umkcdb | grep GENERATED
$ docker exec -it umkcdb mysql -uroot -p
```

I ran into a problem with a different MySQL instance already listening on port 3306, so I found its process ID (969, yours will be different) and stopped it with these commands.

```console
$ sudo netstat -pna | grep 3306
tcp        0        0 0.0.0.0:3306        0.0.0.0:*        LISTEN 969/mysql
$ sudo kill 969
```

### MySQL

1. Change the root user's password to something more memorable, for local testing I just use `root` but we'll use something more secure when we actually build.
2. MySQL is set to only allow communication from inside the image by default, so update the `host` to `%` to open up communication to the outside world.

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'newPassword';
UPDATE mysql.user SET host = '%' WHERE user='root';
```

Now we can quit the container (Ctrl+D first out of MySQL and again out of the container) and restart it.

```console
$ docker restart umkcdb
```

Now we should be able to connect to the MySQL server from outside of the container from something like MySQL Workbench.