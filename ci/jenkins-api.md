# Jenkins API

* [Jenkins 文档](https://javadoc.jenkins-ci.org/jenkins/model/Jenkins.html)
* [Job 文档](https://javadoc.jenkins-ci.org/hudson/model/Job.html)
* [Build 文档](https://javadoc.jenkins-ci.org/hudson/model/Build.html)

```
// Jenkins
def jenkins = Jenkins.instance
// Job
def job = jenkins.getItem('job name')
// Build
def build = job.getBuildByNumber(<build number>)
```

## get current stage

```
import hudson.model.Action

import org.jenkinsci.plugins.workflow.graph.FlowNode
import org.jenkinsci.plugins.workflow.cps.nodes.StepStartNode
import org.jenkinsci.plugins.workflow.actions.LabelAction

def getCurrentStage() {
  def build = currentBuild.getRawBuild()
  def execution = build.getExecution()
  def executionHeads = execution.getCurrentHeads()
  def stepStartNode = getStepStartNode(executionHeads)
  println 'stage: ' + stepStartNode ? stepStartNode.getDisplayName() : 'null'
  return stepStartNode
}

def getStepStartNode(List<FlowNode> flowNodes) {
  def currentFlowNode = null
  def labelAction = null
  for (FlowNode flowNode: flowNodes) {
    currentFlowNode = flowNode
    labelAction = false
    if (flowNode instanceof StepStartNode) {
      labelAction = hasLabelAction(flowNode)
    }
    if (labelAction) {
      return flowNode
    }
  }
  if (currentFlowNode == null) {
    return null
  }
  return getStepStartNode(currentFlowNode.getParents())
}

def hasLabelAction(FlowNode flowNode) {
  def actions = flowNode.getActions()
  for (Action action: actions) {
    if (action instanceof LabelAction) {
      return true
    }
  }
  return false
}
```

## get stage log

### build.getLog

缺点

* parallel 模式日志是无序的

### 日志存文件

缺点

* 命令报错，返回状态码仍然是成功
* tee 不支持 windows

```
stage('log') {
  sh comand | tee log.log
  def log readFile log.log
}
```

### blue ocean api

参考

* [blueocean-rest](https://github.com/jenkinsci/blueocean-plugin/tree/master/blueocean-rest#log-api)
* https://stackoverflow.com/questions/53444196/get-log-for-each-jenkins-pipeline-stage

缺点

* 用起来比较麻烦，要发网络请求
