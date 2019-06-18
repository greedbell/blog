# pod lib create 实现过程

研究 pod lib create 是如果完成创建 cocoaPods 工程的。

## 相关工程

* [CocoaPods](https://github.com/CocoaPods/CocoaPods)
* [pod-template](https://github.com/CocoaPods/pod-template)

## CocoaPods

Example:

```shell
$ pod lib create WFT-social --template-url=/Users/Bell/Documents/Gitlab/pod-template/.git
```

`bundle install` 安装所有依赖

### lib.rb

`lib.rb`的完整路径`lib/cocoapods/command/lib.rb`。是实现`pod lib create` 的文件目录.会执行下面命令。

#### clone_template

clone `--template-url` 对应的 repo 到本地

#### configure_template

调用 `pod-template/configure`

#### print_info

打印结果

## pod-template

核心文件

```
├── configure
├── setup
│   ├── ConfigureSwift.rb
│   ├── ConfigureiOS.rb
│   ├── MessageBank.rb
│   ├── ProjectManipulator.rb
│   ├── TemplateConfigurator.rb
```

## configure

```ruby
Pod::TemplateConfigurator.new(pod_name).run
```

调用 `pod-template/setup/TemplateConfigurator.rb` 的 `run` 方法

## TemplateConfigurator

配置工程

### run 方法

run 方法定义了配置工程的所有步骤

```ruby
def run
  @message_bank.welcome_message

  framework = self.ask_with_answers("What language do you want to use?", ["ObjC", "Swift"]).to_sym
  case framework
    when :swift
      ConfigureSwift.perform(configurator: self)

    when :objc
      ConfigureIOS.perform(configurator: self)
  end

  replace_variables_in_files
  clean_template_files
  rename_template_files
  add_pods_to_podfile
  customise_prefix
  ensure_carthage_compatibility
  reinitialize_git_repo
  run_pod_install

  @message_bank.farewell_message
end
```

#### replace_variables_in_files

修改文件里的变量

#### clean_template_files

删除临时文件

#### rename_template_files

修改文件名

#### add_pods_to_podfile

修改`Podfile`

#### customise_prefix

修改 `.pch` 文件

#### ensure_carthage_compatibility

创建软链接

#### reinitialize_git_repo

重新初始化`git`

#### run_pod_install

运行 `pod install`


### ConfigureIOS

配置 objc 工程

```ruby
Pod::ProjectManipulator.new({
  :configurator => @configurator,
  :xcodeproj_path => "templates/ios/Example/PROJECT.xcodeproj",
  :platform => :ios,
  :remove_demo_project => (keep_demo == :no),
  :prefix => prefix,
  :pod_organization => organization
}).run
```

### ProjectManipulator

修改工程文件里的变量

```ruby
def run
  @string_replacements = {
    "PROJECT_OWNER" => @configurator.user_name,
    "TODAYS_DATE" => @configurator.date,
    "TODAYS_YEAR" => @configurator.year,
    "PROJECT" => @configurator.pod_name,
    "CPD" => @prefix,
    "POD_ORGANIZATION" => @pod_organization,
  }
  replace_internal_project_settings

  @project = Xcodeproj::Project.open(@xcodeproj_path)
  add_podspec_metadata
  remove_demo_project if @remove_demo_target
  @project.save

  rename_files
  rename_project_folder
end
```

### replace_internal_project_settings

修改工程文件里的变量
