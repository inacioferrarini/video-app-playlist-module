
desc "Executes pod install and fix files messed up by Cocoapods."
task :install do
sh "bundle exec pod install"
end

desc "Executes pod update and fix files messed up by Cocoapods."
task :update do
sh "bundle exec pod update"
end

desc "Generates Slather Code Coverage Report."
task :slather do
sh "killall -9 'Simulator' || true"
sh "killall -9 'iOS Simulator' || true"
sh "killall -9 com.apple.CoreSimulator.CoreSimulatorService || true"
sh "rm -rf ~/Library/Developer/Xcode/DerivedData/* || true"
sh "rm -rf ~/Library/Developer/CoreSimulator/* || true"
sh "rm -rf slather-report || true"
sh "xcodebuild clean build -workspace PlaylistApp.xcworkspace -scheme PlaylistApp -destination 'platform=iOS Simulator,name=iPhone 5s' VALID_ARCHS=x86_64 test | xcpretty"
sh "bundle exec slather > /dev/null"
sh "open slather-report/index.html > /dev/null"
end

desc "Generates Code Style Report."
task :oclint do
sh "echo oclint ... "
end

