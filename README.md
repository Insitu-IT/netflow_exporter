# Prometheus netflow Exporter
This is an exporter that exposes information gathered from netflow for use by the Prometheus monitoring system.

now support netflow v5 and v9.

## Installation
go get -d

go build

## Usage
```
./netflow_exporter --help
Usage of ./bin/netflow_exporter:
  -netflow.collect string
        Regexp match type is Collect metrics. (default "Count$")
  -netflow.exclude string
        Regexp match type is not use Label. (default "Time")
  -netflow.listen-address string
        Network address on which to accept netflow binary network packets, e.g. ":2055". (default ":2055")
  -netflow.sample-expiry duration
        How long a sample is valid for. (default 5m0s)
  -version
        Print version information.
  -web.listen-address string
        Address on which to expose metrics. (default ":9191")
  -web.telemetry-path string
        Path under which to expose Prometheus metrics. (default "/metrics")
```
## For example
```
./netflow_exporter -netflow.listen-address :2066 -netflow.sample-expiry 1h -web.listen-address :6666
```
Visit http://localhost:6666/metrics

## Usage docker
```
$ git clone https://github.com/Insitu-IT/netflow_exporter
$ cd netflow_exporter
$ vi Dockerfile - set needed parameters
$ docker build -t netflow_exporter .
$ docker run --name=netflow_exporter -d -p9191:6666 -p2055:2066/udp netflow_exporter
```



