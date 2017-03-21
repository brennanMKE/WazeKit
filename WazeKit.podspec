Pod::Spec.new do |s|
  s.name             = "WazeKit"
  s.version          = "0.0.3"
  s.summary          = "Basic utility framework for Waze written in Swift."
  s.description      = "Swift framework for integrating with the Waze iOS app."
  s.module_name      = "WazeKit"
  s.homepage         = "https://github.com/brennanMKE/WazeKit"
  s.license          = 'MIT'
  s.author           = { "Brennan Stehling" => "brennan@smallsharptools.com" }
  s.source           = { :git => "https://github.com/brennanMKE/WazeKit.git", :tag => "v0.0.3" }
  s.social_media_url = 'https://twitter.com/smallsharptools'
  s.source_files = 'Sources/*.swift'
  s.cocoapods_version = '>= 1.0'
  s.ios.deployment_target = '10.0'
  s.frameworks = 'Foundation', 'CoreLocation', 'UIKit'
end