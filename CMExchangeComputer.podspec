
Pod::Spec.new do |s|
s.name             = 'CMExchangeComputer'
s.version          = '1.0.2'
s.summary          = 'Swift3的自定义的键盘'


s.description      = <<-DESC
Swift3的自定义的键盘,支持扩展
DESC

s.homepage         = 'https://github.com/DreamLCM/CMExchangeComputer'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'LCM' => '212763791@qq.com' }
s.source           = { :git => 'https://github.com/DreamLCM/CMExchangeComputer.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'


s.source_files = 'Class'
s.resources = 'Sclass/CMExchangeComputer.podspec.xib'
end

#验证命令：pod lib lint CMExchangeComputer.podspec --verbose
#提交命令：pod trunk push CMExchangeComputer.podspec
