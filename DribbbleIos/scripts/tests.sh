 xcodebuild -workspace ../DribbbleIos.xcworkspace -scheme DribbbleIosTests-jenkins -configuration Debug \
           RUN_APPLICATION_TESTS_WITH_IOS_SIM=YES \
           ONLY_ACTIVE_ARCH=NO \
           test
