#
# Be sure to run `pod lib lint GDProtocolMediator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GDProtocolMediator'
  s.version          = '0.1.0'
  s.summary          = '稿定调停家'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  稿定调停家, 模块解耦调用调停者.
                       DESC

  s.homepage         = 'https://git.huanleguang.com/gaodingios/GDProtocolMediator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '宇园' => 'yuyuan@gaoding.com' }
  s.source           = { :git => 'https://git.huanleguang.com/gaodingios/GDProtocolMediator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GDProtocolMediator/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'GDProtocolMediator' => ['GDProtocolMediator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
