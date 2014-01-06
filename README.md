#Docker-RAILS-UNICORN

Dockerfile for rails application with unicorn.

Rails 4.0.0, ruby 2.0.0-p353

CentOS6.4, Docker 0.7.2

#Usage

```
git clone git@github.com:yss44/docker_rails_unicorn.git
cd docker_rails_unicorn
docker build -t yoshiso/rails_unicorn .
docker run -p 2222 -p 3000 -d yoshiso/rails_unicorn
```


SSH listening port 2222

```
ssh -p 2222 -i path/to/identify_file yoshiso@XXX.XXX.XXX.XXX
```

Unicorn hosted rails application listen port 3000

```
curl http://XXX.XXX.XXX.XXX:3000
> <htm><head>.......
```

ok!
