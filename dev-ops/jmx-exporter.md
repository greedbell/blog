# JMX Exporter

* [GitHub](https://github.com/prometheus/jmx_exporter)

## 集成步骤

1. <https://mvnrepository.com/artifact/io.prometheus.jmx/jmx_prometheus_javaagent/0.12.0> 下载 jmx_prometheus_javaagent-0.12.0.jar
2. 参考 <https://github.com/prometheus/jmx_exporter/blob/master/example_configs/tomcat.yml> 配置 jmx_exporter.yml
3. 配置 JAVA_OPTS ` -javaagent:/your/path/to/jmx_prometheus_javaagent.jar=2112:/your/path/to/jmx_exporter.yml`

运行 java 程序，通过 2112 端口查看 JVM 信息

## References

* [使用Prometheus+Grafana监控JVM](https://chanjarster.github.io/post/prom-grafana-jvm/)
* [在k8s集群中，利用prometheus的jmx_exporter进行tomcat的JVM性能监控，并用grafana作前端展示](https://www.cnblogs.com/aguncn/p/10106453.html)
