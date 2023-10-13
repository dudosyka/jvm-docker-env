# jvm-web-docker
> Docker compose configuration for running JVM-based server with nginx as proxy

## Services

1. Maria - mariadb container which is linked to iternal network and blocked for external requests
2. Jvm - jvm-run env based on eclipse-temurin docker image. Linked to iternal network to get access to the Maria and external to expose ports. That container exposes ports 8XXX, 9XXX. They can be used to get access from the host network
3. Nginx - nginx container which used to proxy jvm applications
4. Prometheus - for metrics scrapping from JVM
5. Grafana - for prometheus visualization


## Networks

1. iternal (for services which are closed for external requests)
2. exposed (for services which are exposed for external requests)

#### Iternal

Iternal network used to protect services which must be isolated.
That network contains Mariadb container (to protect it from external access) and Jvm (to provide Jvm access to the Database)
Also it used for runnnig Grafana and Prometheus

#### Exposed

Exposed network used for containers which should be accessed from external
That network contains Nginx container which used to proxy Jvm apps and Jvm itself (to provide Nginx access to the Applications) 

## Structure
<pre>
  ./nginx <-- Nginx container configuration
    ./home <-- Linked to /home at the container
      wait-for-it.sh <-- Script which provide functionality of waiting for other containers initialization 
      startup.sh <-- Runs wait-for-it && nginx

    ./conf.d <-- Linked to /etc/nginx/conf.d at the container
      Here you must place your nginx hosts configuration  
      
  ./jvm <-- Jvm container configuration
    ./home <-- Linked to /home at the container
      wait-for-it.sh <-- Script which provide functionality of waiting for other containers initialization 
      startup.sh <-- Runs wait-for-it && jar from ./dist

    ./dist <-- Linked to /opt/application at the container
      Here you must place your jars
      
  ./mariadb <-- Mariadb container configuration
    ./home <-- Linked to /home at the container
      You can use it for file communication with container (for example for dumps export)

    ./start_dump <-- Linked to /docker-entrypoint-initdb.d
      Here you can place some initialization SQL files for example to load dumps or something 
  
  ./prometheus <-- Prometheus container configuration (/ linked to /etc/prometheus at the container)
    ./home <-- Linked to /home at the container
      You can use it for file communication with container 
      prometheus.yml <-- Prometheus scrape conf
      TestService.json <-- Example of target configuration in external file (take a look into prometheus.yml for more info)
      
  ./grafana <-- Grafana container configuration
    ./data <-- Linked to /var/lib/grafana at the container
    ktor_status_dashboard.json <-- Grafana dashboard example configuration (for Ktor framework based application) 
      
  docker-compose.yml <-- Compose configuration
</pre>

> You can edit startup files at nginx and jvm homes if you dont have to wait for other containers initialization. <br>
> When cloning repo dont forget to check rights for sh files (it should be +x to be able to run on startup)

## How to use

1. Firstly clone the repo (dont forget to star repo ^_^)
3. Build your jar and place it to /jvm/dist/ with name app.jar
4. Edit startup files if you need
5. run docker compose ^_^

## FAQ

1. Mysql credentials configuration placed into its Dockerfile ( /mariadb/Dockerfile )
2. By default only Nginx container exposes ports (80, 443) other containers are isolated by networks. So if you need to expose Mariadb or Jvm ports edit corresponging service at the docker-compose.yml
