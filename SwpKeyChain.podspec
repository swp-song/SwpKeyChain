#
#  Be sure to run `pod spec lint SwpKeyChain.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name             = 'SwpKeyChain'
  s.version          = '1.0.2'
  s.summary          = ' KeyChain 存储工具 '


  s.description      = <<-DESC
TODO: KeyChain 存储工具
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpKeyChain'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpKeyChain.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files          = 'SwpKeyChain', 'SwpKeyChain/Classes/**/*.{h,m}'
  s.public_header_files   = 'SwpKeyChain/Classes/**/*.h'
  # s.resource              = 'SwpKeyChain/Resources/SwpKeyChain.bundle'
  s.frameworks            = 'Foundation', 'UIKit'
  s.requires_arc          = true

  # s.resource_bundles = {
  #   'SwpKeyChain' => ['SwpKeyChain/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
