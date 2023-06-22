
Pod::Spec.new do |spec|
  spec.name             = 'Alerts'
  spec.version          = '1.0.0'
  spec.summary          = 'Alerts'
  spec.homepage         = 'https://github.com/devhplusn/Alerts'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Hanwoong Na' => 'devhplusn@gmail.com' }
  spec.source           = { :git => 'https://github.com/devhplusn/Alerts.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '11.0'
  spec.swift_versions = ['5']
  spec.source_files = 'Sources/Alerts/**/*'

end
