#Dockerized Zeppelin

##How to use
1. docker build -t jamescross91/zeppelin .
2. docker run -d -p 8080:8080 jamescross91/zeppelin
3. Get the ip for your docker machine: docker-machine ip default
4. Browse to %docker-machine-ip%:8080