#
# Be sure to run `pod lib lint URLExpress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'URLExpress'
  s.version          = '0.1.0'
  s.swift_versions   = '5.7'
  s.summary          = 'A framework built on top of URLSession to enable writing URLRequest in a declarative manner.'

  s.description      = <<-DESC
  A framework built on top of URLSession to enable writing URLRequest in a declarative syntax to make it more readable and expressive (yes, pun definitely intended) and reduce unwanted mutability.
                       DESC

  s.homepage         = 'https://github.com/ahmedfathy-m/URLExpress'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmed Fathy' => 'ahmedfathy.mha@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmedfathy-m/URLExpress.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.source_files = 'URLExpress/Sources/**/*'
end
