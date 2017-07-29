source 'https://github.com/inacioferrarini/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
inhibit_all_warnings!

target 'PlaylistApp' do

  use_frameworks!

  pod 'SharedModule', :path => '../Shared'
  pod 'Glasgow', :path => '../../../../Glasgow'

  target 'PlaylistAppTests' do
    inherit! :search_paths
    pod 'Quick', '~> 1.1.0'
    pod 'Nimble', '~> 6.0.0'
    pod 'OHHTTPStubs/Swift', '~> 6.0.0'
  end

  target 'PlaylistAppUITests' do
    inherit! :search_paths
  end

end
