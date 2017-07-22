Pod::Spec.new do |s|
  s.name         = "PlaylistAppModule"
  s.version      = "0.0.1"
  s.summary      = "Video App Playlist Module."
  s.homepage     = "http://gitmobile.itau/framework/sdk-ios"
  s.license      = "MIT"
  s.authors      = { "Inácio Ferrarini" => "inacio.ferrarini@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/inacioferrarini/video-app-playlist-module.git", :tag => s.version.to_s }
  s.source_files     = "PlaylistApp/**/*.swift"
  s.ios.deployment_target  = '9.0'
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.dependency 'Glasgow'
  s.dependency 'SharedModule'
end
