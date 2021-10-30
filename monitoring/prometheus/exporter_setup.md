# Exporter Configuration

## Install node Exporter
scrape_config = section of the Prometheus config file provides a list of targets the Prometheus server will scrape, such as a Node Exporter running on a Linux machine.
Prometheus server will scrape these targets periodically to collect metric data.

sudo useradd -M -r -s /bin/false node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz

tar xvfz node-xxx

sudo cp node-xxx/node_exporter /usr/local/bin/

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

### Create node exporter service

sudo vim /etc/systemd/system/node_exporter.service
ref : node_exporter.service

### Configure prometheus server to reach node exporter
Ref : server_setup.md