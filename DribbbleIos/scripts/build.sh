set -e

xcodebuild -workspace ../DribbbleIos.xcworkspace/ -scheme DribbbleIos -configuration Debug -sdk iphonesimulator clean build
