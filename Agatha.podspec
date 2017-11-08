Pod::Spec.new do |s|
  s.name             = 'Agatha'
  s.version          = '0.1.0'
  s.summary          = 'Nimble matchers for RxSwift TestableObservers.'

  s.description      = <<-DESC
Agatha is a set of Nimble matchers used to match events received by a TestableObserver,
included in the RxTest library belonging to the RxSwift family. You can use these matchers
to check that your observer has received the expected events.
                       DESC

  s.homepage         = 'https://github.com/wuakitv/Agatha'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'José González' => 'jose.gonzalez@rakuten.com' }
  s.source           = { :git => 'git@github.com:wuakitv/agatha.git', :tag => s.version.to_s }

  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Agatha/Classes/**/*'
  s.dependency 'Quick', '~> 1.2.0'
  s.dependency 'Nimble', '~> 7.0.2'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxTest', '~> 4.0'
end
