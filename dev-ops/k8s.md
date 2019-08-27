# Kubernetes

Kubernetes（常简称为K8s）是用于自动部署、扩展和管理容器化（containerized）应用程序的开源系统。它旨在提供“跨主机集群的自动部署、扩展以及运行应用程序容器的平台”。[4] 它支持一系列容器工具, 包括Docker等。

## kubectl

kubectl 用它来操作 Kubernetes 命令行工具。

### 安装

参考 <https://kubernetes.io/docs/tasks/tools/install-kubectl/>

```
$ brew install kubernetes-cli
```

### 配置

`kubeconfig` 文件存储到 `$HOME/.kube`

### 显示和查找资源

```
kubectl [command] [TYPE] [NAME] [flags]
```

```shell
# Get commands with basic output
$ kubectl get services                          # 列出所有 namespace 中的所有 service
$ kubectl get pods --all-namespaces             # 列出所有 namespace 中的所有 pod
$ kubectl get pods -o wide                      # 列出所有 pod 并显示详细信息
$ kubectl get deployment my-dep                 # 列出指定 deployment
$ kubectl get pods --include-uninitialized      # 列出该 namespace 中的所有 pod 包括未初始化的

# 使用详细输出来描述命令
$ kubectl describe nodes my-node
$ kubectl describe pods my-pod

$ kubectl get services --sort-by=.metadata.name # List Services Sorted by Name

# 根据重启次数排序列出 pod
$ kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# 获取所有具有 app=cassandra 的 pod 中的 version 标签
$ kubectl get pods --selector=app=cassandra rc -o \
  jsonpath='{.items[*].metadata.labels.version}'

# 获取所有节点的 ExternalIP
$ kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'

# 列出属于某个 PC 的 Pod 的名字
# “jq”命令用于转换复杂的 jsonpath，参考 https://stedolan.github.io/jq/
$ sel=${$(kubectl get rc my-rc --output=json | jq -j '.spec.selector | to_entries | .[] | "\(.key)=\(.value),"')%?}
$ echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})

# 查看哪些节点已就绪
$ JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \
 && kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True"

# 列出当前 Pod 中使用的 Secret
$ kubectl get pods -o json | jq '.items[].spec.containers[].env[]?.valueFrom.secretKeyRef.name' | grep -v null | sort | uniq
```

与运行中的 Pod 交互

```shell
$ kubectl logs my-pod                                 # dump 输出 pod 的日志（stdout）
$ kubectl logs my-pod -c my-container                 # dump 输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）
$ kubectl logs -f my-pod                              # 流式输出 pod 的日志（stdout）
$ kubectl logs -f my-pod -c my-container              # 流式输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）
$ kubectl run -i --tty busybox --image=busybox -- sh  # 交互式 shell 的方式运行 pod
$ kubectl attach my-pod -i                            # 连接到运行中的容器
$ kubectl port-forward my-pod 5000:6000               # 转发 pod 中的 6000 端口到本地的 5000 端口
$ kubectl exec my-pod -- ls /                         # 在已存在的容器中执行命令（只有一个容器的情况下）
$ kubectl exec my-pod -c my-container -- ls /         # 在已存在的容器中执行命令（pod 中有多个容器的情况下）
$ kubectl top pod POD_NAME --containers               # 显示指定 pod 和容器的指标度量
```

### 查看指定 service 或 pod 信息

```shell
# 列出所有 services
$ kubectl get services

# 查看指定 service 详情
$ kubectl get describe services <my-service>
Labels:            run=my-service
Selector:          app=my-service,enable=true
Type:              ClusterIP
IP:                XX.XX.X.XX
Port:              grpc  50051/TCP
Port:              http  9001/TCP

# 列出 my-service 的所有 pods
$ kubectl get pods --selector="app=my-service,enable=true" --output=wide
```

### port-forward

参考 [Use Port Forwarding to Access Applications in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/) 进行端口映射

```
kubectl port-forward <pod-name> <locahost-port>:<pod-port>
```

代理到 Pod

```
$ kubectl port-forward my-pod 5000:6000               # 转发 pod 中的 6000 端口到本地的 5000 端口
```

代理到 Service

```
$ kubectl port-forward svc/my-service 5000:6000               # 转发 service 中的 6000 端口到本地的 5000 端口
```

`-n namespace` 指定 namespace

### References

* [Kubectl GitHub](https://github.com/kubernetes/kubectl)
* [Kubectl 文档](https://kubernetes.io/docs/reference/kubectl/)
* [kubectl 命令技巧大全](https://jimmysong.io/kubernetes-handbook/guide/kubectl-cheatsheet.html)

## Other

### Kubernetes Millicores

参考 <https://www.noqcks.io/notes/2016/12/14/kubernetes-understanding-millicores/>

```
Kubernetes has a new metric called Millicores that is used to measure CPU usage. It is a CPU core split into 1000 units (milli = 1000).

If you have 4 cores, then the CPU capacity of the node is 4000m.
```

## References

* [Kubernetes Wikipedia](https://zh.wikipedia.org/wiki/Kubernetes)
* [Kubernetes GitHub](https://github.com/kubernetes/kubernetes)
* [Kubernetes 官方中文文档](https://kubernetes.io/zh/docs/home/)
