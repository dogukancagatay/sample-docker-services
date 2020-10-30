# RabbitMQ Clustering (HA Mirror)

## Clustering

Run following command from the second RabbitMQ instance.

```bash
docker exec rabbitmq rabbitmqctl join_cluster rabbit@rabbitmq01.example.com
docker exec rabbitmq rabbitmqctl start_app
docker exec rabbitmq rabbitmqctl set_policy \
    SyncQs \
    '.*' \
    '{"ha-mode":"all", "ha-sync-mode":"automatic"}' \
    --priority 0 \
    --apply-to queues
```