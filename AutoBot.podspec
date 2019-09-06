#
# Be sure to run `pod lib lint AutoBot.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutoBot'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AutoBot.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/michaelhenry/AutoBot'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'michaelhenry' => 'me@iamkel.net' }
  s.source           = { :git => 'https://github.com/michaelhenry/AutoBot.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AutoBot/Classes/**/*'
  s.framework = "XCTest"
  s.requires_arc = true
  s.user_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks'
  }
  s.pod_target_xcconfig = {
    'APPLICATION_EXTENSION_API_ONLY' => 'YES',
    'ENABLE_BITCODE' => 'NO',
    'OTHER_LDFLAGS' => '$(inherited) -Xlinker -no_application_extension',
  }
  s.frameworks   = 'XCTest','UIKit','Foundation'
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  s.ios.deployment_target  = '10.0'
end
