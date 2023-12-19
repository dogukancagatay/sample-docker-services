# Prometheus - Grafana Example

## Running

```sh
docker compose up -d
```

## Install node-exporter as a OS service

```sh
wget -P /tmp/ https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar -C /tmp -xzf /tmp/node_exporter-1.7.0.linux-amd64.tar.gz
sudo cp /tmp/node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/node_exporter
sudo chmod +x /usr/local/bin/node_exporter

sudo tee /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
EnvironmentFile=-/etc/node_exporter.conf
ExecStart=/usr/local/bin/node_exporter \$ARGS
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter
```


### node_exporter Configuration

```sh
sudo tee /etc/node_exporter.conf <<EOF
ARGS='--web.listen-address=:9100 --web.telemetry-path="/metrics" --collector.systemd --collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc|run|boot|var/snap|var/lib/docker/overlay2|var/lib/containers/storage/overlay)(\$\$|/)'
EOF
```


### Running with its own user

Add user

```sh
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

Change

```sh
[Service]
User=node_exporter
Group=node_exporter
Type=simple
EnvironmentFile=-/etc/sysconfig/node_exporter
ExecStart=/usr/local/bin/node_exporter $ARGS
Restart=always
RestartSec=3
```
