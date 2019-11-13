# Sonar analysis in chaincodes

## Prerequistes:

- Sonar-scanner installed in the host machine (in MacOS you can install it with brew)
- Docker 19.03
- Go 1.12

## Run the test and generate report

First it is necessary to run the sonar server

```
cd miscelanea
docker-compose up -d 
```

Once the server is up, it is necessary to execute the test and the code coverage

````
mkdir -p bi
go test -short -coverprofile=bin/cov.out `go list ./... | grep -v vendor/`
go tool cover -func=bin/cov.out
````
The next step is to execute the sonnar scanner
````
sonar-scanner
```

Finally, the report will be done. We can see it in the browser in the following url http://localhost:9000/


## Run this repository

If you execute the following command, you will execute the past steps in one command.

```
make test
```



The following repository is an example https://github.com/remast/service_sonar


