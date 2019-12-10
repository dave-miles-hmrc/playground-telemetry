# playground-telemetry
Docker up a telemetry playground

* `make up       # spin up playground`
* `make down     # tear down playground`
* `make config   # dump docker-compose yaml`
* `make clean    # flush data`
* `make ps       # list stack containers`

# Images in the stack
```
$ grep image docker-compose.yml | sort
    image: confluentinc/cp-kafka:5.3.1
    image: confluentinc/cp-kafka-connect:5.3.1
    image: confluentinc/cp-kafka-rest:5.3.1
    image: confluentinc/cp-ksql-server:5.3.1
    image: confluentinc/cp-schema-registry:5.3.1
    image: docker.elastic.co/elasticsearch/elasticsearch:6.8.0
    image: docker.elastic.co/kibana/kibana:6.8.0
    image: elkozmon/zoonavigator-api:0.5.1
    image: elkozmon/zoonavigator-web:0.5.1
    image: kafkamanager/kafka-manager:2.0.0.2
    image: landoop/kafka-connect-ui:0.9.4
    image: landoop/kafka-topics-ui:0.9.4
    image: landoop/schema-registry-ui:0.9.4
    image: locustio/locust
    image: logstash-consumer:latest
    image: logstash-producer:latest
    image: obsidiandynamics/kafdrop:latest
    image: redis
    image: redislabs/redisinsight
    image: zookeeper:3.4.9
```
