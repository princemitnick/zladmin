# Prometheus Config


sudo useradd -M -r -s /bin/false prometheus
sudo mkdir /etc/prometheus /var/lib/prometheus

wget https://github.com/prometheus/prometheus/releases/download/v2.31.0-rc.1/prometheus-2.31.0-rc.1.linux-amd64.tar.gz

tar xzf prometheus-xxxx

sudo cp prometheus-xxx/{prometheus,promtool} /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/{prometheus,promtool}

sudo cp -r prometheus-xxx/{consoles,console_libraries} /etc/prometheus

sudo cp prometheus-xxx/prometheus.yml /etc/prometheus/prometheus.yaml

sudo chown -R prometheus:prometheus /etc/prometheus

sudo chown -R prometheus:prometheus /var/lib/prometheus

#####################
prometheus --config.file=/etc/prometheus/prometheus.yaml


##############

sudo vi /etc/systemd/system/prometheus.service

## Ref : prometheus.service file

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

"""
"""

##################################
## Configuration file
/etc/prometheus/prometheus.yml

### Reloading new config file
sudo killall -HUP prometheus



## Configure node Exporter
scrape_config = section of the Prometheus config file provides a list of targets the Prometheus server will scrape, such as a Node Exporter running on a Linux machine.
Prometheus server will scrape these targets periodically to collect metric data.

Edit prometheus.yml
Go to "scrape_configs" section

- job_name : 'Server Name'
  static_configs:
  - targets: ['192.168.1.1:9100']

sudo killall -HUP prometheus
