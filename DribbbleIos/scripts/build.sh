set -e

xcodebuild -workspace DribbbleIos.xcworkspace/ -scheme DribbbleIos-jenkins-ci -configuration Debug -sdk iphonesimulator clean build
