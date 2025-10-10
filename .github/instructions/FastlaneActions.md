<!--
Downloaded via https://llm.codes by @steipete on September 24, 2025 at 08:29 PM
Source URL: https://docs.fastlane.tools/actions/
Total pages processed: 200
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://docs.fastlane.tools/actions/

- Docs »
- Actions »
- Available Actions
- ```

* * *

New to fastlane? Click here to open the installation & setup instructions first

1) Install the latest Xcode command line tools

```no-highlight
xcode-select --install

2) Install _fastlane_

```sh hljs bash
# Using RubyGems
sudo gem install fastlane -NV

# Alternatively using Homebrew
brew install fastlane

3) Navigate to your project and run

```no-highlight
fastlane init

More Details

# fastlane actions

This page contains a list of all built-in fastlane actions and their available options.

To get the most up-to-date information from the command line on your current version you can also run

```sh hljs bash
fastlane actions # list all available fastlane actions
fastlane action [action_name] # more information for a specific action

You can import another `Fastfile` by using the `import` action. This is useful if you have shared lanes across multiple apps and you want to store a `Fastfile` in a separate folder. The path must be relative to the `Fastfile` this is called from.

```ruby hljs
import './path/to/other/Fastfile'

For _fastlane_ plugins, check out the available plugins page.
If you want to create your own action, check out the local actions page.

- Testing
- Building
- Screenshots
- Project
- Code Signing
- Documentation
- Beta
- Push
- Releasing your app
- Source Control
- Notifications
- App Store Connect
- Misc
- Deprecated
- Plugins

# Testing

| Action | Description | Supported Platforms |
| --- | --- | --- |
| scan | Alias for the `run_tests` action | ios, mac |
| trainer | Convert the Xcode plist log to a JUnit report | ios, mac |
| slather | Use slather to generate a code coverage report | ios, mac |
| swiftlint | Run swift code validation using SwiftLint | ios, mac |
| xcov | Nice code coverage reports without hassle | ios, mac |
| sonar | Invokes sonar-scanner to programmatically run SonarQube analysis | ios, android, mac |
| oclint | Lints implementation files with OCLint | ios, android, mac |
| gcovr | Runs test coverage reports for your Xcode project | ios |
| lcov | Generates coverage data using lcov | ios, mac |
| appium | Run UI test by Appium with RSpec | ios, android |
| xctool | Run tests using xctool | ios, mac |
| run\_tests | Easily run tests of your iOS app (via _scan_) | ios, mac |
| xcode\_server\_get\_assets | Downloads Xcode Bot assets like the `.xcarchive` and logs | ios, mac |

# Building

| Action | Description | Supported Platforms |
| --- | --- | --- |
| gym | Alias for the `build_app` action | ios, mac |
| cocoapods | Runs `pod install` for the project | ios, mac |
| gradle | All gradle related actions, including building and testing your Android app | ios, android |
| clear\_derived\_data | Deletes the Xcode Derived Data | ios, mac |
| adb | Run ADB Actions | android |
| xcodebuild | Use the `xcodebuild` command to build and sign your app | ios, mac |
| carthage | Runs `carthage` for your project | ios, mac |
| xcode\_select | Change the xcode-path to use. Useful for beta versions of Xcode | ios, mac |
| ensure\_xcode\_version | Ensure the right version of Xcode is used | ios, mac |
| clean\_cocoapods\_cache | Remove the cache for pods | ios, mac |
| verify\_xcode | Verifies that the Xcode installation is properly signed by Apple | ios, mac |
| verify\_pod\_keys | Verifies all keys referenced from the Podfile are non-empty | ios, mac |
| xcodes | Make sure a certain version of Xcode is installed, installing it only if needed | ios, mac |
| xcclean | Cleans the project using `xcodebuild` | ios, mac |
| spm | Runs Swift Package Manager on your project | ios, android, mac |
| xcbuild | Builds the project using `xcodebuild` | ios, mac |
| xctest | Runs tests on the given simulator | ios, mac |
| build\_app | Easily build and sign your app (via _gym_) | ios, mac |
| xcarchive | Archives the project using `xcodebuild` | ios, mac |
| create\_xcframework | Package multiple build configs of a library/framework into a single xcframework | ios, mac |
| xcexport | Exports the project using `xcodebuild` | ios, mac |
| build\_android\_app | Alias for the `gradle` action | ios, android |
| build\_ios\_app | Alias for the `build_app` action but only for iOS | ios |
| build\_mac\_app | Alias for the `build_app` action but only for macOS | mac |

# Screenshots

| Action | Description | Supported Platforms |
| --- | --- | --- |
| snapshot | Alias for the `capture_ios_screenshots` action | ios, mac |
| screengrab | Alias for the `capture_android_screenshots` action | android |
| frameit | Alias for the `frame_screenshots` action | ios, android, mac |
| capture\_android\_screenshots | Automated localized screenshots of your Android app (via _screengrab_) | android |
| frame\_screenshots | Adds device frames around all screenshots (via _frameit_) | ios, android, mac |
| capture\_screenshots | Alias for the `capture_ios_screenshots` action | ios, mac |
| capture\_ios\_screenshots | Generate new localized screenshots on multiple devices (via _snapshot_) | ios, mac |

# Project

| Action | Description | Supported Platforms |
| --- | --- | --- |
| increment\_build\_number | Increment the build number of your project | ios, mac |
| set\_info\_plist\_value | Sets value to Info.plist of your project as native Ruby data structures | ios, mac |
| get\_version\_number | Get the version number of your project | ios, mac |
| get\_info\_plist\_value | Returns value from Info.plist of your project as native Ruby data structures | ios, mac |
| update\_info\_plist | Update a Info.plist file with bundle identifier and display name | ios |
| update\_app\_identifier | Update the project's bundle identifier | ios |
| get\_build\_number | Get the build number of your project | ios, mac |
| increment\_version\_number | Increment the version number of your project | ios, mac |
| update\_project\_team | Update Xcode Development Team ID | ios, mac |
| update\_app\_group\_identifiers | This action changes the app group identifiers in the entitlements file | ios |
| get\_ipa\_info\_plist\_value | Returns a value from Info.plist inside a .ipa file | ios, mac |
| recreate\_schemes | Recreate not shared Xcode project schemes | ios, mac |
| update\_url\_schemes | Updates the URL schemes in the given Info.plist | ios, mac |
| set\_build\_number\_repository | Set the build number from the current repository | ios, mac |
| set\_pod\_key | Sets a value for a key with cocoapods-keys | ios, mac |
| update\_keychain\_access\_groups | This action changes the keychain access groups in the entitlements file | ios |
| update\_plist | Update a plist file | ios |

# Code Signing

| Action | Description | Supported Platforms |
| --- | --- | --- |
| sigh | Alias for the `get_provisioning_profile` action | ios, mac |
| match | Alias for the `sync_code_signing` action | ios, mac |
| cert | Alias for the `get_certificates` action | ios |
| import\_certificate | Import certificate from inputfile into a keychain | ios, android, mac |
| update\_project\_provisioning | Update projects code signing settings from your provisioning profile | ios, mac |
| resign | Codesign an existing ipa file | ios |
| register\_devices | Registers new devices to the Apple Dev Portal | ios, mac |
| register\_device | Registers a new device to the Apple Dev Portal | ios |
| get\_provisioning\_profile | Generates a provisioning profile, saving it in the current folder (via _sigh_) | ios, mac |
| get\_certificates | Create new iOS code signing certificates (via _cert_) | ios |
| notarize | Notarizes a macOS app | mac |
| update\_code\_signing\_settings | Configures Xcode's Codesigning options | ios, mac |
| match\_nuke | Easily nuke your certificate and provisioning profiles (via _match_) | ios, mac |
| install\_provisioning\_profile | Install provisioning profile from path | ios, mac |
| sync\_code\_signing | Easily sync your certificates and profiles across your team (via _match_) | ios, mac |

# Documentation

| Action | Description | Supported Platforms |
| --- | --- | --- |
| jazzy | Generate docs using Jazzy | ios, mac |
| appledoc | Generate Apple-like source code documentation from the source code | ios, mac |
| sourcedocs | Generate docs using SourceDocs | ios, mac |

# Beta

| Action | Description | Supported Platforms |
| --- | --- | --- |
| pilot | Alias for the `upload_to_testflight` action | ios, mac |
| testflight | Alias for the `upload_to_testflight` action | ios, mac |
| deploygate | Upload a new build to DeployGate | ios, android |
| apteligent | Upload dSYM file to Apteligent (Crittercism) | ios |
| appetize | Upload your app to Appetize.io to stream it in browser | ios, android |
| testfairy | Upload a new build to TestFairy | ios, android |
| appaloosa | Upload your app to Appaloosa Store | ios, android, mac |
| nexus\_upload | Upload a file to Sonatype Nexus platform | ios, android, mac |
| installr | Upload a new build to Installr | ios |
| splunkmint | Upload dSYM file to Splunk MINT | ios |
| tryouts | Upload a new build to Tryouts | ios, android |
| podio\_item | Creates or updates an item within your Podio app | ios, android, mac |
| upload\_to\_testflight | Upload new binary to App Store Connect for TestFlight beta testing (via _pilot_) | ios, mac |

# Push

| Action | Description | Supported Platforms |
| --- | --- | --- |
| pem | Alias for the `get_push_certificate` action | ios, mac |
| update\_urban\_airship\_configuration | Set Urban Airship plist configuration values | ios |
| onesignal | Create or update a new OneSignal application | ios, android |
| get\_push\_certificate | Ensure a valid push profile is active, creating a new one if needed (via _pem_) | ios, mac |

# Releasing your app

| Action | Description | Supported Platforms |
| --- | --- | --- |
| deliver | Alias for the `upload_to_app_store` action | ios, mac |
| supply | Alias for the `upload_to_play_store` action | android |
| appstore | Alias for the `upload_to_app_store` action | ios, mac |
| upload\_to\_play\_store\_internal\_app\_sharing | Upload binaries to Google Play Internal App Sharing (via _supply_) | android |
| download\_app\_privacy\_details\_from\_app\_store | Download App Privacy Details from an app in App Store Connect | ios, mac |
| upload\_to\_app\_store | Upload metadata and binary to App Store Connect (via _deliver_) | ios, mac |
| download\_universal\_apk\_from\_google\_play | Download the Universal APK of a given version code from the Google Play Console | android |
| upload\_app\_privacy\_details\_to\_app\_store | Upload App Privacy Details for an app in App Store Connect | ios, mac |
| download\_from\_play\_store | Download metadata and binaries from Google Play (via _supply_) | android |
| upload\_to\_play\_store | Upload metadata, screenshots and binaries to Google Play (via _supply_) | android |

# Source Control

| Action | Description | Supported Platforms |
| --- | --- | --- |
| ensure\_git\_status\_clean | Raises an exception if there are uncommitted git changes | ios, android, mac |
| git\_branch | Returns the name of the current git branch, possibly as managed by CI ENV vars | ios, android, mac |
| last\_git\_commit | Return last git commit hash, abbreviated commit hash, commit message and author | ios, android, mac |
| reset\_git\_repo | Resets git repo to a clean state by discarding uncommitted changes | ios, android, mac |
| changelog\_from\_git\_commits | Collect git commit messages into a changelog | ios, android, mac |
| number\_of\_commits | Return the number of commits in current git branch | ios, android, mac |
| git\_pull | Executes a simple git pull command | ios, android, mac |
| last\_git\_tag | Get the most recent git tag | ios, android, mac |
| push\_to\_git\_remote | Push local changes to the remote branch | ios, android, mac |
| add\_git\_tag | This will add an annotated git tag to the current branch | ios, android, mac |
| commit\_version\_bump | Creates a 'Version Bump' commit. Run after `increment_build_number` | ios, mac |
| git\_tag\_exists | Checks if the git tag with the given name exists in the current repo | ios, android, mac |
| ensure\_git\_branch | Raises an exception if not on a specific git branch | ios, android, mac |
| git\_commit | Directly commit the given file with the given message | ios, android, mac |
| push\_git\_tags | Push local tags to the remote - this will only push tags | ios, android, mac |
| git\_add | Directly add the given file or all files | ios, android, mac |
| get\_build\_number\_repository | Get the build number from the current repository | ios, mac |
| set\_github\_release | This will create a new release on GitHub and upload assets for it | ios, android, mac |
| create\_pull\_request | This will create a new pull request on GitHub | ios, android, mac |
| get\_github\_release | This will verify if a given release version is available on GitHub | ios, android, mac |
| hg\_ensure\_clean\_status | Raises an exception if there are uncommitted hg changes | ios, android, mac |
| hg\_commit\_version\_bump | This will commit a version bump to the hg repo | ios, android, mac |
| hg\_push | This will push changes to the remote hg repository | ios, android, mac |
| hg\_add\_tag | This will add a hg tag to the current branch | ios, android, mac |
| github\_api | Call a GitHub API endpoint and get the resulting JSON response | ios, android, mac |
| commit\_github\_file | This will commit a file directly on GitHub via the API | ios, android, mac |
| git\_submodule\_update | Executes a git submodule update command | ios, android, mac |
| git\_remote\_branch | Returns the name of the current git remote default branch | ios, android, mac |

# Notifications

| Action | Description | Supported Platforms |
| --- | --- | --- |
| slack | Send a success/error message to your Slack group | ios, android, mac |
| notification | Display a macOS notification with custom message and title | ios, android, mac |
| hipchat | Send a error/success message to HipChat | ios, android, mac |
| mailgun | Send a success/error message to an email group | ios, android, mac |
| chatwork | Send a success/error message to ChatWork | ios, android, mac |
| ifttt | Connect to the IFTTT Maker Channel | ios, android, mac |
| flock | Send a message to a Flock group | ios, android, mac |
| twitter | Post a tweet on Twitter.com | ios, android, mac |
| typetalk | Post a message to Typetalk | ios, android, mac |

# App Store Connect

| Action | Description | Supported Platforms |
| --- | --- | --- |
| produce | Alias for the `create_app_online` action | ios |
| precheck | Alias for the `check_app_store_metadata` action | ios |
| latest\_testflight\_build\_number | Fetches most recent build number from TestFlight | ios, mac |
| download\_dsyms | Download dSYM files from App Store Connect for Bitcode apps | ios |
| app\_store\_build\_number | Returns the current build\_number of either live or edit version | ios, mac |
| set\_changelog | Set the changelog for all languages on App Store Connect | ios, mac |
| app\_store\_connect\_api\_key | Load the App Store Connect API token to use in other fastlane tools and actions | ios, mac |
| check\_app\_store\_metadata | Check your app's metadata before you submit your app to review (via _precheck_) | ios |
| create\_app\_online | Creates the given application on iTC and the Dev Portal (via _produce_) | ios |

# Misc

| Action | Description | Supported Platforms |
| --- | --- | --- |
| puts | Prints out the given text | ios, android, mac |
| default\_platform | Defines a default platform to not have to specify the platform | ios, android, mac |
| fastlane\_version | Alias for the `min_fastlane_version` action | ios, android, mac |
| lane\_context | Access lane context values | ios, android, mac |
| import | Import another Fastfile to use its lanes | ios, android, mac |
| import\_from\_git | Import another Fastfile from a remote git repository to use its lanes | ios, android, mac |
| clean\_build\_artifacts | Deletes files created as result of running gym, cert, sigh or download\_dsyms | ios, mac |
| skip\_docs | Skip the creation of the fastlane/README.md file when running fastlane | ios, android, mac |
| is\_ci | Is the current run being executed on a CI system, like Jenkins or Travis | ios, android, mac |
| setup\_jenkins | Setup xcodebuild, gym and scan for easier Jenkins integration | ios, mac |
| unlock\_keychain | Unlock a keychain | ios, android, mac |
| update\_fastlane | Makes sure fastlane-tools are up-to-date when running fastlane | ios, android, mac |
| bundle\_install | This action runs `bundle install` (if available) | ios, android, mac |
| upload\_symbols\_to\_crashlytics | Upload dSYM symbolication files to Crashlytics | ios |
| create\_keychain | Create a new Keychain | ios, android, mac |
| delete\_keychain | Delete keychains and remove them from the search list | ios, android, mac |
| backup\_file | This action backs up your file to "\[path\].back" | ios, android, mac |
| copy\_artifacts | Copy and save your build artifacts (useful when you use reset\_git\_repo) | ios, android, mac |
| prompt | Ask the user for a value or for confirmation | ios, android, mac |
| reset\_simulator\_contents | Shutdown and reset running simulators | ios |
| restore\_file | This action restore your file that was backed up with the `backup_file` action | ios, android, mac |
| say | This action speaks the given text out loud | ios, android, mac |
| zip | Compress a file or folder to a zip | ios, android, mac |
| danger | Runs `danger` for the project | ios, android, mac |
| artifactory | This action uploads an artifact to artifactory | ios, android, mac |
| version\_bump\_podspec | Increment or set the version in a podspec file | ios, mac |
| team\_id | Specify the Team ID you want to use for the Apple Developer Portal | ios |
| backup\_xcarchive | Save your \[zipped\] xcarchive elsewhere from default path | ios, mac |
| pod\_lib\_lint | Pod lib lint | ios, mac |
| erb | Allows to Generate output files based on ERB templates | ios, android, mac |
| download | Download a file from a remote server (e.g. JSON file) | ios, android, mac |
| rocket | Outputs ascii-art for a rocket 🚀 | ios, android, mac |
| debug | Print out an overview of the lane context values | ios, android, mac |
| make\_changelog\_from\_jenkins | Generate a changelog using the Changes section from the current Jenkins build | ios, android, mac |
| pod\_push | Push a Podspec to Trunk or a private repository | ios, mac |
| dsym\_zip | Creates a zipped dSYM in the project root from the .xcarchive | ios, mac |
| ensure\_no\_debug\_code | Ensures the given text is nowhere in the code base | ios, android, mac |
| cloc | Generates a Code Count that can be read by Jenkins (xml format) | ios, mac |
| team\_name | Set a team to use by its name | ios |
| scp | Transfer files via SCP | ios, android, mac |
| verify\_build | Able to verify various settings in ipa file | ios |
| install\_on\_device | Installs an .ipa file on a connected iOS-device via usb or wifi | ios |
| version\_get\_podspec | Receive the version number from a podspec file | ios, mac |
| rsync | Rsync files from :source to :destination | ios, android, mac |
| adb\_devices | Get an array of Connected android device serials | android |
| dotgpg\_environment | Reads in production secrets set in a dotgpg file and puts them in ENV | ios, android, mac |
| jira | Leave a comment on a Jira ticket | ios, android, mac |
| read\_podspec | Loads a CocoaPods spec as JSON | ios, mac |
| ssh | Allows remote command execution using ssh | ios, android, mac |
| appetize\_viewing\_url\_generator | Generate an URL for appetize simulator | ios |
| install\_xcode\_plugin | Install an Xcode plugin for the current user | ios, mac |
| add\_extra\_platforms | Modify the default list of supported platforms | ios, android, mac |
| clipboard | Copies a given string into the clipboard. Works only on macOS | ios, android, mac |
| build\_and\_upload\_to\_appetize | Generate and upload an ipa file to appetize.io | ios |
| update\_icloud\_container\_identifiers | This action changes the iCloud container identifiers in the entitlements file | ios |
| sh | Runs a shell command | ios, android, mac |
| create\_app\_on\_managed\_play\_store | Create Managed Google Play Apps | android |
| plugin\_scores | \31mNo description provided\[0m | ios, android, mac |\
| [ruby\_version | Verifies the minimum ruby version required | ios, android, mac |\
| opt\_out\_usage | This will stop uploading the information which actions were run | ios, android, mac |\
| setup\_travis | Setup the keychain and match to work with Travis CI | ios, android, mac |\
| min\_fastlane\_version | Verifies the minimum fastlane version required | ios, android, mac |\
| environment\_variable | Sets/gets env vars for Fastlane.swift. Don't use in ruby, use `ENV[key] = val` | ios, android, mac |\
| println | Alias for the `puts` action | ios, android, mac |\
| google\_play\_track\_version\_codes | Retrieves version codes for a Google Play track | android |\
| get\_managed\_play\_store\_publishing\_rights | Obtain publishing rights for custom apps on Managed Google Play Store | android |\
| ensure\_bundle\_exec | Raises an exception if not using `bundle exec` to run fastlane | ios, android, mac |\
| setup\_circle\_ci | Setup the keychain and match to work with CircleCI | ios, android, mac |\
| setup\_ci | Setup the keychain and match to work with CI | ios, mac |\
| modify\_services | Modifies the services of the app created on Developer Portal | ios |\
| validate\_play\_store\_json\_key | Validate that the Google Play Store `json_key` works | android |\
| ensure\_env\_vars | Raises an exception if the specified env vars are not set | ios, android, mac |\
| spaceship\_stats | Print out Spaceship stats from this session (number of request to each domain) | ios, android, mac |\
| spaceship\_logs | Find, print, and copy Spaceship logs | ios, android, mac |\
| google\_play\_track\_release\_names | Retrieves release names for a Google Play track | android |\
| echo | Alias for the `puts` action | ios, android, mac |\
\
# Deprecated\
\
| Action | Description | Supported Platforms |\
| --- | --- | --- |\
| hockey | Refer to App Center | ios, android, mac |\
| xcversion | Select an Xcode to use by version specifier | ios, mac |\
| badge | Automatically add a badge to your app icon | ios, android, mac |\
| automatic\_code\_signing | Configures Xcode's Codesigning options | ios, mac |\
| s3 | Generates a plist file and uploads all to AWS S3 | |\
| notify | Shows a macOS notification - use `notification` instead | ios, android, mac |\
| update\_project\_code\_signing | Updated code signing settings from 'Automatic' to a specific profile | ios |\
| xcode\_install | Make sure a certain version of Xcode is installed | ios, mac |\
| ipa | Easily build and sign your app using shenzhen | ios |\
| upload\_symbols\_to\_sentry | Upload dSYM symbolication files to Sentry | ios |\
| opt\_out\_crash\_reporting | This will prevent reports from being uploaded when _fastlane_ crashes | ios, android, mac |\
\
GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions

- Docs »
- Actions »
- Available Actions
- ```

* * *

New to fastlane? Click here to open the installation & setup instructions first

1) Install the latest Xcode command line tools

```no-highlight
xcode-select --install

2) Install _fastlane_

```sh hljs bash
# Using RubyGems
sudo gem install fastlane -NV

# Alternatively using Homebrew
brew install fastlane

3) Navigate to your project and run

```no-highlight
fastlane init

More Details

# fastlane actions

This page contains a list of all built-in fastlane actions and their available options.

To get the most up-to-date information from the command line on your current version you can also run

```sh hljs bash
fastlane actions # list all available fastlane actions
fastlane action [action_name] # more information for a specific action

You can import another `Fastfile` by using the `import` action. This is useful if you have shared lanes across multiple apps and you want to store a `Fastfile` in a separate folder. The path must be relative to the `Fastfile` this is called from.

```ruby hljs
import './path/to/other/Fastfile'

For _fastlane_ plugins, check out the available plugins page.
If you want to create your own action, check out the local actions page.

- Testing
- Building
- Screenshots
- Project
- Code Signing
- Documentation
- Beta
- Push
- Releasing your app
- Source Control
- Notifications
- App Store Connect
- Misc
- Deprecated
- Plugins

# Testing

| Action | Description | Supported Platforms |
| --- | --- | --- |
| scan | Alias for the `run_tests` action | ios, mac |
| trainer | Convert the Xcode plist log to a JUnit report | ios, mac |
| slather | Use slather to generate a code coverage report | ios, mac |
| swiftlint | Run swift code validation using SwiftLint | ios, mac |
| xcov | Nice code coverage reports without hassle | ios, mac |
| sonar | Invokes sonar-scanner to programmatically run SonarQube analysis | ios, android, mac |
| oclint | Lints implementation files with OCLint | ios, android, mac |
| gcovr | Runs test coverage reports for your Xcode project | ios |
| lcov | Generates coverage data using lcov | ios, mac |
| appium | Run UI test by Appium with RSpec | ios, android |
| xctool | Run tests using xctool | ios, mac |
| run\_tests | Easily run tests of your iOS app (via _scan_) | ios, mac |
| xcode\_server\_get\_assets | Downloads Xcode Bot assets like the `.xcarchive` and logs | ios, mac |

# Building

| Action | Description | Supported Platforms |
| --- | --- | --- |
| gym | Alias for the `build_app` action | ios, mac |
| cocoapods | Runs `pod install` for the project | ios, mac |
| gradle | All gradle related actions, including building and testing your Android app | ios, android |
| clear\_derived\_data | Deletes the Xcode Derived Data | ios, mac |
| adb | Run ADB Actions | android |
| xcodebuild | Use the `xcodebuild` command to build and sign your app | ios, mac |
| carthage | Runs `carthage` for your project | ios, mac |
| xcode\_select | Change the xcode-path to use. Useful for beta versions of Xcode | ios, mac |
| ensure\_xcode\_version | Ensure the right version of Xcode is used | ios, mac |
| clean\_cocoapods\_cache | Remove the cache for pods | ios, mac |
| verify\_xcode | Verifies that the Xcode installation is properly signed by Apple | ios, mac |
| verify\_pod\_keys | Verifies all keys referenced from the Podfile are non-empty | ios, mac |
| xcodes | Make sure a certain version of Xcode is installed, installing it only if needed | ios, mac |
| xcclean | Cleans the project using `xcodebuild` | ios, mac |
| spm | Runs Swift Package Manager on your project | ios, android, mac |
| xcbuild | Builds the project using `xcodebuild` | ios, mac |
| xctest | Runs tests on the given simulator | ios, mac |
| build\_app | Easily build and sign your app (via _gym_) | ios, mac |
| xcarchive | Archives the project using `xcodebuild` | ios, mac |
| create\_xcframework | Package multiple build configs of a library/framework into a single xcframework | ios, mac |
| xcexport | Exports the project using `xcodebuild` | ios, mac |
| build\_android\_app | Alias for the `gradle` action | ios, android |
| build\_ios\_app | Alias for the `build_app` action but only for iOS | ios |
| build\_mac\_app | Alias for the `build_app` action but only for macOS | mac |

# Screenshots

| Action | Description | Supported Platforms |
| --- | --- | --- |
| snapshot | Alias for the `capture_ios_screenshots` action | ios, mac |
| screengrab | Alias for the `capture_android_screenshots` action | android |
| frameit | Alias for the `frame_screenshots` action | ios, android, mac |
| capture\_android\_screenshots | Automated localized screenshots of your Android app (via _screengrab_) | android |
| frame\_screenshots | Adds device frames around all screenshots (via _frameit_) | ios, android, mac |
| capture\_screenshots | Alias for the `capture_ios_screenshots` action | ios, mac |
| capture\_ios\_screenshots | Generate new localized screenshots on multiple devices (via _snapshot_) | ios, mac |

# Project

| Action | Description | Supported Platforms |
| --- | --- | --- |
| increment\_build\_number | Increment the build number of your project | ios, mac |
| set\_info\_plist\_value | Sets value to Info.plist of your project as native Ruby data structures | ios, mac |
| get\_version\_number | Get the version number of your project | ios, mac |
| get\_info\_plist\_value | Returns value from Info.plist of your project as native Ruby data structures | ios, mac |
| update\_info\_plist | Update a Info.plist file with bundle identifier and display name | ios |
| update\_app\_identifier | Update the project's bundle identifier | ios |
| get\_build\_number | Get the build number of your project | ios, mac |
| increment\_version\_number | Increment the version number of your project | ios, mac |
| update\_project\_team | Update Xcode Development Team ID | ios, mac |
| update\_app\_group\_identifiers | This action changes the app group identifiers in the entitlements file | ios |
| get\_ipa\_info\_plist\_value | Returns a value from Info.plist inside a .ipa file | ios, mac |
| recreate\_schemes | Recreate not shared Xcode project schemes | ios, mac |
| update\_url\_schemes | Updates the URL schemes in the given Info.plist | ios, mac |
| set\_build\_number\_repository | Set the build number from the current repository | ios, mac |
| set\_pod\_key | Sets a value for a key with cocoapods-keys | ios, mac |
| update\_keychain\_access\_groups | This action changes the keychain access groups in the entitlements file | ios |
| update\_plist | Update a plist file | ios |

# Code Signing

| Action | Description | Supported Platforms |
| --- | --- | --- |
| sigh | Alias for the `get_provisioning_profile` action | ios, mac |
| match | Alias for the `sync_code_signing` action | ios, mac |
| cert | Alias for the `get_certificates` action | ios |
| import\_certificate | Import certificate from inputfile into a keychain | ios, android, mac |
| update\_project\_provisioning | Update projects code signing settings from your provisioning profile | ios, mac |
| resign | Codesign an existing ipa file | ios |
| register\_devices | Registers new devices to the Apple Dev Portal | ios, mac |
| register\_device | Registers a new device to the Apple Dev Portal | ios |
| get\_provisioning\_profile | Generates a provisioning profile, saving it in the current folder (via _sigh_) | ios, mac |
| get\_certificates | Create new iOS code signing certificates (via _cert_) | ios |
| notarize | Notarizes a macOS app | mac |
| update\_code\_signing\_settings | Configures Xcode's Codesigning options | ios, mac |
| match\_nuke | Easily nuke your certificate and provisioning profiles (via _match_) | ios, mac |
| install\_provisioning\_profile | Install provisioning profile from path | ios, mac |
| sync\_code\_signing | Easily sync your certificates and profiles across your team (via _match_) | ios, mac |

# Documentation

| Action | Description | Supported Platforms |
| --- | --- | --- |
| jazzy | Generate docs using Jazzy | ios, mac |
| appledoc | Generate Apple-like source code documentation from the source code | ios, mac |
| sourcedocs | Generate docs using SourceDocs | ios, mac |

# Beta

| Action | Description | Supported Platforms |
| --- | --- | --- |
| pilot | Alias for the `upload_to_testflight` action | ios, mac |
| testflight | Alias for the `upload_to_testflight` action | ios, mac |
| deploygate | Upload a new build to DeployGate | ios, android |
| apteligent | Upload dSYM file to Apteligent (Crittercism) | ios |
| appetize | Upload your app to Appetize.io to stream it in browser | ios, android |
| testfairy | Upload a new build to TestFairy | ios, android |
| appaloosa | Upload your app to Appaloosa Store | ios, android, mac |
| nexus\_upload | Upload a file to Sonatype Nexus platform | ios, android, mac |
| installr | Upload a new build to Installr | ios |
| splunkmint | Upload dSYM file to Splunk MINT | ios |
| tryouts | Upload a new build to Tryouts | ios, android |
| podio\_item | Creates or updates an item within your Podio app | ios, android, mac |
| upload\_to\_testflight | Upload new binary to App Store Connect for TestFlight beta testing (via _pilot_) | ios, mac |

# Push

| Action | Description | Supported Platforms |
| --- | --- | --- |
| pem | Alias for the `get_push_certificate` action | ios, mac |
| update\_urban\_airship\_configuration | Set Urban Airship plist configuration values | ios |
| onesignal | Create or update a new OneSignal application | ios, android |
| get\_push\_certificate | Ensure a valid push profile is active, creating a new one if needed (via _pem_) | ios, mac |

# Releasing your app

| Action | Description | Supported Platforms |
| --- | --- | --- |
| deliver | Alias for the `upload_to_app_store` action | ios, mac |
| supply | Alias for the `upload_to_play_store` action | android |
| appstore | Alias for the `upload_to_app_store` action | ios, mac |
| upload\_to\_play\_store\_internal\_app\_sharing | Upload binaries to Google Play Internal App Sharing (via _supply_) | android |
| download\_app\_privacy\_details\_from\_app\_store | Download App Privacy Details from an app in App Store Connect | ios, mac |
| upload\_to\_app\_store | Upload metadata and binary to App Store Connect (via _deliver_) | ios, mac |
| download\_universal\_apk\_from\_google\_play | Download the Universal APK of a given version code from the Google Play Console | android |
| upload\_app\_privacy\_details\_to\_app\_store | Upload App Privacy Details for an app in App Store Connect | ios, mac |
| download\_from\_play\_store | Download metadata and binaries from Google Play (via _supply_) | android |
| upload\_to\_play\_store | Upload metadata, screenshots and binaries to Google Play (via _supply_) | android |

# Source Control

| Action | Description | Supported Platforms |
| --- | --- | --- |
| ensure\_git\_status\_clean | Raises an exception if there are uncommitted git changes | ios, android, mac |
| git\_branch | Returns the name of the current git branch, possibly as managed by CI ENV vars | ios, android, mac |
| last\_git\_commit | Return last git commit hash, abbreviated commit hash, commit message and author | ios, android, mac |
| reset\_git\_repo | Resets git repo to a clean state by discarding uncommitted changes | ios, android, mac |
| changelog\_from\_git\_commits | Collect git commit messages into a changelog | ios, android, mac |
| number\_of\_commits | Return the number of commits in current git branch | ios, android, mac |
| git\_pull | Executes a simple git pull command | ios, android, mac |
| last\_git\_tag | Get the most recent git tag | ios, android, mac |
| push\_to\_git\_remote | Push local changes to the remote branch | ios, android, mac |
| add\_git\_tag | This will add an annotated git tag to the current branch | ios, android, mac |
| commit\_version\_bump | Creates a 'Version Bump' commit. Run after `increment_build_number` | ios, mac |
| git\_tag\_exists | Checks if the git tag with the given name exists in the current repo | ios, android, mac |
| ensure\_git\_branch | Raises an exception if not on a specific git branch | ios, android, mac |
| git\_commit | Directly commit the given file with the given message | ios, android, mac |
| push\_git\_tags | Push local tags to the remote - this will only push tags | ios, android, mac |
| git\_add | Directly add the given file or all files | ios, android, mac |
| get\_build\_number\_repository | Get the build number from the current repository | ios, mac |
| set\_github\_release | This will create a new release on GitHub and upload assets for it | ios, android, mac |
| create\_pull\_request | This will create a new pull request on GitHub | ios, android, mac |
| get\_github\_release | This will verify if a given release version is available on GitHub | ios, android, mac |
| hg\_ensure\_clean\_status | Raises an exception if there are uncommitted hg changes | ios, android, mac |
| hg\_commit\_version\_bump | This will commit a version bump to the hg repo | ios, android, mac |
| hg\_push | This will push changes to the remote hg repository | ios, android, mac |
| hg\_add\_tag | This will add a hg tag to the current branch | ios, android, mac |
| github\_api | Call a GitHub API endpoint and get the resulting JSON response | ios, android, mac |
| commit\_github\_file | This will commit a file directly on GitHub via the API | ios, android, mac |
| git\_submodule\_update | Executes a git submodule update command | ios, android, mac |
| git\_remote\_branch | Returns the name of the current git remote default branch | ios, android, mac |

# Notifications

| Action | Description | Supported Platforms |
| --- | --- | --- |
| slack | Send a success/error message to your Slack group | ios, android, mac |
| notification | Display a macOS notification with custom message and title | ios, android, mac |
| hipchat | Send a error/success message to HipChat | ios, android, mac |
| mailgun | Send a success/error message to an email group | ios, android, mac |
| chatwork | Send a success/error message to ChatWork | ios, android, mac |
| ifttt | Connect to the IFTTT Maker Channel | ios, android, mac |
| flock | Send a message to a Flock group | ios, android, mac |
| twitter | Post a tweet on Twitter.com | ios, android, mac |
| typetalk | Post a message to Typetalk | ios, android, mac |

# App Store Connect

| Action | Description | Supported Platforms |
| --- | --- | --- |
| produce | Alias for the `create_app_online` action | ios |
| precheck | Alias for the `check_app_store_metadata` action | ios |
| latest\_testflight\_build\_number | Fetches most recent build number from TestFlight | ios, mac |
| download\_dsyms | Download dSYM files from App Store Connect for Bitcode apps | ios |
| app\_store\_build\_number | Returns the current build\_number of either live or edit version | ios, mac |
| set\_changelog | Set the changelog for all languages on App Store Connect | ios, mac |
| app\_store\_connect\_api\_key | Load the App Store Connect API token to use in other fastlane tools and actions | ios, mac |
| check\_app\_store\_metadata | Check your app's metadata before you submit your app to review (via _precheck_) | ios |
| create\_app\_online | Creates the given application on iTC and the Dev Portal (via _produce_) | ios |

# Misc

| Action | Description | Supported Platforms |
| --- | --- | --- |
| puts | Prints out the given text | ios, android, mac |
| default\_platform | Defines a default platform to not have to specify the platform | ios, android, mac |
| fastlane\_version | Alias for the `min_fastlane_version` action | ios, android, mac |
| lane\_context | Access lane context values | ios, android, mac |
| import | Import another Fastfile to use its lanes | ios, android, mac |
| import\_from\_git | Import another Fastfile from a remote git repository to use its lanes | ios, android, mac |
| clean\_build\_artifacts | Deletes files created as result of running gym, cert, sigh or download\_dsyms | ios, mac |
| skip\_docs | Skip the creation of the fastlane/README.md file when running fastlane | ios, android, mac |
| is\_ci | Is the current run being executed on a CI system, like Jenkins or Travis | ios, android, mac |
| setup\_jenkins | Setup xcodebuild, gym and scan for easier Jenkins integration | ios, mac |
| unlock\_keychain | Unlock a keychain | ios, android, mac |
| update\_fastlane | Makes sure fastlane-tools are up-to-date when running fastlane | ios, android, mac |
| bundle\_install | This action runs `bundle install` (if available) | ios, android, mac |
| upload\_symbols\_to\_crashlytics | Upload dSYM symbolication files to Crashlytics | ios |
| create\_keychain | Create a new Keychain | ios, android, mac |
| delete\_keychain | Delete keychains and remove them from the search list | ios, android, mac |
| backup\_file | This action backs up your file to "\[path\].back" | ios, android, mac |
| copy\_artifacts | Copy and save your build artifacts (useful when you use reset\_git\_repo) | ios, android, mac |
| prompt | Ask the user for a value or for confirmation | ios, android, mac |
| reset\_simulator\_contents | Shutdown and reset running simulators | ios |
| restore\_file | This action restore your file that was backed up with the `backup_file` action | ios, android, mac |
| say | This action speaks the given text out loud | ios, android, mac |
| zip | Compress a file or folder to a zip | ios, android, mac |
| danger | Runs `danger` for the project | ios, android, mac |
| artifactory | This action uploads an artifact to artifactory | ios, android, mac |
| version\_bump\_podspec | Increment or set the version in a podspec file | ios, mac |
| team\_id | Specify the Team ID you want to use for the Apple Developer Portal | ios |
| backup\_xcarchive | Save your \[zipped\] xcarchive elsewhere from default path | ios, mac |
| pod\_lib\_lint | Pod lib lint | ios, mac |
| erb | Allows to Generate output files based on ERB templates | ios, android, mac |
| download | Download a file from a remote server (e.g. JSON file) | ios, android, mac |
| rocket | Outputs ascii-art for a rocket 🚀 | ios, android, mac |
| debug | Print out an overview of the lane context values | ios, android, mac |
| make\_changelog\_from\_jenkins | Generate a changelog using the Changes section from the current Jenkins build | ios, android, mac |
| pod\_push | Push a Podspec to Trunk or a private repository | ios, mac |
| dsym\_zip | Creates a zipped dSYM in the project root from the .xcarchive | ios, mac |
| ensure\_no\_debug\_code | Ensures the given text is nowhere in the code base | ios, android, mac |
| cloc | Generates a Code Count that can be read by Jenkins (xml format) | ios, mac |
| team\_name | Set a team to use by its name | ios |
| scp | Transfer files via SCP | ios, android, mac |
| verify\_build | Able to verify various settings in ipa file | ios |
| install\_on\_device | Installs an .ipa file on a connected iOS-device via usb or wifi | ios |
| version\_get\_podspec | Receive the version number from a podspec file | ios, mac |
| rsync | Rsync files from :source to :destination | ios, android, mac |
| adb\_devices | Get an array of Connected android device serials | android |
| dotgpg\_environment | Reads in production secrets set in a dotgpg file and puts them in ENV | ios, android, mac |
| jira | Leave a comment on a Jira ticket | ios, android, mac |
| read\_podspec | Loads a CocoaPods spec as JSON | ios, mac |
| ssh | Allows remote command execution using ssh | ios, android, mac |
| appetize\_viewing\_url\_generator | Generate an URL for appetize simulator | ios |
| install\_xcode\_plugin | Install an Xcode plugin for the current user | ios, mac |
| add\_extra\_platforms | Modify the default list of supported platforms | ios, android, mac |
| clipboard | Copies a given string into the clipboard. Works only on macOS | ios, android, mac |
| build\_and\_upload\_to\_appetize | Generate and upload an ipa file to appetize.io | ios |
| update\_icloud\_container\_identifiers | This action changes the iCloud container identifiers in the entitlements file | ios |
| sh | Runs a shell command | ios, android, mac |
| create\_app\_on\_managed\_play\_store | Create Managed Google Play Apps | android |
| plugin\_scores | \31mNo description provided\[0m | ios, android, mac |\
| [ruby\_version | Verifies the minimum ruby version required | ios, android, mac |\
| opt\_out\_usage | This will stop uploading the information which actions were run | ios, android, mac |\
| setup\_travis | Setup the keychain and match to work with Travis CI | ios, android, mac |\
| min\_fastlane\_version | Verifies the minimum fastlane version required | ios, android, mac |\
| environment\_variable | Sets/gets env vars for Fastlane.swift. Don't use in ruby, use `ENV[key] = val` | ios, android, mac |\
| println | Alias for the `puts` action | ios, android, mac |\
| google\_play\_track\_version\_codes | Retrieves version codes for a Google Play track | android |\
| get\_managed\_play\_store\_publishing\_rights | Obtain publishing rights for custom apps on Managed Google Play Store | android |\
| ensure\_bundle\_exec | Raises an exception if not using `bundle exec` to run fastlane | ios, android, mac |\
| setup\_circle\_ci | Setup the keychain and match to work with CircleCI | ios, android, mac |\
| setup\_ci | Setup the keychain and match to work with CI | ios, mac |\
| modify\_services | Modifies the services of the app created on Developer Portal | ios |\
| validate\_play\_store\_json\_key | Validate that the Google Play Store `json_key` works | android |\
| ensure\_env\_vars | Raises an exception if the specified env vars are not set | ios, android, mac |\
| spaceship\_stats | Print out Spaceship stats from this session (number of request to each domain) | ios, android, mac |\
| spaceship\_logs | Find, print, and copy Spaceship logs | ios, android, mac |\
| google\_play\_track\_release\_names | Retrieves release names for a Google Play track | android |\
| echo | Alias for the `puts` action | ios, android, mac |\
\
# Deprecated\
\
| Action | Description | Supported Platforms |\
| --- | --- | --- |\
| hockey | Refer to App Center | ios, android, mac |\
| xcversion | Select an Xcode to use by version specifier | ios, mac |\
| badge | Automatically add a badge to your app icon | ios, android, mac |\
| automatic\_code\_signing | Configures Xcode's Codesigning options | ios, mac |\
| s3 | Generates a plist file and uploads all to AWS S3 | |\
| notify | Shows a macOS notification - use `notification` instead | ios, android, mac |\
| update\_project\_code\_signing | Updated code signing settings from 'Automatic' to a specific profile | ios |\
| xcode\_install | Make sure a certain version of Xcode is installed | ios, mac |\
| ipa | Easily build and sign your app using shenzhen | ios |\
| upload\_symbols\_to\_sentry | Upload dSYM symbolication files to Sentry | ios |\
| opt\_out\_crash\_reporting | This will prevent reports from being uploaded when _fastlane_ crashes | ios, android, mac |\
\
GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/scan



---

# https://docs.fastlane.tools/actions/trainer



---

# https://docs.fastlane.tools/actions/slather



---

# https://docs.fastlane.tools/actions/swiftlint

- Docs »
- \_Actions »
- swiftlint
- Edit on GitHub
- ```

* * *

# swiftlint

Run swift code validation using SwiftLint

| swiftlint | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
swiftlint(
mode: :lint, # SwiftLint mode: :lint (default) or :autocorrect
path: "/path/to/lint", # Specify path to lint (optional)
output_file: "swiftlint.result.json", # The path of the output file (optional)
config_file: ".swiftlint-ci.yml", # The path of the configuration file (optional)
files: [# List of files to process (optional)\
"AppDelegate.swift",\
"path/to/project/Model.swift"\
],
raise_if_swiftlint_error: true, # Allow fastlane to raise an error if swiftlint fails
ignore_exit_status: true # Allow fastlane to continue even if SwiftLint returns a non-zero exit status

)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `mode` | SwiftLint mode: :lint, :fix, :autocorrect or :analyze | `:lint` |
| `path` | Specify path to lint | |
| `output_file` | Path to output SwiftLint result | |
| `config_file` | Custom configuration file of SwiftLint | |
| `strict` | Fail on warnings? (true/false) | `false` |
| `files` | List of files to process | |
| `ignore_exit_status` | Ignore the exit status of the SwiftLint command, so that serious violations don't fail the build (true/false) | `false` |
| `raise_if_swiftlint_error` | Raises an error if swiftlint fails, so you can fail CI/CD jobs if necessary (true/false) | `false` |
| `reporter` | Choose output reporter. Available: xcode, json, csv, checkstyle, codeclimate, junit, html, emoji, sonarqube, markdown, github-actions-logging | |
| `quiet` | Don't print status logs like 'Linting ' & 'Done linting' | `false` |
| `executable` | Path to the `swiftlint` executable on your machine | |
| `format` | Format code when mode is :autocorrect | `false` |
| `no_cache` | Ignore the cache when mode is :autocorrect or :lint | `false` |
| `compiler_log_path` | Compiler log path when mode is :analyze | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action swiftlint

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run swiftlint

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run swiftlint parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcov



---

# https://docs.fastlane.tools/actions/sonar



---

# https://docs.fastlane.tools/actions/oclint



---

# https://docs.fastlane.tools/actions/gcovr



---

# https://docs.fastlane.tools/actions/lcov



---

# https://docs.fastlane.tools/actions/appium

- Docs »
- \_Actions »
- appium
- Edit on GitHub
- ```

* * *

# appium

Run UI test by Appium with RSpec

| appium | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @yonekawa |

## 1 Example

```ruby hljs
appium(
app_path: "appium/apps/TargetApp.app",
spec_path: "appium/spec",
platform: "iOS",
caps: {
versionNumber: "9.1",
deviceName: "iPhone 6"
},
appium_lib: {
wait: 10
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `platform` | Appium platform name | |
| `spec_path` | Path to Appium spec directory | |
| `app_path` | Path to Appium target app file | |
| `invoke_appium_server` | Use local Appium server with invoke automatically | `true` |
| `host` | Hostname of Appium server | `0.0.0.0` |
| `port` | HTTP port of Appium server | `4723` |
| `appium_path` | Path to Appium executable | |
| `caps` | Hash of caps for Appium::Driver | |
| `appium_lib` | Hash of appium\_lib for Appium::Driver | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action appium

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appium

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appium parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xctool

- Docs »
- \_Actions »
- xctool
- Edit on GitHub
- ```

* * *

# xctool

>
> It is recommended to store the build configuration in the `.xctool-args` file.
>
> More information:

| xctool | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
xctool(:test)

```ruby hljs
# If you prefer to have the build configuration stored in the `Fastfile`:
xctool(:test, [\
"--workspace", "'AwesomeApp.xcworkspace'",\
"--scheme", "'Schema Name'",\
"--configuration", "Debug",\
"--sdk", "iphonesimulator",\
"--arch", "i386"\
].join(" "))

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xctool

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xctool

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xctool parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/run_tests

- Docs »
- \_Actions »
- run\_tests
- Edit on GitHub
- ```

* * *

# run\_tests

Easily run tests of your iOS app (via _scan_)

###### The easiest way to run tests of your iOS and Mac app

_scan_ makes it easy to run tests of your iOS and Mac app on a simulator or connected device.

Features •
Usage •
Scanfile

# What's scan?

### Before _scan_

```no-highlight
xcodebuild \
-workspace MyApp.xcworkspace \
-scheme "MyApp" \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' \
test

As the output will look like this

```no-highlight
/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.o Example/main.m normal arm64 objective-c com.apple.compilers.llvm.clang.1_0.compiler
cd /Users/felixkrause/Developer/fastlane/gym/example/cocoapods
export LANG=en_US.US-ASCII
export PATH="/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/Applications/Xcode-beta.app/Contents/Developer/usr/bin:/Users/felixkrause/.rvm/gems/ruby-2.2.0/bin:/Users/felixkrause/.rvm/gems/ruby-2.2.0@global/bin:/Users/felixkrause/.rvm/rubies/ruby-2.2.0/bin:/Users/felixkrause/.rvm/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch arm64 -fmessage-length=126 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fobjc-arc -fmodules -gmodules -fmodules-cache-path=/Users/felixkrause/Library/Developer/Xcode/DerivedData/ModuleCache -fmodules-prune-interval=86400 -fmodules-prune-after=345600 -fbuild-session-file=/Users/felixkrause/Library/Developer/Xcode/DerivedData/ModuleCache/Session.modulevalidation -fmodules-validate-once-per-build-session -Wnon-modular-include-in-framework-module -Werror=non-modular-include-in-framework-module -Wno-trigraphs -fpascal-strings -Os -fno-common -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wunreachable-code -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wconditional-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DCOCOAPODS=1 -DNS_BLOCK_ASSERTIONS=1 -DOBJC_OLD_DISPATCH_PROTOTYPES=0 -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.0.sdk -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -miphoneos-version-min=9.0 -g -fvisibility=hidden -Wno-sign-conversion -fembed-bitcode -iquote /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-generated-files.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-own-target-headers.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-all-target-headers.hmap -iquote /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-project-headers.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/BuildProductsPath/Release-iphoneos/include -I/Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public -I/Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public/HexColors -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/DerivedSources/arm64 -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/DerivedSources -F/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/BuildProductsPath/Release-iphoneos -isystem /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public -isystem /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public/HexColors -MMD -MT dependencies -MF /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.d --serialize-diagnostics /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.dia -c /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Example/main.m -o /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.o

you'll probably want to use something like xcpretty, which will look like this:

```no-highlight
set -o pipefail &&
xcodebuild \
-workspace MyApp.xcworkspace \
-scheme "MyApp" \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' \
test \
| xcpretty \
-r "html" \
-o "tests.html"

### With _scan_

```no-highlight
fastlane scan

### Why _scan_?

_scan_ uses the latest APIs and tools to make running tests plain simple and offer a great integration into your existing workflow, like _fastlane_ or Jenkins.

| | scan Features |
| --- | --- |
| 🏁 | Beautiful inline build output while running the tests |
| 🚠 | Sensible defaults: Automatically detect the project, schemes and more |
| 📊 | Support for HTML, JSON and JUnit reports |
| 🔎 | Xcode duplicated your simulators again? _scan_ will handle this for you |
| 🔗 | Works perfectly with _fastlane_ and other tools |
| 🚅 | Don't remember any complicated build commands, just _scan_ |
| 🔧 | Easy and dynamic configuration using parameters and environment variables |
| 📢 | Beautiful slack notifications of the test results |
| 💾 | Store common build settings in a `Scanfile` |
| 📤 | The raw `xcodebuild` outputs are stored in `~/Library/Logs/scan` |
| 💻 | Supports both iOS and Mac applications |
| 👱 | Automatically switches to the travis formatter when running on Travis |
| 📖 | Helps you resolve common test errors like simulator not responding |

_scan_ uses a plain `xcodebuild` command, therefore keeping 100% compatible with `xcodebuild`. To generate the nice output, _scan_ uses xcpretty. You can always access the raw output in `~/Library/Logs/scan`.

# Usage

That's all you need to run your tests. If you want more control, here are some available parameters:

```no-highlight
fastlane scan --workspace "Example.xcworkspace" --scheme "AppName" --device "iPhone 6" --clean

If you need to use a different Xcode install, use `xcodes` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" scan

To run _scan_ on multiple devices via _fastlane_, add this to your `Fastfile`:

```ruby hljs
scan(
workspace: "Example.xcworkspace",
devices: ["iPhone 6s", "iPad Air"]
)

For a list of all available parameters use

```no-highlight
fastlane action scan

To access the raw `xcodebuild` output open `~/Library/Logs/scan`

# Scanfile

Since you might want to manually trigger the tests but don't want to specify all the parameters every time, you can store your defaults in a so called `Scanfile`.

Run `fastlane scan init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")
devices(["iPhone 6s", "iPad Air"])

clean(true)

output_types("html")

# Automating the whole process

_scan_ works great together with _fastlane_, which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby hljs
lane :test do
scan(scheme: "Example")
end

| run\_tests | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | Outputs hash of results with the following keys: :number\_of\_tests, :number\_of\_failures, :number\_of\_retries, :number\_of\_tests\_excluding\_retries, :number\_of\_failures\_excluding\_retries |

## 6 Examples

```ruby hljs
run_tests

```ruby hljs
scan # alias for "run_tests"

```ruby hljs
run_tests(
workspace: "App.xcworkspace",
scheme: "MyTests",
clean: false
)

```ruby hljs
# Build For Testing
run_tests(
derived_data_path: "my_folder",
build_for_testing: true
)

# run tests using derived data from prev. build
```ruby hljs
run_tests(
derived_data_path: "my_folder",
test_without_building: true
)

# or run it from an existing xctestrun package
```ruby hljs
run_tests(
xctestrun: "/path/to/mytests.xctestrun"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `package_path` | Path to the Swift Package | |
| `scheme` | The project's scheme. Make sure it's marked as `Shared` | |
| `device` | The name of the simulator type you want to run tests on (e.g. 'iPhone 6' or 'iPhone SE (2nd generation) (14.5)') | |
| `devices` | Array of devices to run the tests on (e.g. \['iPhone 6', 'iPad Air', 'iPhone SE (2nd generation) (14.5)'\]) | |
| `skip_detect_devices` | Should skip auto detecting of devices if none were specified | `false` |
| `ensure_devices_found` | Should fail if devices not found | `false` |
| `force_quit_simulator` | Enabling this option will automatically killall Simulator processes before the run | `false` |
| `reset_simulator` | Enabling this option will automatically erase the simulator before running the application | `false` |
| `disable_slide_to_type` | Enabling this option will disable the simulator from showing the 'Slide to type' prompt | `true` |
| `prelaunch_simulator` | Enabling this option will launch the first simulator prior to calling any xcodebuild command | |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall\_app) | \* |
| `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run | |
| `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip | |
| `testplan` | The testplan associated with the scheme that should be used for testing | |
| `only_test_configurations` | Array of strings matching test plan configurations to run | |
| `skip_test_configurations` | Array of strings matching test plan configurations to skip | |
| `xctestrun` | Run tests using the provided `.xctestrun` file | |
| `toolchain` | The toolchain that should be used for building the application (e.g. `com.apple.dt.toolchain.Swift_2_3, org.swift.30p620160816a`) | |
| `clean` | Should the project be cleaned before building it? | `false` |
| `code_coverage` | Should code coverage be generated? (Xcode 7 and up) | |
| `address_sanitizer` | Should the address sanitizer be turned on? | |
| `thread_sanitizer` | Should the thread sanitizer be turned on? | |
| `open_report` | Should the HTML report be opened when tests are completed? | `false` |
| `output_directory` | The directory in which all reports will be stored | \* |
| `output_style` | Define how the output should look like. Valid values are: standard, basic, rspec, or raw (disables xcpretty during xcodebuild) | |
| `output_types` | Comma separated list of the output types (e.g. html, junit, json-compilation-database) | `html,junit` |
| `output_files` | Comma separated list of the output files, corresponding to the types provided by :output\_types (order should match). If specifying an output type of json-compilation-database with :use\_clang\_report\_name enabled, that option will take precedence | |
| `buildlog_path` | The directory where to store the raw log | \* |
| `include_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output\_directory | `false` |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `output_remove_retry_attempts` | Remove retry attempts from test results table and the JUnit report (if not using xcpretty) | `false` |
| `disable_xcpretty` | **DEPRECATED!** Use `output_style: 'raw'` instead - Disable xcpretty formatting of build, similar to `output_style='raw'` but this will also skip the test results table | |
| `formatter` | **DEPRECATED!** Use 'xcpretty\_formatter' instead - A custom xcpretty formatter to use | |
| `xcpretty_formatter` | A custom xcpretty formatter to use | |
| `xcpretty_args` | Pass in xcpretty additional command line arguments (e.g. '--test --no-color' or '--tap --no-utf') | |
| `derived_data_path` | The directory where build products and other derived data will go | |
| `should_zip_build_products` | Should zip the derived data build products and place in output path? | `false` |
| `output_xctestrun` | Should provide additional copy of .xctestrun file (settings.xctestrun) and place in output path? | `false` |
| `result_bundle_path` | Custom path for the result bundle, overrides result\_bundle | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `use_clang_report_name` | Generate the json compilation database with clang naming convention (compile\_commands.json) | `false` |
| `parallel_testing` | Optionally override the per-target setting in the scheme for running tests in parallel. Equivalent to -parallel-testing-enabled | |
| `concurrent_workers` | Specify the exact number of test runners that will be spawned during parallel testing. Equivalent to -parallel-testing-worker-count | |
| `max_concurrent_simulators` | Constrain the number of simulator devices on which to test concurrently. Equivalent to -maximum-concurrent-test-simulator-destinations | |
| `disable_concurrent_testing` | Do not run test bundles in parallel on the specified destinations. Testing will occur on each destination serially. Equivalent to -disable-concurrent-testing | `false` |
| `skip_build` | Should debug build be skipped before test build? | `false` |
| `test_without_building` | Test without building, requires a derived data path | |
| `build_for_testing` | Build for testing only, does not run tests | |
| `sdk` | The SDK that should be used for building the application | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `xcargs` | Pass additional arguments to xcodebuild. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `app_name` | App name to use in slack message and logfile name | |
| `deployment_target_version` | Target version of the app being build or tested. Used to filter out simulator version | |
| `slack_url` | Create an Incoming WebHook for your Slack group to post results there | |
| `slack_channel` | #channel or @username | |
| `slack_message` | The message included with each message posted to slack | |
| `slack_use_webhook_configured_username_and_icon` | Use webhook's default username and icon settings? (true/false) | `false` |
| `slack_username` | Overrides the webhook's username property if slack\_use\_webhook\_configured\_username\_and\_icon is false | `fastlane` |
| `slack_icon_url` | Overrides the webhook's image property if slack\_use\_webhook\_configured\_username\_and\_icon is false | `https://fastlane.tools/assets/img/fastlane_icon.png` |
| `skip_slack` | Don't publish to slack, even when an URL is given | `false` |
| `slack_only_on_failure` | Only post on Slack if the tests fail | `false` |
| `slack_default_payloads` | Specifies default payloads to include in Slack messages. For more info visit | |
| `destination` | Use only if you're a pro, use the other options instead | |
| `run_rosetta_simulator` | Adds arch=x86\_64 to the xcodebuild 'destination' argument to run simulator in a Rosetta mode | `false` |
| `catalyst_platform` | Platform to build when using a Catalyst enabled app. Valid values are: ios, macos | |
| `custom_report_file_name` | **DEPRECATED!** Use `--output_files` instead - Sets custom full report file name when generating a single report | |
| `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `env NSUnbufferedIO=YES xcodebuild` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |
| `number_of_retries` | The number of times a test can fail | `0` |
| `fail_build` | Should this step stop the build if the tests fail? Set this to false if you're using trainer | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `run_tests` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SCAN_DERIVED_DATA_PATH` | The path to the derived data |
| `SharedValues::SCAN_GENERATED_PLIST_FILE` | The generated plist file |
| `SharedValues::SCAN_GENERATED_PLIST_FILES` | The generated plist files |
| `SharedValues::SCAN_GENERATED_XCRESULT_PATH` | The path to the generated .xcresult |
| `SharedValues::SCAN_ZIP_BUILD_PRODUCTS_PATH` | The path to the zipped build products |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action run_tests

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run run_tests

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run run_tests parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcode_server_get_assets

- Docs »
- \_Actions »
- xcode\_server\_get\_assets
- Edit on GitHub
- ```

* * *

# xcode\_server\_get\_assets

>
> If you'd like to keep all downloaded assets, pass `keep_all_assets: true`.
>
> This action returns the path to the downloaded assets folder and puts into shared values the paths to the asset folder and to the `.xcarchive` inside it.

| xcode\_server\_get\_assets | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @czechboy0 |

## 1 Example

```ruby hljs
xcode_server_get_assets(
host: "10.99.0.59", # Specify Xcode Server's Host or IP Address
bot_name: "release-1.3.4" # Specify the particular Bot
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `host` | IP Address/Hostname of Xcode Server | |
| `bot_name` | Name of the Bot to pull assets from | |
| `integration_number` | Optionally you can override which integration's assets should be downloaded. If not provided, the latest integration is used | |
| `username` | Username for your Xcode Server | `''` |
| `password` | Password for your Xcode Server | `''` |
| `target_folder` | Relative path to a folder into which to download assets | `./xcs_assets` |
| `keep_all_assets` | Whether to keep all assets or let the script delete everything except for the .xcarchive | `false` |
| `trust_self_signed_certs` | Whether to trust self-signed certs on your Xcode Server | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `xcode_server_get_assets` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::XCODE_SERVER_GET_ASSETS_PATH` | Absolute path to the downloaded assets folder |
| `SharedValues::XCODE_SERVER_GET_ASSETS_ARCHIVE_PATH` | Absolute path to the downloaded xcarchive file |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcode_server_get_assets

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcode_server_get_assets

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcode_server_get_assets parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/gym

- Docs »
- \_Actions »
- gym
- Edit on GitHub
- ```

* * *

# gym

Alias for the `build_app` action

Features •
Usage •
Tips

# What's gym?

_gym_ builds and packages iOS apps for you. It takes care of all the heavy lifting and makes it super easy to generate a signed `ipa` or `app` file 💪

_gym_ is a replacement for shenzhen.

### Before _gym_

```no-highlight
xcodebuild clean archive -archivePath build/MyApp \
-scheme MyApp
xcodebuild -exportArchive \
-exportFormat ipa \
-archivePath "build/MyApp.xcarchive" \
-exportPath "build/MyApp.ipa" \
-exportProvisioningProfile "ProvisioningProfileName"

### With _gym_

```no-highlight
fastlane gym

### Why _gym_?

_gym_ uses the latest APIs to build and sign your application which results in much faster build times.

| | _gym_ Features |
| --- | --- |
| 🚀 | _gym_ builds 30% faster than other build tools like shenzhen |
| 🏁 | Beautiful inline build output |
| 📖 | Helps you resolve common build errors like code signing issues |
| 🚠 | Sensible defaults: Automatically detect the project, its schemes and more |
| 🔗 | Works perfectly with _fastlane_ and other tools |
| 📦 | Automatically generates an `ipa` and a compressed `dSYM` file |
| 🚅 | Don't remember any complicated build commands, just _gym_ |
| 🔧 | Easy and dynamic configuration using parameters and environment variables |
| 💾 | Store common build settings in a `Gymfile` |
| 📤 | All archives are stored and accessible in the Xcode Organizer |
| 💻 | Supports both iOS and Mac applications |

# Usage

That's all you need to build your application. If you want more control, here are some available parameters:

```no-highlight
fastlane gym --workspace "Example.xcworkspace" --scheme "AppName" --clean

If you need to use a different Xcode installation, use `xcodes` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" fastlane gym

For a list of all available parameters use

```no-highlight
fastlane action gym

If you run into any issues, use the `verbose` mode to get more information

```no-highlight
fastlane gym --verbose

Set the right export method if you're not uploading to App Store or TestFlight:

```no-highlight
fastlane gym --export_method ad-hoc

To pass boolean parameters make sure to use _gym_ like this:

```no-highlight
fastlane gym --include_bitcode true --include_symbols false

To access the raw `xcodebuild` output open `~/Library/Logs/gym`

# Gymfile

Since you might want to manually trigger a new build but don't want to specify all the parameters every time, you can store your defaults in a so called `Gymfile`.

Run `fastlane gym init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")

sdk("iphoneos9.0")

clean(true)

output_directory("./build") # store the ipa in this folder
output_name("MyApp") # the name of the ipa file

## Export options

Since Xcode 7, _gym_ is using new Xcode API which allows us to specify export options using `plist` file. By default _gym_ creates this file for you and you are able to modify some parameters by using `export_method`, `export_team_id`, `include_symbols` or `include_bitcode`. If you want to have more options, like creating manifest file for app thinning, you can provide your own `plist` file:

```ruby-skip-tests
export_options("./ExportOptions.plist")

or you can provide hash of values directly in the `Gymfile`:

```ruby-skip-tests
export_options({
method: "ad-hoc",
manifest: {
appURL: "https://example.com/My App.ipa",
},

})

Optional: If _gym_ can't automatically detect the provisioning profiles to use, you can pass a mapping of bundle identifiers to provisioning profiles:

```ruby hljs
build_app(
scheme: "Release",
export_method: "app-store",
export_options: {
provisioningProfiles: {

}
}
)

**Note**: If you use _fastlane_ with _match_ you don't need to provide those values manually, unless you pass a plist file into `export_options`

For the list of available options run `xcodebuild -help`.

## Setup code signing

- More information on how to get started with codesigning
- Docs on how to set up your Xcode project

## Automating the whole process

_gym_ works great together with _fastlane_, which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby hljs
lane :beta do
scan
gym(scheme: "MyApp")
crashlytics
end

# error block is executed when a error occurs
error do |lane, exception|
slack(
# message with short human friendly message
message: exception.to_s,
success: false,
# Output containing extended log output

)
end

When _gym_ raises an error the `error_info` property will contain the process output
in case you want to display the error in 3rd party tools such as Slack.

You can then easily switch between the beta provider (e.g. `testflight`, `hockey`, `s3` and more).

# How does it work?

_gym_ uses the latest APIs to build and sign your application. The 2 main components are

- `xcodebuild`
- xcpretty

When you run _gym_ without the `--silent` mode it will print out every command it executes.

To build the archive _gym_ uses the following command:

```no-highlight
set -o pipefail && \
xcodebuild -scheme 'Example' \
-project './Example.xcodeproj' \
-configuration 'Release' \
-destination 'generic/platform=iOS' \
-archivePath '/Users/felixkrause/Library/Developer/Xcode/Archives/2015-08-11/ExampleProductName 2015-08-11 18.15.30.xcarchive' \
archive | xcpretty

After building the archive it is being checked by _gym_. If it's valid, it gets packaged up and signed into an `ipa` file.

_gym_ automatically chooses a different packaging method depending on the version of Xcode you're using.

### Xcode 7 and above

```no-highlight
/usr/bin/xcrun path/to/xcbuild-safe.sh -exportArchive \
-exportOptionsPlist '/tmp/gym_config_1442852529.plist' \
-archivePath '/Users/fkrause/Library/Developer/Xcode/Archives/2015-09-21/App 2015-09-21 09.21.56.xcarchive' \
-exportPath '/tmp/1442852529'

_gym_ makes use of the new Xcode 7 API which allows us to specify the export options using a `plist` file. You can find more information about the available options by running `xcodebuild --help`.

Using this method there are no workarounds for WatchKit or Swift required, as it uses the same technique Xcode uses when exporting your binary.

Note: the xcbuild-safe.sh script wraps around xcodebuild to workaround some incompatibilities.

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `ipa` files like this:

| gym | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | The absolute path to the generated ipa file |

## 5 Examples

```ruby hljs
build_app(scheme: "MyApp", workspace: "MyApp.xcworkspace")

```ruby hljs
build_app(
workspace: "MyApp.xcworkspace",
configuration: "Debug",
scheme: "MyApp",
silent: true,
clean: true,
output_directory: "path/to/dir", # Destination directory. Defaults to current directory.
output_name: "my-app.ipa", # specify the name of the .ipa file to generate (including file extension)
sdk: "iOS 11.1" # use SDK as the name or path of the base SDK when building the project.
)

```ruby hljs
gym # alias for "build_app"

```ruby hljs
build_ios_app # alias for "build_app (only iOS options)"

```ruby hljs
build_mac_app # alias for "build_app (only macOS options)"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `scheme` | The project's scheme. Make sure it's marked as `Shared` | |
| `clean` | Should the project be cleaned before building it? | `false` |
| `output_directory` | The directory in which the ipa file should be stored in | `.` |
| `output_name` | The name of the resulting ipa file | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `silent` | Hide all information that's not necessary while building | `false` |
| `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH' | |
| `skip_package_ipa` | Should we skip packaging the ipa? | `false` |
| `skip_package_pkg` | Should we skip packaging the pkg? | `false` |
| `include_symbols` | Should the ipa file include symbols? | |
| `include_bitcode` | Should the ipa file include bitcode? | |
| `export_method` | Method used to export the archive. Valid values are: app-store, validation, ad-hoc, package, enterprise, development, developer-id and mac-application | |
| `export_options` | Path to an export options plist or a hash with export options. Use 'xcodebuild -help' to print the full set of available options | |
| `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `skip_build_archive` | Export ipa from previously built xcarchive. Uses archive\_path as source | |
| `skip_archive` | After building, don't archive, effectively not including -archivePath param | |
| `skip_codesigning` | Build without codesigning | |
| `catalyst_platform` | Platform to build when using a Catalyst enabled app. Valid values are: ios, macos | |
| `installer_cert_name` | Full name of 3rd Party Mac Developer Installer or Developer ID Installer certificate. Example: `3rd Party Mac Developer Installer: Your Company (ABC1234XWYZ)` | |
| `build_path` | The directory in which the archive should be stored in | |
| `archive_path` | The path to the created archive | |
| `derived_data_path` | The directory where built products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `result_bundle_path` | Path to the result bundle directory to create. Ignored if `result_bundle` if false | |
| `buildlog_path` | The directory where to store the build log | \* |
| `sdk` | The SDK that should be used for building the application | |
| `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift\_2\_3, org.swift.30p620160816a) | |
| `destination` | Use a custom destination for building the app | |
| `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file | |
| `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `build_timing_summary` | Create a build timing summary | `false` |
| `disable_xcpretty` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Disable xcpretty formatting of build output | |
| `xcpretty_test_format` | Use the test (RSpec style) format for build output | |
| `xcpretty_formatter` | A custom xcpretty formatter to use | |
| `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path | |
| `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path | |
| `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path | |
| `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds | |
| `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file | |
| `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used | `false` |
| `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `xcodebuild` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `gym` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file |
| `SharedValues::PKG_OUTPUT_PATH` | The path to the newly generated pkg file |
| `SharedValues::DSYM_OUTPUT_PATH` | The path to the dSYM files |
| `SharedValues::XCODEBUILD_ARCHIVE` | The path to the xcodebuild archive |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run gym

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run gym parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/cocoapods

- Docs »
- \_Actions »
- cocoapods
- Edit on GitHub
- ```

* * *

# cocoapods

| cocoapods | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx, @tadpol, @birmacher, @Liquidsoul |

## 2 Examples

```ruby hljs
cocoapods

```ruby hljs
cocoapods(
clean_install: true,
podfile: "./CustomPodfile"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `repo_update` | Add `--repo-update` flag to `pod install` command | `false` |
| `clean_install` | Execute a full pod installation ignoring the content of the project cache | `false` |
| `silent` | Execute command without logging output | `false` |
| `verbose` | Show more debugging information | `false` |
| `ansi` | Show output with ANSI codes | `true` |
| `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true` |
| `podfile` | Explicitly specify the path to the Cocoapods' Podfile. You can either set it to the Podfile's path or to the folder containing the Podfile file | |
| `error_callback` | A callback invoked with the command output if there is a non-zero exit status | |
| `try_repo_update_on_error` | Retry with --repo-update if action was finished with error | `false` |
| `deployment` | Disallow any changes to the Podfile or the Podfile.lock during installation | `false` |
| `allow_root` | Allows CocoaPods to run as root | `false` |
| `clean` | **DEPRECATED!** (Option renamed as clean\_install) Remove SCM directories | `true` |
| `integrate` | **DEPRECATED!** (Option removed from cocoapods) Integrate the Pods libraries into the Xcode project(s) | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action cocoapods

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run cocoapods

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run cocoapods parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/gradle

- Docs »
- \_Actions »
- gradle
- Edit on GitHub
- ```

* * *

# gradle

| gradle | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @KrauseFx, @lmirosevic |
| Returns | The output of running the gradle task |

## 1 Example

```ruby hljs
gradle(
task: "assemble",
flavor: "WorldDomination",
build_type: "Release"
)

To build an AAB use:

```ruby hljs
gradle(
task: "bundle",
flavor: "WorldDomination",
build_type: "Release"
)

You can pass multiple gradle tasks:

```ruby hljs
gradle(
tasks: ["assembleDebug", "bundleDebug"]
)

You can pass properties to gradle:

```ruby hljs
gradle(
# ...

properties: {

}
)

You can use this to change the version code and name of your app:

You can use this to automatically sign and zipalign your app:

```ruby hljs
gradle(
task: "assemble",
build_type: "Release",
print_command: false,
properties: {

If you need to pass sensitive information through the `gradle` action, and don't want the generated command to be printed before it is run, you can suppress that:

```ruby hljs
gradle(
print_command: false
)

You can also suppress printing the output generated by running the generated Gradle command:

```ruby hljs
gradle(
print_command_output: false
)

To pass any other CLI flags to gradle use:

flags: "--exitcode --xml file.xml"
)

Delete the build directory, generated APKs and AABs

```ruby hljs
gradle(
task: "clean"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `task` | The gradle task you want to execute, e.g. `assemble`, `bundle` or `test`. For tasks such as `assembleMyFlavorRelease` you should use gradle(task: 'assemble', flavor: 'Myflavor', build\_type: 'Release') | |
| `flavor` | The flavor that you want the task for, e.g. `MyFlavor`. If you are running the `assemble` task in a multi-flavor project, and you rely on Actions.lane\_context\[SharedValues::GRADLE\_APK\_OUTPUT\_PATH\] then you must specify a flavor here or else this value will be undefined | |
| `build_type` | The build type that you want the task for, e.g. `Release`. Useful for some tasks such as `assemble` | |
| `tasks` | The multiple gradle tasks that you want to execute, e.g. `[assembleDebug, bundleDebug]` | |
| `flags` | All parameter flags you want to pass to the gradle command, e.g. `--exitcode --xml file.xml` | |
| `project_dir` | The root directory of the gradle project | `.` |
| `gradle_path` | The path to your `gradlew`. If you specify a relative path, it is assumed to be relative to the `project_dir` | |
| `properties` | Gradle properties to be exposed to the gradle script | |
| `system_properties` | Gradle system properties to be exposed to the gradle script | |
| `serial` | Android serial, which device should be used for this command | `''` |
| `print_command` | Control whether the generated Gradle command is printed as output before running it (true/false) | `true` |
| `print_command_output` | Control whether the output produced by given Gradle command is printed while running (true/false) | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `gradle` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GRADLE_APK_OUTPUT_PATH` | The path to the newly generated apk file. Undefined in a multi-variant assemble scenario |
| `SharedValues::GRADLE_ALL_APK_OUTPUT_PATHS` | When running a multi-variant `assemble`, the array of signed apk's that were generated |
| `SharedValues::GRADLE_FLAVOR` | The flavor, e.g. `MyFlavor` |
| `SharedValues::GRADLE_BUILD_TYPE` | The build type, e.g. `Release` |
| `SharedValues::GRADLE_AAB_OUTPUT_PATH` | The path to the most recent Android app bundle |
| `SharedValues::GRADLE_ALL_AAB_OUTPUT_PATHS` | The paths to the most recent Android app bundles |
| `SharedValues::GRADLE_OUTPUT_JSON_OUTPUT_PATH` | The path to the most recent output.json file |
| `SharedValues::GRADLE_ALL_OUTPUT_JSON_OUTPUT_PATHS` | The path to the newly generated output.json files |
| `SharedValues::GRADLE_MAPPING_TXT_OUTPUT_PATH` | The path to the most recent mapping.txt file |
| `SharedValues::GRADLE_ALL_MAPPING_TXT_OUTPUT_PATHS` | The path to the newly generated mapping.txt files |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action gradle

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run gradle

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run gradle parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/clear_derived_data

- Docs »
- \_Actions »
- clear\_derived\_data
- Edit on GitHub
- ```

* * *

# clear\_derived\_data

| clear\_derived\_data | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
clear_derived_data

```ruby hljs
clear_derived_data(derived_data_path: "/custom/")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `derived_data_path` | Custom path for derivedData | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action clear_derived_data

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clear_derived_data

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clear_derived_data parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/adb

- Docs »
- \_Actions »
- adb
- Edit on GitHub
- ```

* * *

# adb

| adb | |
| --- | --- |
| Supported platforms | android |
| Author | @hjanuschka |
| Returns | The output of the adb command |

## 1 Example

```ruby hljs
adb(
command: "shell ls"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `serial` | Android serial of the device to use for this command | `''` |
| `command` | All commands you want to pass to the adb command, e.g. `kill-server` | |
| `adb_path` | The path to your `adb` binary (can be left blank if the ANDROID\_SDK\_ROOT, ANDROID\_HOME or ANDROID\_SDK environment variable is set) | `adb` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action adb

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run adb

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run adb parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcodebuild

- Docs »
- \_Actions »
- xcodebuild
- Edit on GitHub
- ```

* * *

# xcodebuild

| xcodebuild | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcodebuild(
archive: true,
archive_path: "./build-dir/MyApp.xcarchive",
scheme: "MyApp",
workspace: "MyApp.xcworkspace"
)

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcodebuild

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcodebuild

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcodebuild parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/carthage

- Docs »
- \_Actions »
- carthage
- Edit on GitHub
- ```

* * *

# carthage

Runs `carthage` for your project

| carthage | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @bassrock, @petester42, @jschmid, @JaviSoto, @uny, @phatblat, @bfcrampton, @antondomashnev, @gbrhaz |

## 2 Examples

```ruby hljs
carthage

```ruby hljs
carthage(
frameworks: ["MyFramework1", "MyFramework2"], # Specify which frameworks to archive (only for the archive command)
output: "MyFrameworkBundle.framework.zip", # Specify the output archive name (only for the archive command)
command: "bootstrap", # One of: build, bootstrap, update, archive. (default: bootstrap)
dependencies: ["Alamofire", "Notice"],# Specify which dependencies to update or build (only for update, build and bootstrap commands)
use_ssh: false, # Use SSH for downloading GitHub repositories.
use_submodules: false, # Add dependencies as Git submodules.
use_binaries: true, # Check out dependency repositories even when prebuilt frameworks exist
no_build: false, # When bootstrapping Carthage do not build
no_skip_current: false, # Don't skip building the current project (only for frameworks)
verbose: false, # Print xcodebuild output inline
platform: "all", # Define which platform to build for (one of ‘all’, ‘Mac’, ‘iOS’, ‘watchOS’, ‘tvOS‘, or comma-separated values of the formers except for ‘all’)
configuration: "Release", # Build configuration to use when building
cache_builds: true, # By default Carthage will rebuild a dependency regardless of whether its the same resolved version as before.
toolchain: "com.apple.dt.toolchain.Swift_2_3", # Specify the xcodebuild toolchain
new_resolver: false, # Use the new resolver to resolve dependency graph
log_path: "carthage.log" # Path to the xcode build output
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `command` | Carthage command (one of: build, bootstrap, update, archive) | `bootstrap` |
| `dependencies` | Carthage dependencies to update, build or bootstrap | `[]` |
| `use_ssh` | Use SSH for downloading GitHub repositories | |
| `use_submodules` | Add dependencies as Git submodules | |
| `use_netrc` | Use .netrc for downloading frameworks | |
| `use_binaries` | Check out dependency repositories even when prebuilt frameworks exist | |
| `no_checkout` | When bootstrapping Carthage do not checkout | |
| `no_build` | When bootstrapping Carthage do not build | |
| `no_skip_current` | Don't skip building the Carthage project (in addition to its dependencies) | |
| `derived_data` | Use derived data folder at path | |
| `verbose` | Print xcodebuild output inline | |
| `platform` | Define which platform to build for | |
| `cache_builds` | By default Carthage will rebuild a dependency regardless of whether it's the same resolved version as before. Passing the --cache-builds will cause carthage to avoid rebuilding a dependency if it can | `false` |
| `frameworks` | Framework name or names to archive, could be applied only along with the archive command | `[]` |
| `output` | Output name for the archive, could be applied only along with the archive command. Use following format \*.framework.zip | |
| `configuration` | Define which build configuration to use when building | |
| `toolchain` | Define which xcodebuild toolchain to use when building | |
| `project_directory` | Define the directory containing the Carthage project | |
| `new_resolver` | Use new resolver when resolving dependency graph | |
| `log_path` | Path to the xcode build output | |
| `use_xcframeworks` | Create xcframework bundles instead of one framework per platform (requires Xcode 12+) | `false` |
| `archive` | Archive built frameworks from the current project | `false` |
| `executable` | Path to the `carthage` executable on your machine | `carthage` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action carthage

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run carthage

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run carthage parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcode_select

- Docs »
- \_Actions »
- xcode\_select
- Edit on GitHub
- ```

* * *

# xcode\_select

>
> Use the `xcodes` action if you want to select an Xcode:
>
> \- Based on a version specifier or
>
> \- You don't have known, stable paths, as may happen in a CI environment.

| xcode\_select | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcode_select("/Applications/Xcode-8.3.2.app")

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcode_select

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcode_select

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcode_select parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/ensure_xcode_version

- Docs »
- \_Actions »
- ensure\_xcode\_version
- Edit on GitHub
- ```

* * *

# ensure\_xcode\_version

>
> If building your app requires a specific version of Xcode, you can invoke this command before using gym.
>
> For example, to ensure that a beta version of Xcode is not accidentally selected to build, which would make uploading to TestFlight fail.
>
> You can either manually provide a specific version using `version:` or you make use of the `.xcode-version` file.
>
> Using the `strict` parameter, you can either verify the full set of version numbers strictly (i.e. `11.3.1`) or only a subset of them (i.e. `11.3` or `11`).

| ensure\_xcode\_version | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @JaviSoto, @KrauseFx |

## 1 Example

```ruby hljs
ensure_xcode_version(version: "12.5")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `version` | Xcode version to verify that is selected | |
| `strict` | Should the version be verified strictly (all 3 version numbers), or matching only the given version numbers (i.e. `11.3` == `11.3.x`) | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `ensure_xcode_version` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::FL_ENSURE_XCODE_VERSION` | Xcode version to verify that is selected |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action ensure_xcode_version

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_xcode_version

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_xcode_version parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/clean_cocoapods_cache

- Docs »
- \_Actions »
- clean\_cocoapods\_cache
- Edit on GitHub
- ```

* * *

# clean\_cocoapods\_cache

Remove the cache for pods

| clean\_cocoapods\_cache | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @alexmx |

## 2 Examples

```ruby hljs
clean_cocoapods_cache

```ruby hljs
clean_cocoapods_cache(name: "CACHED_POD")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `name` | Pod name to be removed from cache | |
| `no_ansi` | Show output without ANSI codes | `false` |
| `verbose` | Show more debugging information | `false` |
| `silent` | Show nothing | `false` |
| `allow_root` | Allows CocoaPods to run as root | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action clean_cocoapods_cache

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clean_cocoapods_cache

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clean_cocoapods_cache parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/verify_xcode

- Docs »
- \_Actions »
- verify\_xcode
- Edit on GitHub
- ```

* * *

# verify\_xcode

| verify\_xcode | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
verify_xcode

```ruby hljs
verify_xcode(xcode_path: "/Applications/Xcode.app")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcode_path` | The path to the Xcode installation to test | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action verify_xcode

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_xcode

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_xcode parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/verify_pod_keys

- Docs »
- \_Actions »
- verify\_pod\_keys
- Edit on GitHub
- ```

* * *

# verify\_pod\_keys

| verify\_pod\_keys | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @ashfurrow |

## 1 Example

```ruby hljs
verify_pod_keys

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action verify_pod_keys

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_pod_keys

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_pod_keys parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcodes

- Docs »
- \_Actions »
- xcodes
- Edit on GitHub
- ```

* * *

# xcodes

>
> This will make sure to use the correct Xcode version for later actions.
>
> Note that this action depends on xcodes CLI, so make sure you have it installed in your environment. For the installation guide, see:

| xcodes | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @rogerluan |
| Returns | The path to the newly installed Xcode version |

## 2 Examples

```ruby hljs
xcodes(version: "14.1")

```ruby hljs
xcodes # When missing, the version value defaults to the value specified in the .xcode-version file

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `version` | The version number of the version of Xcode to install. Defaults to the value specified in the .xcode-version file | \* |
| `update_list` | Whether the list of available Xcode versions should be updated before running the install command | `true` |
| `select_for_current_build_only` | When true, it won't attempt to install an Xcode version, just find the installed Xcode version that best matches the passed version argument, and select it for the current build steps. It doesn't change the global Xcode version (e.g. via 'xcrun xcode-select'), which would require sudo permissions — when this option is true, this action doesn't require sudo permissions | `false` |
| `binary_path` | Where the xcodes binary lives on your system (full path) | \* |
| `xcodes_args` | Pass in xcodes command line arguments directly. When present, other parameters are ignored and only this parameter is used to build the command to be executed | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `xcodes` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::XCODES_XCODE_PATH` | The path to the newly installed Xcode version |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcodes

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcodes

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcodes parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcclean

- Docs »
- \_Actions »
- xcclean
- Edit on GitHub
- ```

* * *

# xcclean

Cleans the project using `xcodebuild`

| xcclean | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcclean

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcclean

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcclean

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcclean parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/spm

- Docs »
- \_Actions »
- spm
- Edit on GitHub
- ```

* * *

# spm

Runs Swift Package Manager on your project

| spm | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @fjcaetano, @nxtstep |

## 6 Examples

```ruby hljs
spm

```ruby hljs
spm(
command: "build",
scratch_path: "./build",
configuration: "release"
)

```ruby hljs
spm(
command: "generate-xcodeproj",
xcconfig: "Package.xcconfig"
)

```ruby hljs
spm(
command: "test",
parallel: true
)

```ruby hljs
spm(
simulator: "iphonesimulator"
)

```ruby hljs
spm(
simulator: "macosx",
simulator_arch: "arm64"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `command` | The swift command (one of: build, test, clean, reset, update, resolve, generate-xcodeproj, init) | `build` |
| `enable_code_coverage` | Enables code coverage for the generated Xcode project when using the 'generate-xcodeproj' and the 'test' command | |
| `scratch_path` | Specify build/cache directory \[default: ./.build\] | |
| `parallel` | Enables running tests in parallel when using the 'test' command | `false` |
| `build_path` | **DEPRECATED!** `build_path` option is deprecated, use `scratch_path` instead - Specify build/cache directory \[default: ./.build\] | |
| `package_path` | Change working directory before any other operation | |
| `xcconfig` | Use xcconfig file to override swift package generate-xcodeproj defaults | |
| `configuration` | Build with configuration (debug\|release) \[default: debug\] | |
| `disable_sandbox` | Disable using the sandbox when executing subprocesses | `false` |
| `xcpretty_output` | Specifies the output type for xcpretty. eg. 'test', or 'simple' | |
| `xcpretty_args` | Pass in xcpretty additional command line arguments (e.g. '--test --no-color' or '--tap --no-utf'), requires xcpretty\_output to be specified also | |
| `verbose` | Increase verbosity of informational output | `false` |
| `simulator` | Specifies the simulator to pass for Swift Compiler (one of: iphonesimulator, macosx) | |
| `simulator_arch` | Specifies the architecture of the simulator to pass for Swift Compiler (one of: x86\_64, arm64). Requires the simulator option to be specified also, otherwise, it's ignored | `arm64` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action spm

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run spm

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run spm parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcbuild

- Docs »
- \_Actions »
- xcbuild
- Edit on GitHub
- ```

* * *

# xcbuild

Builds the project using `xcodebuild`

| xcbuild | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcbuild

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcbuild

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcbuild

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcbuild parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xctest

- Docs »
- \_Actions »
- xctest
- Edit on GitHub
- ```

* * *

# xctest

Runs tests on the given simulator

| xctest | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xctest(
destination: "name=iPhone 7s,OS=10.0"
)

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xctest

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xctest

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xctest parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/build_app

- Docs »
- \_Actions »
- build\_app
- Edit on GitHub
- ```

* * *

# build\_app

Easily build and sign your app (via _gym_)

Features •
Usage •
Tips

# What's gym?

_gym_ builds and packages iOS apps for you. It takes care of all the heavy lifting and makes it super easy to generate a signed `ipa` or `app` file 💪

_gym_ is a replacement for shenzhen.

### Before _gym_

```no-highlight
xcodebuild clean archive -archivePath build/MyApp \
-scheme MyApp
xcodebuild -exportArchive \
-exportFormat ipa \
-archivePath "build/MyApp.xcarchive" \
-exportPath "build/MyApp.ipa" \
-exportProvisioningProfile "ProvisioningProfileName"

### With _gym_

```no-highlight
fastlane gym

### Why _gym_?

_gym_ uses the latest APIs to build and sign your application which results in much faster build times.

| | _gym_ Features |
| --- | --- |
| 🚀 | _gym_ builds 30% faster than other build tools like shenzhen |
| 🏁 | Beautiful inline build output |
| 📖 | Helps you resolve common build errors like code signing issues |
| 🚠 | Sensible defaults: Automatically detect the project, its schemes and more |
| 🔗 | Works perfectly with _fastlane_ and other tools |
| 📦 | Automatically generates an `ipa` and a compressed `dSYM` file |
| 🚅 | Don't remember any complicated build commands, just _gym_ |
| 🔧 | Easy and dynamic configuration using parameters and environment variables |
| 💾 | Store common build settings in a `Gymfile` |
| 📤 | All archives are stored and accessible in the Xcode Organizer |
| 💻 | Supports both iOS and Mac applications |

# Usage

That's all you need to build your application. If you want more control, here are some available parameters:

```no-highlight
fastlane gym --workspace "Example.xcworkspace" --scheme "AppName" --clean

If you need to use a different Xcode installation, use `xcodes` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" fastlane gym

For a list of all available parameters use

```no-highlight
fastlane action gym

If you run into any issues, use the `verbose` mode to get more information

```no-highlight
fastlane gym --verbose

Set the right export method if you're not uploading to App Store or TestFlight:

```no-highlight
fastlane gym --export_method ad-hoc

To pass boolean parameters make sure to use _gym_ like this:

```no-highlight
fastlane gym --include_bitcode true --include_symbols false

To access the raw `xcodebuild` output open `~/Library/Logs/gym`

# Gymfile

Since you might want to manually trigger a new build but don't want to specify all the parameters every time, you can store your defaults in a so called `Gymfile`.

Run `fastlane gym init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")

sdk("iphoneos9.0")

clean(true)

output_directory("./build") # store the ipa in this folder
output_name("MyApp") # the name of the ipa file

## Export options

Since Xcode 7, _gym_ is using new Xcode API which allows us to specify export options using `plist` file. By default _gym_ creates this file for you and you are able to modify some parameters by using `export_method`, `export_team_id`, `include_symbols` or `include_bitcode`. If you want to have more options, like creating manifest file for app thinning, you can provide your own `plist` file:

```ruby-skip-tests
export_options("./ExportOptions.plist")

or you can provide hash of values directly in the `Gymfile`:

```ruby-skip-tests
export_options({
method: "ad-hoc",
manifest: {
appURL: "https://example.com/My App.ipa",
},

})

Optional: If _gym_ can't automatically detect the provisioning profiles to use, you can pass a mapping of bundle identifiers to provisioning profiles:

```ruby hljs
build_app(
scheme: "Release",
export_method: "app-store",
export_options: {
provisioningProfiles: {

}
}
)

**Note**: If you use _fastlane_ with _match_ you don't need to provide those values manually, unless you pass a plist file into `export_options`

For the list of available options run `xcodebuild -help`.

## Setup code signing

- More information on how to get started with codesigning
- Docs on how to set up your Xcode project

## Automating the whole process

_gym_ works great together with _fastlane_, which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby hljs
lane :beta do
scan
gym(scheme: "MyApp")
crashlytics
end

# error block is executed when a error occurs
error do |lane, exception|
slack(
# message with short human friendly message
message: exception.to_s,
success: false,
# Output containing extended log output

)
end

When _gym_ raises an error the `error_info` property will contain the process output
in case you want to display the error in 3rd party tools such as Slack.

You can then easily switch between the beta provider (e.g. `testflight`, `hockey`, `s3` and more).

# How does it work?

_gym_ uses the latest APIs to build and sign your application. The 2 main components are

- `xcodebuild`
- xcpretty

When you run _gym_ without the `--silent` mode it will print out every command it executes.

To build the archive _gym_ uses the following command:

```no-highlight
set -o pipefail && \
xcodebuild -scheme 'Example' \
-project './Example.xcodeproj' \
-configuration 'Release' \
-destination 'generic/platform=iOS' \
-archivePath '/Users/felixkrause/Library/Developer/Xcode/Archives/2015-08-11/ExampleProductName 2015-08-11 18.15.30.xcarchive' \
archive | xcpretty

After building the archive it is being checked by _gym_. If it's valid, it gets packaged up and signed into an `ipa` file.

_gym_ automatically chooses a different packaging method depending on the version of Xcode you're using.

### Xcode 7 and above

```no-highlight
/usr/bin/xcrun path/to/xcbuild-safe.sh -exportArchive \
-exportOptionsPlist '/tmp/gym_config_1442852529.plist' \
-archivePath '/Users/fkrause/Library/Developer/Xcode/Archives/2015-09-21/App 2015-09-21 09.21.56.xcarchive' \
-exportPath '/tmp/1442852529'

_gym_ makes use of the new Xcode 7 API which allows us to specify the export options using a `plist` file. You can find more information about the available options by running `xcodebuild --help`.

Using this method there are no workarounds for WatchKit or Swift required, as it uses the same technique Xcode uses when exporting your binary.

Note: the xcbuild-safe.sh script wraps around xcodebuild to workaround some incompatibilities.

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `ipa` files like this:

| build\_app | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | The absolute path to the generated ipa file |

## 5 Examples

```ruby hljs
build_app(scheme: "MyApp", workspace: "MyApp.xcworkspace")

```ruby hljs
build_app(
workspace: "MyApp.xcworkspace",
configuration: "Debug",
scheme: "MyApp",
silent: true,
clean: true,
output_directory: "path/to/dir", # Destination directory. Defaults to current directory.
output_name: "my-app.ipa", # specify the name of the .ipa file to generate (including file extension)
sdk: "iOS 11.1" # use SDK as the name or path of the base SDK when building the project.
)

```ruby hljs
gym # alias for "build_app"

```ruby hljs
build_ios_app # alias for "build_app (only iOS options)"

```ruby hljs
build_mac_app # alias for "build_app (only macOS options)"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `scheme` | The project's scheme. Make sure it's marked as `Shared` | |
| `clean` | Should the project be cleaned before building it? | `false` |
| `output_directory` | The directory in which the ipa file should be stored in | `.` |
| `output_name` | The name of the resulting ipa file | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `silent` | Hide all information that's not necessary while building | `false` |
| `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH' | |
| `skip_package_ipa` | Should we skip packaging the ipa? | `false` |
| `skip_package_pkg` | Should we skip packaging the pkg? | `false` |
| `include_symbols` | Should the ipa file include symbols? | |
| `include_bitcode` | Should the ipa file include bitcode? | |
| `export_method` | Method used to export the archive. Valid values are: app-store, validation, ad-hoc, package, enterprise, development, developer-id and mac-application | |
| `export_options` | Path to an export options plist or a hash with export options. Use 'xcodebuild -help' to print the full set of available options | |
| `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `skip_build_archive` | Export ipa from previously built xcarchive. Uses archive\_path as source | |
| `skip_archive` | After building, don't archive, effectively not including -archivePath param | |
| `skip_codesigning` | Build without codesigning | |
| `catalyst_platform` | Platform to build when using a Catalyst enabled app. Valid values are: ios, macos | |
| `installer_cert_name` | Full name of 3rd Party Mac Developer Installer or Developer ID Installer certificate. Example: `3rd Party Mac Developer Installer: Your Company (ABC1234XWYZ)` | |
| `build_path` | The directory in which the archive should be stored in | |
| `archive_path` | The path to the created archive | |
| `derived_data_path` | The directory where built products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `result_bundle_path` | Path to the result bundle directory to create. Ignored if `result_bundle` if false | |
| `buildlog_path` | The directory where to store the build log | \* |
| `sdk` | The SDK that should be used for building the application | |
| `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift\_2\_3, org.swift.30p620160816a) | |
| `destination` | Use a custom destination for building the app | |
| `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file | |
| `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `build_timing_summary` | Create a build timing summary | `false` |
| `disable_xcpretty` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Disable xcpretty formatting of build output | |
| `xcpretty_test_format` | Use the test (RSpec style) format for build output | |
| `xcpretty_formatter` | A custom xcpretty formatter to use | |
| `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path | |
| `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path | |
| `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path | |
| `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds | |
| `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file | |
| `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used | `false` |
| `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `xcodebuild` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `build_app` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file |
| `SharedValues::PKG_OUTPUT_PATH` | The path to the newly generated pkg file |
| `SharedValues::DSYM_OUTPUT_PATH` | The path to the dSYM files |
| `SharedValues::XCODEBUILD_ARCHIVE` | The path to the xcodebuild archive |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action build_app

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_app

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_app parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcarchive

- Docs »
- \_Actions »
- xcarchive
- Edit on GitHub
- ```

* * *

# xcarchive

Archives the project using `xcodebuild`

| xcarchive | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcarchive

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcarchive

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcarchive

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcarchive parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/create_xcframework

- Docs »
- \_Actions »
- create\_xcframework
- Edit on GitHub
- ```

* * *

# create\_xcframework

>
> or framework into a single xcframework.
>
> If you want to package several frameworks just provide one of:
>
> \\* An array containing the list of frameworks using the :frameworks parameter
>
> (if they have no associated dSYMs):
>
> \['FrameworkA.framework', 'FrameworkB.framework'\]
>
> \\* A hash containing the list of frameworks with their dSYMs using the
>
> :frameworks\_with\_dsyms parameter:
>
> {
>
> 'FrameworkA.framework' => {},
>
> 'FrameworkB.framework' => { dsyms: 'FrameworkB.framework.dSYM' }
>
> }
>
> If you want to package several libraries just provide one of:
>
> \\* An array containing the list of libraries using the :libraries parameter
>
> (if they have no associated headers or dSYMs):
>
> \['LibraryA.so', 'LibraryB.so'\]
>
> \\* A hash containing the list of libraries with their headers and dSYMs
>
> using the :libraries\_with\_headers\_or\_dsyms parameter:
>
> {
>
> 'LibraryA.so' => { dsyms: 'libraryA.so.dSYM' },
>
> 'LibraryB.so' => { headers: 'headers' }
>
> }
>
> Finally specify the location of the xcframework to be generated using the :output
>
> parameter.

| create\_xcframework | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @jgongo |

## 4 Examples

```ruby hljs
create_xcframework(frameworks: ['FrameworkA.framework', 'FrameworkB.framework'], output: 'UniversalFramework.xcframework')

```ruby hljs

```ruby hljs
create_xcframework(libraries: ['LibraryA.so', 'LibraryB.so'], output: 'UniversalFramework.xcframework')

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `frameworks` | Frameworks (without dSYMs) to add to the target xcframework | |
| `frameworks_with_dsyms` | Frameworks (with dSYMs) to add to the target xcframework | |
| `libraries` | Libraries (without headers or dSYMs) to add to the target xcframework | |
| `libraries_with_headers_or_dsyms` | Libraries (with headers or dSYMs) to add to the target xcframework | |
| `output` | The path to write the xcframework to | |
| `allow_internal_distribution` | Specifies that the created xcframework contains information not suitable for public distribution | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_xcframework` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::XCFRAMEWORK_PATH` | Location of the generated xcframework |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action create_xcframework

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_xcframework

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_xcframework parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/xcexport

- Docs »
- \_Actions »
- xcexport
- Edit on GitHub
- ```

* * *

# xcexport

Exports the project using `xcodebuild`

| xcexport | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dtrenz |

## 1 Example

```ruby hljs
xcexport

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action xcexport

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcexport

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcexport parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/build_android_app

- Docs »
- \_Actions »
- build\_android\_app
- Edit on GitHub
- ```

* * *

# build\_android\_app

| build\_android\_app | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @KrauseFx, @lmirosevic |
| Returns | The output of running the gradle task |

## 1 Example

```ruby hljs
gradle(
task: "assemble",
flavor: "WorldDomination",
build_type: "Release"
)

To build an AAB use:

```ruby hljs
gradle(
task: "bundle",
flavor: "WorldDomination",
build_type: "Release"
)

You can pass multiple gradle tasks:

```ruby hljs
gradle(
tasks: ["assembleDebug", "bundleDebug"]
)

You can pass properties to gradle:

```ruby hljs
gradle(
# ...

properties: {

}
)

You can use this to change the version code and name of your app:

You can use this to automatically sign and zipalign your app:

```ruby hljs
gradle(
task: "assemble",
build_type: "Release",
print_command: false,
properties: {

If you need to pass sensitive information through the `gradle` action, and don't want the generated command to be printed before it is run, you can suppress that:

```ruby hljs
gradle(
print_command: false
)

You can also suppress printing the output generated by running the generated Gradle command:

```ruby hljs
gradle(
print_command_output: false
)

To pass any other CLI flags to gradle use:

flags: "--exitcode --xml file.xml"
)

Delete the build directory, generated APKs and AABs

```ruby hljs
gradle(
task: "clean"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `task` | The gradle task you want to execute, e.g. `assemble`, `bundle` or `test`. For tasks such as `assembleMyFlavorRelease` you should use gradle(task: 'assemble', flavor: 'Myflavor', build\_type: 'Release') | |
| `flavor` | The flavor that you want the task for, e.g. `MyFlavor`. If you are running the `assemble` task in a multi-flavor project, and you rely on Actions.lane\_context\[SharedValues::GRADLE\_APK\_OUTPUT\_PATH\] then you must specify a flavor here or else this value will be undefined | |
| `build_type` | The build type that you want the task for, e.g. `Release`. Useful for some tasks such as `assemble` | |
| `tasks` | The multiple gradle tasks that you want to execute, e.g. `[assembleDebug, bundleDebug]` | |
| `flags` | All parameter flags you want to pass to the gradle command, e.g. `--exitcode --xml file.xml` | |
| `project_dir` | The root directory of the gradle project | `.` |
| `gradle_path` | The path to your `gradlew`. If you specify a relative path, it is assumed to be relative to the `project_dir` | |
| `properties` | Gradle properties to be exposed to the gradle script | |
| `system_properties` | Gradle system properties to be exposed to the gradle script | |
| `serial` | Android serial, which device should be used for this command | `''` |
| `print_command` | Control whether the generated Gradle command is printed as output before running it (true/false) | `true` |
| `print_command_output` | Control whether the output produced by given Gradle command is printed while running (true/false) | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `build_android_app` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GRADLE_APK_OUTPUT_PATH` | The path to the newly generated apk file. Undefined in a multi-variant assemble scenario |
| `SharedValues::GRADLE_ALL_APK_OUTPUT_PATHS` | When running a multi-variant `assemble`, the array of signed apk's that were generated |
| `SharedValues::GRADLE_FLAVOR` | The flavor, e.g. `MyFlavor` |
| `SharedValues::GRADLE_BUILD_TYPE` | The build type, e.g. `Release` |
| `SharedValues::GRADLE_AAB_OUTPUT_PATH` | The path to the most recent Android app bundle |
| `SharedValues::GRADLE_ALL_AAB_OUTPUT_PATHS` | The paths to the most recent Android app bundles |
| `SharedValues::GRADLE_OUTPUT_JSON_OUTPUT_PATH` | The path to the most recent output.json file |
| `SharedValues::GRADLE_ALL_OUTPUT_JSON_OUTPUT_PATHS` | The path to the newly generated output.json files |
| `SharedValues::GRADLE_MAPPING_TXT_OUTPUT_PATH` | The path to the most recent mapping.txt file |
| `SharedValues::GRADLE_ALL_MAPPING_TXT_OUTPUT_PATHS` | The path to the newly generated mapping.txt files |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action build_android_app

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_android_app

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_android_app parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/build_ios_app

- Docs »
- \_Actions »
- build\_ios\_app
- Edit on GitHub
- ```

* * *

# build\_ios\_app

Alias for the `build_app` action but only for iOS

Features •
Usage •
Tips

# What's gym?

_gym_ builds and packages iOS apps for you. It takes care of all the heavy lifting and makes it super easy to generate a signed `ipa` or `app` file 💪

_gym_ is a replacement for shenzhen.

### Before _gym_

```no-highlight
xcodebuild clean archive -archivePath build/MyApp \
-scheme MyApp
xcodebuild -exportArchive \
-exportFormat ipa \
-archivePath "build/MyApp.xcarchive" \
-exportPath "build/MyApp.ipa" \
-exportProvisioningProfile "ProvisioningProfileName"

### With _gym_

```no-highlight
fastlane gym

### Why _gym_?

_gym_ uses the latest APIs to build and sign your application which results in much faster build times.

| | _gym_ Features |
| --- | --- |
| 🚀 | _gym_ builds 30% faster than other build tools like shenzhen |
| 🏁 | Beautiful inline build output |
| 📖 | Helps you resolve common build errors like code signing issues |
| 🚠 | Sensible defaults: Automatically detect the project, its schemes and more |
| 🔗 | Works perfectly with _fastlane_ and other tools |
| 📦 | Automatically generates an `ipa` and a compressed `dSYM` file |
| 🚅 | Don't remember any complicated build commands, just _gym_ |
| 🔧 | Easy and dynamic configuration using parameters and environment variables |
| 💾 | Store common build settings in a `Gymfile` |
| 📤 | All archives are stored and accessible in the Xcode Organizer |
| 💻 | Supports both iOS and Mac applications |

# Usage

That's all you need to build your application. If you want more control, here are some available parameters:

```no-highlight
fastlane gym --workspace "Example.xcworkspace" --scheme "AppName" --clean

If you need to use a different Xcode installation, use `xcodes` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" fastlane gym

For a list of all available parameters use

```no-highlight
fastlane action gym

If you run into any issues, use the `verbose` mode to get more information

```no-highlight
fastlane gym --verbose

Set the right export method if you're not uploading to App Store or TestFlight:

```no-highlight
fastlane gym --export_method ad-hoc

To pass boolean parameters make sure to use _gym_ like this:

```no-highlight
fastlane gym --include_bitcode true --include_symbols false

To access the raw `xcodebuild` output open `~/Library/Logs/gym`

# Gymfile

Since you might want to manually trigger a new build but don't want to specify all the parameters every time, you can store your defaults in a so called `Gymfile`.

Run `fastlane gym init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")

sdk("iphoneos9.0")

clean(true)

output_directory("./build") # store the ipa in this folder
output_name("MyApp") # the name of the ipa file

## Export options

Since Xcode 7, _gym_ is using new Xcode API which allows us to specify export options using `plist` file. By default _gym_ creates this file for you and you are able to modify some parameters by using `export_method`, `export_team_id`, `include_symbols` or `include_bitcode`. If you want to have more options, like creating manifest file for app thinning, you can provide your own `plist` file:

```ruby-skip-tests
export_options("./ExportOptions.plist")

or you can provide hash of values directly in the `Gymfile`:

```ruby-skip-tests
export_options({
method: "ad-hoc",
manifest: {
appURL: "https://example.com/My App.ipa",
},

})

Optional: If _gym_ can't automatically detect the provisioning profiles to use, you can pass a mapping of bundle identifiers to provisioning profiles:

```ruby hljs
build_app(
scheme: "Release",
export_method: "app-store",
export_options: {
provisioningProfiles: {

}
}
)

**Note**: If you use _fastlane_ with _match_ you don't need to provide those values manually, unless you pass a plist file into `export_options`

For the list of available options run `xcodebuild -help`.

## Setup code signing

- More information on how to get started with codesigning
- Docs on how to set up your Xcode project

## Automating the whole process

_gym_ works great together with _fastlane_, which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby hljs
lane :beta do
scan
gym(scheme: "MyApp")
crashlytics
end

# error block is executed when a error occurs
error do |lane, exception|
slack(
# message with short human friendly message
message: exception.to_s,
success: false,
# Output containing extended log output

)
end

When _gym_ raises an error the `error_info` property will contain the process output
in case you want to display the error in 3rd party tools such as Slack.

You can then easily switch between the beta provider (e.g. `testflight`, `hockey`, `s3` and more).

# How does it work?

_gym_ uses the latest APIs to build and sign your application. The 2 main components are

- `xcodebuild`
- xcpretty

When you run _gym_ without the `--silent` mode it will print out every command it executes.

To build the archive _gym_ uses the following command:

```no-highlight
set -o pipefail && \
xcodebuild -scheme 'Example' \
-project './Example.xcodeproj' \
-configuration 'Release' \
-destination 'generic/platform=iOS' \
-archivePath '/Users/felixkrause/Library/Developer/Xcode/Archives/2015-08-11/ExampleProductName 2015-08-11 18.15.30.xcarchive' \
archive | xcpretty

After building the archive it is being checked by _gym_. If it's valid, it gets packaged up and signed into an `ipa` file.

_gym_ automatically chooses a different packaging method depending on the version of Xcode you're using.

### Xcode 7 and above

```no-highlight
/usr/bin/xcrun path/to/xcbuild-safe.sh -exportArchive \
-exportOptionsPlist '/tmp/gym_config_1442852529.plist' \
-archivePath '/Users/fkrause/Library/Developer/Xcode/Archives/2015-09-21/App 2015-09-21 09.21.56.xcarchive' \
-exportPath '/tmp/1442852529'

_gym_ makes use of the new Xcode 7 API which allows us to specify the export options using a `plist` file. You can find more information about the available options by running `xcodebuild --help`.

Using this method there are no workarounds for WatchKit or Swift required, as it uses the same technique Xcode uses when exporting your binary.

Note: the xcbuild-safe.sh script wraps around xcodebuild to workaround some incompatibilities.

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `ipa` files like this:

| build\_ios\_app | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |
| Returns | The absolute path to the generated ipa file |

## 5 Examples

```ruby hljs
build_app(scheme: "MyApp", workspace: "MyApp.xcworkspace")

```ruby hljs
build_app(
workspace: "MyApp.xcworkspace",
configuration: "Debug",
scheme: "MyApp",
silent: true,
clean: true,
output_directory: "path/to/dir", # Destination directory. Defaults to current directory.
output_name: "my-app.ipa", # specify the name of the .ipa file to generate (including file extension)
sdk: "iOS 11.1" # use SDK as the name or path of the base SDK when building the project.
)

```ruby hljs
gym # alias for "build_app"

```ruby hljs
build_ios_app # alias for "build_app (only iOS options)"

```ruby hljs
build_mac_app # alias for "build_app (only macOS options)"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `scheme` | The project's scheme. Make sure it's marked as `Shared` | |
| `clean` | Should the project be cleaned before building it? | `false` |
| `output_directory` | The directory in which the ipa file should be stored in | `.` |
| `output_name` | The name of the resulting ipa file | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `silent` | Hide all information that's not necessary while building | `false` |
| `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH' | |
| `skip_package_ipa` | Should we skip packaging the ipa? | `false` |
| `include_symbols` | Should the ipa file include symbols? | |
| `include_bitcode` | Should the ipa file include bitcode? | |
| `export_method` | Method used to export the archive. Valid values are: app-store, validation, ad-hoc, package, enterprise, development, developer-id and mac-application | |
| `export_options` | Path to an export options plist or a hash with export options. Use 'xcodebuild -help' to print the full set of available options | |
| `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `skip_build_archive` | Export ipa from previously built xcarchive. Uses archive\_path as source | |
| `skip_archive` | After building, don't archive, effectively not including -archivePath param | |
| `skip_codesigning` | Build without codesigning | |
| `build_path` | The directory in which the archive should be stored in | |
| `archive_path` | The path to the created archive | |
| `derived_data_path` | The directory where built products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `result_bundle_path` | Path to the result bundle directory to create. Ignored if `result_bundle` if false | |
| `buildlog_path` | The directory where to store the build log | \* |
| `sdk` | The SDK that should be used for building the application | |
| `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift\_2\_3, org.swift.30p620160816a) | |
| `destination` | Use a custom destination for building the app | |
| `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file | |
| `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `build_timing_summary` | Create a build timing summary | `false` |
| `disable_xcpretty` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Disable xcpretty formatting of build output | |
| `xcpretty_test_format` | Use the test (RSpec style) format for build output | |
| `xcpretty_formatter` | A custom xcpretty formatter to use | |
| `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path | |
| `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path | |
| `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path | |
| `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds | |
| `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file | |
| `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used | `false` |
| `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `xcodebuild` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `build_ios_app` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file |
| `SharedValues::PKG_OUTPUT_PATH` | The path to the newly generated pkg file |
| `SharedValues::DSYM_OUTPUT_PATH` | The path to the dSYM files |
| `SharedValues::XCODEBUILD_ARCHIVE` | The path to the xcodebuild archive |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action build_ios_app

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_ios_app

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_ios_app parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/build_mac_app

- Docs »
- \_Actions »
- build\_mac\_app
- Edit on GitHub
- ```

* * *

# build\_mac\_app

Alias for the `build_app` action but only for macOS

Features •
Usage •
Tips

# What's gym?

_gym_ builds and packages iOS apps for you. It takes care of all the heavy lifting and makes it super easy to generate a signed `ipa` or `app` file 💪

_gym_ is a replacement for shenzhen.

### Before _gym_

```no-highlight
xcodebuild clean archive -archivePath build/MyApp \
-scheme MyApp
xcodebuild -exportArchive \
-exportFormat ipa \
-archivePath "build/MyApp.xcarchive" \
-exportPath "build/MyApp.ipa" \
-exportProvisioningProfile "ProvisioningProfileName"

### With _gym_

```no-highlight
fastlane gym

### Why _gym_?

_gym_ uses the latest APIs to build and sign your application which results in much faster build times.

| | _gym_ Features |
| --- | --- |
| 🚀 | _gym_ builds 30% faster than other build tools like shenzhen |
| 🏁 | Beautiful inline build output |
| 📖 | Helps you resolve common build errors like code signing issues |
| 🚠 | Sensible defaults: Automatically detect the project, its schemes and more |
| 🔗 | Works perfectly with _fastlane_ and other tools |
| 📦 | Automatically generates an `ipa` and a compressed `dSYM` file |
| 🚅 | Don't remember any complicated build commands, just _gym_ |
| 🔧 | Easy and dynamic configuration using parameters and environment variables |
| 💾 | Store common build settings in a `Gymfile` |
| 📤 | All archives are stored and accessible in the Xcode Organizer |
| 💻 | Supports both iOS and Mac applications |

# Usage

That's all you need to build your application. If you want more control, here are some available parameters:

```no-highlight
fastlane gym --workspace "Example.xcworkspace" --scheme "AppName" --clean

If you need to use a different Xcode installation, use `xcodes` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" fastlane gym

For a list of all available parameters use

```no-highlight
fastlane action gym

If you run into any issues, use the `verbose` mode to get more information

```no-highlight
fastlane gym --verbose

Set the right export method if you're not uploading to App Store or TestFlight:

```no-highlight
fastlane gym --export_method ad-hoc

To pass boolean parameters make sure to use _gym_ like this:

```no-highlight
fastlane gym --include_bitcode true --include_symbols false

To access the raw `xcodebuild` output open `~/Library/Logs/gym`

# Gymfile

Since you might want to manually trigger a new build but don't want to specify all the parameters every time, you can store your defaults in a so called `Gymfile`.

Run `fastlane gym init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")

sdk("iphoneos9.0")

clean(true)

output_directory("./build") # store the ipa in this folder
output_name("MyApp") # the name of the ipa file

## Export options

Since Xcode 7, _gym_ is using new Xcode API which allows us to specify export options using `plist` file. By default _gym_ creates this file for you and you are able to modify some parameters by using `export_method`, `export_team_id`, `include_symbols` or `include_bitcode`. If you want to have more options, like creating manifest file for app thinning, you can provide your own `plist` file:

```ruby-skip-tests
export_options("./ExportOptions.plist")

or you can provide hash of values directly in the `Gymfile`:

```ruby-skip-tests
export_options({
method: "ad-hoc",
manifest: {
appURL: "https://example.com/My App.ipa",
},

})

Optional: If _gym_ can't automatically detect the provisioning profiles to use, you can pass a mapping of bundle identifiers to provisioning profiles:

```ruby hljs
build_app(
scheme: "Release",
export_method: "app-store",
export_options: {
provisioningProfiles: {

}
}
)

**Note**: If you use _fastlane_ with _match_ you don't need to provide those values manually, unless you pass a plist file into `export_options`

For the list of available options run `xcodebuild -help`.

## Setup code signing

- More information on how to get started with codesigning
- Docs on how to set up your Xcode project

## Automating the whole process

_gym_ works great together with _fastlane_, which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby hljs
lane :beta do
scan
gym(scheme: "MyApp")
crashlytics
end

# error block is executed when a error occurs
error do |lane, exception|
slack(
# message with short human friendly message
message: exception.to_s,
success: false,
# Output containing extended log output

)
end

When _gym_ raises an error the `error_info` property will contain the process output
in case you want to display the error in 3rd party tools such as Slack.

You can then easily switch between the beta provider (e.g. `testflight`, `hockey`, `s3` and more).

# How does it work?

_gym_ uses the latest APIs to build and sign your application. The 2 main components are

- `xcodebuild`
- xcpretty

When you run _gym_ without the `--silent` mode it will print out every command it executes.

To build the archive _gym_ uses the following command:

```no-highlight
set -o pipefail && \
xcodebuild -scheme 'Example' \
-project './Example.xcodeproj' \
-configuration 'Release' \
-destination 'generic/platform=iOS' \
-archivePath '/Users/felixkrause/Library/Developer/Xcode/Archives/2015-08-11/ExampleProductName 2015-08-11 18.15.30.xcarchive' \
archive | xcpretty

After building the archive it is being checked by _gym_. If it's valid, it gets packaged up and signed into an `ipa` file.

_gym_ automatically chooses a different packaging method depending on the version of Xcode you're using.

### Xcode 7 and above

```no-highlight
/usr/bin/xcrun path/to/xcbuild-safe.sh -exportArchive \
-exportOptionsPlist '/tmp/gym_config_1442852529.plist' \
-archivePath '/Users/fkrause/Library/Developer/Xcode/Archives/2015-09-21/App 2015-09-21 09.21.56.xcarchive' \
-exportPath '/tmp/1442852529'

_gym_ makes use of the new Xcode 7 API which allows us to specify the export options using a `plist` file. You can find more information about the available options by running `xcodebuild --help`.

Using this method there are no workarounds for WatchKit or Swift required, as it uses the same technique Xcode uses when exporting your binary.

Note: the xcbuild-safe.sh script wraps around xcodebuild to workaround some incompatibilities.

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `ipa` files like this:

| build\_mac\_app | |
| --- | --- |
| Supported platforms | mac |
| Author | @KrauseFx |
| Returns | The absolute path to the generated ipa file |

## 5 Examples

```ruby hljs
build_app(scheme: "MyApp", workspace: "MyApp.xcworkspace")

```ruby hljs
build_app(
workspace: "MyApp.xcworkspace",
configuration: "Debug",
scheme: "MyApp",
silent: true,
clean: true,
output_directory: "path/to/dir", # Destination directory. Defaults to current directory.
output_name: "my-app.ipa", # specify the name of the .ipa file to generate (including file extension)
sdk: "iOS 11.1" # use SDK as the name or path of the base SDK when building the project.
)

```ruby hljs
gym # alias for "build_app"

```ruby hljs
build_ios_app # alias for "build_app (only iOS options)"

```ruby hljs
build_mac_app # alias for "build_app (only macOS options)"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `scheme` | The project's scheme. Make sure it's marked as `Shared` | |
| `clean` | Should the project be cleaned before building it? | `false` |
| `output_directory` | The directory in which the ipa file should be stored in | `.` |
| `output_name` | The name of the resulting ipa file | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `silent` | Hide all information that's not necessary while building | `false` |
| `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH' | |
| `skip_package_pkg` | Should we skip packaging the pkg? | `false` |
| `include_symbols` | Should the ipa file include symbols? | |
| `include_bitcode` | Should the ipa file include bitcode? | |
| `export_method` | Method used to export the archive. Valid values are: app-store, validation, ad-hoc, package, enterprise, development, developer-id and mac-application | |
| `export_options` | Path to an export options plist or a hash with export options. Use 'xcodebuild -help' to print the full set of available options | |
| `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `skip_build_archive` | Export ipa from previously built xcarchive. Uses archive\_path as source | |
| `skip_archive` | After building, don't archive, effectively not including -archivePath param | |
| `skip_codesigning` | Build without codesigning | |
| `installer_cert_name` | Full name of 3rd Party Mac Developer Installer or Developer ID Installer certificate. Example: `3rd Party Mac Developer Installer: Your Company (ABC1234XWYZ)` | |
| `build_path` | The directory in which the archive should be stored in | |
| `archive_path` | The path to the created archive | |
| `derived_data_path` | The directory where built products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `result_bundle_path` | Path to the result bundle directory to create. Ignored if `result_bundle` if false | |
| `buildlog_path` | The directory where to store the build log | \* |
| `sdk` | The SDK that should be used for building the application | |
| `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift\_2\_3, org.swift.30p620160816a) | |
| `destination` | Use a custom destination for building the app | |
| `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file | |
| `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `build_timing_summary` | Create a build timing summary | `false` |
| `disable_xcpretty` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Disable xcpretty formatting of build output | |
| `xcpretty_test_format` | Use the test (RSpec style) format for build output | |
| `xcpretty_formatter` | A custom xcpretty formatter to use | |
| `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path | |
| `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path | |
| `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path | |
| `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds | |
| `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file | |
| `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used | `false` |
| `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `xcodebuild` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `build_mac_app` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file |
| `SharedValues::PKG_OUTPUT_PATH` | The path to the newly generated pkg file |
| `SharedValues::DSYM_OUTPUT_PATH` | The path to the dSYM files |
| `SharedValues::XCODEBUILD_ARCHIVE` | The path to the xcodebuild archive |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action build_mac_app

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_mac_app

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_mac_app parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/snapshot

- Docs »
- \_Actions »
- snapshot
- Edit on GitHub
- ```

* * *

# snapshot

Alias for the `capture_ios_screenshots` action

###### Automate taking localized screenshots of your iOS, tvOS, and watchOS apps on every device

#### Check out the new fastlane documentation on how to generate screenshots

_snapshot_ generates localized iOS, tvOS, and watchOS screenshots for different device types and languages for the App Store and can be uploaded using ( _deliver_).

You have to manually create 20 (languages) x 6 (devices) x 5 (screenshots) = **600 screenshots**.

It's hard to get everything right!

- New screenshots with every (design) update
- No loading indicators
- Same content / screens
- Clean Status Bar
- Uploading screenshots ( _deliver_ is your friend)

More information about creating perfect screenshots.

_snapshot_ runs completely in the background - you can do something else, while your computer takes the screenshots for you.

Features •
UI Tests •
Quick Start •
Usage •
Tips •
How?

# Features

- Create hundreds of screenshots in multiple languages on all simulators
- Take screenshots in multiple device simulators concurrently to cut down execution time (Xcode 9 only)
- Configure it once, store the configuration in git
- Do something else, while the computer takes the screenshots for you
- Integrates with _fastlane_ and _deliver_
- Generates a beautiful web page, which shows all screenshots on all devices. This is perfect to send to QA or the marketing team
- _snapshot_ automatically waits for network requests to be finished before taking a screenshot (we don't want loading images in the App Store screenshots)

After _snapshot_ successfully created new screenshots, it will generate a beautiful HTML file to get a quick overview of all screens:

## Why?

This tool automatically switches the language and device type and runs UI Tests for every combination.

### Why should I automate this process?

- It takes **hours** to take screenshots
- You get a great overview of all your screens, running on all available simulators without the need to manually start it hundreds of times
- Easy verification for translators (without an iDevice) that translations do make sense in real App context
- Easy verification that localizations fit into labels on all screen dimensions
- It is an integration test: You can test for UI elements and other things inside your scripts
- Be so nice, and provide new screenshots with every App Store update. Your customers deserve it
- You realize, there is a spelling mistake in one of the screens? Well, just correct it and re-run the script

# UI Tests

## Getting started

This project uses Apple's newly announced UI Tests. We will not go into detail on how to write scripts.

Here a few links to get started:

- WWDC 2015 Introduction to UI Tests
- A first look into UI Tests
- UI Testing in Xcode 7
- HSTestingBackchannel : ‘Cheat’ by communicating directly with your app
- Automating App Store screenshots using fastlane snapshot and frameit

# Quick Start

- Create a new UI Test target in your Xcode project ( top part of this article)
- Run `fastlane snapshot init` in your project folder
- Add the ./SnapshotHelper.swift to your UI Test target (You can move the file anywhere you want)
- (Xcode 8 only) add the ./SnapshotHelperXcode8.swift to your UI Test target
- (Objective C only) add the bridging header to your test class:
- `#import "MYUITests-Swift.h"`

(The bridging header is named after your test target with `-Swift.h` appended.)
- In your UI Test class, click the `Record` button on the bottom left and record your interaction
- To take a snapshot, call the following between interactions
- Swift: `snapshot("01LoginScreen")`
- Objective C: `[Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];`
- Add the following code to your `setUp()` method:

**Swift:**

```swift hljs
let app = XCUIApplication()
setupSnapshot(app)
app.launch()

**Objective C:**

```objective-c
XCUIApplication *app = [[XCUIApplication alloc] init];
[Snapshot setupSnapshot:app waitForAnimations:NO];
[app launch];

_Make sure you only have one `launch` call in your test class, as Xcode adds one automatically on new test files._

You can try the _snapshot_ example project by cloning this repo.

To quick start your UI tests, you can use the UI Test recorder. You only have to interact with the simulator, and Xcode will generate the UI Test code for you. You can find the red record button on the bottom of the screen (more information in this blog post)

# Usage

```no-highlight
fastlane snapshot

Your screenshots will be stored in the `./screenshots/` folder by default (or `./fastlane/screenshots` if you're using _fastlane_)

New with Xcode 9, _snapshot_ can run multiple simulators concurrently. This is the default behavior in order to take your screenshots as quickly as possible. This can be disabled to run each device, one at a time, by setting the `:concurrent_simulators` option to `false`.

**Note:** While running _snapshot_ with Xcode 9, the simulators will not be visibly spawned. So, while you won't see the simulators running your tests, they will, in fact, be taking your screenshots.

If any error occurs while running the snapshot script on a device, that device will not have any screenshots, and _snapshot_ will continue with the next device or language. To stop the flow after the first error, run

```no-highlight
fastlane snapshot --stop_after_first_error

Also by default, _snapshot_ will open the HTML after all is done. This can be skipped with the following command

```no-highlight
fastlane snapshot --stop_after_first_error --skip_open_summary

There are a lot of options available that define how to build your app, for example

```no-highlight
fastlane snapshot --scheme "UITests" --configuration "Release" --sdk "iphonesimulator"

Reinstall the app before running _snapshot_

```no-highlight
fastlane snapshot --reinstall_app --app_identifier "tools.fastlane.app"

By default _snapshot_ automatically retries running UI Tests if they fail. This is due to randomly failing UI Tests (e.g. #2517). You can adapt this number using

```no-highlight
fastlane snapshot --number_of_retries 3

Add photos and/or videos to the simulator before running _snapshot_

```no-highlight
fastlane snapshot --add_photos MyTestApp/Assets/demo.jpg --add_videos MyTestApp/Assets/demo.mp4

For a list for all available options run

```no-highlight
fastlane action snapshot

After running _snapshot_ you will get a nice summary:

## Snapfile

All of the available options can also be stored in a configuration file called the `Snapfile`. Since most values will not change often for your project, it is recommended to store them there:

First make sure to have a `Snapfile` (you get it for free when running `fastlane snapshot init`)

The `Snapfile` can contain all the options that are also available on `fastlane action snapshot`

```ruby-skip-tests
scheme("UITests")

devices([\
"iPad (7th generation)",\
"iPad Air (3rd generation)",\
"iPad Pro (11-inch)",\
"iPad Pro (12.9-inch) (3rd generation)",\
"iPad Pro (9.7-inch)",\
"iPhone 11",\
"iPhone 11 Pro",\
"iPhone 11 Pro Max",\
"iPhone 8",\
"iPhone 8 Plus"\
])

languages([\
"en-US",\
"de-DE",\
"es-ES",\
["pt", "pt_BR"] # Portuguese with Brazilian locale\
])

launch_arguments(["-username Felix"])

# The directory in which the screenshots should be stored
output_directory('./screenshots')

clear_previous_screenshots(true)

override_status_bar(true)

add_photos(["MyTestApp/Assets/demo.jpg"])

### Completely reset all simulators

You can run this command in the terminal to delete and re-create all iOS and tvOS simulators:

```no-highlight
fastlane snapshot reset_simulators

**Warning**: This will delete **all** your simulators and replace by new ones! This is useful, if you run into weird problems when running _snapshot_.

You can use the environment variable `SNAPSHOT_FORCE_DELETE` to stop asking for confirmation before deleting.

```no-highlight
SNAPSHOT_FORCE_DELETE=1 fastlane snapshot reset_simulators

## Update snapshot helpers

Some updates require the helper files to be updated. _snapshot_ will automatically warn you and tell you how to update.

Basically you can run

```no-highlight
fastlane snapshot update

to update your `SnapshotHelper.swift` files. In case you modified your `SnapshotHelper.swift` and want to manually update the file, check out SnapshotHelper.swift.

## Launch Arguments

You can provide additional arguments to your app on launch. These strings will be available in your app (e.g. not in the testing target) through `ProcessInfo.processInfo.arguments`. Alternatively, use user-default syntax ( `-key value`) and they will be available as key-value pairs in `UserDefaults.standard`.

```ruby-skip-tests
launch_arguments([\
"-firstName Felix -lastName Krause"\
])

```swift hljs
name.text = UserDefaults.standard.string(forKey: "firstName")
// name.text = "Felix"

_snapshot_ includes `-FASTLANE_SNAPSHOT YES`, which will set a temporary user default for the key `FASTLANE_SNAPSHOT`, you may use this to detect when the app is run by _snapshot_.

```swift hljs
if UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT") {
// runtime check that we are in snapshot mode
}

Specify multiple argument strings and _snapshot_ will generate screenshots for each combination of arguments, devices, and languages. This is useful for comparing the same screenshots with different feature flags, dynamic text sizes, and different data sets.

```ruby-skip-tests
# Snapfile for A/B Test Comparison
launch_arguments([\
"-secretFeatureEnabled YES",\
"-secretFeatureEnabled NO"\
])

## Xcode Environment Variables

# How does it work?

The easiest solution would be to just render the UIWindow into a file. That's not possible because UI Tests don't run on a main thread. So _snapshot_ uses a different approach:

When you run unit tests in Xcode, the reporter generates a plist file, documenting all events that occurred during the tests ( More Information). Additionally, Xcode generates screenshots before, during and after each of these events. There is no way to manually trigger a screenshot event. The screenshots and the plist files are stored in the DerivedData directory, which _snapshot_ stores in a temporary folder.

When the user calls `snapshot(...)` in the UI Tests (Swift or Objective C) the script actually does a rotation to `.Unknown` which doesn't have any effect on the actual app, but is enough to trigger a screenshot. It has no effect to the application and is not something you would do in your tests. The goal was to find _some_ event that a user would never trigger, so that we know it's from _snapshot_. On tvOS, there is no orientation so we ask for a count of app views with type "Browser" (which should never exist on tvOS).

_snapshot_ then iterates through all test events and check where we either did this weird rotation (on iOS) or searched for browsers (on tvOS). Once _snapshot_ has all events triggered by _snapshot_ it collects a ordered list of all the file names of the actual screenshots of the application.

_snapshot_ finds all these entries using a regex. The number of _snapshot_ outputs in the terminal and the number of _snapshot_ events in the plist file should be the same. Knowing that, _snapshot_ automatically matches these 2 lists to identify the name of each of these screenshots. They are then copied over to the output directory and separated by language and device.

2 thing have to be passed on from _snapshot_ to the `xcodebuild` command line tool:

- The device type is passed via the `destination` parameter of the `xcodebuild` parameter
- The language is passed via a temporary file which is written by _snapshot_ before running the tests and read by the UI Tests when launching the application

If you find a better way to do any of this, please submit an issue on GitHub or even a pull request :+1:

Radar 23062925 has been resolved with Xcode 8.3, so it's now possible to actually take screenshots from the simulator. We'll keep using the old approach for now, since many of you still want to use older versions of Xcode.

# Tips

#### Check out the new fastlane documentation on how to generate screenshots

## Frame the screenshots

If you want to add frames around the screenshots and even put a title on top, check out _frameit_.

## Available language codes

```ruby hljs
ALL_LANGUAGES = ["da", "de-DE", "el", "en-AU", "en-CA", "en-GB", "en-US", "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "id", "it", "ja", "ko", "ms", "nl-NL", "no", "pt-BR", "pt-PT", "ru", "sv", "th", "tr", "vi", "zh-Hans", "zh-Hant"]

To get more information about language and locale codes please read Internationalization and Localization Guide.

## Use a clean status bar

You can set `override_status_bar` to `true` to set the status bar to Tuesday January 9th at 9:41AM with full battery and reception. If you need more granular customization, to set a Carrier name for example, also set `override_status_bar_arguments` to the specific arguments to be passed to the `xcrun simctl status_bar override` command. Run `xcrun simctl status_bar --help` to see the options available.

## Editing the `Snapfile`

Change syntax highlighting to _Ruby_.

### Simulator doesn't launch the application

When the app dies directly after the application is launched there might be 2 problems

- The simulator is somehow in a broken state and you need to re-create it. You can use `snapshot reset_simulators` to reset all simulators (this will remove all installed apps)
- A restart helps very often

## Determine language

To detect the currently used localization in your tests, access the `deviceLanguage` variable from `SnapshotHelper.swift`.

## Speed up snapshots

A lot of time in UI tests is spent waiting for animations.

You can disable `UIView` animations in your app to make the tests faster:

```swift hljs
if ProcessInfo().arguments.contains("SKIP_ANIMATIONS") {
UIView.setAnimationsEnabled(false)
}

This requires you to pass the launch argument like so:

```ruby hljs
snapshot(launch_arguments: ["SKIP_ANIMATIONS"])

By default, _snapshot_ will wait for a short time for the animations to finish.
If you're skipping the animations, this wait time is unnecessary and can be skipped:

```swift hljs
setupSnapshot(app, waitForAnimations: false)

| snapshot | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
capture_ios_screenshots

```ruby hljs
snapshot # alias for "capture_ios_screenshots"

```ruby hljs
capture_ios_screenshots(
skip_open_summary: true,
clean: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `xcargs` | Pass additional arguments to xcodebuild for the test phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `devices` | A list of devices you want to take the screenshots from | |
| `languages` | A list of languages which should be used | `["en-US"]` |
| `launch_arguments` | A list of launch arguments which should be used | `[""]` |
| `output_directory` | The directory where to store the screenshots | \* |
| `output_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output\_directory | `false` |
| `ios_version` | By default, the latest version should be used automatically. If you want to change it, do it here | |
| `skip_open_summary` | Don't open the HTML summary after running _snapshot_ | `false` |
| `skip_helper_version_check` | Do not check for most recent SnapshotHelper code | `false` |
| `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running snapshot | `false` |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `erase_simulator` | Enabling this option will automatically erase the simulator before running the application | `false` |
| `headless` | Enabling this option will prevent displaying the simulator window | `true` |
| `override_status_bar` | Enabling this option will automatically override the status bar to show 9:41 AM, full battery, and full reception (Adjust 'SNAPSHOT\_SIMULATOR\_WAIT\_FOR\_BOOT\_TIMEOUT' environment variable if override status bar is not working. Might be because simulator is not fully booted. Defaults to 10 seconds) | `false` |
| `override_status_bar_arguments` | Fully customize the status bar by setting each option here. Requires `override_status_bar` to be set to `true`. See `xcrun simctl status_bar --help` | |
| `localize_simulator` | Enabling this option will configure the Simulator's system language | `false` |
| `dark_mode` | Enabling this option will configure the Simulator to be in dark mode (false for light, true for dark) | |
| `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall\_app) | \* |
| `add_photos` | A list of photos that should be added to the simulator before running the application | |
| `add_videos` | A list of videos that should be added to the simulator before running the application | |
| `html_template` | A path to screenshots.html template | |
| `buildlog_path` | The directory where to store the build log | \* |
| `clean` | Should the project be cleaned before building it? | `false` |
| `test_without_building` | Test without building, requires a derived data path | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `sdk` | The SDK that should be used for building the application | |
| `scheme` | The scheme you want to use, this must be the scheme for the UI Tests | |
| `number_of_retries` | The number of times a test can fail before snapshot should stop retrying | `1` |
| `stop_after_first_error` | Should snapshot stop immediately after the tests completely failed on one device? | `false` |
| `derived_data_path` | The directory where build products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `test_target_name` | The name of the target you want to test (if you desire to override the Target Application from Xcode) | |
| `namespace_log_files` | Separate the log files per device and per language | |
| `concurrent_simulators` | Take snapshots on multiple simulators concurrently. Note: This option is only applicable when running against Xcode 9 | `true` |
| `disable_slide_to_type` | Disable the simulator from showing the 'Slide to type' prompt | `false` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `testplan` | The testplan associated with the scheme that should be used for testing | |
| `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run | |
| `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `xcpretty_args` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Additional xcpretty arguments | |
| `disable_xcpretty` | Disable xcpretty formatting of build | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `snapshot` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SNAPSHOT_SCREENSHOTS_PATH` | The path to the screenshots |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run snapshot

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run snapshot parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/screengrab

- Docs »
- \_Actions »
- screengrab
- Edit on GitHub
- ```

* * *

# screengrab

Alias for the `capture_android_screenshots` action

###### Automated localized screenshots of your Android app on every device

_screengrab_ generates localized screenshots of your Android app for different device types and languages for Google Play and can be uploaded using _supply_.

### Why should I automate this process?

- Create hundreds of screenshots in multiple languages on emulators or real devices, saving you hours
- Easily verify that localizations fit into labels on all screen dimensions to find UI mistakes before you ship
- You only need to configure it once for anyone on your team to run it
- Keep your screenshots perfectly up-to-date with every app update. Your customers deserve it!
- Fully integrates with _fastlane_ and _supply_

# Installation

Install the gem

```no-highlight
gem install fastlane

##### Gradle dependency

```java hljs
androidTestImplementation 'tools.fastlane:screengrab:x.x.x'

The latest version is ![Download](https://search.maven.org/artifact/tools.fastlane/screengrab)

As of _screengrab_ version 2.0.0, all Android test dependencies are AndroidX dependencies. This means a device with API 18+, Android 4.3 or greater is required. If you wish to capture screenshots with an older Android OS, then you must use a 1.x.x version.

##### Configuring your Manifest Permissions

Ensure that the following permissions exist in your **src/debug/AndroidManifest.xml**

```xml hljs
<manifest xmlns:android="http://schemas.android.com/apk/res/android"

android:name="android.permission.CHANGE_CONFIGURATION"

android:name="android.permission.DUMP"

##### Configuring your UI Tests for Screenshots

1. Add `LocaleTestRule` to your tests class to handle automatic switching of locales.

If you're using Java use:

`java
@ClassRule
public static final LocaleTestRule localeTestRule = new LocaleTestRule();`

If you're using Kotlin use:

`kotlin
@Rule @JvmField
val localeTestRule = LocaleTestRule()`

The `@JvmField` annotation is important. It won't work like this:

`kotlin
companion object {
@get:ClassRule
val localeTestRule = LocaleTestRule()
}`

2. To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

# Generating Screenshots with _screengrab_

- Then, before running `fastlane screengrab` you'll need a debug and test apk
- You can create your APKs manually with `./gradlew assembleDebug assembleAndroidTest`
- You can also create a lane and use `build_android_app`:

`ruby
desc "Build debug and test APK for screenshots"
lane :build_and_screengrab do
build_android_app(
task: 'assemble',
build_type: 'Debug'
)
build_android_app(
task: 'assemble',
build_type: 'AndroidTest'
)
screengrab()
end`
\- Once complete run `fastlane screengrab` in your app project directory to generate screenshots
\- You will be prompted to provide any required parameters which are not in your **Screengrabfile** or provided as command line arguments
\- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran _screengrab_

## Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to UI Automator which fixes a number of problems compared to the original strategy:

- Shadows/elevation are correctly captured for Material UI
- Multi-window situations are correctly captured (dialogs, etc.)
- Works on Android N

```java hljs
Screengrab.setDefaultScreenshotStrategy(new DecorViewScreenshotStrategy());

## Improved screenshot capture with Falcon

As of _screengrab_ 1.2.0, you can specify a new strategy to delegate to Falcon. Falcon may work better than UI Automator in some situations and also provides similar benefits as UI Automator:

- Multi-window situations are correctly captured (dialogs, etc.)
- Works on Android N

```java hljs
Screengrab.setDefaultScreenshotStrategy(new FalconScreenshotStrategy(activityRule.getActivity()));

## Advanced Screengrabfile Configuration

Running `fastlane screengrab init` generated a Screengrabfile which can store all of your configuration options. Since most values will not change often for your project, it is recommended to store them there.

The `Screengrabfile` is written in Ruby, so you may find it helpful to use an editor that highlights Ruby syntax to modify this file.

```ruby-skip-tests
# remove the leading '#' to uncomment lines

# app_package_name('your.app.package')
# use_tests_in_packages(['your.screenshot.tests.package'])

# app_apk_path('path/to/your/app.apk')
# tests_apk_path('path/to/your/tests.apk')

locales(['en-US', 'fr-FR', 'it-IT'])

# clear all previously generated screenshots in your local output directory before creating new ones
clear_previous_screenshots(true)

For more information about all available options run

```no-highlight
fastlane action screengrab

# Tips

## UI Tests

Check out Testing UI for a Single App for an introduction to using Espresso for UI testing.

##### Example UI Test Class (Using JUnit4)

Java:

```java hljs
@RunWith(JUnit4.class)
public class JUnit4StyleTests {
@ClassRule
public static final LocaleTestRule localeTestRule = new LocaleTestRule();

@Rule

@Test
public void testTakeScreenshot() {
Screengrab.screenshot("before_button_click");

onView(withId(R.id.fab)).perform(click());

Screengrab.screenshot("after_button_click");
}
}

Kotlin:

```kotlin hljs
@RunWith(JUnit4.class)
class JUnit4StyleTests {
@get:Rule
var activityRule = ActivityScenarioRule(MainActivity::class.java)

@Rule @JvmField
val localeTestRule = LocaleTestRule()

@Test
fun testTakeScreenshot() {
Screengrab.screenshot("before_button_click")

onView(withId(R.id.fab)).perform(click())

Screengrab.screenshot("after_button_click")
}
}

There is an example project showing how to use JUnit 3 or 4 and Espresso with the screengrab Java library to capture screenshots during a UI test run.

Using JUnit 4 is preferable because of its ability to perform actions before and after the entire test class is run. This means you will change the device's locale far fewer times when compared with JUnit 3 running those commands before and after each test method.

When using JUnit 3 you'll need to add a bit more code:

- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getTestLocale());` in `setUp()`
- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getEndingLocale());` in `tearDown()`
- Use `Screengrab.screenshot("name_of_screenshot_here");` to capture screenshots at the appropriate points in your tests

## Clean Status Bar

_screengrab_ can clean your status bar to make your screenshots even more beautiful.
It is simply a wrapper that allows configuring SystemUI DemoMode in your code.

You can enable and disable the clean status bar at any moment during your tests.
In most cases you probably want to do this in the @BeforeClass and @AfterClass methods.

```java hljs
@BeforeClass
public static void beforeAll() {
CleanStatusBar.enableWithDefaults();
}

@AfterClass
public static void afterAll() {
CleanStatusBar.disable();
}

Have a look at the methods of the `CleanStatusBar` class to customize the status bar even more.
You could for example show the Bluetooth icon and the LTE text.

```java hljs
new CleanStatusBar()
.setBluetoothState(BluetoothState.DISCONNECTED)
.setMobileNetworkDataType(MobileDataType.LTE)
.enable();

# Advanced _screengrab_

Launch Arguments

You can provide additional arguments to your test cases on launch. These strings will be available in your tests through `InstrumentationRegistry.getArguments()`.

```ruby hljs
screengrab(
launch_arguments: [\
"username hjanuschka",\
"build_number 201"\
]
)

```java hljs
Bundle extras = InstrumentationRegistry.getArguments();
String peerID = null;
if (extras != null) {
if (extras.containsKey("username")) {
username = extras.getString("username");
System.out.println("Username: " + username);
} else {
System.out.println("No username in extras");
}
} else {
System.out.println("No extras");
}

Detecting screengrab at runtime

For some apps, it is helpful to know when _screengrab_ is running so that you can display specific data for your screenshots. For iOS fastlane users, this is much like "FASTLANE\_SNAPSHOT". In order to do this, you'll need to have at least two product flavors of your app.

Add two product flavors to the app-level build.gradle file:

```hljs python-repl
android {
...
flavorDimensions "mode"
productFlavors {
screengrab {
dimension "mode"
}
regular {
dimension "mode"
}
}
...
}

Check for the existence of that flavor (i.e screengrab) in your app code as follows in order to use mock data or customize data for screenshots:

```hljs less
if (BuildConfig.FLAVOR == "screengrab") {
System.out.println("screengrab is running!");
}

When running _screengrab_, do the following to build the flavor you want as well as the test apk. Note that you use "assembleFlavor\_name" where Flavor\_name is the flavor name, capitalized (i.e. Screengrab).

```hljs
./gradlew assembleScreengrab assembleAndroidTest

Run _screengrab_:

```hljs nginx
fastlane screengrab

_screengrab_ will ask you to select the debug and test apps (which you can then add to your Screengrabfile to skip this step later).

The debug apk should be somewhere like this:

`app/build/outputs/apk/screengrab/debug/app-screengrab-debug.apk`

The test apk should be somewhere like this:

`app/build/outputs/apk/androidTest/screengrab/debug/app-screengrab-debug-androidTest.apk`

Sit back and enjoy your new screenshots!

Note: while this could also be done by creating a new build variant (i.e. debug, release and creating a new one called screengrab), Android only allows one build type to be tested which defaults to debug. That's why we use product flavors.

| screengrab | |
| --- | --- |
| Supported platforms | android |
| Author | @asfalcone, @i2amsam, @mfurtak |

## 3 Examples

```ruby hljs
capture_android_screenshots

```ruby hljs
screengrab # alias for "capture_android_screenshots"

```ruby hljs
capture_android_screenshots(
locales: ["en-US", "fr-FR", "ja-JP"],
clear_previous_screenshots: true,
app_apk_path: "build/outputs/apk/example-debug.apk",
tests_apk_path: "build/outputs/apk/example-debug-androidTest-unaligned.apk"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `android_home` | Path to the root of your Android SDK installation, e.g. ~/tools/android-sdk-macosx | \* |
| `build_tools_version` | **DEPRECATED!** The Android build tools version to use, e.g. '23.0.2' | |
| `locales` | A list of locales which should be used | `["en-US"]` |
| `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running screengrab | `false` |
| `output_directory` | The directory where to store the screenshots | `fastlane/metadata/android` |
| `skip_open_summary` | Don't open the summary after running _screengrab_ | \* |
| `app_package_name` | The package name of the app under test (e.g. com.yourcompany.yourapp) | \* |
| `tests_package_name` | The package name of the tests bundle (e.g. com.yourcompany.yourapp.test) | |
| `use_tests_in_packages` | Only run tests in these Java packages | |
| `use_tests_in_classes` | Only run tests in these Java classes | |
| `launch_arguments` | Additional launch arguments | |
| `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner | `androidx.test.runner.AndroidJUnitRunner` |
| `ending_locale` | **DEPRECATED!** Return the device to this locale after running tests | `en-US` |
| `use_adb_root` | **DEPRECATED!** Restarts the adb daemon using `adb root` to allow access to screenshots directories on device. Use if getting 'Permission denied' errors | `false` |
| `app_apk_path` | The path to the APK for the app under test | \* |
| `tests_apk_path` | The path to the APK for the tests bundle | \* |
| `specific_device` | Use the device or emulator with the given serial number or qualifier | |
| `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear) | `phone` |
| `exit_on_test_failure` | Whether or not to exit Screengrab on test failure. Exiting on failure will not copy screenshots to local machine nor open screenshots summary | `true` |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `use_timestamp_suffix` | Add timestamp suffix to screenshot filename | `true` |
| `adb_host` | Configure the host used by adb to connect, allows running on remote devices farm | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `screengrab` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SCREENGRAB_OUTPUT_DIRECTORY` | The path to the output directory |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run screengrab

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run screengrab parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/frameit

- Docs »
- \_Actions »
- frameit
- Edit on GitHub
- ```

* * *

# frameit

Alias for the `frame_screenshots` action

###### Easily put your screenshots into the right device frames

_frameit_ allows you to put a gorgeous device frame around your iOS, macOS and Android screenshots just by running one simple command. Use _frameit_ to prepare perfect screenshots for the App Store, your website, QA or emails.

Features •
Usage •
Tips

# Features

## Frame screenshot

Put a gorgeous device frame around your iOS, macOS and Android screenshots just by running one simple command. Support for:

- iPhone, iPad and Mac
- Set of Android devices
- Portrait and Landscape modes
- Several device frame colors

The complete and updated list of supported devices and colors can be found here

Here is a nice gif, that shows _frameit_ in action:

## Advanced Features

- Put framed screenshot on colored background, define padding
- add text above or under framed screenshot
- keyword + text
- choose text font and color
- multi line text
- "intelligent" positioning of text that always looks good(ish)

## Results

##### The _frameit_ 2.0 update was kindly sponsored by MindNode, seen in the screenshots above.

The first time that _frameit_ is executed the frames will be downloaded automatically. Originally the frames are coming from Facebook frameset and they are kept on this repo.

More information about this process and how to update the frames can be found here

# Usage

## Basic Usage

Why should you have to use Photoshop, just to add a frame around your screenshots?

Just navigate to your folder of screenshots and use the following command (iOS and Mac OS are default platforms for backward compatibility):

```no-highlight
fastlane frameit

To frame Android screenshots:

```no-highlight
fastlane frameit android

To use the silver version of the frames:

```no-highlight
fastlane frameit silver

To download the latest frames

```no-highlight
fastlane frameit download_frames

Note: When using _frameit_ without titles on top, the screenshots will have the full resolution, which means they can't be uploaded to the App Store directly. They are supposed to be used for websites, print media and emails. Check out the section below to use the screenshots for the App Store.

## Advanced Usage (optional)

### Text and Background

With _frameit_ it's possible to add a custom background and text below or above the framed screenshots in fonts and colors you define.

A working example can be found in the fastlane examples project.

### `Framefile.json`

The Framefile allows to define general and screenshot specific information.
It has the following general JSON structure:

```json hljs
{
"device_frame_version": "latest",
"default": {
...
},
"data": [\
...\
]
}

### General parameters

The general parameters are defined in the `default` key and can be:

| Key | Description | Default value |
| --- | --- | --- |
| `background` | The background that should be used for the framed screenshot. Specify the (relative) path to the image file (e.g. `*.jpg`). This parameter is mandatory. | NA |
| `keyword` | An object that contains up to 3 keys to describe the optional keyword. See table below. | NA |
| `title` | An object that contains up to 3 keys to describe the mandatory title. See table below. | NA |
| `stack_title` | Specifies whether _frameit_ should display the keyword above the title when both keyword and title are defined. If it is false, the title and keyword will be displayed side by side when both keyword and title are defined. | `false` |
| `title_below_image` | Specifies whether _frameit_ should place the title and optional keyword below the device frame. If it is false, it will be placed above the device frame. | `false` |
| `show_complete_frame` | Specifies whether _frameit_ should shrink the device frame so that it is completely shown in the framed screenshot. If it is false, clipping of the device frame might occur at the bottom (when `title_below_image` is `false`) or top (when `title_below_image` is `true`) of the framed screenshot. | `false` |

| `interline_spacing` | Specifies whether _frameit_ should add or subtract this many pixels between the individual lines of text. This only applies to a multi-line `title` and/or `keyword` to expand or squash together the individual lines of text. | `0` |
| `font_scale_factor` | Specifies whether _frameit_ should increase or decrease the font size of the text. Is ignored for `keyword` or `title`, if `font_size` is specified. | `0.1` |
| `frame` | Overrides the color of the frame to be used. (Valid values are `BLACK`, `WHITE`, `GOLD` and `ROSE_GOLD`) | NA |
| `title_min_height` | Specifies a height always reserved for the title. Value can be a percentage of the height or an absolute value. The device will be placed below (or above) this area. Convenient to ensure the device top (or bottom) will be consistently placed at the same height on the different screenshots. | NA |
| `use_platform` | Overrides the platform used for the screenshot. Valid values are `IOS`, `ANDROID` and `ANY`. | `IOS` |
| `force_device_type` | Forces a specific device. Valid values are: Huawei P8, Motorola Moto E, Motorola Moto G, Nexus 4, Nexus 5X, Nexus 6P, Nexus 9, Samsung Galaxy Grand Prime, Samsung Galaxy Note 5, Samsung Galaxy S Duos, Samsung Galaxy S3, Samsung Galaxy S5, Samsung Galaxy S7, Samsung Galaxy S8, Samsung Galaxy S9, iPhone 5s, iPhone 5c, iPhone SE, iPhone 6s, iPhone 6s Plus, iPhone 7, iPhone 7 Plus, iPhone 8, iPhone 8 Plus, iPhone X, iPhone XS, iPhone XR, iPhone XS Max, iPad Air 2, iPad Mini 4, iPad Pro, MacBook, Google Pixel 3, Google Pixel 3 XL, HTC One A9, HTC One M8 | NA |

### Specific parameters

The screenshot specific parameters are related to the keyword and title texts.
These are defined in the `data` key. This is an array with the following keys for each screenshot:

| Key | Description |
| --- | --- |

| `keyword` | Similar use as in `default`, except that parameter `text` can be used here because it is screenshot specific. |
| `title` | Similar use as in `default`, except that parameter `text` can be used here because it is screenshot specific. |
| `frame` | Overrides the color of the frame to be used. (Valid values are `BLACK`, `WHITE`, `GOLD` and `ROSE_GOLD`) |
| `use_platform` | Overrides the platform used for the screenshot. Valid values are `IOS`, `ANDROID` and `ANY`. |
| `force_device_type` | Forces a specific device. Valid values are the same as for the general parameter. |

### Framefile `keyword` and `title` parameters

The `keyword` and `title` parameters are both used in `default` and `data`. They both consist of the following optional keys:

| Key | Description | Default value |
| --- | --- | --- |
| `color` | The font color for the text. Specify a HEX/HTML color code. | `#000000` (black) |
| `font` | The font family for the text. Specify the (relative) path to the font file (e.g. an OpenType Font). | The default `imagemagick` font, which is system dependent. |
| `font_size` | The font size for the text specified in points. If not specified or `0`, font will be scaled automatically to fit the available space. _frameit_ still shrinks the text, if it would not fit. | NA |
| `font_weight` | The font weight for the text. Specify an integer value (e.g. 900). | NA |

### Example

```json hljs
{
"device_frame_version": "latest",
"default": {
"keyword": {
"font": "./fonts/MyFont-Rg.otf"
},
"title": {
"font": "./fonts/MyFont-Th.otf",
"font_size": 128,
"color": "#545454"
},
"background": "./background.jpg",
"padding": 50,
"show_complete_frame": false,
"stack_title" : false,
"title_below_image": true,
"frame": "WHITE",
"use_platform": "IOS"
},

"data": [\
{\
"filter": "Brainstorming",\
"keyword": {\
"color": "#d21559"\
}\
},\
{\
"filter": "Organizing",\
"keyword": {\
"color": "#feb909"\
},\
"frame": "ROSE_GOLD"\
},\
{\
"filter": "Sharing",\
"keyword": {\
"color": "#aa4dbc"\
}\
},\
{\
"filter": "Styling",\
"keyword": {\
"color": "#31bb48"\
}\
},\
{\
"filter": "Android",\
"use_platform": "ANDROID"\
}\
]
}

You can find a more complex configuration to also support Chinese, Japanese and Korean languages.

The `Framefile.json` should be in the `screenshots` folder, as seen in the example.

### `.strings` files

To define the title and optionally the keyword, put two `.strings` files into the language folder (e.g. en-US in the example project)

The `keyword.strings` and `title.strings` are standard `.strings` file you already use for your iOS apps, making it easy to use your existing translation service to get localized titles.

**Notes**

- These `.strings` files **MUST** be utf-8 (UTF-8) or utf-16 encoded (UTF-16 BE with BOM). They also must begin with an empty line. If you are having trouble see issue #1740
- You **MUST** provide a background if you want titles. _frameit_ will not add the titles if a background is not specified.

### Screenshot orientation

By default _frameit_ adds a frame to your screenshot based on an orientation you took it. For a portrait (vertical orientation) it is going to add portrait frame and for a landscape (horizontal orientation) - landscape left (= Home button on the left side).

One way to override the default behavior is editing the file name by adding `force_landscaperight` to the end.

### `force_orientation_block`

If the default behavior doesn't fit your needs and you don't want or can't rename your screenshots, you can customize _frameit_'s orientation behavior by setting a `force_orientation_block` parameter. The valid values are: `:landscape_left` (home button on the left side), `:landscape_right` (home button on the right side), `:portrait` (home button on the bottom), `nil` (home button on the right side).

### Examples

```ruby hljs
# It matches the filename to the framed device orientation
frameit(
path: "./fastlane/screenshots",
force_orientation_block: proc do |filename|
case filename
when "iPad Pro (12.9-inch)-01LoginScreen"
:landscape_right
when "iPhone 6 Plus-01LoginScreen"
:portrait
# and so on
end
end
)

# It frames the screenshots in landscape right whenever the filename contains `landscape` word
```ruby hljs
frameit(
silver: true,
path: "./fastlane/screenshots",
force_orientation_block: proc do |filename|
f = filename.downcase
if f.include?("landscape")
:landscape_right
end
end
)

# Mac

With _frameit_ it's possible to also frame macOS Application screenshots. You have to provide the following:

- A (relative) path to a `background` image file, which should contain both the background and the Mac.
- The `offset` information so _frameit_ knows where to position your screenshot on the `background`:

- `titleHeight` : The height in pixels that should be used for the title.

## Example

```json hljs
{
"default": {
"title": {
"color": "#545454"
},
"background": "Mac.jpg",
"offset": {
"offset": "+676+479",
"titleHeight": 320
}
},
"data": [\
{\
"filter": "Brainstorming",\
"keyword": {\
"color": "#d21559"\
}\
}\
]
}

Check out the MindNode example project.

# Tips

## Generate localized screenshots

Check out _snapshot_ to automatically generate screenshots using `UI Automation`.

## Resume framing

Framing screenshots is a slow operation. In case you need to resume framing, or just frame a couple updated screenshots again, you can rely on the `--resume` flag. Only screenshots which have not been framed yet – or for which there isn't an up-to-date framed image – will be framed. This feature uses the file modification dates and will reframe screenshots if the screenshot is newer than the framed file.

## Upload screenshots

Use _deliver_ to upload iOS screenshots to App Store Connect, or _supply_ to upload Android screenshots to Play Store completely automatically 🚀

## Use a clean status bar

You can set `override_status_bar` to `true` in snapshot to set the status bar to Tuesday January 9th at 9:41AM with full battery and reception. If you need more granular customization, to set a Carrier name for example, also set `override_status_bar_arguments` to the specific arguments to be passed to the `xcrun simctl status_bar override` command. Run `xcrun simctl status_bar --help` to see the options available.

### Examples

# Sets the time to 9:41AM with full battery and reception, with the default carrier name: Carrier
```ruby hljs
capture_ios_screenshots(
override_status_bar: true
)

# Set the time to 9:41AM, battery at 75% and charging, on the TELUS LTE network
```ruby hljs
capture_ios_screenshots(
override_status_bar: true,
override_status_bar_arguments: "--time 9:41 --dataNetwork lte --cellularMode active --cellularBars 4 --batteryState charging --batteryLevel 75 --operatorName TELUS"
)

## Gray artifacts around text

If you run into any quality issues, like having a border around the font, it usually helps to just re-install `imagemagick`. You can do so by running

```sh hljs bash
brew uninstall imagemagick
brew install imagemagick

## Uninstall

- `gem uninstall fastlane`
- `rm -rf ~/.frameit`

| frameit | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 6 Examples

```ruby hljs
frame_screenshots

```ruby hljs
frameit # alias for "frame_screenshots"

```ruby hljs
frame_screenshots(use_platform: "ANDROID")

```ruby hljs
frame_screenshots(silver: true)

```ruby hljs
frame_screenshots(path: "/screenshots")

```ruby hljs
frame_screenshots(rose_gold: true)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `white` | Use white device frames | |
| `silver` | Use white device frames. Alias for :white | |
| `rose_gold` | Use rose gold device frames. Alias for :rose\_gold | |
| `gold` | Use gold device frames. Alias for :gold | |
| `force_device_type` | Forces a given device type, useful for Mac screenshots, as their sizes vary | |
| `use_legacy_iphone5s` | Use iPhone 5s instead of iPhone SE frames | `false` |
| `use_legacy_iphone6s` | Use iPhone 6s frames instead of iPhone 7 frames | `false` |
| `use_legacy_iphone7` | Use iPhone 7 frames instead of iPhone 8 frames | `false` |
| `use_legacy_iphonex` | Use iPhone X instead of iPhone XS frames | `false` |
| `use_legacy_iphonexr` | Use iPhone XR instead of iPhone 11 frames | `false` |
| `use_legacy_iphonexs` | Use iPhone XS instead of iPhone 11 Pro frames | `false` |
| `use_legacy_iphonexsmax` | Use iPhone XS Max instead of iPhone 11 Pro Max frames | `false` |
| `force_orientation_block` | \[Advanced\] A block to customize your screenshots' device orientation | \* |
| `debug_mode` | Output debug information in framed screenshots | `false` |
| `resume` | Resume frameit instead of reprocessing all screenshots | `false` |
| `use_platform` | Choose a platform, the valid options are IOS, ANDROID and ANY (default is either general platform defined in the fastfile or IOS to ensure backward compatibility) | \* |
| `path` | The path to the directory containing the screenshots | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action frameit

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run frameit

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run frameit parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/capture_android_screenshots

- Docs »
- \_Actions »
- capture\_android\_screenshots
- Edit on GitHub
- ```

* * *

# capture\_android\_screenshots

Automated localized screenshots of your Android app (via _screengrab_)

###### Automated localized screenshots of your Android app on every device

_screengrab_ generates localized screenshots of your Android app for different device types and languages for Google Play and can be uploaded using _supply_.

### Why should I automate this process?

- Create hundreds of screenshots in multiple languages on emulators or real devices, saving you hours
- Easily verify that localizations fit into labels on all screen dimensions to find UI mistakes before you ship
- You only need to configure it once for anyone on your team to run it
- Keep your screenshots perfectly up-to-date with every app update. Your customers deserve it!
- Fully integrates with _fastlane_ and _supply_

# Installation

Install the gem

```no-highlight
gem install fastlane

##### Gradle dependency

```java hljs
androidTestImplementation 'tools.fastlane:screengrab:x.x.x'

The latest version is ![Download](https://search.maven.org/artifact/tools.fastlane/screengrab)

As of _screengrab_ version 2.0.0, all Android test dependencies are AndroidX dependencies. This means a device with API 18+, Android 4.3 or greater is required. If you wish to capture screenshots with an older Android OS, then you must use a 1.x.x version.

##### Configuring your Manifest Permissions

Ensure that the following permissions exist in your **src/debug/AndroidManifest.xml**

```xml hljs
<manifest xmlns:android="http://schemas.android.com/apk/res/android"

android:name="android.permission.CHANGE_CONFIGURATION"

android:name="android.permission.DUMP"

##### Configuring your UI Tests for Screenshots

1. Add `LocaleTestRule` to your tests class to handle automatic switching of locales.

If you're using Java use:

`java
@ClassRule
public static final LocaleTestRule localeTestRule = new LocaleTestRule();`

If you're using Kotlin use:

`kotlin
@Rule @JvmField
val localeTestRule = LocaleTestRule()`

The `@JvmField` annotation is important. It won't work like this:

`kotlin
companion object {
@get:ClassRule
val localeTestRule = LocaleTestRule()
}`

2. To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

# Generating Screenshots with _screengrab_

- Then, before running `fastlane screengrab` you'll need a debug and test apk
- You can create your APKs manually with `./gradlew assembleDebug assembleAndroidTest`
- You can also create a lane and use `build_android_app`:

`ruby
desc "Build debug and test APK for screenshots"
lane :build_and_screengrab do
build_android_app(
task: 'assemble',
build_type: 'Debug'
)
build_android_app(
task: 'assemble',
build_type: 'AndroidTest'
)
screengrab()
end`
\- Once complete run `fastlane screengrab` in your app project directory to generate screenshots
\- You will be prompted to provide any required parameters which are not in your **Screengrabfile** or provided as command line arguments
\- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran _screengrab_

## Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to UI Automator which fixes a number of problems compared to the original strategy:

- Shadows/elevation are correctly captured for Material UI
- Multi-window situations are correctly captured (dialogs, etc.)
- Works on Android N

```java hljs
Screengrab.setDefaultScreenshotStrategy(new DecorViewScreenshotStrategy());

## Improved screenshot capture with Falcon

As of _screengrab_ 1.2.0, you can specify a new strategy to delegate to Falcon. Falcon may work better than UI Automator in some situations and also provides similar benefits as UI Automator:

- Multi-window situations are correctly captured (dialogs, etc.)
- Works on Android N

```java hljs
Screengrab.setDefaultScreenshotStrategy(new FalconScreenshotStrategy(activityRule.getActivity()));

## Advanced Screengrabfile Configuration

Running `fastlane screengrab init` generated a Screengrabfile which can store all of your configuration options. Since most values will not change often for your project, it is recommended to store them there.

The `Screengrabfile` is written in Ruby, so you may find it helpful to use an editor that highlights Ruby syntax to modify this file.

```ruby-skip-tests
# remove the leading '#' to uncomment lines

# app_package_name('your.app.package')
# use_tests_in_packages(['your.screenshot.tests.package'])

# app_apk_path('path/to/your/app.apk')
# tests_apk_path('path/to/your/tests.apk')

locales(['en-US', 'fr-FR', 'it-IT'])

# clear all previously generated screenshots in your local output directory before creating new ones
clear_previous_screenshots(true)

For more information about all available options run

```no-highlight
fastlane action screengrab

# Tips

## UI Tests

Check out Testing UI for a Single App for an introduction to using Espresso for UI testing.

##### Example UI Test Class (Using JUnit4)

Java:

```java hljs
@RunWith(JUnit4.class)
public class JUnit4StyleTests {
@ClassRule
public static final LocaleTestRule localeTestRule = new LocaleTestRule();

@Rule

@Test
public void testTakeScreenshot() {
Screengrab.screenshot("before_button_click");

onView(withId(R.id.fab)).perform(click());

Screengrab.screenshot("after_button_click");
}
}

Kotlin:

```kotlin hljs
@RunWith(JUnit4.class)
class JUnit4StyleTests {
@get:Rule
var activityRule = ActivityScenarioRule(MainActivity::class.java)

@Rule @JvmField
val localeTestRule = LocaleTestRule()

@Test
fun testTakeScreenshot() {
Screengrab.screenshot("before_button_click")

onView(withId(R.id.fab)).perform(click())

Screengrab.screenshot("after_button_click")
}
}

There is an example project showing how to use JUnit 3 or 4 and Espresso with the screengrab Java library to capture screenshots during a UI test run.

Using JUnit 4 is preferable because of its ability to perform actions before and after the entire test class is run. This means you will change the device's locale far fewer times when compared with JUnit 3 running those commands before and after each test method.

When using JUnit 3 you'll need to add a bit more code:

- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getTestLocale());` in `setUp()`
- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getEndingLocale());` in `tearDown()`
- Use `Screengrab.screenshot("name_of_screenshot_here");` to capture screenshots at the appropriate points in your tests

## Clean Status Bar

_screengrab_ can clean your status bar to make your screenshots even more beautiful.
It is simply a wrapper that allows configuring SystemUI DemoMode in your code.

You can enable and disable the clean status bar at any moment during your tests.
In most cases you probably want to do this in the @BeforeClass and @AfterClass methods.

```java hljs
@BeforeClass
public static void beforeAll() {
CleanStatusBar.enableWithDefaults();
}

@AfterClass
public static void afterAll() {
CleanStatusBar.disable();
}

Have a look at the methods of the `CleanStatusBar` class to customize the status bar even more.
You could for example show the Bluetooth icon and the LTE text.

```java hljs
new CleanStatusBar()
.setBluetoothState(BluetoothState.DISCONNECTED)
.setMobileNetworkDataType(MobileDataType.LTE)
.enable();

# Advanced _screengrab_

Launch Arguments

You can provide additional arguments to your test cases on launch. These strings will be available in your tests through `InstrumentationRegistry.getArguments()`.

```ruby hljs
screengrab(
launch_arguments: [\
"username hjanuschka",\
"build_number 201"\
]
)

```java hljs
Bundle extras = InstrumentationRegistry.getArguments();
String peerID = null;
if (extras != null) {
if (extras.containsKey("username")) {
username = extras.getString("username");
System.out.println("Username: " + username);
} else {
System.out.println("No username in extras");
}
} else {
System.out.println("No extras");
}

Detecting screengrab at runtime

For some apps, it is helpful to know when _screengrab_ is running so that you can display specific data for your screenshots. For iOS fastlane users, this is much like "FASTLANE\_SNAPSHOT". In order to do this, you'll need to have at least two product flavors of your app.

Add two product flavors to the app-level build.gradle file:

```hljs python-repl
android {
...
flavorDimensions "mode"
productFlavors {
screengrab {
dimension "mode"
}
regular {
dimension "mode"
}
}
...
}

Check for the existence of that flavor (i.e screengrab) in your app code as follows in order to use mock data or customize data for screenshots:

```hljs less
if (BuildConfig.FLAVOR == "screengrab") {
System.out.println("screengrab is running!");
}

When running _screengrab_, do the following to build the flavor you want as well as the test apk. Note that you use "assembleFlavor\_name" where Flavor\_name is the flavor name, capitalized (i.e. Screengrab).

```hljs
./gradlew assembleScreengrab assembleAndroidTest

Run _screengrab_:

```hljs nginx
fastlane screengrab

_screengrab_ will ask you to select the debug and test apps (which you can then add to your Screengrabfile to skip this step later).

The debug apk should be somewhere like this:

`app/build/outputs/apk/screengrab/debug/app-screengrab-debug.apk`

The test apk should be somewhere like this:

`app/build/outputs/apk/androidTest/screengrab/debug/app-screengrab-debug-androidTest.apk`

Sit back and enjoy your new screenshots!

Note: while this could also be done by creating a new build variant (i.e. debug, release and creating a new one called screengrab), Android only allows one build type to be tested which defaults to debug. That's why we use product flavors.

| capture\_android\_screenshots | |
| --- | --- |
| Supported platforms | android |
| Author | @asfalcone, @i2amsam, @mfurtak |

## 3 Examples

```ruby hljs
capture_android_screenshots

```ruby hljs
screengrab # alias for "capture_android_screenshots"

```ruby hljs
capture_android_screenshots(
locales: ["en-US", "fr-FR", "ja-JP"],
clear_previous_screenshots: true,
app_apk_path: "build/outputs/apk/example-debug.apk",
tests_apk_path: "build/outputs/apk/example-debug-androidTest-unaligned.apk"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `android_home` | Path to the root of your Android SDK installation, e.g. ~/tools/android-sdk-macosx | \* |
| `build_tools_version` | **DEPRECATED!** The Android build tools version to use, e.g. '23.0.2' | |
| `locales` | A list of locales which should be used | `["en-US"]` |
| `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running screengrab | `false` |
| `output_directory` | The directory where to store the screenshots | `fastlane/metadata/android` |
| `skip_open_summary` | Don't open the summary after running _screengrab_ | \* |
| `app_package_name` | The package name of the app under test (e.g. com.yourcompany.yourapp) | \* |
| `tests_package_name` | The package name of the tests bundle (e.g. com.yourcompany.yourapp.test) | |
| `use_tests_in_packages` | Only run tests in these Java packages | |
| `use_tests_in_classes` | Only run tests in these Java classes | |
| `launch_arguments` | Additional launch arguments | |
| `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner | `androidx.test.runner.AndroidJUnitRunner` |
| `ending_locale` | **DEPRECATED!** Return the device to this locale after running tests | `en-US` |
| `use_adb_root` | **DEPRECATED!** Restarts the adb daemon using `adb root` to allow access to screenshots directories on device. Use if getting 'Permission denied' errors | `false` |
| `app_apk_path` | The path to the APK for the app under test | \* |
| `tests_apk_path` | The path to the APK for the tests bundle | \* |
| `specific_device` | Use the device or emulator with the given serial number or qualifier | |
| `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear) | `phone` |
| `exit_on_test_failure` | Whether or not to exit Screengrab on test failure. Exiting on failure will not copy screenshots to local machine nor open screenshots summary | `true` |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `use_timestamp_suffix` | Add timestamp suffix to screenshot filename | `true` |
| `adb_host` | Configure the host used by adb to connect, allows running on remote devices farm | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `capture_android_screenshots` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SCREENGRAB_OUTPUT_DIRECTORY` | The path to the output directory |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action capture_android_screenshots

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run capture_android_screenshots

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run capture_android_screenshots parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/frame_screenshots

- Docs »
- \_Actions »
- frame\_screenshots
- Edit on GitHub
- ```

* * *

# frame\_screenshots

Adds device frames around all screenshots (via _frameit_)

###### Easily put your screenshots into the right device frames

_frameit_ allows you to put a gorgeous device frame around your iOS, macOS and Android screenshots just by running one simple command. Use _frameit_ to prepare perfect screenshots for the App Store, your website, QA or emails.

Features •
Usage •
Tips

# Features

## Frame screenshot

Put a gorgeous device frame around your iOS, macOS and Android screenshots just by running one simple command. Support for:

- iPhone, iPad and Mac
- Set of Android devices
- Portrait and Landscape modes
- Several device frame colors

The complete and updated list of supported devices and colors can be found here

Here is a nice gif, that shows _frameit_ in action:

## Advanced Features

- Put framed screenshot on colored background, define padding
- add text above or under framed screenshot
- keyword + text
- choose text font and color
- multi line text
- "intelligent" positioning of text that always looks good(ish)

## Results

##### The _frameit_ 2.0 update was kindly sponsored by MindNode, seen in the screenshots above.

The first time that _frameit_ is executed the frames will be downloaded automatically. Originally the frames are coming from Facebook frameset and they are kept on this repo.

More information about this process and how to update the frames can be found here

# Usage

## Basic Usage

Why should you have to use Photoshop, just to add a frame around your screenshots?

Just navigate to your folder of screenshots and use the following command (iOS and Mac OS are default platforms for backward compatibility):

```no-highlight
fastlane frameit

To frame Android screenshots:

```no-highlight
fastlane frameit android

To use the silver version of the frames:

```no-highlight
fastlane frameit silver

To download the latest frames

```no-highlight
fastlane frameit download_frames

Note: When using _frameit_ without titles on top, the screenshots will have the full resolution, which means they can't be uploaded to the App Store directly. They are supposed to be used for websites, print media and emails. Check out the section below to use the screenshots for the App Store.

## Advanced Usage (optional)

### Text and Background

With _frameit_ it's possible to add a custom background and text below or above the framed screenshots in fonts and colors you define.

A working example can be found in the fastlane examples project.

### `Framefile.json`

The Framefile allows to define general and screenshot specific information.
It has the following general JSON structure:

```json hljs
{
"device_frame_version": "latest",
"default": {
...
},
"data": [\
...\
]
}

### General parameters

The general parameters are defined in the `default` key and can be:

| Key | Description | Default value |
| --- | --- | --- |
| `background` | The background that should be used for the framed screenshot. Specify the (relative) path to the image file (e.g. `*.jpg`). This parameter is mandatory. | NA |
| `keyword` | An object that contains up to 3 keys to describe the optional keyword. See table below. | NA |
| `title` | An object that contains up to 3 keys to describe the mandatory title. See table below. | NA |
| `stack_title` | Specifies whether _frameit_ should display the keyword above the title when both keyword and title are defined. If it is false, the title and keyword will be displayed side by side when both keyword and title are defined. | `false` |
| `title_below_image` | Specifies whether _frameit_ should place the title and optional keyword below the device frame. If it is false, it will be placed above the device frame. | `false` |
| `show_complete_frame` | Specifies whether _frameit_ should shrink the device frame so that it is completely shown in the framed screenshot. If it is false, clipping of the device frame might occur at the bottom (when `title_below_image` is `false`) or top (when `title_below_image` is `true`) of the framed screenshot. | `false` |

| `interline_spacing` | Specifies whether _frameit_ should add or subtract this many pixels between the individual lines of text. This only applies to a multi-line `title` and/or `keyword` to expand or squash together the individual lines of text. | `0` |
| `font_scale_factor` | Specifies whether _frameit_ should increase or decrease the font size of the text. Is ignored for `keyword` or `title`, if `font_size` is specified. | `0.1` |
| `frame` | Overrides the color of the frame to be used. (Valid values are `BLACK`, `WHITE`, `GOLD` and `ROSE_GOLD`) | NA |
| `title_min_height` | Specifies a height always reserved for the title. Value can be a percentage of the height or an absolute value. The device will be placed below (or above) this area. Convenient to ensure the device top (or bottom) will be consistently placed at the same height on the different screenshots. | NA |
| `use_platform` | Overrides the platform used for the screenshot. Valid values are `IOS`, `ANDROID` and `ANY`. | `IOS` |
| `force_device_type` | Forces a specific device. Valid values are: Huawei P8, Motorola Moto E, Motorola Moto G, Nexus 4, Nexus 5X, Nexus 6P, Nexus 9, Samsung Galaxy Grand Prime, Samsung Galaxy Note 5, Samsung Galaxy S Duos, Samsung Galaxy S3, Samsung Galaxy S5, Samsung Galaxy S7, Samsung Galaxy S8, Samsung Galaxy S9, iPhone 5s, iPhone 5c, iPhone SE, iPhone 6s, iPhone 6s Plus, iPhone 7, iPhone 7 Plus, iPhone 8, iPhone 8 Plus, iPhone X, iPhone XS, iPhone XR, iPhone XS Max, iPad Air 2, iPad Mini 4, iPad Pro, MacBook, Google Pixel 3, Google Pixel 3 XL, HTC One A9, HTC One M8 | NA |

### Specific parameters

The screenshot specific parameters are related to the keyword and title texts.
These are defined in the `data` key. This is an array with the following keys for each screenshot:

| Key | Description |
| --- | --- |

| `keyword` | Similar use as in `default`, except that parameter `text` can be used here because it is screenshot specific. |
| `title` | Similar use as in `default`, except that parameter `text` can be used here because it is screenshot specific. |
| `frame` | Overrides the color of the frame to be used. (Valid values are `BLACK`, `WHITE`, `GOLD` and `ROSE_GOLD`) |
| `use_platform` | Overrides the platform used for the screenshot. Valid values are `IOS`, `ANDROID` and `ANY`. |
| `force_device_type` | Forces a specific device. Valid values are the same as for the general parameter. |

### Framefile `keyword` and `title` parameters

The `keyword` and `title` parameters are both used in `default` and `data`. They both consist of the following optional keys:

| Key | Description | Default value |
| --- | --- | --- |
| `color` | The font color for the text. Specify a HEX/HTML color code. | `#000000` (black) |
| `font` | The font family for the text. Specify the (relative) path to the font file (e.g. an OpenType Font). | The default `imagemagick` font, which is system dependent. |
| `font_size` | The font size for the text specified in points. If not specified or `0`, font will be scaled automatically to fit the available space. _frameit_ still shrinks the text, if it would not fit. | NA |
| `font_weight` | The font weight for the text. Specify an integer value (e.g. 900). | NA |

### Example

```json hljs
{
"device_frame_version": "latest",
"default": {
"keyword": {
"font": "./fonts/MyFont-Rg.otf"
},
"title": {
"font": "./fonts/MyFont-Th.otf",
"font_size": 128,
"color": "#545454"
},
"background": "./background.jpg",
"padding": 50,
"show_complete_frame": false,
"stack_title" : false,
"title_below_image": true,
"frame": "WHITE",
"use_platform": "IOS"
},

"data": [\
{\
"filter": "Brainstorming",\
"keyword": {\
"color": "#d21559"\
}\
},\
{\
"filter": "Organizing",\
"keyword": {\
"color": "#feb909"\
},\
"frame": "ROSE_GOLD"\
},\
{\
"filter": "Sharing",\
"keyword": {\
"color": "#aa4dbc"\
}\
},\
{\
"filter": "Styling",\
"keyword": {\
"color": "#31bb48"\
}\
},\
{\
"filter": "Android",\
"use_platform": "ANDROID"\
}\
]
}

You can find a more complex configuration to also support Chinese, Japanese and Korean languages.

The `Framefile.json` should be in the `screenshots` folder, as seen in the example.

### `.strings` files

To define the title and optionally the keyword, put two `.strings` files into the language folder (e.g. en-US in the example project)

The `keyword.strings` and `title.strings` are standard `.strings` file you already use for your iOS apps, making it easy to use your existing translation service to get localized titles.

**Notes**

- These `.strings` files **MUST** be utf-8 (UTF-8) or utf-16 encoded (UTF-16 BE with BOM). They also must begin with an empty line. If you are having trouble see issue #1740
- You **MUST** provide a background if you want titles. _frameit_ will not add the titles if a background is not specified.

### Screenshot orientation

By default _frameit_ adds a frame to your screenshot based on an orientation you took it. For a portrait (vertical orientation) it is going to add portrait frame and for a landscape (horizontal orientation) - landscape left (= Home button on the left side).

One way to override the default behavior is editing the file name by adding `force_landscaperight` to the end.

### `force_orientation_block`

If the default behavior doesn't fit your needs and you don't want or can't rename your screenshots, you can customize _frameit_'s orientation behavior by setting a `force_orientation_block` parameter. The valid values are: `:landscape_left` (home button on the left side), `:landscape_right` (home button on the right side), `:portrait` (home button on the bottom), `nil` (home button on the right side).

### Examples

```ruby hljs
# It matches the filename to the framed device orientation
frameit(
path: "./fastlane/screenshots",
force_orientation_block: proc do |filename|
case filename
when "iPad Pro (12.9-inch)-01LoginScreen"
:landscape_right
when "iPhone 6 Plus-01LoginScreen"
:portrait
# and so on
end
end
)

# It frames the screenshots in landscape right whenever the filename contains `landscape` word
```ruby hljs
frameit(
silver: true,
path: "./fastlane/screenshots",
force_orientation_block: proc do |filename|
f = filename.downcase
if f.include?("landscape")
:landscape_right
end
end
)

# Mac

With _frameit_ it's possible to also frame macOS Application screenshots. You have to provide the following:

- A (relative) path to a `background` image file, which should contain both the background and the Mac.
- The `offset` information so _frameit_ knows where to position your screenshot on the `background`:

- `titleHeight` : The height in pixels that should be used for the title.

## Example

```json hljs
{
"default": {
"title": {
"color": "#545454"
},
"background": "Mac.jpg",
"offset": {
"offset": "+676+479",
"titleHeight": 320
}
},
"data": [\
{\
"filter": "Brainstorming",\
"keyword": {\
"color": "#d21559"\
}\
}\
]
}

Check out the MindNode example project.

# Tips

## Generate localized screenshots

Check out _snapshot_ to automatically generate screenshots using `UI Automation`.

## Resume framing

Framing screenshots is a slow operation. In case you need to resume framing, or just frame a couple updated screenshots again, you can rely on the `--resume` flag. Only screenshots which have not been framed yet – or for which there isn't an up-to-date framed image – will be framed. This feature uses the file modification dates and will reframe screenshots if the screenshot is newer than the framed file.

## Upload screenshots

Use _deliver_ to upload iOS screenshots to App Store Connect, or _supply_ to upload Android screenshots to Play Store completely automatically 🚀

## Use a clean status bar

You can set `override_status_bar` to `true` in snapshot to set the status bar to Tuesday January 9th at 9:41AM with full battery and reception. If you need more granular customization, to set a Carrier name for example, also set `override_status_bar_arguments` to the specific arguments to be passed to the `xcrun simctl status_bar override` command. Run `xcrun simctl status_bar --help` to see the options available.

### Examples

# Sets the time to 9:41AM with full battery and reception, with the default carrier name: Carrier
```ruby hljs
capture_ios_screenshots(
override_status_bar: true
)

# Set the time to 9:41AM, battery at 75% and charging, on the TELUS LTE network
```ruby hljs
capture_ios_screenshots(
override_status_bar: true,
override_status_bar_arguments: "--time 9:41 --dataNetwork lte --cellularMode active --cellularBars 4 --batteryState charging --batteryLevel 75 --operatorName TELUS"
)

## Gray artifacts around text

If you run into any quality issues, like having a border around the font, it usually helps to just re-install `imagemagick`. You can do so by running

```sh hljs bash
brew uninstall imagemagick
brew install imagemagick

## Uninstall

- `gem uninstall fastlane`
- `rm -rf ~/.frameit`

| frame\_screenshots | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 6 Examples

```ruby hljs
frame_screenshots

```ruby hljs
frameit # alias for "frame_screenshots"

```ruby hljs
frame_screenshots(use_platform: "ANDROID")

```ruby hljs
frame_screenshots(silver: true)

```ruby hljs
frame_screenshots(path: "/screenshots")

```ruby hljs
frame_screenshots(rose_gold: true)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `white` | Use white device frames | |
| `silver` | Use white device frames. Alias for :white | |
| `rose_gold` | Use rose gold device frames. Alias for :rose\_gold | |
| `gold` | Use gold device frames. Alias for :gold | |
| `force_device_type` | Forces a given device type, useful for Mac screenshots, as their sizes vary | |
| `use_legacy_iphone5s` | Use iPhone 5s instead of iPhone SE frames | `false` |
| `use_legacy_iphone6s` | Use iPhone 6s frames instead of iPhone 7 frames | `false` |
| `use_legacy_iphone7` | Use iPhone 7 frames instead of iPhone 8 frames | `false` |
| `use_legacy_iphonex` | Use iPhone X instead of iPhone XS frames | `false` |
| `use_legacy_iphonexr` | Use iPhone XR instead of iPhone 11 frames | `false` |
| `use_legacy_iphonexs` | Use iPhone XS instead of iPhone 11 Pro frames | `false` |
| `use_legacy_iphonexsmax` | Use iPhone XS Max instead of iPhone 11 Pro Max frames | `false` |
| `force_orientation_block` | \[Advanced\] A block to customize your screenshots' device orientation | \* |
| `debug_mode` | Output debug information in framed screenshots | `false` |
| `resume` | Resume frameit instead of reprocessing all screenshots | `false` |
| `use_platform` | Choose a platform, the valid options are IOS, ANDROID and ANY (default is either general platform defined in the fastfile or IOS to ensure backward compatibility) | \* |
| `path` | The path to the directory containing the screenshots | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action frame_screenshots

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run frame_screenshots

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run frame_screenshots parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/capture_screenshots

- Docs »
- \_Actions »
- capture\_screenshots
- Edit on GitHub
- ```

* * *

# capture\_screenshots

Alias for the `capture_ios_screenshots` action

###### Automate taking localized screenshots of your iOS, tvOS, and watchOS apps on every device

#### Check out the new fastlane documentation on how to generate screenshots

_snapshot_ generates localized iOS, tvOS, and watchOS screenshots for different device types and languages for the App Store and can be uploaded using ( _deliver_).

You have to manually create 20 (languages) x 6 (devices) x 5 (screenshots) = **600 screenshots**.

It's hard to get everything right!

- New screenshots with every (design) update
- No loading indicators
- Same content / screens
- Clean Status Bar
- Uploading screenshots ( _deliver_ is your friend)

More information about creating perfect screenshots.

_snapshot_ runs completely in the background - you can do something else, while your computer takes the screenshots for you.

Features •
UI Tests •
Quick Start •
Usage •
Tips •
How?

# Features

- Create hundreds of screenshots in multiple languages on all simulators
- Take screenshots in multiple device simulators concurrently to cut down execution time (Xcode 9 only)
- Configure it once, store the configuration in git
- Do something else, while the computer takes the screenshots for you
- Integrates with _fastlane_ and _deliver_
- Generates a beautiful web page, which shows all screenshots on all devices. This is perfect to send to QA or the marketing team
- _snapshot_ automatically waits for network requests to be finished before taking a screenshot (we don't want loading images in the App Store screenshots)

After _snapshot_ successfully created new screenshots, it will generate a beautiful HTML file to get a quick overview of all screens:

## Why?

This tool automatically switches the language and device type and runs UI Tests for every combination.

### Why should I automate this process?

- It takes **hours** to take screenshots
- You get a great overview of all your screens, running on all available simulators without the need to manually start it hundreds of times
- Easy verification for translators (without an iDevice) that translations do make sense in real App context
- Easy verification that localizations fit into labels on all screen dimensions
- It is an integration test: You can test for UI elements and other things inside your scripts
- Be so nice, and provide new screenshots with every App Store update. Your customers deserve it
- You realize, there is a spelling mistake in one of the screens? Well, just correct it and re-run the script

# UI Tests

## Getting started

This project uses Apple's newly announced UI Tests. We will not go into detail on how to write scripts.

Here a few links to get started:

- WWDC 2015 Introduction to UI Tests
- A first look into UI Tests
- UI Testing in Xcode 7
- HSTestingBackchannel : ‘Cheat’ by communicating directly with your app
- Automating App Store screenshots using fastlane snapshot and frameit

# Quick Start

- Create a new UI Test target in your Xcode project ( top part of this article)
- Run `fastlane snapshot init` in your project folder
- Add the ./SnapshotHelper.swift to your UI Test target (You can move the file anywhere you want)
- (Xcode 8 only) add the ./SnapshotHelperXcode8.swift to your UI Test target
- (Objective C only) add the bridging header to your test class:
- `#import "MYUITests-Swift.h"`

(The bridging header is named after your test target with `-Swift.h` appended.)
- In your UI Test class, click the `Record` button on the bottom left and record your interaction
- To take a snapshot, call the following between interactions
- Swift: `snapshot("01LoginScreen")`
- Objective C: `[Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];`
- Add the following code to your `setUp()` method:

**Swift:**

```swift hljs
let app = XCUIApplication()
setupSnapshot(app)
app.launch()

**Objective C:**

```objective-c
XCUIApplication *app = [[XCUIApplication alloc] init];
[Snapshot setupSnapshot:app waitForAnimations:NO];
[app launch];

_Make sure you only have one `launch` call in your test class, as Xcode adds one automatically on new test files._

You can try the _snapshot_ example project by cloning this repo.

To quick start your UI tests, you can use the UI Test recorder. You only have to interact with the simulator, and Xcode will generate the UI Test code for you. You can find the red record button on the bottom of the screen (more information in this blog post)

# Usage

```no-highlight
fastlane snapshot

Your screenshots will be stored in the `./screenshots/` folder by default (or `./fastlane/screenshots` if you're using _fastlane_)

New with Xcode 9, _snapshot_ can run multiple simulators concurrently. This is the default behavior in order to take your screenshots as quickly as possible. This can be disabled to run each device, one at a time, by setting the `:concurrent_simulators` option to `false`.

**Note:** While running _snapshot_ with Xcode 9, the simulators will not be visibly spawned. So, while you won't see the simulators running your tests, they will, in fact, be taking your screenshots.

If any error occurs while running the snapshot script on a device, that device will not have any screenshots, and _snapshot_ will continue with the next device or language. To stop the flow after the first error, run

```no-highlight
fastlane snapshot --stop_after_first_error

Also by default, _snapshot_ will open the HTML after all is done. This can be skipped with the following command

```no-highlight
fastlane snapshot --stop_after_first_error --skip_open_summary

There are a lot of options available that define how to build your app, for example

```no-highlight
fastlane snapshot --scheme "UITests" --configuration "Release" --sdk "iphonesimulator"

Reinstall the app before running _snapshot_

```no-highlight
fastlane snapshot --reinstall_app --app_identifier "tools.fastlane.app"

By default _snapshot_ automatically retries running UI Tests if they fail. This is due to randomly failing UI Tests (e.g. #2517). You can adapt this number using

```no-highlight
fastlane snapshot --number_of_retries 3

Add photos and/or videos to the simulator before running _snapshot_

```no-highlight
fastlane snapshot --add_photos MyTestApp/Assets/demo.jpg --add_videos MyTestApp/Assets/demo.mp4

For a list for all available options run

```no-highlight
fastlane action snapshot

After running _snapshot_ you will get a nice summary:

## Snapfile

All of the available options can also be stored in a configuration file called the `Snapfile`. Since most values will not change often for your project, it is recommended to store them there:

First make sure to have a `Snapfile` (you get it for free when running `fastlane snapshot init`)

The `Snapfile` can contain all the options that are also available on `fastlane action snapshot`

```ruby-skip-tests
scheme("UITests")

devices([\
"iPad (7th generation)",\
"iPad Air (3rd generation)",\
"iPad Pro (11-inch)",\
"iPad Pro (12.9-inch) (3rd generation)",\
"iPad Pro (9.7-inch)",\
"iPhone 11",\
"iPhone 11 Pro",\
"iPhone 11 Pro Max",\
"iPhone 8",\
"iPhone 8 Plus"\
])

languages([\
"en-US",\
"de-DE",\
"es-ES",\
["pt", "pt_BR"] # Portuguese with Brazilian locale\
])

launch_arguments(["-username Felix"])

# The directory in which the screenshots should be stored
output_directory('./screenshots')

clear_previous_screenshots(true)

override_status_bar(true)

add_photos(["MyTestApp/Assets/demo.jpg"])

### Completely reset all simulators

You can run this command in the terminal to delete and re-create all iOS and tvOS simulators:

```no-highlight
fastlane snapshot reset_simulators

**Warning**: This will delete **all** your simulators and replace by new ones! This is useful, if you run into weird problems when running _snapshot_.

You can use the environment variable `SNAPSHOT_FORCE_DELETE` to stop asking for confirmation before deleting.

```no-highlight
SNAPSHOT_FORCE_DELETE=1 fastlane snapshot reset_simulators

## Update snapshot helpers

Some updates require the helper files to be updated. _snapshot_ will automatically warn you and tell you how to update.

Basically you can run

```no-highlight
fastlane snapshot update

to update your `SnapshotHelper.swift` files. In case you modified your `SnapshotHelper.swift` and want to manually update the file, check out SnapshotHelper.swift.

## Launch Arguments

You can provide additional arguments to your app on launch. These strings will be available in your app (e.g. not in the testing target) through `ProcessInfo.processInfo.arguments`. Alternatively, use user-default syntax ( `-key value`) and they will be available as key-value pairs in `UserDefaults.standard`.

```ruby-skip-tests
launch_arguments([\
"-firstName Felix -lastName Krause"\
])

```swift hljs
name.text = UserDefaults.standard.string(forKey: "firstName")
// name.text = "Felix"

_snapshot_ includes `-FASTLANE_SNAPSHOT YES`, which will set a temporary user default for the key `FASTLANE_SNAPSHOT`, you may use this to detect when the app is run by _snapshot_.

```swift hljs
if UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT") {
// runtime check that we are in snapshot mode
}

Specify multiple argument strings and _snapshot_ will generate screenshots for each combination of arguments, devices, and languages. This is useful for comparing the same screenshots with different feature flags, dynamic text sizes, and different data sets.

```ruby-skip-tests
# Snapfile for A/B Test Comparison
launch_arguments([\
"-secretFeatureEnabled YES",\
"-secretFeatureEnabled NO"\
])

## Xcode Environment Variables

# How does it work?

The easiest solution would be to just render the UIWindow into a file. That's not possible because UI Tests don't run on a main thread. So _snapshot_ uses a different approach:

When you run unit tests in Xcode, the reporter generates a plist file, documenting all events that occurred during the tests ( More Information). Additionally, Xcode generates screenshots before, during and after each of these events. There is no way to manually trigger a screenshot event. The screenshots and the plist files are stored in the DerivedData directory, which _snapshot_ stores in a temporary folder.

When the user calls `snapshot(...)` in the UI Tests (Swift or Objective C) the script actually does a rotation to `.Unknown` which doesn't have any effect on the actual app, but is enough to trigger a screenshot. It has no effect to the application and is not something you would do in your tests. The goal was to find _some_ event that a user would never trigger, so that we know it's from _snapshot_. On tvOS, there is no orientation so we ask for a count of app views with type "Browser" (which should never exist on tvOS).

_snapshot_ then iterates through all test events and check where we either did this weird rotation (on iOS) or searched for browsers (on tvOS). Once _snapshot_ has all events triggered by _snapshot_ it collects a ordered list of all the file names of the actual screenshots of the application.

_snapshot_ finds all these entries using a regex. The number of _snapshot_ outputs in the terminal and the number of _snapshot_ events in the plist file should be the same. Knowing that, _snapshot_ automatically matches these 2 lists to identify the name of each of these screenshots. They are then copied over to the output directory and separated by language and device.

2 thing have to be passed on from _snapshot_ to the `xcodebuild` command line tool:

- The device type is passed via the `destination` parameter of the `xcodebuild` parameter
- The language is passed via a temporary file which is written by _snapshot_ before running the tests and read by the UI Tests when launching the application

If you find a better way to do any of this, please submit an issue on GitHub or even a pull request :+1:

Radar 23062925 has been resolved with Xcode 8.3, so it's now possible to actually take screenshots from the simulator. We'll keep using the old approach for now, since many of you still want to use older versions of Xcode.

# Tips

#### Check out the new fastlane documentation on how to generate screenshots

## Frame the screenshots

If you want to add frames around the screenshots and even put a title on top, check out _frameit_.

## Available language codes

```ruby hljs
ALL_LANGUAGES = ["da", "de-DE", "el", "en-AU", "en-CA", "en-GB", "en-US", "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "id", "it", "ja", "ko", "ms", "nl-NL", "no", "pt-BR", "pt-PT", "ru", "sv", "th", "tr", "vi", "zh-Hans", "zh-Hant"]

To get more information about language and locale codes please read Internationalization and Localization Guide.

## Use a clean status bar

You can set `override_status_bar` to `true` to set the status bar to Tuesday January 9th at 9:41AM with full battery and reception. If you need more granular customization, to set a Carrier name for example, also set `override_status_bar_arguments` to the specific arguments to be passed to the `xcrun simctl status_bar override` command. Run `xcrun simctl status_bar --help` to see the options available.

## Editing the `Snapfile`

Change syntax highlighting to _Ruby_.

### Simulator doesn't launch the application

When the app dies directly after the application is launched there might be 2 problems

- The simulator is somehow in a broken state and you need to re-create it. You can use `snapshot reset_simulators` to reset all simulators (this will remove all installed apps)
- A restart helps very often

## Determine language

To detect the currently used localization in your tests, access the `deviceLanguage` variable from `SnapshotHelper.swift`.

## Speed up snapshots

A lot of time in UI tests is spent waiting for animations.

You can disable `UIView` animations in your app to make the tests faster:

```swift hljs
if ProcessInfo().arguments.contains("SKIP_ANIMATIONS") {
UIView.setAnimationsEnabled(false)
}

This requires you to pass the launch argument like so:

```ruby hljs
snapshot(launch_arguments: ["SKIP_ANIMATIONS"])

By default, _snapshot_ will wait for a short time for the animations to finish.
If you're skipping the animations, this wait time is unnecessary and can be skipped:

```swift hljs
setupSnapshot(app, waitForAnimations: false)

| capture\_screenshots | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
capture_ios_screenshots

```ruby hljs
snapshot # alias for "capture_ios_screenshots"

```ruby hljs
capture_ios_screenshots(
skip_open_summary: true,
clean: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `xcargs` | Pass additional arguments to xcodebuild for the test phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `devices` | A list of devices you want to take the screenshots from | |
| `languages` | A list of languages which should be used | `["en-US"]` |
| `launch_arguments` | A list of launch arguments which should be used | `[""]` |
| `output_directory` | The directory where to store the screenshots | \* |
| `output_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output\_directory | `false` |
| `ios_version` | By default, the latest version should be used automatically. If you want to change it, do it here | |
| `skip_open_summary` | Don't open the HTML summary after running _snapshot_ | `false` |
| `skip_helper_version_check` | Do not check for most recent SnapshotHelper code | `false` |
| `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running snapshot | `false` |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `erase_simulator` | Enabling this option will automatically erase the simulator before running the application | `false` |
| `headless` | Enabling this option will prevent displaying the simulator window | `true` |
| `override_status_bar` | Enabling this option will automatically override the status bar to show 9:41 AM, full battery, and full reception (Adjust 'SNAPSHOT\_SIMULATOR\_WAIT\_FOR\_BOOT\_TIMEOUT' environment variable if override status bar is not working. Might be because simulator is not fully booted. Defaults to 10 seconds) | `false` |
| `override_status_bar_arguments` | Fully customize the status bar by setting each option here. Requires `override_status_bar` to be set to `true`. See `xcrun simctl status_bar --help` | |
| `localize_simulator` | Enabling this option will configure the Simulator's system language | `false` |
| `dark_mode` | Enabling this option will configure the Simulator to be in dark mode (false for light, true for dark) | |
| `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall\_app) | \* |
| `add_photos` | A list of photos that should be added to the simulator before running the application | |
| `add_videos` | A list of videos that should be added to the simulator before running the application | |
| `html_template` | A path to screenshots.html template | |
| `buildlog_path` | The directory where to store the build log | \* |
| `clean` | Should the project be cleaned before building it? | `false` |
| `test_without_building` | Test without building, requires a derived data path | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `sdk` | The SDK that should be used for building the application | |
| `scheme` | The scheme you want to use, this must be the scheme for the UI Tests | |
| `number_of_retries` | The number of times a test can fail before snapshot should stop retrying | `1` |
| `stop_after_first_error` | Should snapshot stop immediately after the tests completely failed on one device? | `false` |
| `derived_data_path` | The directory where build products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `test_target_name` | The name of the target you want to test (if you desire to override the Target Application from Xcode) | |
| `namespace_log_files` | Separate the log files per device and per language | |
| `concurrent_simulators` | Take snapshots on multiple simulators concurrently. Note: This option is only applicable when running against Xcode 9 | `true` |
| `disable_slide_to_type` | Disable the simulator from showing the 'Slide to type' prompt | `false` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `testplan` | The testplan associated with the scheme that should be used for testing | |
| `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run | |
| `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `xcpretty_args` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Additional xcpretty arguments | |
| `disable_xcpretty` | Disable xcpretty formatting of build | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `capture_screenshots` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SNAPSHOT_SCREENSHOTS_PATH` | The path to the screenshots |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action capture_screenshots

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run capture_screenshots

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run capture_screenshots parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/capture_ios_screenshots

- Docs »
- \_Actions »
- capture\_ios\_screenshots
- Edit on GitHub
- ```

* * *

# capture\_ios\_screenshots

Generate new localized screenshots on multiple devices (via _snapshot_)

###### Automate taking localized screenshots of your iOS, tvOS, and watchOS apps on every device

#### Check out the new fastlane documentation on how to generate screenshots

_snapshot_ generates localized iOS, tvOS, and watchOS screenshots for different device types and languages for the App Store and can be uploaded using ( _deliver_).

You have to manually create 20 (languages) x 6 (devices) x 5 (screenshots) = **600 screenshots**.

It's hard to get everything right!

- New screenshots with every (design) update
- No loading indicators
- Same content / screens
- Clean Status Bar
- Uploading screenshots ( _deliver_ is your friend)

More information about creating perfect screenshots.

_snapshot_ runs completely in the background - you can do something else, while your computer takes the screenshots for you.

Features •
UI Tests •
Quick Start •
Usage •
Tips •
How?

# Features

- Create hundreds of screenshots in multiple languages on all simulators
- Take screenshots in multiple device simulators concurrently to cut down execution time (Xcode 9 only)
- Configure it once, store the configuration in git
- Do something else, while the computer takes the screenshots for you
- Integrates with _fastlane_ and _deliver_
- Generates a beautiful web page, which shows all screenshots on all devices. This is perfect to send to QA or the marketing team
- _snapshot_ automatically waits for network requests to be finished before taking a screenshot (we don't want loading images in the App Store screenshots)

After _snapshot_ successfully created new screenshots, it will generate a beautiful HTML file to get a quick overview of all screens:

## Why?

This tool automatically switches the language and device type and runs UI Tests for every combination.

### Why should I automate this process?

- It takes **hours** to take screenshots
- You get a great overview of all your screens, running on all available simulators without the need to manually start it hundreds of times
- Easy verification for translators (without an iDevice) that translations do make sense in real App context
- Easy verification that localizations fit into labels on all screen dimensions
- It is an integration test: You can test for UI elements and other things inside your scripts
- Be so nice, and provide new screenshots with every App Store update. Your customers deserve it
- You realize, there is a spelling mistake in one of the screens? Well, just correct it and re-run the script

# UI Tests

## Getting started

This project uses Apple's newly announced UI Tests. We will not go into detail on how to write scripts.

Here a few links to get started:

- WWDC 2015 Introduction to UI Tests
- A first look into UI Tests
- UI Testing in Xcode 7
- HSTestingBackchannel : ‘Cheat’ by communicating directly with your app
- Automating App Store screenshots using fastlane snapshot and frameit

# Quick Start

- Create a new UI Test target in your Xcode project ( top part of this article)
- Run `fastlane snapshot init` in your project folder
- Add the ./SnapshotHelper.swift to your UI Test target (You can move the file anywhere you want)
- (Xcode 8 only) add the ./SnapshotHelperXcode8.swift to your UI Test target
- (Objective C only) add the bridging header to your test class:
- `#import "MYUITests-Swift.h"`

(The bridging header is named after your test target with `-Swift.h` appended.)
- In your UI Test class, click the `Record` button on the bottom left and record your interaction
- To take a snapshot, call the following between interactions
- Swift: `snapshot("01LoginScreen")`
- Objective C: `[Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];`
- Add the following code to your `setUp()` method:

**Swift:**

```swift hljs
let app = XCUIApplication()
setupSnapshot(app)
app.launch()

**Objective C:**

```objective-c
XCUIApplication *app = [[XCUIApplication alloc] init];
[Snapshot setupSnapshot:app waitForAnimations:NO];
[app launch];

_Make sure you only have one `launch` call in your test class, as Xcode adds one automatically on new test files._

You can try the _snapshot_ example project by cloning this repo.

To quick start your UI tests, you can use the UI Test recorder. You only have to interact with the simulator, and Xcode will generate the UI Test code for you. You can find the red record button on the bottom of the screen (more information in this blog post)

# Usage

```no-highlight
fastlane snapshot

Your screenshots will be stored in the `./screenshots/` folder by default (or `./fastlane/screenshots` if you're using _fastlane_)

New with Xcode 9, _snapshot_ can run multiple simulators concurrently. This is the default behavior in order to take your screenshots as quickly as possible. This can be disabled to run each device, one at a time, by setting the `:concurrent_simulators` option to `false`.

**Note:** While running _snapshot_ with Xcode 9, the simulators will not be visibly spawned. So, while you won't see the simulators running your tests, they will, in fact, be taking your screenshots.

If any error occurs while running the snapshot script on a device, that device will not have any screenshots, and _snapshot_ will continue with the next device or language. To stop the flow after the first error, run

```no-highlight
fastlane snapshot --stop_after_first_error

Also by default, _snapshot_ will open the HTML after all is done. This can be skipped with the following command

```no-highlight
fastlane snapshot --stop_after_first_error --skip_open_summary

There are a lot of options available that define how to build your app, for example

```no-highlight
fastlane snapshot --scheme "UITests" --configuration "Release" --sdk "iphonesimulator"

Reinstall the app before running _snapshot_

```no-highlight
fastlane snapshot --reinstall_app --app_identifier "tools.fastlane.app"

By default _snapshot_ automatically retries running UI Tests if they fail. This is due to randomly failing UI Tests (e.g. #2517). You can adapt this number using

```no-highlight
fastlane snapshot --number_of_retries 3

Add photos and/or videos to the simulator before running _snapshot_

```no-highlight
fastlane snapshot --add_photos MyTestApp/Assets/demo.jpg --add_videos MyTestApp/Assets/demo.mp4

For a list for all available options run

```no-highlight
fastlane action snapshot

After running _snapshot_ you will get a nice summary:

## Snapfile

All of the available options can also be stored in a configuration file called the `Snapfile`. Since most values will not change often for your project, it is recommended to store them there:

First make sure to have a `Snapfile` (you get it for free when running `fastlane snapshot init`)

The `Snapfile` can contain all the options that are also available on `fastlane action snapshot`

```ruby-skip-tests
scheme("UITests")

devices([\
"iPad (7th generation)",\
"iPad Air (3rd generation)",\
"iPad Pro (11-inch)",\
"iPad Pro (12.9-inch) (3rd generation)",\
"iPad Pro (9.7-inch)",\
"iPhone 11",\
"iPhone 11 Pro",\
"iPhone 11 Pro Max",\
"iPhone 8",\
"iPhone 8 Plus"\
])

languages([\
"en-US",\
"de-DE",\
"es-ES",\
["pt", "pt_BR"] # Portuguese with Brazilian locale\
])

launch_arguments(["-username Felix"])

# The directory in which the screenshots should be stored
output_directory('./screenshots')

clear_previous_screenshots(true)

override_status_bar(true)

add_photos(["MyTestApp/Assets/demo.jpg"])

### Completely reset all simulators

You can run this command in the terminal to delete and re-create all iOS and tvOS simulators:

```no-highlight
fastlane snapshot reset_simulators

**Warning**: This will delete **all** your simulators and replace by new ones! This is useful, if you run into weird problems when running _snapshot_.

You can use the environment variable `SNAPSHOT_FORCE_DELETE` to stop asking for confirmation before deleting.

```no-highlight
SNAPSHOT_FORCE_DELETE=1 fastlane snapshot reset_simulators

## Update snapshot helpers

Some updates require the helper files to be updated. _snapshot_ will automatically warn you and tell you how to update.

Basically you can run

```no-highlight
fastlane snapshot update

to update your `SnapshotHelper.swift` files. In case you modified your `SnapshotHelper.swift` and want to manually update the file, check out SnapshotHelper.swift.

## Launch Arguments

You can provide additional arguments to your app on launch. These strings will be available in your app (e.g. not in the testing target) through `ProcessInfo.processInfo.arguments`. Alternatively, use user-default syntax ( `-key value`) and they will be available as key-value pairs in `UserDefaults.standard`.

```ruby-skip-tests
launch_arguments([\
"-firstName Felix -lastName Krause"\
])

```swift hljs
name.text = UserDefaults.standard.string(forKey: "firstName")
// name.text = "Felix"

_snapshot_ includes `-FASTLANE_SNAPSHOT YES`, which will set a temporary user default for the key `FASTLANE_SNAPSHOT`, you may use this to detect when the app is run by _snapshot_.

```swift hljs
if UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT") {
// runtime check that we are in snapshot mode
}

Specify multiple argument strings and _snapshot_ will generate screenshots for each combination of arguments, devices, and languages. This is useful for comparing the same screenshots with different feature flags, dynamic text sizes, and different data sets.

```ruby-skip-tests
# Snapfile for A/B Test Comparison
launch_arguments([\
"-secretFeatureEnabled YES",\
"-secretFeatureEnabled NO"\
])

## Xcode Environment Variables

# How does it work?

The easiest solution would be to just render the UIWindow into a file. That's not possible because UI Tests don't run on a main thread. So _snapshot_ uses a different approach:

When you run unit tests in Xcode, the reporter generates a plist file, documenting all events that occurred during the tests ( More Information). Additionally, Xcode generates screenshots before, during and after each of these events. There is no way to manually trigger a screenshot event. The screenshots and the plist files are stored in the DerivedData directory, which _snapshot_ stores in a temporary folder.

When the user calls `snapshot(...)` in the UI Tests (Swift or Objective C) the script actually does a rotation to `.Unknown` which doesn't have any effect on the actual app, but is enough to trigger a screenshot. It has no effect to the application and is not something you would do in your tests. The goal was to find _some_ event that a user would never trigger, so that we know it's from _snapshot_. On tvOS, there is no orientation so we ask for a count of app views with type "Browser" (which should never exist on tvOS).

_snapshot_ then iterates through all test events and check where we either did this weird rotation (on iOS) or searched for browsers (on tvOS). Once _snapshot_ has all events triggered by _snapshot_ it collects a ordered list of all the file names of the actual screenshots of the application.

_snapshot_ finds all these entries using a regex. The number of _snapshot_ outputs in the terminal and the number of _snapshot_ events in the plist file should be the same. Knowing that, _snapshot_ automatically matches these 2 lists to identify the name of each of these screenshots. They are then copied over to the output directory and separated by language and device.

2 thing have to be passed on from _snapshot_ to the `xcodebuild` command line tool:

- The device type is passed via the `destination` parameter of the `xcodebuild` parameter
- The language is passed via a temporary file which is written by _snapshot_ before running the tests and read by the UI Tests when launching the application

If you find a better way to do any of this, please submit an issue on GitHub or even a pull request :+1:

Radar 23062925 has been resolved with Xcode 8.3, so it's now possible to actually take screenshots from the simulator. We'll keep using the old approach for now, since many of you still want to use older versions of Xcode.

# Tips

#### Check out the new fastlane documentation on how to generate screenshots

## Frame the screenshots

If you want to add frames around the screenshots and even put a title on top, check out _frameit_.

## Available language codes

```ruby hljs
ALL_LANGUAGES = ["da", "de-DE", "el", "en-AU", "en-CA", "en-GB", "en-US", "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "id", "it", "ja", "ko", "ms", "nl-NL", "no", "pt-BR", "pt-PT", "ru", "sv", "th", "tr", "vi", "zh-Hans", "zh-Hant"]

To get more information about language and locale codes please read Internationalization and Localization Guide.

## Use a clean status bar

You can set `override_status_bar` to `true` to set the status bar to Tuesday January 9th at 9:41AM with full battery and reception. If you need more granular customization, to set a Carrier name for example, also set `override_status_bar_arguments` to the specific arguments to be passed to the `xcrun simctl status_bar override` command. Run `xcrun simctl status_bar --help` to see the options available.

## Editing the `Snapfile`

Change syntax highlighting to _Ruby_.

### Simulator doesn't launch the application

When the app dies directly after the application is launched there might be 2 problems

- The simulator is somehow in a broken state and you need to re-create it. You can use `snapshot reset_simulators` to reset all simulators (this will remove all installed apps)
- A restart helps very often

## Determine language

To detect the currently used localization in your tests, access the `deviceLanguage` variable from `SnapshotHelper.swift`.

## Speed up snapshots

A lot of time in UI tests is spent waiting for animations.

You can disable `UIView` animations in your app to make the tests faster:

```swift hljs
if ProcessInfo().arguments.contains("SKIP_ANIMATIONS") {
UIView.setAnimationsEnabled(false)
}

This requires you to pass the launch argument like so:

```ruby hljs
snapshot(launch_arguments: ["SKIP_ANIMATIONS"])

By default, _snapshot_ will wait for a short time for the animations to finish.
If you're skipping the animations, this wait time is unnecessary and can be skipped:

```swift hljs
setupSnapshot(app, waitForAnimations: false)

| capture\_ios\_screenshots | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
capture_ios_screenshots

```ruby hljs
snapshot # alias for "capture_ios_screenshots"

```ruby hljs
capture_ios_screenshots(
skip_open_summary: true,
clean: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `workspace` | Path to the workspace file | |
| `project` | Path to the project file | |
| `xcargs` | Pass additional arguments to xcodebuild for the test phase. Be sure to quote the setting names and values e.g. OTHER\_LDFLAGS="-ObjC -lstdc++" | |
| `xcconfig` | Use an extra XCCONFIG file to build your app | |
| `devices` | A list of devices you want to take the screenshots from | |
| `languages` | A list of languages which should be used | `["en-US"]` |
| `launch_arguments` | A list of launch arguments which should be used | `[""]` |
| `output_directory` | The directory where to store the screenshots | \* |
| `output_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output\_directory | `false` |
| `ios_version` | By default, the latest version should be used automatically. If you want to change it, do it here | |
| `skip_open_summary` | Don't open the HTML summary after running _snapshot_ | `false` |
| `skip_helper_version_check` | Do not check for most recent SnapshotHelper code | `false` |
| `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running snapshot | `false` |
| `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false` |
| `erase_simulator` | Enabling this option will automatically erase the simulator before running the application | `false` |
| `headless` | Enabling this option will prevent displaying the simulator window | `true` |
| `override_status_bar` | Enabling this option will automatically override the status bar to show 9:41 AM, full battery, and full reception (Adjust 'SNAPSHOT\_SIMULATOR\_WAIT\_FOR\_BOOT\_TIMEOUT' environment variable if override status bar is not working. Might be because simulator is not fully booted. Defaults to 10 seconds) | `false` |
| `override_status_bar_arguments` | Fully customize the status bar by setting each option here. Requires `override_status_bar` to be set to `true`. See `xcrun simctl status_bar --help` | |
| `localize_simulator` | Enabling this option will configure the Simulator's system language | `false` |
| `dark_mode` | Enabling this option will configure the Simulator to be in dark mode (false for light, true for dark) | |
| `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall\_app) | \* |
| `add_photos` | A list of photos that should be added to the simulator before running the application | |
| `add_videos` | A list of videos that should be added to the simulator before running the application | |
| `html_template` | A path to screenshots.html template | |
| `buildlog_path` | The directory where to store the build log | \* |
| `clean` | Should the project be cleaned before building it? | `false` |
| `test_without_building` | Test without building, requires a derived data path | |
| `configuration` | The configuration to use when building the app. Defaults to 'Release' | \* |
| `sdk` | The SDK that should be used for building the application | |
| `scheme` | The scheme you want to use, this must be the scheme for the UI Tests | |
| `number_of_retries` | The number of times a test can fail before snapshot should stop retrying | `1` |
| `stop_after_first_error` | Should snapshot stop immediately after the tests completely failed on one device? | `false` |
| `derived_data_path` | The directory where build products and other derived data will go | |
| `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false` |
| `test_target_name` | The name of the target you want to test (if you desire to override the Target Application from Xcode) | |
| `namespace_log_files` | Separate the log files per device and per language | |
| `concurrent_simulators` | Take snapshots on multiple simulators concurrently. Note: This option is only applicable when running against Xcode 9 | `true` |
| `disable_slide_to_type` | Disable the simulator from showing the 'Slide to type' prompt | `false` |
| `cloned_source_packages_path` | Sets a custom path for Swift Package Manager dependencies | |
| `skip_package_dependencies_resolution` | Skips resolution of Swift Package Manager dependencies | `false` |
| `disable_package_automatic_updates` | Prevents packages from automatically being resolved to versions other than those recorded in the `Package.resolved` file | `false` |
| `testplan` | The testplan associated with the scheme that should be used for testing | |
| `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run | |
| `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip | |
| `xcodebuild_formatter` | xcodebuild formatter to use (ex: 'xcbeautify', 'xcbeautify --quieter', 'xcpretty', 'xcpretty -test'). Use empty string (ex: '') to disable any formatter (More information: | \* |
| `xcpretty_args` | **DEPRECATED!** Use `xcodebuild_formatter: ''` instead - Additional xcpretty arguments | |
| `disable_xcpretty` | Disable xcpretty formatting of build | |
| `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog\_path | |
| `use_system_scm` | Lets xcodebuild use system's scm configuration | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `capture_ios_screenshots` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SNAPSHOT_SCREENSHOTS_PATH` | The path to the screenshots |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action capture_ios_screenshots

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run capture_ios_screenshots

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run capture_ios_screenshots parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/increment_build_number

- Docs »
- \_Actions »
- increment\_build\_number
- Edit on GitHub
- ```

* * *

# increment\_build\_number

Increment the build number of your project

| increment\_build\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | The new build number |

## 4 Examples

```ruby hljs
increment_build_number # automatically increment by one

```ruby hljs
increment_build_number(
build_number: "75" # set a specific number
)

```ruby hljs
increment_build_number(
build_number: 75, # specify specific build number (optional, omitting it increments by one)
xcodeproj: "./path/to/MyApp.xcodeproj" # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)

```ruby hljs
build_number = increment_build_number

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `build_number` | Change to a specific version. When you provide this parameter, Apple Generic Versioning does not have to be enabled | |
| `skip_info_plist` | Don't update Info.plist files when updating the build version | `false` |
| `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `increment_build_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::BUILD_NUMBER` | The new build number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action increment_build_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run increment_build_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run increment_build_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/set_info_plist_value

- Docs »
- \_Actions »
- set\_info\_plist\_value
- Edit on GitHub
- ```

* * *

# set\_info\_plist\_value

Sets value to Info.plist of your project as native Ruby data structures

| set\_info\_plist\_value | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @kohtenko, @uwehollatz |

## 2 Examples

```ruby hljs
set_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier", value: "com.krausefx.app.beta")

```ruby hljs
set_info_plist_value(path: "./MyApp-Info.plist", key: "NSAppTransportSecurity", subkey: "NSAllowsArbitraryLoads", value: true, output_file_name: "./Info.plist")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `key` | Name of key in plist | |
| `subkey` | Name of subkey in plist | |
| `value` | Value to setup | |
| `path` | Path to plist file you want to update | |
| `output_file_name` | Path to the output file you want to generate | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action set_info_plist_value

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_info_plist_value

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_info_plist_value parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_version_number

- Docs »
- \_Actions »
- get\_version\_number
- Edit on GitHub
- ```

* * *

# get\_version\_number

| get\_version\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @Liquidsoul, @joshdholtz |

## 2 Examples

```ruby hljs
version = get_version_number(xcodeproj: "Project.xcodeproj")

```ruby hljs
version = get_version_number(
xcodeproj: "Project.xcodeproj",
target: "App"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcodeproj` | Path to the Xcode project to read version number from, or its containing directory, optional. If omitted, or if a directory is passed instead, it will use the first Xcode project found within the given directory, or the project root directory if none is passed | |
| `target` | Target name, optional. Will be needed if you have more than one non-test target to avoid being prompted to select one | |
| `configuration` | Configuration name, optional. Will be needed if you have altered the configurations from the default or your version number depends on the configuration selected | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_version_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::VERSION_NUMBER` | The version number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_version_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_version_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_version_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_info_plist_value

- Docs »
- \_Actions »
- get\_info\_plist\_value
- Edit on GitHub
- ```

* * *

# get\_info\_plist\_value

| get\_info\_plist\_value | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @kohtenko |

## 1 Example

```ruby hljs
identifier = get_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `key` | Name of parameter | |
| `path` | Path to plist file you want to read | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_info_plist_value` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GET_INFO_PLIST_VALUE_CUSTOM_VALUE` | The value of the last plist file that was parsed |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_info_plist_value

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_info_plist_value

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_info_plist_value parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_info_plist

- Docs »
- \_Actions »
- update\_info\_plist
- Edit on GitHub
- ```

* * *

# update\_info\_plist

| update\_info\_plist | |
| --- | --- |
| Supported platforms | ios |
| Author | @tobiasstrebitzer |

## 4 Examples

```ruby hljs
update_info_plist( # update app identifier string
plist_path: "path/to/Info.plist",
app_identifier: "com.example.newappidentifier"
)

```ruby hljs
update_info_plist( # Change the Display Name of your app
plist_path: "path/to/Info.plist",
display_name: "MyApp-Beta"
)

```ruby hljs
update_info_plist( # Target a specific `xcodeproj` rather than finding the first available one
xcodeproj: "path/to/Example.proj",
plist_path: "path/to/Info.plist",
display_name: "MyApp-Beta"
)

```ruby hljs
update_info_plist( # Advanced processing: find URL scheme for particular key and replace value
xcodeproj: "path/to/Example.proj",
plist_path: "path/to/Info.plist",
block: proc do |plist|
urlScheme = plist["CFBundleURLTypes"].find{|scheme| scheme["CFBundleURLName"] == "com.acme.default-url-handler"}
urlScheme[:CFBundleURLSchemes] = ["acme-production"]
end
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcodeproj` | Path to your Xcode project | |
| `plist_path` | Path to info plist | |
| `scheme` | Scheme of info plist | |
| `app_identifier` | The App Identifier of your app | \* |
| `display_name` | The Display Name of your app | |
| `block` | A block to process plist with custom logic | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_info_plist

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_info_plist

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_info_plist parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_app_identifier

- Docs »
- \_Actions »
- update\_app\_identifier
- Edit on GitHub
- ```

* * *

# update\_app\_identifier

| update\_app\_identifier | |
| --- | --- |
| Supported platforms | ios |
| Author | @squarefrog, @tobiasstrebitzer |

## 1 Example

```ruby hljs
update_app_identifier(
xcodeproj: "Example.xcodeproj", # Optional path to xcodeproj, will use the first .xcodeproj if not set
plist_path: "Example/Info.plist", # Path to info plist file, relative to xcodeproj
app_identifier: "com.test.example" # The App Identifier
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcodeproj` | Path to your Xcode project | \* |
| `plist_path` | Path to info plist, relative to your Xcode project | |
| `app_identifier` | The app Identifier you want to set | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_app_identifier

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_app_identifier

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_app_identifier parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_build_number

- Docs »
- \_Actions »
- get\_build\_number
- Edit on GitHub
- ```

* * *

# get\_build\_number

>
> You first have to set up your Xcode project, if you haven't done it already:

| get\_build\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @Liquidsoul |

## 1 Example

```ruby hljs
build_number = get_build_number(xcodeproj: "Project.xcodeproj")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | |
| `hide_error_when_versioning_disabled` | Used during `fastlane init` to hide the error message | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_build_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::BUILD_NUMBER` | The build number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_build_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_build_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_build_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/increment_version_number

- Docs »
- \_Actions »
- increment\_version\_number
- Edit on GitHub
- ```

* * *

# increment\_version\_number

>
> You first have to set up your Xcode project, if you haven't done it already:

| increment\_version\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @serluca |
| Returns | The new version number |

## 7 Examples

```ruby hljs
increment_version_number # Automatically increment version number

```ruby hljs
increment_version_number(
bump_type: "patch" # Automatically increment patch version number
)

```ruby hljs
increment_version_number(
bump_type: "minor" # Automatically increment minor version number
)

```ruby hljs
increment_version_number(
bump_type: "major" # Automatically increment major version number
)

```ruby hljs
increment_version_number(
version_number: "2.1.1" # Set a specific version number
)

```ruby hljs
increment_version_number(
version_number: "2.1.1", # specify specific version number (optional, omitting it increments patch version number)
xcodeproj: "./path/to/MyApp.xcodeproj" # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)

```ruby hljs
version = increment_version_number

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `bump_type` | The type of this version bump. Available: patch, minor, major | `bump` |
| `version_number` | Change to a specific version. This will replace the bump type value | |
| `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `increment_version_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::VERSION_NUMBER` | The new version number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action increment_version_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run increment_version_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run increment_version_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_project_team

- Docs »
- \_Actions »
- update\_project\_team
- Edit on GitHub
- ```

* * *

# update\_project\_team

| update\_project\_team | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @lgaches |

## 2 Examples

```ruby hljs
update_project_team

```ruby hljs
update_project_team(
path: "Example.xcodeproj",
teamid: "A3ZZVJ7CNY"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to your Xcode project | \* |
| `targets` | Name of the targets you want to update | |
| `teamid` | The Team ID you want to use | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_project_team

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_project_team

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_project_team parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_app_group_identifiers

- Docs »
- \_Actions »
- update\_app\_group\_identifiers
- Edit on GitHub
- ```

* * *

# update\_app\_group\_identifiers

| update\_app\_group\_identifiers | |
| --- | --- |
| Supported platforms | ios |
| Author | @mathiasAichinger |

## 1 Example

```ruby hljs
update_app_group_identifiers(
entitlements_file: "/path/to/entitlements_file.entitlements",
app_group_identifiers: ["group.your.app.group.identifier"]
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `entitlements_file` | The path to the entitlement file which contains the app group identifiers | |
| `app_group_identifiers` | An Array of unique identifiers for the app groups. Eg. \['group.com.test.testapp'\] | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `update_app_group_identifiers` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::APP_GROUP_IDENTIFIERS` | The new App Group Identifiers |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_app_group_identifiers

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_app_group_identifiers

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_app_group_identifiers parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_ipa_info_plist_value

- Docs »
- \_Actions »
- get\_ipa\_info\_plist\_value
- Edit on GitHub
- ```

* * *

# get\_ipa\_info\_plist\_value

| get\_ipa\_info\_plist\_value | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @johnboiles |
| Returns | Returns the value in the .ipa's Info.plist corresponding to the passed in Key |

## 1 Example

```ruby hljs
get_ipa_info_plist_value(ipa: "path.ipa", key: "KEY_YOU_READ")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `key` | Name of parameter | |
| `ipa` | Path to IPA | \* |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_ipa_info_plist_value` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GET_IPA_INFO_PLIST_VALUE_CUSTOM_VALUE` | The value of the last plist file that was parsed |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_ipa_info_plist_value

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_ipa_info_plist_value

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_ipa_info_plist_value parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/recreate_schemes

- Docs »
- \_Actions »
- recreate\_schemes
- Edit on GitHub
- ```

* * *

# recreate\_schemes

Recreate not shared Xcode project schemes

| recreate\_schemes | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @jerolimov |

## 1 Example

```ruby hljs
recreate_schemes(project: "./path/to/MyApp.xcodeproj")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `project` | The Xcode project | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action recreate_schemes

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run recreate_schemes

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run recreate_schemes parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_url_schemes

- Docs »
- \_Actions »
- update\_url\_schemes
- Edit on GitHub
- ```

* * *

# update\_url\_schemes

>
> For example, you can use this to set a different URL scheme for the alpha or beta version of the app.

| update\_url\_schemes | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @kmikael |

## 2 Examples

```ruby hljs
update_url_schemes(
path: "path/to/Info.plist",
url_schemes: ["com.myapp"]
)

```ruby hljs
update_url_schemes(
path: "path/to/Info.plist",
update_url_schemes: proc do |schemes|
schemes + ["anotherscheme"]
end
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | The Plist file's path | |
| `url_schemes` | The new URL schemes | |
| `update_url_schemes` | Block that is called to update schemes with current schemes passed in as parameter | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_url_schemes

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_url_schemes

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_url_schemes parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/set_build_number_repository

- Docs »
- \_Actions »
- set\_build\_number\_repository
- Edit on GitHub
- ```

* * *

# set\_build\_number\_repository

>
> Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision) and git (uses short hash) and mercurial (uses short hash or revision number).
>
> There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash.

| set\_build\_number\_repository | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @pbrooks, @armadsen, @AndrewSB |

## 2 Examples

```ruby hljs
set_build_number_repository

```ruby hljs
set_build_number_repository(
xcodeproj: "./path/to/MyApp.xcodeproj"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos) | `false` |
| `xcodeproj` | explicitly specify which xcodeproj to use | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action set_build_number_repository

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_build_number_repository

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_build_number_repository parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/set_pod_key

- Docs »
- \_Actions »
- set\_pod\_key
- Edit on GitHub
- ```

* * *

# set\_pod\_key

| set\_pod\_key | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @marcelofabri |

## 1 Example

```ruby hljs
set_pod_key(
key: "APIToken",
value: "1234",
project: "MyProject"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true` |
| `key` | The key to be saved with cocoapods-keys | |
| `value` | The value to be saved with cocoapods-keys | |
| `project` | The project name | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action set_pod_key

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_pod_key

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_pod_key parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_keychain_access_groups

- Docs »
- \_Actions »
- update\_keychain\_access\_groups
- Edit on GitHub
- ```

* * *

# update\_keychain\_access\_groups

| update\_keychain\_access\_groups | |
| --- | --- |
| Supported platforms | ios |
| Author | @yutae |

## 1 Example

```ruby hljs
update_keychain_access_groups(
entitlements_file: "/path/to/entitlements_file.entitlements",
identifiers: ["your.keychain.access.groups.identifiers"]
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `entitlements_file` | The path to the entitlement file which contains the keychain access groups | |
| `identifiers` | An Array of unique identifiers for the keychain access groups. Eg. \['your.keychain.access.groups.identifiers'\] | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `update_keychain_access_groups` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::KEYCHAIN_ACCESS_GROUPS` | The new Keychain Access Groups |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_keychain_access_groups

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_keychain_access_groups

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_keychain_access_groups parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_plist

- Docs »
- \_Actions »
- update\_plist
- Edit on GitHub
- ```

* * *

# update\_plist

| update\_plist | |
| --- | --- |
| Supported platforms | ios |
| Author | @rishabhtayal, @matthiaszarzecki |

## 6 Examples

```ruby hljs
update_plist( # Updates the CLIENT_ID and GOOGLE_APP_ID string entries in the plist-file
plist_path: "path/to/your_plist_file.plist",
block: proc do |plist|
plist[:CLIENT_ID] = "new_client_id"
plist[:GOOGLE_APP_ID] = "new_google_app_id"
end
)

```ruby hljs
update_plist( # Sets a boolean entry
plist_path: "path/to/your_plist_file.plist",
block: proc do |plist|
plist[:boolean_entry] = true
end
)

```ruby hljs
update_plist( # Sets a number entry
plist_path: "path/to/your_plist_file.plist",
block: proc do |plist|
plist[:number_entry] = 13
end
)

```ruby hljs
update_plist( # Sets an array-entry with multiple sub-types
plist_path: "path/to/your_plist_file.plist",
block: proc do |plist|
plist[:array_entry] = ["entry_01", true, 1243]
end
)

```ruby hljs
update_plist( # The block can contain logic too
plist_path: "path/to/your_plist_file.plist",
block: proc do |plist|
if options[:environment] == "production"
plist[:CLIENT_ID] = "new_client_id_production"
else
plist[:CLIENT_ID] = "new_client_id_development"
end
end
)

```ruby hljs
update_plist( # Advanced processing: find URL scheme for particular key and replace value
plist_path: "path/to/Info.plist",
block: proc do |plist|
urlScheme = plist["CFBundleURLTypes"].find{|scheme| scheme["CFBundleURLName"] == "com.acme.default-url-handler"}
urlScheme[:CFBundleURLSchemes] = ["acme-production"]
end
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `plist_path` | Path to plist file | |
| `block` | A block to process plist with custom logic | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_plist

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_plist

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_plist parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/sigh

- Docs »
- \_Actions »
- sigh
- Edit on GitHub
- ```

* * *

# sigh

Alias for the `get_provisioning_profile` action

###### Because you would rather spend your time building stuff than fighting provisioning

_sigh_ can create, renew, download and repair provisioning profiles (with one command). It supports App Store, Ad Hoc, Development and Enterprise profiles and supports nice features, like auto-adding all test devices.

Features •
Usage •
Resign •
How does it work?

# Features

- **Download** the latest provisioning profile for your app
- **Renew** a provisioning profile, when it has expired
- **Repair** a provisioning profile, when it is broken
- **Create** a new provisioning profile, if it doesn't exist already
- Supports **App Store**, **Ad Hoc** and **Development** profiles
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain
- Support for **multiple Teams**
- Support for **Enterprise Profiles**

To automate iOS Push profiles you can use _pem_.

### Why not let Xcode do the work?

- _sigh_ can easily be integrated into your CI-server (e.g. Jenkins)
- Xcode sometimes invalidates all existing profiles
- You have control over what happens
- You still get to have the signing files, which you can then use for your build scripts or store in git

See _sigh_ in action:

# Usage

**Note**: It is recommended to use _match_ according to the codesigning.guide for generating and maintaining your provisioning profiles. Use _sigh_ directly only if you want full control over what's going on and know more about codesigning.

```no-highlight
fastlane sigh

Yes, that's the whole command!

_sigh_ will create, repair and download profiles for the App Store by default.

You can pass your bundle identifier and username like this:

```no-highlight
fastlane sigh -a com.krausefx.app -u username

If you want to generate an **Ad Hoc** profile instead of an App Store profile:

```no-highlight
fastlane sigh --adhoc

If you want to generate a **Development** profile:

```no-highlight
fastlane sigh --development

To generate the profile in a specific directory:

```no-highlight
fastlane sigh -o "~/Certificates/"

To download all your provisioning profiles use

```no-highlight
fastlane sigh download_all

Optionally, use `fastlane sigh download_all --download_xcode_profiles` to also include the Xcode managed provisioning profiles

For a list of available parameters and commands run

```no-highlight
fastlane action sigh

### Advanced

By default, _sigh_ will install the downloaded profile on your machine. If you just want to generate the profile and skip the installation, use the following flag:

```no-highlight
fastlane sigh --skip_install

To save the provisioning profile under a specific name, use the -q option:

```no-highlight
fastlane sigh -a com.krausefx.app -u username -q "myProfile.mobileprovision"

If for some reason you don't want _sigh_ to verify that the code signing identity is installed on your local machine:

```no-highlight
fastlane sigh --skip_certificate_verification

If you need the provisioning profile to be renewed regardless of its state use the `--force` option. This gives you a profile with the maximum lifetime. `--force` will also add all available devices to this profile.

```no-highlight
fastlane sigh --force

By default, _sigh_ will include all certificates on development profiles, and first certificate on other types. If you need to specify which certificate to use you can either use the environment variable `SIGH_CERTIFICATE`, or pass the name or expiry date of the certificate as argument:

```no-highlight
fastlane sigh -c "SunApps GmbH"

### Use with _fastlane_

_sigh_ becomes really interesting when used in _fastlane_ in combination with _cert_.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :beta do
cert
sigh(force: true)
end

`force: true` will make sure to re-generate the provisioning profile on each run.
This will result in _sigh_ always using the correct signing certificate, which is installed on the local machine.

# Repair

_sigh_ can automatically repair all your existing provisioning profiles which are expired or just invalid.

```no-highlight
fastlane sigh repair

# Resign

If you generated your `ipa` file but want to apply a different code signing onto the ipa file, you can use `sigh resign`:

```no-highlight
fastlane sigh resign

_sigh_ will find the ipa file and the provisioning profile for you if they are located in the current folder.

You can pass more information using the command line:

```no-highlight
fastlane sigh resign ./path/app.ipa --signing_identity "iPhone Distribution: Felix Krause" -p "my.mobileprovision"

# Manage

With `sigh manage` you can list all provisioning profiles installed locally.

```no-highlight
fastlane sigh manage

Delete all expired provisioning profiles

```no-highlight
fastlane sigh manage -e

Or delete all `iOS Team Provisioning Profile` by using a regular expression

```no-highlight
fastlane sigh manage -p "iOS\ ?Team Provisioning Profile:"

## Environment Variables

Run `fastlane action sigh` to get a list of all available environment variables.

If you're using _cert_ in combination with _fastlane_ the signing certificate will automatically be selected for you. (make sure to run _cert_ before _sigh_)

# How does it work?

_sigh_ will access the `iOS Dev Center` to download, renew or generate the `.mobileprovision` file. It uses _spaceship_ to communicate with Apple's web services.

## How is my password stored?

_sigh_ uses the CredentialsManager from _fastlane_.

# Tips

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `mobileprovision` files like this:

## App Identifier couldn't be found

If you also want to create a new App Identifier on the Apple Developer Portal, check out _produce_, which does exactly that.

## What happens to my Xcode managed profiles?

_sigh_ will never touch or use the profiles which are created and managed by Xcode. Instead _sigh_ will manage its own set of provisioning profiles.

| sigh | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | The UUID of the profile sigh just fetched/generated |

## 3 Examples

```ruby hljs
get_provisioning_profile

```ruby hljs
sigh # alias for "get_provisioning_profile"

```ruby hljs
get_provisioning_profile(
adhoc: true,
force: true,
filename: "myFile.mobileprovision"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `adhoc` | Setting this flag will generate AdHoc profiles instead of App Store Profiles | `false` |
| `developer_id` | Setting this flag will generate Developer ID profiles instead of App Store Profiles | `false` |
| `development` | Renew the development certificate instead of the production one | `false` |
| `skip_install` | By default, the certificate will be added to your local machine. Setting this flag will skip this action | `false` |
| `force` | Renew provisioning profiles regardless of its state - to automatically add all devices for ad hoc profiles | `false` |
| `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false` |
| `app_identifier` | The bundle identifier of your app | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `provisioning_name` | The name of the profile that is used on the Apple Developer Portal | |
| `ignore_profiles_with_different_name` | Use in combination with :provisioning\_name - when true only profiles matching this exact name will be downloaded | `false` |
| `output_path` | Directory in which the profile should be stored | `.` |
| `cert_id` | The ID of the code signing certificate to use (e.g. 78ADL6LVAA) | |
| `cert_owner_name` | The certificate name to use for new profiles, or to renew with. (e.g. "Felix Krause") | |
| `filename` | Filename to use for the generated provisioning profile (must include .mobileprovision) | |
| `skip_fetch_profiles` | Skips the verification of existing profiles which is useful if you have thousands of profiles | `false` |
| `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false` |
| `skip_certificate_verification` | Skips the verification of the certificates for every existing profiles. This will make sure the provisioning profile can be used on the local machine | \* |
| `platform` | Set the provisioning profile's platform (i.e. ios, tvos, macos, catalyst) | `ios` |
| `readonly` | Only fetch existing profile, don't generate new ones | `false` |
| `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | |
| `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false` |
| `cached_certificates` | A list of cached certificates | |
| `cached_devices` | A list of cached devices | |
| `cached_bundle_ids` | A list of cached bundle ids | |
| `cached_profiles` | A list of cached bundle ids | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `sigh` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SIGH_PROFILE_PATH` | A path in which certificates, key and profile are exported |
| `SharedValues::SIGH_PROFILE_PATHS` | Paths in which certificates, key and profile are exported |
| `SharedValues::SIGH_UUID` | UUID (Universally Unique IDentifier) of a provisioning profile |
| `SharedValues::SIGH_NAME` | The name of the profile |
| `SharedValues::SIGH_PROFILE_TYPE` | The profile type, can be app-store, ad-hoc, development, enterprise, developer-id, can be used in `build_app` as a default value for `export_method` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run sigh

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run sigh parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/match

- Docs »
- \_Actions »
- match
- Edit on GitHub
- ```

* * *

# match

Alias for the `sync_code_signing` action

###### Easily sync your certificates and profiles across your team

A new approach to iOS and macOS code signing: Share one code signing identity across your development team to simplify your codesigning setup and prevent code signing issues.

_match_ is the implementation of the codesigning.guide concept. _match_ creates all required certificates & provisioning profiles and stores them in a separate git repository, Google Cloud, or Amazon S3. Every team member with access to the selected storage can use those credentials for code signing. _match_ also automatically repairs broken and expired credentials. It's the easiest way to share signing credentials across teams

More information on how to get started with codesigning

Why? •
Usage •
Is this secure?

## Why match?

>
> You have to manually renew and download the latest set of provisioning profiles every time you add a new device or a certificate expires. Additionally this requires spending a lot of time when setting up a new machine that will build your app.

For more information about the concept, visit codesigning.guide.

### Why not let Xcode handle all this?

- You have full control over what happens
- You have access to all the certificates and profiles, which are all securely stored in git
- You share one code signing identity across the team to have fewer certificates and profiles
- Xcode sometimes revokes certificates which breaks your setup causing failed builds
- More predictable builds by settings profiles in an explicit way instead of using the `Automatic` setting
- It just works

### What does _match_ do for you?

| | match |
| --- | --- |
| 🔄 | Automatically sync your iOS and macOS keys and profiles across all your team members using git |
| 📦 | Handle all the heavy lifting of creating and storing your certificates and profiles |
| 💻 | Setup codesigning on a new machine in under a minute |
| 🎯 | Designed to work with apps with multiple targets and bundle identifiers |
| 🔒 | You have full control over your files and Git repo, no third party service involved |
| ✨ | Provisioning profile will always match the correct certificate |
| 💥 | Easily reset your existing profiles and certificates if your current account has expired or invalid profiles |
| ♻️ | Automatically renew your provisioning profiles to include all your devices using the `--force` option |
| 👥 | Support for multiple Apple accounts and multiple teams |
| ✨ | Tightly integrated with _fastlane_ to work seamlessly with _gym_ and other build tools |

## Usage

### Setup

1. Optional: Create a **new, shared Apple Developer Portal account**, something like `office@company.com`, that will be shared across your team from now on (for more information visit codesigning.guide)
2. Run the following in your project folder to start using _match_:

```no-highlight
fastlane match init

You'll be asked if you want to store your code signing identities inside a **Git repo**, **Google Cloud** or **Amazon S3**.

#### Git Storage

Use Git Storage to store all code signing identities in a private git repo, owned and operated by you. The files will be encrypted using OpenSSL.

First, enter the URL to your private (!) Git repo (You can create one for free on e.g. GitHub or BitBucket). The URL you enter can be either a `https://` or a `git` URL. `fastlane match init` won't read or modify your certificates or profiles yet, and also won't validate your git URL.

This will create a `Matchfile` in your current directory (or in your `./fastlane/` folder).

Example content (for more advanced setups check out the fastlane section):

```ruby-skip-tests
git_url("https://github.com/fastlane/certificates")

app_identifier("tools.fastlane.app")
username("user@fastlane.tools")

##### Git Storage on GitHub

If your machine is currently using SSH to authenticate with GitHub, you'll want to use a `git` URL, otherwise, you may see an authentication error when you attempt to use match. Alternatively, you can set a basic authorization for _match_:

Using parameter:

```hljs less

Using environment variable:

```hljs lua

match

To generate your base64 key according to RFC 7617, run this:

```hljs apache
echo -n your_github_username:your_personal_access_token | base64

You can find more information about GitHub basic authentication and personal token generation here:

##### Git Storage on GitHub - Deploy keys

If your machine does not have a private key set up for your certificates repository, you can give _match_ a path for one:

##### Git Storage on Azure DevOps

If you're running a pipeline on Azure DevOps and using git storage in a another repository on the same project, you might want to use `bearer` token authentication.

You can find more information about this use case here:

#### Google Cloud Storage

Use Google Cloud Storage for a fully hosted solution for your code signing identities. Certificates are stored on Google Cloud, encrypted using Google managed keys. Everything will be stored on your Google account, inside a storage bucket you provide. You can also directly access the files using the web console.

```ruby-skip-tests
google_cloud_bucket_name("major-key-certificates")

#### Amazon S3

Use Amazon S3 for a fully hosted solution for your code signing identities. Certificates are stored on S3, inside a storage bucket you provide. You can also directly access the files using the web console.

```ruby-skip-tests
s3_bucket("ios-certificates")

### Multiple teams

_match_ can store the codesigning files for multiple development teams:

#### Git Storage

Use one git branch per team. _match_ also supports storing certificates of multiple teams in one repo, by using separate git branches. If you work in multiple teams, make sure to set the `git_branch` parameter to a unique value per team. From there, _match_ will automatically create and use the specified branch for you.

```ruby hljs
match(git_branch: "team1", username: "user@team1.com")
match(git_branch: "team2", username: "user@team2.com")

#### Google Cloud or Amazon S3 Storage

If you use Google Cloud or Amazon S3 Storage, you don't need to do anything manually. Just use Google Cloud or Amazon S3 Storage, and the top level folder will be the team ID.

After running `fastlane match init` you can run the following to generate new certificates and profiles:

```no-highlight
fastlane match appstore

```no-highlight
fastlane match development

This will create a new certificate and provisioning profile (if required) and store them in your selected storage.
If you previously ran _match_ with the configured storage it will automatically install the existing profiles from your storage.

The provisioning profiles are installed in `~/Library/MobileDevice/Provisioning Profiles` while the certificates and private keys are installed in your Keychain.

To get a more detailed output of what _match_ is doing use

```no-highlight
fastlane match --verbose

For a list of all available options run

```no-highlight
fastlane action match

#### Handle multiple targets

_match_ can use the same one Git repository, Google Cloud, or Amazon S3 Storage for all bundle identifiers.

If you have several targets with different bundle identifiers, supply them as a comma-separated list:

```no-highlight
fastlane match appstore -a tools.fastlane.app,tools.fastlane.app.watchkitapp

You can make this even easier using _fastlane_ by creating a `certificates` lane like this:

```ruby hljs
lane :certificates do
match(app_identifier: ["tools.fastlane.app", "tools.fastlane.app.watchkitapp"])
end

Then all your team has to do is run `fastlane certificates` and the keys, certificates and profiles for all targets will be synced.

#### Handle multiple apps per developer/distribution certificate

If you want to use a single developer and/or distribution certificate for multiple apps belonging to the same development team, you may use the same signing identities repository and branch to store the signing identities for your apps:

`Matchfile` example for both App #1 and #2:

```ruby-skip-tests
git_url("https://github.com/example/example-repo.git")
git_branch("master")

_match_ will reuse certificates and will create separate provisioning profiles for each app.

#### Passphrase

_Git Repo storage only_

When running _match_ for the first time on a new machine, it will ask you for the passphrase for the Git repository. This is an additional layer of security: each of the files will be encrypted using `openssl`. Make sure to remember the password, as you'll need it when you run match on a different machine.

To set the passphrase to decrypt your profiles using an environment variable (and avoid the prompt) use `MATCH_PASSWORD`.

#### Migrate from Git Repo to Google Cloud

If you're already using a Git Repo, but would like to switch to using Google Cloud Storage, run the following command to automatically migrate all your existing code signing identities and provisioning profiles

```no-highlight
fastlane match migrate

After a successful migration you can safely delete your Git repo.

#### Google Cloud access control

_Google Cloud Storage only_

There are two cases for reading and writing certificates stored in a Google Cloud storage bucket:

1. Continuous integration jobs. These will authenticate to your Google Cloud project via a service account, and use a `gc_keys.json` file as credentials.
2. Developers on a local workstation. In this case, you should choose whether everyone on your team will create their own `gc_keys.json` file, or whether you want to manage access to the bucket directly using your developers' Google accounts.

When running `fastlane match init` the first time, the setup process will give you the option to create your `gc_keys.json` file. This file contains the authentication credentials needed to access your Google Cloud storage bucket. Make sure to keep that file secret and never add it to version control. We recommend adding `gc_keys.json` to your `.gitignore`

##### Managing developer access via keys

If you want to manage developer access to your certificates via authentication keys, every developer should create their own `gc_keys.json` and add the file to all their work machines. This will give the admin full control over who has read/write access to the given Storage bucket. At the same time it allows your team to revoke a single key if a file gets compromised.

##### Managing developer access via Google accounts

If your developers already have Google accounts and access to your Google Cloud project, you can also manage access to the storage bucket via Cloud Identity and Access Management (IAM). Just set up individual developer accounts or an entire Google Group containing your team as readers and writers on your storage bucket.

You can then specify the Google Cloud project id containing your storage bucket in your `Matchfile`:

```ruby-skip-tests
storage_mode("google_cloud")
google_cloud_bucket_name("my-app-certificates")
google_cloud_project_id("my-app-project")

This lets developers on your team use Application Default Credentials when accessing your storage bucket. After installing the Google Cloud SDK, they only need to run the following command once:

```no-highlight
gcloud auth application-default login

... and log in with their Google account. Then, when they run `fastlane match`, _match_ will use these credentials to read from and write to the storage bucket.

#### New machine

To set up the certificates and provisioning profiles on a new machine, you just run the same command using:

You can also run _match_ in a `readonly` mode to be sure it won't create any new certificates or profiles.

```no-highlightno-highlight
fastlane match development --readonly

We recommend to always use `readonly` mode when running _fastlane_ on CI systems. This can be done using

```ruby hljs
lane :beta do
match(type: "appstore", readonly: is_ci)

gym(scheme: "Release")
end

#### Access Control

A benefit of using _match_ is that it enables you to give the developers of your team access to the code signing certificates without having to give everyone access to the Developer Portal:

1. Run _match_ to store the certificates in a Git repo or Google Cloud Storage
2. Grant access to the Git repo / Google Cloud Storage Bucket to your developers and give them the passphrase (for git storage)
3. The developers can now run _match_ which will install the latest code signing profiles so they can build and sign the application without having to have access to the Apple Developer Portal
4. Every time you run _match_ to update the profiles (e.g. add a new device), all your developers will automatically get the latest profiles when running _match_

If you decide to run _match_ without access to the Developer Portal, make sure to use the `--readonly` option so that the commands don't ask you for the password to the Developer Portal.

The advantage of this approach is that no one in your team will revoke a certificate by mistake, while having all code signing secrets in one location.

#### Folder structure

After running _match_ for the first time, your Git repo or Google Cloud bucket will contain 2 directories:

- The `certs` folder contains all certificates with their private keys
- The `profiles` folder contains all provisioning profiles

Additionally, _match_ creates a nice repo `README.md` for you, making it easy to onboard new team members:

In the case of Google Cloud, the top level folder will be the team ID.

#### fastlane

Add _match_ to your `Fastfile` to automatically fetch the latest code signing certificates with _fastlane_.

```hljs less
match(type: "appstore")

match(type: "development")

match(type: "adhoc",
app_identifier: "tools.fastlane.app")

match(type: "enterprise",
app_identifier: "tools.fastlane.app")

# _match_ should be called before building the app with _gym_
gym
# ...

##### Registering new devices

By using _match_, you'll save a lot of time every time you add new device to your Ad Hoc or Development profiles. Use _match_ in combination with the `register_devices` action.

```ruby hljs
lane :beta do
register_devices(devices_file: "./devices.txt")
match(type: "adhoc", force_for_new_devices: true)
end

By using the `force_for_new_devices` parameter, _match_ will check if the (enabled) device count has changed since the last time you ran _match_, and automatically re-generate the provisioning profile if necessary. You can also use `force: true` to re-generate the provisioning profile on each run.

_**Important:** The `force_for_new_devices` parameter is ignored for App Store provisioning profiles since they don't contain any device information._

If you're not using `Fastfile`, you can also use the `force_for_new_devices` option from the command line:

```no-highlight
fastlane match adhoc --force_for_new_devices

##### Templates (aka: custom entitlements)

_match_ can generate profiles that contain custom entitlements by passing in the entitlement's name with the `template_name` parameter.

```hljs less
match(type: "development",
template_name: "Apple Pay Pass Suppression Development")

### Setup Xcode project

Docs on how to set up your Xcode project

#### To build from the command line using _fastlane_

_match_ automatically pre-fills environment variables with the UUIDs of the correct provisioning profiles, ready to be used in your Xcode project.

More information about how to setup your Xcode project can be found here

#### To build from Xcode manually

This is useful when installing your application on your device using the Development profile.

You can statically select the right provisioning profile in your Xcode project (the name will be `match Development tools.fastlane.app`).

#### Git repo access

There is one tricky part of setting up a CI system to work with _match_, which is enabling the CI to access the repo. Usually you'd just add your CI's public ssh key as a deploy key to your _match_ repo, but since your CI will already likely be using its public ssh key to access the codebase repo, you won't be able to do that.

Some repo hosts might allow you to use the same deploy key for different repos, but GitHub will not. If your host does, you don't need to worry about this, just add your CI's public ssh key as a deploy key for your _match_ repo and scroll down to " _Encryption password_".

There are a few ways around this:

1. Create a new account on your repo host with read-only access to your _match_ repo. Bitrise have a good description of this here.
2. Some CIs allow you to upload your signing credentials manually, but obviously this means that you'll have to re-upload the profiles/keys/certs each time they change.

Neither solution is pretty. It's one of those _trade-off_ things. Do you care more about **not** having an extra account sitting around, or do you care more about having the :sparkles: of auto-syncing of credentials.

#### Git repo encryption password

Once you've decided which approach to take, all that's left to do is to set your encryption password as secret environment variable named `MATCH_PASSWORD`. _match_ will pick this up when it's run.

#### Google Cloud Storage access

Accessing Google Cloud Storage from your CI system requires you to provide the `gc_keys.json` file as part of your build. How you implement this is your decision. You can inject that file during build time.

#### Amazon S3 Storage access

Accessing Amazon S3 Storage from your CI system requires you to provide the `s3_region`, `s3_access_key`, `s3_secret_access_key` and `s3_bucket` options (or environment variables), with keys that has read access to the bucket.

### Nuke

If you never really cared about code signing and have a messy Apple Developer account with a lot of invalid, expired or Xcode managed profiles/certificates, you can use the `match nuke` command to revoke your certificates and provisioning profiles. Don't worry, apps that are already available in the App Store / TestFlight will still work. Builds distributed via Ad Hoc or Enterprise will be disabled after nuking your account, so you'll have to re-upload a new build. After clearing your account you'll start from a clean state, and you can run _match_ to generate your certificates and profiles again.

To revoke all certificates and provisioning profiles for a specific environment:

```no-highlight
fastlane match nuke development
fastlane match nuke distribution
fastlane match nuke enterprise

You'll have to confirm a list of profiles / certificates that will be deleted.

## Advanced Git Storage features

### Change Password

To change the password of your repo and therefore decrypting and encrypting all files run:

```no-highlight
fastlane match change_password

You'll be asked for the new password on all your machines on the next run.

### Import

To import and encrypt a certificate ( `.cer`), the private key ( `.p12`) and the provisioning profiles ( `.mobileprovision` or `.provisionprofile`) into the _match_ repo run:

```no-highlight
fastlane match import

You'll be prompted for the certificate ( `.cer`), the private key ( `.p12`) and the provisioning profiles ( `.mobileprovision` or `.provisionprofile`) paths. _match_ will first validate the certificate ( `.cer`) against the Developer Portal before importing the certificate, the private key and the provisioning profiles into the specified _match_ repository.

However if there is no access to the developer portal but there are certificates, private keys and profiles provided, you can use the `skip_certificate_matching` option to tell _match_ not to verify the certificates. Like this:

```no-highlight
fastlane match import --skip_certificate_matching true

This will skip login to Apple Developer Portal and will import the provided certificate, private key and profile directly to the certificates repo.

Please be careful when using this option and ensure the certificates and profiles match the type (development, adhoc, appstore, enterprise, developer\_id) and are not revoked or expired.

### Manual Decrypt

If you want to manually decrypt or encrypt a file, you can use the companion script `match_file`:

```no-highlight

The password will be asked interactively.

_**Note:** You may need to swap double quotes `"` for single quotes `'` if your match password contains an exclamation mark `!`._

#### Export Distribution Certificate and Private Key as Single .p12 File

_match_ stores the certificate ( `.cer`) and the private key ( `.p12`) files separately. The following steps will repackage the separate certificate and private key into a single `.p12` file.

openssl x509 -inform der -in cert.der -out cert.pem

Generate an encrypted p12 file with the same or new password:

## Is this secure?

### Git

Both your keys and provisioning profiles are encrypted using OpenSSL using a passphrase.

Storing your private keys in a Git repo may sound off-putting at first. We did an analysis of potential security issues, see section below.

### Google Cloud Storage

All your keys and provisioning profiles are encrypted using Google managed keys.

### What could happen if someone stole a private key?

If attackers would have your certificate and provisioning profile, they could codesign an application with the same bundle identifier.

What's the worst that could happen for each of the profile types?

#### App Store Profiles

An App Store profile can't be used for anything as long as it's not re-signed by Apple. The only way to get an app resigned is to submit an app for review which could take anywhere from 24 hours to a few days (checkout appreviewtimes.com for up-to-date expectations). Attackers could only submit an app for review, if they also got access to your App Store Connect credentials (which are not stored in git, but in your local keychain). Additionally you get an email notification every time a build gets uploaded to cancel the submission even before your app gets into the review stage.

#### Development and Ad Hoc Profiles

In general those profiles are harmless as they can only be used to install a signed application on a small subset of devices. To add new devices, the attacker would also need your Apple Developer Portal credentials (which are not stored in git, but in your local keychain).

#### Enterprise Profiles

Attackers could use an In-House profile to distribute signed application to a potentially unlimited number of devices. All this would run under your company name and it could eventually lead to Apple revoking your In-House account. However it is very easy to revoke a certificate to remotely break the app on all devices.

Because of the potentially dangerous nature of In-House profiles please use _match_ with enterprise profiles with caution, ensure your git repository is private and use a secure password.

#### To sum up

- You have full control over the access list of your Git repo, no third party service involved
- Even if your certificates are leaked, they can't be used to cause any harm without your App Store Connect login credentials
- Use In-House enterprise profile with _match_ with caution
- If you use GitHub or Bitbucket we encourage enabling 2 factor authentication for all accounts that have access to the certificates repo
- The complete source code of _match_ is fully open source on GitHub

| match | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 4 Examples

```ruby hljs
sync_code_signing(type: "appstore", app_identifier: "tools.fastlane.app")

```ruby hljs
sync_code_signing(type: "development", readonly: true)

```ruby hljs
sync_code_signing(app_identifier: ["tools.fastlane.app", "tools.fastlane.sleepy"])

```ruby hljs
match # alias for "sync_code_signing"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `type` | Define the profile type, can be appstore, adhoc, development, enterprise, developer\_id, mac\_installer\_distribution, developer\_id\_installer | `development` |
| `additional_cert_types` | Create additional cert types needed for macOS installers (valid values: mac\_installer\_distribution, developer\_id\_installer) | |
| `readonly` | Only fetch existing certificates and profiles, don't generate new ones | `false` |
| `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | \* |
| `skip_provisioning_profiles` | Skip syncing provisioning profiles | `false` |
| `app_identifier` | The bundle identifier(s) of your app (comma-separated string or array of strings) | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `storage_mode` | Define where you want to store your certificates | `git` |
| `git_url` | URL to the git repo containing all the certificates | |
| `git_branch` | Specific git branch to use | `master` |
| `git_full_name` | git user full name to commit | |
| `git_user_email` | git user email to commit | |
| `shallow_clone` | Make a shallow clone of the repository (truncate the history to 1 revision) | `false` |
| `clone_branch_directly` | Clone just the branch specified, instead of the whole repo. This requires that the branch already exists. Otherwise the command will fail | `false` |
| `git_basic_authorization` | Use a basic authorization header to access the git repo (e.g.: access via HTTPS, GitHub Actions, etc), usually a string in Base64 | |
| `git_bearer_authorization` | Use a bearer authorization header to access the git repo (e.g.: access to an Azure DevOps repository), usually a string in Base64 | |
| `git_private_key` | Use a private key to access the git repo (e.g.: access to GitHub repository via Deploy keys), usually a id\_rsa named file or the contents hereof | |
| `google_cloud_bucket_name` | Name of the Google Cloud Storage bucket to use | |
| `google_cloud_keys_file` | Path to the gc\_keys.json file | |
| `google_cloud_project_id` | ID of the Google Cloud project to use for authentication | |
| `skip_google_cloud_account_confirmation` | Skips confirming to use the system google account | `false` |
| `s3_region` | Name of the S3 region | |
| `s3_access_key` | S3 access key | |
| `s3_secret_access_key` | S3 secret access key | |
| `s3_bucket` | Name of the S3 bucket | |
| `s3_object_prefix` | Prefix to be used on all objects uploaded to S3 | |
| `s3_skip_encryption` | Skip encryption of all objects uploaded to S3. WARNING: only enable this on S3 buckets with sufficiently restricted permissions and server-side encryption enabled. See | `false` |
| `gitlab_project` | GitLab Project Path (i.e. 'gitlab-org/gitlab') | |
| `gitlab_host` | GitLab Host (i.e. 'https://gitlab.com') | `https://gitlab.com` |
| `job_token` | GitLab CI\_JOB\_TOKEN | |
| `private_token` | GitLab Access Token | |
| `keychain_name` | Keychain the items should be imported to | `login.keychain` |
| `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | |
| `force` | Renew the provisioning profiles every time you run match | `false` |
| `force_for_new_devices` | Renew the provisioning profiles if the device count on the developer portal has changed. Ignored for profile types 'appstore' and 'developer\_id' | `false` |
| `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false` |
| `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false` |
| `certificate_id` | Select certificate by id. Useful if multiple certificates are stored in one place | |
| `force_for_new_certificates` | Renew the provisioning profiles if the certificate count on the developer portal has changed. Works only for the 'development' provisioning profile type. Requires 'include\_all\_certificates' option to be 'true' | `false` |
| `skip_confirmation` | Disables confirmation prompts during nuke, answering them with yes | `false` |
| `safe_remove_certs` | Remove certs from repository during nuke without revoking them on the developer portal | `false` |
| `skip_docs` | Skip generation of a README.md for the created git repository | `false` |
| `platform` | Set the provisioning profile's platform to work with (i.e. ios, tvos, macos, catalyst) | \* |
| `derive_catalyst_app_identifier` | Enable this if you have the Mac Catalyst capability enabled and your project was created with Xcode 11.3 or earlier. Prepends 'maccatalyst.' to the app identifier for the provisioning profile mapping | `false` |
| `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | |
| `profile_name` | A custom name for the provisioning profile. This will replace the default provisioning profile name if specified | |
| `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false` |
| `skip_certificate_matching` | Set to true if there is no access to Apple developer portal but there are certificates, keys and profiles provided. Only works with match import action | `false` |
| `output_path` | Path in which to export certificates, key and profile | |
| `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false` |
| `verbose` | Print out extra information and all commands | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `match` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::MATCH_PROVISIONING_PROFILE_MAPPING` | The match provisioning profile mapping |
| `SharedValues::SIGH_PROFILE_TYPE` | The profile type, can be app-store, ad-hoc, development, enterprise, can be used in `build_app` as a default value for `export_method` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run match

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run match parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/cert

- Docs »
- \_Actions »
- cert
- Edit on GitHub
- ```

* * *

# cert

Alias for the `get_certificates` action

Why? •
Usage •
How does it work? •
Tips

##### _cert_ is part of fastlane: The easiest way to automate beta deployments and releases for your iOS and Android apps.

In the gif we used `cert && sigh`, which will first create an iOS code signing certificate and then a provisioning profile for your app if _cert_ succeeded.

# Usage

**Note**: It is recommended to use _match_ according to the codesigning.guide for generating and maintaining your certificates. Use _cert_ directly only if you want full control over what's going on and know more about codesigning.

```no-highlight
fastlane cert

This will check if any of the available signing certificates is installed on your local machine.

Only if a new certificate needs to be created, _cert_ will

- Create a new private key
- Create a new signing request
- Generate, downloads and installs the certificate
- Import all the generated files into your Keychain

_cert_ will never revoke your existing certificates. If you can't create any more certificates, _cert_ will raise an exception, which means, you have to revoke one of the existing certificates to make room for a new one.

You can pass your Apple ID:

```no-highlight
fastlane cert -u cert@krausefx.com

For a list of available commands run

```no-highlight
fastlane action cert

Keep in mind, there is no way for _cert_ to download existing certificates + private keys from the Apple Developer Portal, as the private key never leaves your computer.

## Environment Variables

Run `fastlane action cert` to get a list of all available environment variables.

## Use with _sigh_

_cert_ becomes really interesting when used in _fastlane_ in combination with _sigh_.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :beta do
cert
sigh(force: true)
end

`force: true` will make sure to re-generate the provisioning profile on each run.
This will result in _sigh_ always using the correct signing certificate, which is installed on the local machine.

## How is my password stored?

_cert_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

# Tips

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `mobileprovision` files like this:

| cert | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
get_certificates

```ruby hljs
cert # alias for "get_certificates"

```ruby hljs
get_certificates(
development: true,
username: "user@email.com"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `development` | Create a development certificate instead of a distribution one | `false` |
| `type` | Create specific certificate type (takes precedence over :development) | |
| `force` | Create a certificate even if an existing certificate exists | `false` |
| `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `filename` | The filename of certificate to store | |
| `output_path` | The path to a directory in which all certificates and private keys should be stored | `.` |
| `keychain_path` | Path to a custom keychain | \* |
| `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | |
| `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false` |
| `platform` | Set the provisioning profile's platform (ios, macos, tvos) | `ios` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `cert` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::CERT_FILE_PATH` | The path to the certificate |
| `SharedValues::CERT_CERTIFICATE_ID` | The id of the certificate |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run cert

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run cert parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/import_certificate

- Docs »
- \_Actions »
- import\_certificate
- Edit on GitHub
- ```

* * *

# import\_certificate

| import\_certificate | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @gin0606 |

## 3 Examples

```ruby hljs
import_certificate(certificate_path: "certs/AppleWWDRCA6.cer")

```ruby hljs
import_certificate(
certificate_path: "certs/dist.p12",
certificate_password: ENV["CERTIFICATE_PASSWORD"] || "default"
)

```ruby hljs
import_certificate(
certificate_path: "certs/development.cer"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `certificate_path` | Path to certificate | |
| `certificate_password` | Certificate password | `''` |
| `keychain_name` | Keychain the items should be imported to | |
| `keychain_path` | Path to the Keychain file to which the items should be imported | |
| `keychain_password` | The password for the keychain. Note that for the login keychain this is your user's password | |
| `log_output` | If output should be logged to the console | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action import_certificate

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import_certificate

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import_certificate parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_project_provisioning

- Docs »
- \_Actions »
- update\_project\_provisioning
- Edit on GitHub
- ```

* * *

# update\_project\_provisioning

>
> This action retrieves a provisioning profile UUID from a provisioning profile ( `.mobileprovision`) to set up the Xcode projects' code signing settings in `*.xcodeproj/project.pbxproj`.
>
> The `:target_filter` value can be used to only update code signing for the specified targets.
>
> The `:build_configuration` value can be used to only update code signing for the specified build configurations of the targets passing through the `:target_filter`.
>
> Example usage is the WatchKit Extension or WatchKit App, where you need separate provisioning profiles.
>
> Example: `update_project_provisioning(xcodeproj: "..", target_filter: ".*WatchKit App.*")`.

| update\_project\_provisioning | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @tobiasstrebitzer, @czechboy0 |

## 1 Example

```ruby hljs
update_project_provisioning(
xcodeproj: "Project.xcodeproj",
profile: "./watch_app_store.mobileprovision", # optional if you use sigh
target_filter: ".*WatchKit Extension.*", # matches name or type of a target
build_configuration: "Release",
code_signing_identity: "iPhone Development" # optionally specify the codesigning identity
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcodeproj` | Path to your Xcode project | |
| `profile` | Path to provisioning profile (.mobileprovision) | \* |
| `target_filter` | A filter for the target name. Use a standard regex | |
| `build_configuration_filter` | Legacy option, use 'target\_filter' instead | |
| `build_configuration` | A filter for the build configuration name. Use a standard regex. Applied to all configurations if not specified | |
| `certificate` | Path to apple root certificate | `/tmp/AppleIncRootCertificate.cer` |
| `code_signing_identity` | Code sign identity for build configuration | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_project_provisioning

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_project_provisioning

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_project_provisioning parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/resign

- Docs »
- \_Actions »
- resign
- Edit on GitHub
- ```

* * *

# resign

Codesign an existing ipa file

| resign | |
| --- | --- |
| Supported platforms | ios |
| Author | @lmirosevic |

## 2 Examples

```ruby hljs
resign(
ipa: "path/to/ipa", # can omit if using the `ipa` action
signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
provisioning_profile: "path/to/profile", # can omit if using the _sigh_ action
)

```ruby hljs
# You may provide multiple provisioning profiles if the application contains nested
# applications or app extensions, which need their own provisioning profile.
# You can do so by passing an array of provisioning profile strings or a hash
# that associates provisioning profile values to bundle identifier keys.
resign(
ipa: "path/to/ipa", # can omit if using the `ipa` action
signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
provisioning_profile: {

}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `ipa` | Path to the ipa file to resign. Optional if you use the _gym_ or _xcodebuild_ action | \* |
| `signing_identity` | Code signing identity to use. e.g. `iPhone Distribution: Luka Mirosevic (0123456789)` | |
| `entitlements` | Path to the entitlement file to use, e.g. `myApp/MyApp.entitlements` | |
| `provisioning_profile` | Path to your provisioning\_profile. Optional if you use _sigh_ | \* |
| `version` | Version number to force resigned ipa to use. Updates both `CFBundleShortVersionString` and `CFBundleVersion` values in `Info.plist`. Applies for main app and all nested apps or extensions | |
| `display_name` | Display name to force resigned ipa to use | |
| `short_version` | Short version string to force resigned ipa to use ( `CFBundleShortVersionString`) | |
| `bundle_version` | Bundle version to force resigned ipa to use ( `CFBundleVersion`) | |
| `bundle_id` | Set new bundle ID during resign ( `CFBundleIdentifier`) | |
| `use_app_entitlements` | Extract app bundle codesigning entitlements and combine with entitlements from new provisioning profile | |
| `keychain_path` | Provide a path to a keychain file that should be used by `/usr/bin/codesign` | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action resign

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run resign

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run resign parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/register_devices

- Docs »
- \_Actions »
- register\_devices
- Edit on GitHub
- ```

* * *

# register\_devices

>
> This is an optimistic action, in that it will only ever add new devices to the member center, and never remove devices. If a device which has already been registered within the member center is not passed to this action, it will be left alone in the member center and continue to work.
>
> The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `username` option, or by setting the env variable `ENV['DELIVER_USER']`.

| register\_devices | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @lmirosevic |

## 4 Examples

```ruby hljs
register_devices(
devices: {

}
) # Simply provide a list of devices as a Hash

```ruby hljs
register_devices(
devices_file: "./devices.txt"
) # Alternatively provide a standard UDID export .txt file, see the Apple Sample (http://devimages.apple.com/downloads/devices/Multiple-Upload-Samples.zip)

```ruby hljs
register_devices(
devices_file: "./devices.txt", # You must pass in either `devices_file` or `devices`.
team_id: "XXXXXXXXXX", # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
username: "luka@goonbee.com" # Optional, lets you override the Apple Member Center username.
)

},
platform: "mac"
) # Register devices for Mac

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `devices` | A hash of devices, with the name as key and the UDID as value | |
| `devices_file` | Provide a path to a file with the devices to register. For the format of the file see the examples | |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `username` | Optional: Your Apple ID | \* |
| `platform` | The platform to use (optional) | `ios` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action register_devices

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run register_devices

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run register_devices parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/register_device

- Docs »
- \_Actions »
- register\_device
- Edit on GitHub
- ```

* * *

# register\_device

>
> This is an optimistic action, in that it will only ever add a device to the member center. If the device has already been registered within the member center, it will be left alone in the member center.
>
> The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `:username` option.

| register\_device | |
| --- | --- |
| Supported platforms | ios |
| Author | @pvinis |

## 2 Examples

```ruby hljs
register_device(
name: "Luka iPhone 6",
udid: "1234567890123456789012345678901234567890"
) # Simply provide the name and udid of the device

```ruby hljs
register_device(
name: "Luka iPhone 6",
udid: "1234567890123456789012345678901234567890",
team_id: "XXXXXXXXXX", # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
username: "luka@goonbee.com" # Optional, lets you override the Apple Member Center username.
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `name` | Provide the name of the device to register as | |
| `platform` | Provide the platform of the device to register as (ios, mac) | `ios` |
| `udid` | Provide the UDID of the device to register as | |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `username` | Optional: Your Apple ID | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action register_device

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run register_device

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run register_device parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_provisioning_profile

- Docs »
- \_Actions »
- get\_provisioning\_profile
- Edit on GitHub
- ```

* * *

# get\_provisioning\_profile

Generates a provisioning profile, saving it in the current folder (via _sigh_)

###### Because you would rather spend your time building stuff than fighting provisioning

_sigh_ can create, renew, download and repair provisioning profiles (with one command). It supports App Store, Ad Hoc, Development and Enterprise profiles and supports nice features, like auto-adding all test devices.

Features •
Usage •
Resign •
How does it work?

# Features

- **Download** the latest provisioning profile for your app
- **Renew** a provisioning profile, when it has expired
- **Repair** a provisioning profile, when it is broken
- **Create** a new provisioning profile, if it doesn't exist already
- Supports **App Store**, **Ad Hoc** and **Development** profiles
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain
- Support for **multiple Teams**
- Support for **Enterprise Profiles**

To automate iOS Push profiles you can use _pem_.

### Why not let Xcode do the work?

- _sigh_ can easily be integrated into your CI-server (e.g. Jenkins)
- Xcode sometimes invalidates all existing profiles
- You have control over what happens
- You still get to have the signing files, which you can then use for your build scripts or store in git

See _sigh_ in action:

# Usage

**Note**: It is recommended to use _match_ according to the codesigning.guide for generating and maintaining your provisioning profiles. Use _sigh_ directly only if you want full control over what's going on and know more about codesigning.

```no-highlight
fastlane sigh

Yes, that's the whole command!

_sigh_ will create, repair and download profiles for the App Store by default.

You can pass your bundle identifier and username like this:

```no-highlight
fastlane sigh -a com.krausefx.app -u username

If you want to generate an **Ad Hoc** profile instead of an App Store profile:

```no-highlight
fastlane sigh --adhoc

If you want to generate a **Development** profile:

```no-highlight
fastlane sigh --development

To generate the profile in a specific directory:

```no-highlight
fastlane sigh -o "~/Certificates/"

To download all your provisioning profiles use

```no-highlight
fastlane sigh download_all

Optionally, use `fastlane sigh download_all --download_xcode_profiles` to also include the Xcode managed provisioning profiles

For a list of available parameters and commands run

```no-highlight
fastlane action sigh

### Advanced

By default, _sigh_ will install the downloaded profile on your machine. If you just want to generate the profile and skip the installation, use the following flag:

```no-highlight
fastlane sigh --skip_install

To save the provisioning profile under a specific name, use the -q option:

```no-highlight
fastlane sigh -a com.krausefx.app -u username -q "myProfile.mobileprovision"

If for some reason you don't want _sigh_ to verify that the code signing identity is installed on your local machine:

```no-highlight
fastlane sigh --skip_certificate_verification

If you need the provisioning profile to be renewed regardless of its state use the `--force` option. This gives you a profile with the maximum lifetime. `--force` will also add all available devices to this profile.

```no-highlight
fastlane sigh --force

By default, _sigh_ will include all certificates on development profiles, and first certificate on other types. If you need to specify which certificate to use you can either use the environment variable `SIGH_CERTIFICATE`, or pass the name or expiry date of the certificate as argument:

```no-highlight
fastlane sigh -c "SunApps GmbH"

### Use with _fastlane_

_sigh_ becomes really interesting when used in _fastlane_ in combination with _cert_.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :beta do
cert
sigh(force: true)
end

`force: true` will make sure to re-generate the provisioning profile on each run.
This will result in _sigh_ always using the correct signing certificate, which is installed on the local machine.

# Repair

_sigh_ can automatically repair all your existing provisioning profiles which are expired or just invalid.

```no-highlight
fastlane sigh repair

# Resign

If you generated your `ipa` file but want to apply a different code signing onto the ipa file, you can use `sigh resign`:

```no-highlight
fastlane sigh resign

_sigh_ will find the ipa file and the provisioning profile for you if they are located in the current folder.

You can pass more information using the command line:

```no-highlight
fastlane sigh resign ./path/app.ipa --signing_identity "iPhone Distribution: Felix Krause" -p "my.mobileprovision"

# Manage

With `sigh manage` you can list all provisioning profiles installed locally.

```no-highlight
fastlane sigh manage

Delete all expired provisioning profiles

```no-highlight
fastlane sigh manage -e

Or delete all `iOS Team Provisioning Profile` by using a regular expression

```no-highlight
fastlane sigh manage -p "iOS\ ?Team Provisioning Profile:"

## Environment Variables

Run `fastlane action sigh` to get a list of all available environment variables.

If you're using _cert_ in combination with _fastlane_ the signing certificate will automatically be selected for you. (make sure to run _cert_ before _sigh_)

# How does it work?

_sigh_ will access the `iOS Dev Center` to download, renew or generate the `.mobileprovision` file. It uses _spaceship_ to communicate with Apple's web services.

## How is my password stored?

_sigh_ uses the CredentialsManager from _fastlane_.

# Tips

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `mobileprovision` files like this:

## App Identifier couldn't be found

If you also want to create a new App Identifier on the Apple Developer Portal, check out _produce_, which does exactly that.

## What happens to my Xcode managed profiles?

_sigh_ will never touch or use the profiles which are created and managed by Xcode. Instead _sigh_ will manage its own set of provisioning profiles.

| get\_provisioning\_profile | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |
| Returns | The UUID of the profile sigh just fetched/generated |

## 3 Examples

```ruby hljs
get_provisioning_profile

```ruby hljs
sigh # alias for "get_provisioning_profile"

```ruby hljs
get_provisioning_profile(
adhoc: true,
force: true,
filename: "myFile.mobileprovision"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `adhoc` | Setting this flag will generate AdHoc profiles instead of App Store Profiles | `false` |
| `developer_id` | Setting this flag will generate Developer ID profiles instead of App Store Profiles | `false` |
| `development` | Renew the development certificate instead of the production one | `false` |
| `skip_install` | By default, the certificate will be added to your local machine. Setting this flag will skip this action | `false` |
| `force` | Renew provisioning profiles regardless of its state - to automatically add all devices for ad hoc profiles | `false` |
| `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false` |
| `app_identifier` | The bundle identifier of your app | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `provisioning_name` | The name of the profile that is used on the Apple Developer Portal | |
| `ignore_profiles_with_different_name` | Use in combination with :provisioning\_name - when true only profiles matching this exact name will be downloaded | `false` |
| `output_path` | Directory in which the profile should be stored | `.` |
| `cert_id` | The ID of the code signing certificate to use (e.g. 78ADL6LVAA) | |
| `cert_owner_name` | The certificate name to use for new profiles, or to renew with. (e.g. "Felix Krause") | |
| `filename` | Filename to use for the generated provisioning profile (must include .mobileprovision) | |
| `skip_fetch_profiles` | Skips the verification of existing profiles which is useful if you have thousands of profiles | `false` |
| `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false` |
| `skip_certificate_verification` | Skips the verification of the certificates for every existing profiles. This will make sure the provisioning profile can be used on the local machine | \* |
| `platform` | Set the provisioning profile's platform (i.e. ios, tvos, macos, catalyst) | `ios` |
| `readonly` | Only fetch existing profile, don't generate new ones | `false` |
| `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | |
| `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false` |
| `cached_certificates` | A list of cached certificates | |
| `cached_devices` | A list of cached devices | |
| `cached_bundle_ids` | A list of cached bundle ids | |
| `cached_profiles` | A list of cached bundle ids | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_provisioning_profile` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SIGH_PROFILE_PATH` | A path in which certificates, key and profile are exported |
| `SharedValues::SIGH_PROFILE_PATHS` | Paths in which certificates, key and profile are exported |
| `SharedValues::SIGH_UUID` | UUID (Universally Unique IDentifier) of a provisioning profile |
| `SharedValues::SIGH_NAME` | The name of the profile |
| `SharedValues::SIGH_PROFILE_TYPE` | The profile type, can be app-store, ad-hoc, development, enterprise, developer-id, can be used in `build_app` as a default value for `export_method` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_provisioning_profile

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_provisioning_profile

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_provisioning_profile parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_certificates

- Docs »
- \_Actions »
- get\_certificates
- Edit on GitHub
- ```

* * *

# get\_certificates

Create new iOS code signing certificates (via _cert_)

Why? •
Usage •
How does it work? •
Tips

##### _cert_ is part of fastlane: The easiest way to automate beta deployments and releases for your iOS and Android apps.

In the gif we used `cert && sigh`, which will first create an iOS code signing certificate and then a provisioning profile for your app if _cert_ succeeded.

# Usage

**Note**: It is recommended to use _match_ according to the codesigning.guide for generating and maintaining your certificates. Use _cert_ directly only if you want full control over what's going on and know more about codesigning.

```no-highlight
fastlane cert

This will check if any of the available signing certificates is installed on your local machine.

Only if a new certificate needs to be created, _cert_ will

- Create a new private key
- Create a new signing request
- Generate, downloads and installs the certificate
- Import all the generated files into your Keychain

_cert_ will never revoke your existing certificates. If you can't create any more certificates, _cert_ will raise an exception, which means, you have to revoke one of the existing certificates to make room for a new one.

You can pass your Apple ID:

```no-highlight
fastlane cert -u cert@krausefx.com

For a list of available commands run

```no-highlight
fastlane action cert

Keep in mind, there is no way for _cert_ to download existing certificates + private keys from the Apple Developer Portal, as the private key never leaves your computer.

## Environment Variables

Run `fastlane action cert` to get a list of all available environment variables.

## Use with _sigh_

_cert_ becomes really interesting when used in _fastlane_ in combination with _sigh_.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :beta do
cert
sigh(force: true)
end

`force: true` will make sure to re-generate the provisioning profile on each run.
This will result in _sigh_ always using the correct signing certificate, which is installed on the local machine.

## How is my password stored?

_cert_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

# Tips

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install ProvisionQL.

It will show you `mobileprovision` files like this:

| get\_certificates | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
get_certificates

```ruby hljs
cert # alias for "get_certificates"

```ruby hljs
get_certificates(
development: true,
username: "user@email.com"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `development` | Create a development certificate instead of a distribution one | `false` |
| `type` | Create specific certificate type (takes precedence over :development) | |
| `force` | Create a certificate even if an existing certificate exists | `false` |
| `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `filename` | The filename of certificate to store | |
| `output_path` | The path to a directory in which all certificates and private keys should be stored | `.` |
| `keychain_path` | Path to a custom keychain | \* |
| `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | |
| `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false` |
| `platform` | Set the provisioning profile's platform (ios, macos, tvos) | `ios` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_certificates` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::CERT_FILE_PATH` | The path to the certificate |
| `SharedValues::CERT_CERTIFICATE_ID` | The id of the certificate |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_certificates

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_certificates

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_certificates parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/notarize

- Docs »
- \_Actions »
- notarize
- Edit on GitHub
- ```

* * *

# notarize

Notarizes a macOS app

| notarize | |
| --- | --- |
| Supported platforms | mac |
| Author | @zeplin |

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `package` | Path to package to notarize, e.g. .app bundle or disk image | |
| `use_notarytool` | Whether to `xcrun notarytool` or `xcrun altool` | \* |
| `try_early_stapling` | Whether to try early stapling while the notarization request is in progress | `false` |
| `skip_stapling` | Do not staple the notarization ticket to the artifact; useful for single file executables and ZIP archives | `false` |
| `bundle_id` | Bundle identifier to uniquely identify the package | |
| `username` | Apple ID username | \* |
| `asc_provider` | Provider short name for accounts associated with multiple providers | |
| `print_log` | Whether to print notarization log file, listing issues on failure and warnings on success | `false` |
| `verbose` | Whether to log requests | `false` |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action notarize

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run notarize

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run notarize parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_code_signing_settings

- Docs »
- \_Actions »
- update\_code\_signing\_settings
- Edit on GitHub
- ```

* * *

# update\_code\_signing\_settings

| update\_code\_signing\_settings | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @mathiasAichinger, @hjanuschka, @p4checo, @portellaa, @aeons, @att55, @abcdev |
| Returns | The current status (boolean) of codesigning after modification |

## 3 Examples

```ruby hljs
# manual code signing
update_code_signing_settings(
use_automatic_signing: false,
path: "demo-project/demo/demo.xcodeproj"
)

# automatic code signing
```ruby hljs
update_code_signing_settings(
use_automatic_signing: true,
path: "demo-project/demo/demo.xcodeproj"
)

# more advanced manual code signing
```ruby hljs
update_code_signing_settings(
use_automatic_signing: false,
path: "demo-project/demo/demo.xcodeproj",
team_id: "QABC123DEV",
bundle_identifier: "com.demoapp.QABC123DEV",
code_sign_identity: "iPhone Distribution",
sdk: "iphoneos*",
profile_name: "Demo App Deployment Profile",
entitlements_file_path: "Demo App/generated/New.entitlements"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to your Xcode project | \* |
| `use_automatic_signing` | Defines if project should use automatic signing | `false` |
| `sdk` | Build target SDKs (iphoneos _, macosx_, iphonesimulator\*) | |
| `team_id` | Team ID, is used when upgrading project | |
| `targets` | Specify targets you want to toggle the signing mech. (default to all targets) | |
| `build_configurations` | Specify build\_configurations you want to toggle the signing mech. (default to all configurations) | |
| `code_sign_identity` | Code signing identity type (iPhone Developer, iPhone Distribution) | |
| `entitlements_file_path` | Path to your entitlements file | |
| `profile_name` | Provisioning profile name to use for code signing | |
| `profile_uuid` | Provisioning profile UUID to use for code signing | |
| `bundle_identifier` | Application Product Bundle Identifier | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_code_signing_settings

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_code_signing_settings

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_code_signing_settings parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/match_nuke

- Docs »
- \_Actions »
- match\_nuke
- Edit on GitHub
- ```

* * *

# match\_nuke

>
> Don't worry, apps that are already available in the App Store / TestFlight will still work.
>
> Builds distributed via Ad Hoc or Enterprise will be disabled after nuking your account, so you'll have to re-upload a new build.
>
> After clearing your account you'll start from a clean state, and you can run match to generate your certificates and profiles again.
>
> More information:

| match\_nuke | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @crazymanish |

## 2 Examples

```ruby hljs
match_nuke(type: "development")

```ruby hljs
match_nuke(type: "development", api_key: app_store_connect_api_key)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `type` | Define the profile type, can be appstore, adhoc, development, enterprise, developer\_id, mac\_installer\_distribution, developer\_id\_installer | `development` |
| `additional_cert_types` | Create additional cert types needed for macOS installers (valid values: mac\_installer\_distribution, developer\_id\_installer) | |
| `readonly` | Only fetch existing certificates and profiles, don't generate new ones | `false` |
| `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | \* |
| `skip_provisioning_profiles` | Skip syncing provisioning profiles | `false` |
| `app_identifier` | The bundle identifier(s) of your app (comma-separated string or array of strings) | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `storage_mode` | Define where you want to store your certificates | `git` |
| `git_url` | URL to the git repo containing all the certificates | |
| `git_branch` | Specific git branch to use | `master` |
| `git_full_name` | git user full name to commit | |
| `git_user_email` | git user email to commit | |
| `shallow_clone` | Make a shallow clone of the repository (truncate the history to 1 revision) | `false` |
| `clone_branch_directly` | Clone just the branch specified, instead of the whole repo. This requires that the branch already exists. Otherwise the command will fail | `false` |
| `git_basic_authorization` | Use a basic authorization header to access the git repo (e.g.: access via HTTPS, GitHub Actions, etc), usually a string in Base64 | |
| `git_bearer_authorization` | Use a bearer authorization header to access the git repo (e.g.: access to an Azure DevOps repository), usually a string in Base64 | |
| `git_private_key` | Use a private key to access the git repo (e.g.: access to GitHub repository via Deploy keys), usually a id\_rsa named file or the contents hereof | |
| `google_cloud_bucket_name` | Name of the Google Cloud Storage bucket to use | |
| `google_cloud_keys_file` | Path to the gc\_keys.json file | |
| `google_cloud_project_id` | ID of the Google Cloud project to use for authentication | |
| `skip_google_cloud_account_confirmation` | Skips confirming to use the system google account | `false` |
| `s3_region` | Name of the S3 region | |
| `s3_access_key` | S3 access key | |
| `s3_secret_access_key` | S3 secret access key | |
| `s3_bucket` | Name of the S3 bucket | |
| `s3_object_prefix` | Prefix to be used on all objects uploaded to S3 | |
| `s3_skip_encryption` | Skip encryption of all objects uploaded to S3. WARNING: only enable this on S3 buckets with sufficiently restricted permissions and server-side encryption enabled. See | `false` |
| `gitlab_project` | GitLab Project Path (i.e. 'gitlab-org/gitlab') | |
| `gitlab_host` | GitLab Host (i.e. 'https://gitlab.com') | `https://gitlab.com` |
| `job_token` | GitLab CI\_JOB\_TOKEN | |
| `private_token` | GitLab Access Token | |
| `keychain_name` | Keychain the items should be imported to | `login.keychain` |
| `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | |
| `force` | Renew the provisioning profiles every time you run match | `false` |
| `force_for_new_devices` | Renew the provisioning profiles if the device count on the developer portal has changed. Ignored for profile types 'appstore' and 'developer\_id' | `false` |
| `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false` |
| `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false` |
| `certificate_id` | Select certificate by id. Useful if multiple certificates are stored in one place | |
| `force_for_new_certificates` | Renew the provisioning profiles if the certificate count on the developer portal has changed. Works only for the 'development' provisioning profile type. Requires 'include\_all\_certificates' option to be 'true' | `false` |
| `skip_confirmation` | Disables confirmation prompts during nuke, answering them with yes | `false` |
| `safe_remove_certs` | Remove certs from repository during nuke without revoking them on the developer portal | `false` |
| `skip_docs` | Skip generation of a README.md for the created git repository | `false` |
| `platform` | Set the provisioning profile's platform to work with (i.e. ios, tvos, macos, catalyst) | \* |
| `derive_catalyst_app_identifier` | Enable this if you have the Mac Catalyst capability enabled and your project was created with Xcode 11.3 or earlier. Prepends 'maccatalyst.' to the app identifier for the provisioning profile mapping | `false` |
| `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | |
| `profile_name` | A custom name for the provisioning profile. This will replace the default provisioning profile name if specified | |
| `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false` |
| `skip_certificate_matching` | Set to true if there is no access to Apple developer portal but there are certificates, keys and profiles provided. Only works with match import action | `false` |
| `output_path` | Path in which to export certificates, key and profile | |
| `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false` |
| `verbose` | Print out extra information and all commands | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action match_nuke

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run match_nuke

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run match_nuke parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/install_provisioning_profile

- Docs »
- \_Actions »
- install\_provisioning\_profile
- Edit on GitHub
- ```

* * *

# install\_provisioning\_profile

| install\_provisioning\_profile | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @SofteqDG |
| Returns | The absolute path to the installed provisioning profile |

## 1 Example

```ruby hljs
install_provisioning_profile(path: "profiles/profile.mobileprovision")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to provisioning profile | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action install_provisioning_profile

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run install_provisioning_profile

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run install_provisioning_profile parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/sync_code_signing

- Docs »
- \_Actions »
- sync\_code\_signing
- Edit on GitHub
- ```

* * *

# sync\_code\_signing

Easily sync your certificates and profiles across your team (via _match_)

###### Easily sync your certificates and profiles across your team

A new approach to iOS and macOS code signing: Share one code signing identity across your development team to simplify your codesigning setup and prevent code signing issues.

_match_ is the implementation of the codesigning.guide concept. _match_ creates all required certificates & provisioning profiles and stores them in a separate git repository, Google Cloud, or Amazon S3. Every team member with access to the selected storage can use those credentials for code signing. _match_ also automatically repairs broken and expired credentials. It's the easiest way to share signing credentials across teams

More information on how to get started with codesigning

Why? •
Usage •
Is this secure?

## Why match?

>
> You have to manually renew and download the latest set of provisioning profiles every time you add a new device or a certificate expires. Additionally this requires spending a lot of time when setting up a new machine that will build your app.

For more information about the concept, visit codesigning.guide.

### Why not let Xcode handle all this?

- You have full control over what happens
- You have access to all the certificates and profiles, which are all securely stored in git
- You share one code signing identity across the team to have fewer certificates and profiles
- Xcode sometimes revokes certificates which breaks your setup causing failed builds
- More predictable builds by settings profiles in an explicit way instead of using the `Automatic` setting
- It just works

### What does _match_ do for you?

| | match |
| --- | --- |
| 🔄 | Automatically sync your iOS and macOS keys and profiles across all your team members using git |
| 📦 | Handle all the heavy lifting of creating and storing your certificates and profiles |
| 💻 | Setup codesigning on a new machine in under a minute |
| 🎯 | Designed to work with apps with multiple targets and bundle identifiers |
| 🔒 | You have full control over your files and Git repo, no third party service involved |
| ✨ | Provisioning profile will always match the correct certificate |
| 💥 | Easily reset your existing profiles and certificates if your current account has expired or invalid profiles |
| ♻️ | Automatically renew your provisioning profiles to include all your devices using the `--force` option |
| 👥 | Support for multiple Apple accounts and multiple teams |
| ✨ | Tightly integrated with _fastlane_ to work seamlessly with _gym_ and other build tools |

## Usage

### Setup

1. Optional: Create a **new, shared Apple Developer Portal account**, something like `office@company.com`, that will be shared across your team from now on (for more information visit codesigning.guide)
2. Run the following in your project folder to start using _match_:

```no-highlight
fastlane match init

You'll be asked if you want to store your code signing identities inside a **Git repo**, **Google Cloud** or **Amazon S3**.

#### Git Storage

Use Git Storage to store all code signing identities in a private git repo, owned and operated by you. The files will be encrypted using OpenSSL.

First, enter the URL to your private (!) Git repo (You can create one for free on e.g. GitHub or BitBucket). The URL you enter can be either a `https://` or a `git` URL. `fastlane match init` won't read or modify your certificates or profiles yet, and also won't validate your git URL.

This will create a `Matchfile` in your current directory (or in your `./fastlane/` folder).

Example content (for more advanced setups check out the fastlane section):

```ruby-skip-tests
git_url("https://github.com/fastlane/certificates")

app_identifier("tools.fastlane.app")
username("user@fastlane.tools")

##### Git Storage on GitHub

If your machine is currently using SSH to authenticate with GitHub, you'll want to use a `git` URL, otherwise, you may see an authentication error when you attempt to use match. Alternatively, you can set a basic authorization for _match_:

Using parameter:

```hljs less

Using environment variable:

```hljs lua

match

To generate your base64 key according to RFC 7617, run this:

```hljs apache
echo -n your_github_username:your_personal_access_token | base64

You can find more information about GitHub basic authentication and personal token generation here:

##### Git Storage on GitHub - Deploy keys

If your machine does not have a private key set up for your certificates repository, you can give _match_ a path for one:

##### Git Storage on Azure DevOps

If you're running a pipeline on Azure DevOps and using git storage in a another repository on the same project, you might want to use `bearer` token authentication.

You can find more information about this use case here:

#### Google Cloud Storage

Use Google Cloud Storage for a fully hosted solution for your code signing identities. Certificates are stored on Google Cloud, encrypted using Google managed keys. Everything will be stored on your Google account, inside a storage bucket you provide. You can also directly access the files using the web console.

```ruby-skip-tests
google_cloud_bucket_name("major-key-certificates")

#### Amazon S3

Use Amazon S3 for a fully hosted solution for your code signing identities. Certificates are stored on S3, inside a storage bucket you provide. You can also directly access the files using the web console.

```ruby-skip-tests
s3_bucket("ios-certificates")

### Multiple teams

_match_ can store the codesigning files for multiple development teams:

#### Git Storage

Use one git branch per team. _match_ also supports storing certificates of multiple teams in one repo, by using separate git branches. If you work in multiple teams, make sure to set the `git_branch` parameter to a unique value per team. From there, _match_ will automatically create and use the specified branch for you.

```ruby hljs
match(git_branch: "team1", username: "user@team1.com")
match(git_branch: "team2", username: "user@team2.com")

#### Google Cloud or Amazon S3 Storage

If you use Google Cloud or Amazon S3 Storage, you don't need to do anything manually. Just use Google Cloud or Amazon S3 Storage, and the top level folder will be the team ID.

After running `fastlane match init` you can run the following to generate new certificates and profiles:

```no-highlight
fastlane match appstore

```no-highlight
fastlane match development

This will create a new certificate and provisioning profile (if required) and store them in your selected storage.
If you previously ran _match_ with the configured storage it will automatically install the existing profiles from your storage.

The provisioning profiles are installed in `~/Library/MobileDevice/Provisioning Profiles` while the certificates and private keys are installed in your Keychain.

To get a more detailed output of what _match_ is doing use

```no-highlight
fastlane match --verbose

For a list of all available options run

```no-highlight
fastlane action match

#### Handle multiple targets

_match_ can use the same one Git repository, Google Cloud, or Amazon S3 Storage for all bundle identifiers.

If you have several targets with different bundle identifiers, supply them as a comma-separated list:

```no-highlight
fastlane match appstore -a tools.fastlane.app,tools.fastlane.app.watchkitapp

You can make this even easier using _fastlane_ by creating a `certificates` lane like this:

```ruby hljs
lane :certificates do
match(app_identifier: ["tools.fastlane.app", "tools.fastlane.app.watchkitapp"])
end

Then all your team has to do is run `fastlane certificates` and the keys, certificates and profiles for all targets will be synced.

#### Handle multiple apps per developer/distribution certificate

If you want to use a single developer and/or distribution certificate for multiple apps belonging to the same development team, you may use the same signing identities repository and branch to store the signing identities for your apps:

`Matchfile` example for both App #1 and #2:

```ruby-skip-tests
git_url("https://github.com/example/example-repo.git")
git_branch("master")

_match_ will reuse certificates and will create separate provisioning profiles for each app.

#### Passphrase

_Git Repo storage only_

When running _match_ for the first time on a new machine, it will ask you for the passphrase for the Git repository. This is an additional layer of security: each of the files will be encrypted using `openssl`. Make sure to remember the password, as you'll need it when you run match on a different machine.

To set the passphrase to decrypt your profiles using an environment variable (and avoid the prompt) use `MATCH_PASSWORD`.

#### Migrate from Git Repo to Google Cloud

If you're already using a Git Repo, but would like to switch to using Google Cloud Storage, run the following command to automatically migrate all your existing code signing identities and provisioning profiles

```no-highlight
fastlane match migrate

After a successful migration you can safely delete your Git repo.

#### Google Cloud access control

_Google Cloud Storage only_

There are two cases for reading and writing certificates stored in a Google Cloud storage bucket:

1. Continuous integration jobs. These will authenticate to your Google Cloud project via a service account, and use a `gc_keys.json` file as credentials.
2. Developers on a local workstation. In this case, you should choose whether everyone on your team will create their own `gc_keys.json` file, or whether you want to manage access to the bucket directly using your developers' Google accounts.

When running `fastlane match init` the first time, the setup process will give you the option to create your `gc_keys.json` file. This file contains the authentication credentials needed to access your Google Cloud storage bucket. Make sure to keep that file secret and never add it to version control. We recommend adding `gc_keys.json` to your `.gitignore`

##### Managing developer access via keys

If you want to manage developer access to your certificates via authentication keys, every developer should create their own `gc_keys.json` and add the file to all their work machines. This will give the admin full control over who has read/write access to the given Storage bucket. At the same time it allows your team to revoke a single key if a file gets compromised.

##### Managing developer access via Google accounts

If your developers already have Google accounts and access to your Google Cloud project, you can also manage access to the storage bucket via Cloud Identity and Access Management (IAM). Just set up individual developer accounts or an entire Google Group containing your team as readers and writers on your storage bucket.

You can then specify the Google Cloud project id containing your storage bucket in your `Matchfile`:

```ruby-skip-tests
storage_mode("google_cloud")
google_cloud_bucket_name("my-app-certificates")
google_cloud_project_id("my-app-project")

This lets developers on your team use Application Default Credentials when accessing your storage bucket. After installing the Google Cloud SDK, they only need to run the following command once:

```no-highlight
gcloud auth application-default login

... and log in with their Google account. Then, when they run `fastlane match`, _match_ will use these credentials to read from and write to the storage bucket.

#### New machine

To set up the certificates and provisioning profiles on a new machine, you just run the same command using:

You can also run _match_ in a `readonly` mode to be sure it won't create any new certificates or profiles.

```no-highlightno-highlight
fastlane match development --readonly

We recommend to always use `readonly` mode when running _fastlane_ on CI systems. This can be done using

```ruby hljs
lane :beta do
match(type: "appstore", readonly: is_ci)

gym(scheme: "Release")
end

#### Access Control

A benefit of using _match_ is that it enables you to give the developers of your team access to the code signing certificates without having to give everyone access to the Developer Portal:

1. Run _match_ to store the certificates in a Git repo or Google Cloud Storage
2. Grant access to the Git repo / Google Cloud Storage Bucket to your developers and give them the passphrase (for git storage)
3. The developers can now run _match_ which will install the latest code signing profiles so they can build and sign the application without having to have access to the Apple Developer Portal
4. Every time you run _match_ to update the profiles (e.g. add a new device), all your developers will automatically get the latest profiles when running _match_

If you decide to run _match_ without access to the Developer Portal, make sure to use the `--readonly` option so that the commands don't ask you for the password to the Developer Portal.

The advantage of this approach is that no one in your team will revoke a certificate by mistake, while having all code signing secrets in one location.

#### Folder structure

After running _match_ for the first time, your Git repo or Google Cloud bucket will contain 2 directories:

- The `certs` folder contains all certificates with their private keys
- The `profiles` folder contains all provisioning profiles

Additionally, _match_ creates a nice repo `README.md` for you, making it easy to onboard new team members:

In the case of Google Cloud, the top level folder will be the team ID.

#### fastlane

Add _match_ to your `Fastfile` to automatically fetch the latest code signing certificates with _fastlane_.

```hljs less
match(type: "appstore")

match(type: "development")

match(type: "adhoc",
app_identifier: "tools.fastlane.app")

match(type: "enterprise",
app_identifier: "tools.fastlane.app")

# _match_ should be called before building the app with _gym_
gym
# ...

##### Registering new devices

By using _match_, you'll save a lot of time every time you add new device to your Ad Hoc or Development profiles. Use _match_ in combination with the `register_devices` action.

```ruby hljs
lane :beta do
register_devices(devices_file: "./devices.txt")
match(type: "adhoc", force_for_new_devices: true)
end

By using the `force_for_new_devices` parameter, _match_ will check if the (enabled) device count has changed since the last time you ran _match_, and automatically re-generate the provisioning profile if necessary. You can also use `force: true` to re-generate the provisioning profile on each run.

_**Important:** The `force_for_new_devices` parameter is ignored for App Store provisioning profiles since they don't contain any device information._

If you're not using `Fastfile`, you can also use the `force_for_new_devices` option from the command line:

```no-highlight
fastlane match adhoc --force_for_new_devices

##### Templates (aka: custom entitlements)

_match_ can generate profiles that contain custom entitlements by passing in the entitlement's name with the `template_name` parameter.

```hljs less
match(type: "development",
template_name: "Apple Pay Pass Suppression Development")

### Setup Xcode project

Docs on how to set up your Xcode project

#### To build from the command line using _fastlane_

_match_ automatically pre-fills environment variables with the UUIDs of the correct provisioning profiles, ready to be used in your Xcode project.

More information about how to setup your Xcode project can be found here

#### To build from Xcode manually

This is useful when installing your application on your device using the Development profile.

You can statically select the right provisioning profile in your Xcode project (the name will be `match Development tools.fastlane.app`).

#### Git repo access

There is one tricky part of setting up a CI system to work with _match_, which is enabling the CI to access the repo. Usually you'd just add your CI's public ssh key as a deploy key to your _match_ repo, but since your CI will already likely be using its public ssh key to access the codebase repo, you won't be able to do that.

Some repo hosts might allow you to use the same deploy key for different repos, but GitHub will not. If your host does, you don't need to worry about this, just add your CI's public ssh key as a deploy key for your _match_ repo and scroll down to " _Encryption password_".

There are a few ways around this:

1. Create a new account on your repo host with read-only access to your _match_ repo. Bitrise have a good description of this here.
2. Some CIs allow you to upload your signing credentials manually, but obviously this means that you'll have to re-upload the profiles/keys/certs each time they change.

Neither solution is pretty. It's one of those _trade-off_ things. Do you care more about **not** having an extra account sitting around, or do you care more about having the :sparkles: of auto-syncing of credentials.

#### Git repo encryption password

Once you've decided which approach to take, all that's left to do is to set your encryption password as secret environment variable named `MATCH_PASSWORD`. _match_ will pick this up when it's run.

#### Google Cloud Storage access

Accessing Google Cloud Storage from your CI system requires you to provide the `gc_keys.json` file as part of your build. How you implement this is your decision. You can inject that file during build time.

#### Amazon S3 Storage access

Accessing Amazon S3 Storage from your CI system requires you to provide the `s3_region`, `s3_access_key`, `s3_secret_access_key` and `s3_bucket` options (or environment variables), with keys that has read access to the bucket.

### Nuke

If you never really cared about code signing and have a messy Apple Developer account with a lot of invalid, expired or Xcode managed profiles/certificates, you can use the `match nuke` command to revoke your certificates and provisioning profiles. Don't worry, apps that are already available in the App Store / TestFlight will still work. Builds distributed via Ad Hoc or Enterprise will be disabled after nuking your account, so you'll have to re-upload a new build. After clearing your account you'll start from a clean state, and you can run _match_ to generate your certificates and profiles again.

To revoke all certificates and provisioning profiles for a specific environment:

```no-highlight
fastlane match nuke development
fastlane match nuke distribution
fastlane match nuke enterprise

You'll have to confirm a list of profiles / certificates that will be deleted.

## Advanced Git Storage features

### Change Password

To change the password of your repo and therefore decrypting and encrypting all files run:

```no-highlight
fastlane match change_password

You'll be asked for the new password on all your machines on the next run.

### Import

To import and encrypt a certificate ( `.cer`), the private key ( `.p12`) and the provisioning profiles ( `.mobileprovision` or `.provisionprofile`) into the _match_ repo run:

```no-highlight
fastlane match import

You'll be prompted for the certificate ( `.cer`), the private key ( `.p12`) and the provisioning profiles ( `.mobileprovision` or `.provisionprofile`) paths. _match_ will first validate the certificate ( `.cer`) against the Developer Portal before importing the certificate, the private key and the provisioning profiles into the specified _match_ repository.

However if there is no access to the developer portal but there are certificates, private keys and profiles provided, you can use the `skip_certificate_matching` option to tell _match_ not to verify the certificates. Like this:

```no-highlight
fastlane match import --skip_certificate_matching true

This will skip login to Apple Developer Portal and will import the provided certificate, private key and profile directly to the certificates repo.

Please be careful when using this option and ensure the certificates and profiles match the type (development, adhoc, appstore, enterprise, developer\_id) and are not revoked or expired.

### Manual Decrypt

If you want to manually decrypt or encrypt a file, you can use the companion script `match_file`:

```no-highlight

The password will be asked interactively.

_**Note:** You may need to swap double quotes `"` for single quotes `'` if your match password contains an exclamation mark `!`._

#### Export Distribution Certificate and Private Key as Single .p12 File

_match_ stores the certificate ( `.cer`) and the private key ( `.p12`) files separately. The following steps will repackage the separate certificate and private key into a single `.p12` file.

openssl x509 -inform der -in cert.der -out cert.pem

Generate an encrypted p12 file with the same or new password:

## Is this secure?

### Git

Both your keys and provisioning profiles are encrypted using OpenSSL using a passphrase.

Storing your private keys in a Git repo may sound off-putting at first. We did an analysis of potential security issues, see section below.

### Google Cloud Storage

All your keys and provisioning profiles are encrypted using Google managed keys.

### What could happen if someone stole a private key?

If attackers would have your certificate and provisioning profile, they could codesign an application with the same bundle identifier.

What's the worst that could happen for each of the profile types?

#### App Store Profiles

An App Store profile can't be used for anything as long as it's not re-signed by Apple. The only way to get an app resigned is to submit an app for review which could take anywhere from 24 hours to a few days (checkout appreviewtimes.com for up-to-date expectations). Attackers could only submit an app for review, if they also got access to your App Store Connect credentials (which are not stored in git, but in your local keychain). Additionally you get an email notification every time a build gets uploaded to cancel the submission even before your app gets into the review stage.

#### Development and Ad Hoc Profiles

In general those profiles are harmless as they can only be used to install a signed application on a small subset of devices. To add new devices, the attacker would also need your Apple Developer Portal credentials (which are not stored in git, but in your local keychain).

#### Enterprise Profiles

Attackers could use an In-House profile to distribute signed application to a potentially unlimited number of devices. All this would run under your company name and it could eventually lead to Apple revoking your In-House account. However it is very easy to revoke a certificate to remotely break the app on all devices.

Because of the potentially dangerous nature of In-House profiles please use _match_ with enterprise profiles with caution, ensure your git repository is private and use a secure password.

#### To sum up

- You have full control over the access list of your Git repo, no third party service involved
- Even if your certificates are leaked, they can't be used to cause any harm without your App Store Connect login credentials
- Use In-House enterprise profile with _match_ with caution
- If you use GitHub or Bitbucket we encourage enabling 2 factor authentication for all accounts that have access to the certificates repo
- The complete source code of _match_ is fully open source on GitHub

| sync\_code\_signing | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 4 Examples

```ruby hljs
sync_code_signing(type: "appstore", app_identifier: "tools.fastlane.app")

```ruby hljs
sync_code_signing(type: "development", readonly: true)

```ruby hljs
sync_code_signing(app_identifier: ["tools.fastlane.app", "tools.fastlane.sleepy"])

```ruby hljs
match # alias for "sync_code_signing"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `type` | Define the profile type, can be appstore, adhoc, development, enterprise, developer\_id, mac\_installer\_distribution, developer\_id\_installer | `development` |
| `additional_cert_types` | Create additional cert types needed for macOS installers (valid values: mac\_installer\_distribution, developer\_id\_installer) | |
| `readonly` | Only fetch existing certificates and profiles, don't generate new ones | `false` |
| `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | \* |
| `skip_provisioning_profiles` | Skip syncing provisioning profiles | `false` |
| `app_identifier` | The bundle identifier(s) of your app (comma-separated string or array of strings) | \* |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `storage_mode` | Define where you want to store your certificates | `git` |
| `git_url` | URL to the git repo containing all the certificates | |
| `git_branch` | Specific git branch to use | `master` |
| `git_full_name` | git user full name to commit | |
| `git_user_email` | git user email to commit | |
| `shallow_clone` | Make a shallow clone of the repository (truncate the history to 1 revision) | `false` |
| `clone_branch_directly` | Clone just the branch specified, instead of the whole repo. This requires that the branch already exists. Otherwise the command will fail | `false` |
| `git_basic_authorization` | Use a basic authorization header to access the git repo (e.g.: access via HTTPS, GitHub Actions, etc), usually a string in Base64 | |
| `git_bearer_authorization` | Use a bearer authorization header to access the git repo (e.g.: access to an Azure DevOps repository), usually a string in Base64 | |
| `git_private_key` | Use a private key to access the git repo (e.g.: access to GitHub repository via Deploy keys), usually a id\_rsa named file or the contents hereof | |
| `google_cloud_bucket_name` | Name of the Google Cloud Storage bucket to use | |
| `google_cloud_keys_file` | Path to the gc\_keys.json file | |
| `google_cloud_project_id` | ID of the Google Cloud project to use for authentication | |
| `skip_google_cloud_account_confirmation` | Skips confirming to use the system google account | `false` |
| `s3_region` | Name of the S3 region | |
| `s3_access_key` | S3 access key | |
| `s3_secret_access_key` | S3 secret access key | |
| `s3_bucket` | Name of the S3 bucket | |
| `s3_object_prefix` | Prefix to be used on all objects uploaded to S3 | |
| `s3_skip_encryption` | Skip encryption of all objects uploaded to S3. WARNING: only enable this on S3 buckets with sufficiently restricted permissions and server-side encryption enabled. See | `false` |
| `gitlab_project` | GitLab Project Path (i.e. 'gitlab-org/gitlab') | |
| `gitlab_host` | GitLab Host (i.e. 'https://gitlab.com') | `https://gitlab.com` |
| `job_token` | GitLab CI\_JOB\_TOKEN | |
| `private_token` | GitLab Access Token | |
| `keychain_name` | Keychain the items should be imported to | `login.keychain` |
| `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | |
| `force` | Renew the provisioning profiles every time you run match | `false` |
| `force_for_new_devices` | Renew the provisioning profiles if the device count on the developer portal has changed. Ignored for profile types 'appstore' and 'developer\_id' | `false` |
| `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false` |
| `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false` |
| `certificate_id` | Select certificate by id. Useful if multiple certificates are stored in one place | |
| `force_for_new_certificates` | Renew the provisioning profiles if the certificate count on the developer portal has changed. Works only for the 'development' provisioning profile type. Requires 'include\_all\_certificates' option to be 'true' | `false` |
| `skip_confirmation` | Disables confirmation prompts during nuke, answering them with yes | `false` |
| `safe_remove_certs` | Remove certs from repository during nuke without revoking them on the developer portal | `false` |
| `skip_docs` | Skip generation of a README.md for the created git repository | `false` |
| `platform` | Set the provisioning profile's platform to work with (i.e. ios, tvos, macos, catalyst) | \* |
| `derive_catalyst_app_identifier` | Enable this if you have the Mac Catalyst capability enabled and your project was created with Xcode 11.3 or earlier. Prepends 'maccatalyst.' to the app identifier for the provisioning profile mapping | `false` |
| `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | |
| `profile_name` | A custom name for the provisioning profile. This will replace the default provisioning profile name if specified | |
| `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false` |
| `skip_certificate_matching` | Set to true if there is no access to Apple developer portal but there are certificates, keys and profiles provided. Only works with match import action | `false` |
| `output_path` | Path in which to export certificates, key and profile | |
| `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false` |
| `verbose` | Print out extra information and all commands | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `sync_code_signing` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::MATCH_PROVISIONING_PROFILE_MAPPING` | The match provisioning profile mapping |
| `SharedValues::SIGH_PROFILE_TYPE` | The profile type, can be app-store, ad-hoc, development, enterprise, can be used in `build_app` as a default value for `export_method` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action sync_code_signing

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run sync_code_signing

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run sync_code_signing parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/jazzy

- Docs »
- \_Actions »
- jazzy
- Edit on GitHub
- ```

* * *

# jazzy

Generate docs using Jazzy

| jazzy | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
jazzy

```ruby hljs
jazzy(config: ".jazzy.yaml", module_version: "2.1.37")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `config` | Path to jazzy config file | |
| `module_version` | Version string to use as part of the default docs title and inside the docset | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action jazzy

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run jazzy

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run jazzy parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/appledoc

- Docs »
- \_Actions »
- appledoc
- Edit on GitHub
- ```

* * *

# appledoc

| appledoc | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @alexmx |

## 1 Example

```ruby hljs
appledoc(
project_name: "MyProjectName",
project_company: "Company Name",
input: [\
"MyProjectSources",\
"MyProjectSourceFile.h"\
],
ignore: [\
"ignore/path/1",\
"ignore/path/2"\
],
options: "--keep-intermediate-files --search-undocumented-doc",
warnings: "--warn-missing-output-path --warn-missing-company-id"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `input` | Path(s) to source file directories or individual source files. Accepts a single path or an array of paths | |
| `output` | Output path | |
| `templates` | Template files path | |
| `docset_install_path` | DocSet installation path | |
| `include` | Include static doc(s) at path | |
| `ignore` | Ignore given path | |
| `exclude_output` | Exclude given path from output | |
| `index_desc` | File including main index description | |
| `project_name` | Project name | |
| `project_version` | Project version | |
| `project_company` | Project company | |
| `company_id` | Company UTI (i.e. reverse DNS name) | |
| `create_html` | Create HTML | `false` |
| `create_docset` | Create documentation set | `false` |
| `install_docset` | Install documentation set to Xcode | `false` |
| `publish_docset` | Prepare DocSet for publishing | `false` |
| `no_create_docset` | Create HTML and skip creating a DocSet | `false` |
| `html_anchors` | The html anchor format to use in DocSet HTML | |
| `clean_output` | Remove contents of output path before starting | `false` |
| `docset_bundle_id` | DocSet bundle identifier | |
| `docset_bundle_name` | DocSet bundle name | |
| `docset_desc` | DocSet description | |
| `docset_copyright` | DocSet copyright message | |
| `docset_feed_name` | DocSet feed name | |
| `docset_feed_url` | DocSet feed URL | |
| `docset_feed_formats` | DocSet feed formats. Separated by a comma \[atom,xml\] | |
| `docset_package_url` | DocSet package (.xar) URL | |
| `docset_fallback_url` | DocSet fallback URL | |
| `docset_publisher_id` | DocSet publisher identifier | |
| `docset_publisher_name` | DocSet publisher name | |
| `docset_min_xcode_version` | DocSet min. Xcode version | |
| `docset_platform_family` | DocSet platform family | |
| `docset_cert_issuer` | DocSet certificate issuer | |
| `docset_cert_signer` | DocSet certificate signer | |
| `docset_bundle_filename` | DocSet bundle filename | |
| `docset_atom_filename` | DocSet atom feed filename | |
| `docset_xml_filename` | DocSet xml feed filename | |
| `docset_package_filename` | DocSet package (.xar,.tgz) filename | |
| `options` | Documentation generation options | |
| `crossref_format` | Cross reference template regex | |
| `exit_threshold` | Exit code threshold below which 0 is returned | `2` |
| `docs_section_title` | Title of the documentation section (defaults to "Programming Guides" | |
| `warnings` | Documentation generation warnings | |
| `logformat` | Log format \[0-3\] | |
| `verbose` | Log verbosity level \[0-6,xcode\] | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `appledoc` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::APPLEDOC_DOCUMENTATION_OUTPUT` | Documentation set output path |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action appledoc

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appledoc

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appledoc parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/sourcedocs

- Docs »
- \_Actions »
- sourcedocs
- Edit on GitHub
- ```

* * *

# sourcedocs

Generate docs using SourceDocs

| sourcedocs | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @Kukurijek |

## 2 Examples

```ruby hljs
sourcedocs(output_folder: 'docs')

```ruby hljs
sourcedocs(output_folder: 'docs', clean: true, reproducible: true, scheme: 'MyApp')

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `all_modules` | Generate documentation for all modules in a Swift package | |
| `spm_module` | Generate documentation for Swift Package Manager module | |
| `module_name` | Generate documentation for a Swift module | |
| `link_beginning` | The text to begin links with | |
| `link_ending` | The text to end links with (default: .md) | |
| `output_folder` | Output directory to clean (default: Documentation/Reference) | |
| `min_acl` | Access level to include in documentation \[private, fileprivate, internal, public, open\] (default: public) | |
| `module_name_path` | Include the module name as part of the output folder path | |
| `clean` | Delete output folder before generating documentation | |
| `collapsible` | Put methods, properties and enum cases inside collapsible blocks | |
| `table_of_contents` | Generate a table of contents with properties and methods for each type | |
| `reproducible` | Generate documentation that is reproducible: only depends on the sources | |
| `scheme` | Create documentation for specific scheme | |
| `sdk_platform` | Create documentation for specific sdk platform | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action sourcedocs

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run sourcedocs

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run sourcedocs parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/pilot

- Docs »
- \_Actions »
- pilot
- Edit on GitHub
- ```

* * *

# pilot

Alias for the `upload_to_testflight` action

###### The best way to manage your TestFlight testers and builds from your terminal

_pilot_ makes it easier to manage your app on Apple’s TestFlight. You can:

- Upload & distribute builds
- Add & remove testers
- Retrieve information about testers & devices
- Import/export all available testers

_pilot_ uses spaceship.airforce to interact with App Store Connect 🚀

Usage •
Tips

# Usage

For all commands, you can either use an API Key or your Apple ID.

### App Store Connect API Key

The App Store Connect API Key is the preferred authentication method (if you are able to use it).

- Uses official App Store Connect API
- No need for 2FA
- Better performance over Apple ID

Specify the API key using `--api_key_path ./path/to/api_key_info.json` or `--api_key "{\"key_id\": \"D83848D23\", \"issuer_id\": \"227b0bbf-ada8-458c-9d62-3d8022b7d07f\", \"key_filepath\": \"D83848D23.p8\"}"`

Go to Using App Store Connect API for information on obtaining an API key, the _fastlane_ `api_key_info.json` format, and other API key usage.

### Apple ID

Specify the Apple ID to use using `-u felix@krausefx.com`. If you execute _pilot_ in a project already using _fastlane_ the username and app identifier will automatically be determined.

## Uploading builds

To upload a new build, just run

```no-highlight
fastlane pilot upload

This will automatically look for an `ipa` in your current directory and tries to fetch the login credentials from your fastlane setup.

You'll be asked for any missing information. Additionally, you can pass all kinds of parameters:

```no-highlight
fastlane action pilot

You can pass a changelog using

```no-highlight
fastlane pilot upload --changelog "Something that is new here"

You can also skip the submission of the binary, which means, the `ipa` file will only be uploaded and not distributed to testers:

```no-highlight
fastlane pilot upload --skip_submission

_pilot_ does all kinds of magic for you:

- Automatically detects the bundle identifier from your `ipa` file
- Automatically fetch the AppID of your app based on the bundle identifier

_pilot_ uses _spaceship_ to submit the build metadata and the iTunes Transporter to upload the binary. Because iTunes Transporter's upload capability is only supported on OS X, `pilot upload` does not work on Linux, as described in this issue

## List builds

To list all builds for specific application use

```no-highlight
fastlane pilot builds

The result lists all active builds and processing builds:

```no-highlight
+-----------+---------+----------+
| Great App Builds |
+-----------+---------+----------+
| Version # | Build # | Installs |
+-----------+---------+----------+
| 0.9.13 | 1 | 0 |
| 0.9.13 | 2 | 0 |
| 0.9.20 | 3 | 0 |
| 0.9.20 | 4 | 3 |
+-----------+---------+----------+

## Managing beta testers

### List of Testers

This command will list all your testers, both internal and external.

```no-highlight
fastlane pilot list

The output will look like this:

```no-highlight
+--------+--------+--------------------------+-----------+
| Internal Testers |
+--------+--------+--------------------------+-----------+
| First | Last | Email | # Devices |
+--------+--------+--------------------------+-----------+
| Felix | Krause | felix@krausefx.com | 2 |
+--------+--------+--------------------------+-----------+

+-----------+---------+----------------------------+-----------+
| External Testers |
+-----------+---------+----------------------------+-----------+
| First | Last | Email | # Devices |
+-----------+---------+----------------------------+-----------+
| Max | Manfred | email@email.com | 0 |
| Detlef | Müller | detlef@krausefx.com | 1 |
+-----------+---------+----------------------------+-----------+

### Add a new tester

To add a new tester to your App Store Connect account and to associate it to at least one testing group of your app, use the `pilot add` command. This will create a new tester (if necessary) or add an existing tester to the app to test.

```no-highlight
fastlane pilot add email@invite.com -g group-1,group-2

Additionally you can specify the app identifier (if necessary):

```no-highlight
fastlane pilot add email@email.com -a com.krausefx.app -g group-1,group-2

### Find a tester

To find a specific tester use

```no-highlight
fastlane pilot find felix@krausefx.com

The resulting output will look like this:

```no-highlight
+---------------------+---------------------+
| felix@krausefx.com |
+---------------------+---------------------+
| First name | Felix |
| Last name | Krause |
| Email | felix@krausefx.com |
| Latest Version | 0.9.14 (23 |
| Latest Install Date | 03/28/15 19:00 |
| 2 Devices | • iPhone 6, iOS 8.3 |
| | • iPhone 5, iOS 7.0 |
+---------------------+---------------------+

### Remove a tester

This command will remove beta tester from app (from all internal and external groups)

```no-highlight
fastlane pilot remove felix@krausefx.com

You can also use `groups` option to remove the tester from the groups specified:

```no-highlight
fastlane pilot remove felix@krausefx.com -g group-1,group-2

### Export testers

To export all external testers to a CSV file. Useful if you need to import tester info to another system or a new account.

```no-highlight
fastlane pilot export

### Import testers

Add external testers from a CSV file. Create a file (ex: `testers.csv`) and fill it with the following format:

```no-highlight
John,Appleseed,appleseed_john@mac.com,group-1;group-2

```no-highlight
fastlane pilot import

You can also specify the directory using

```no-highlight
fastlane pilot export -c ~/Desktop/testers.csv
fastlane pilot import -c ~/Desktop/testers.csv

# Tips

## Debug information

If you run into any issues you can use the `verbose` mode to get a more detailed output:

```no-highlight
fastlane pilot upload --verbose

## Firewall Issues

_pilot_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol from the command line using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" pilot ...

If you are using _pilot_ via the fastlane action, add the following to your `Fastfile`

```no-highlight
ENV["DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS"] = "-t DAV"
pilot...

Note, however, that Apple recommends you don’t specify the `-t transport` and instead allow Transporter to use automatic transport discovery to determine the best transport mode for your packages. For this reason, if the `t` option is passed, we will raise a warning.

Also note that `-t` is not the only additional parameter that can be used. The string specified in the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS` environment variable will be forwarded to Transporter. For all the available options, check Apple's Transporter User Guide.

## Credentials Issues

If your password contains special characters, _pilot_ may throw a confusing error saying your "Your Apple ID or password was entered incorrectly". The easiest way to fix this error is to change your password to something that **does not** contains special characters.

## How is my password stored?

_pilot_ uses the CredentialsManager from _fastlane_.

## Provider Short Name

If you are on multiple App Store Connect teams, iTunes Transporter may need a provider short name to know where to upload your binary. _pilot_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

## Use an Application Specific Password to upload

_pilot_/ `upload_to_testflight` can use an Application Specific Password via the `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` environment variable to upload a binary if both the `skip_waiting_for_build_processing` and `apple_id` options are set. (If any of those are not set, it will use the normal Apple login process that might require 2FA authentication.)

## Role for App Store Connect User

_pilot_/ `upload_to_testflight` updates build information and testers after the build has finished processing. App Store Connect requires the "App Manager" or "Admin" role for your Apple account to update this information. The "Developer" role will allow builds to be uploaded but _will not_ allow updating of build information and testers.

| pilot | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 7 Examples

```ruby hljs
upload_to_testflight

```ruby hljs
testflight # alias for "upload_to_testflight"

```ruby hljs
pilot # alias for "upload_to_testflight"

```ruby hljs
upload_to_testflight(skip_submission: true) # to only upload the build

```ruby hljs
upload_to_testflight(
username: "felix@krausefx.com",
app_identifier: "com.krausefx.app",
itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)

```ruby hljs
upload_to_testflight(
beta_app_feedback_email: "email@email.com",
beta_app_description: "This is a description of my app",
demo_account_required: true,
notify_external_testers: false,
changelog: "This is my changelog of things that have changed in a log"
)

```ruby hljs
upload_to_testflight(
beta_app_review_info: {
contact_email: "email@email.com",
contact_first_name: "Connect",
contact_last_name: "API",
contact_phone: "5558675309",
demo_account_name: "demo@email.com",
demo_account_password: "connectapi",
notes: "this is review note for the reviewer <3 thank you for reviewing"
},
localized_app_info: {
"default": {
feedback_email: "default@email.com",
marketing_url: "https://example.com/marketing-default",
privacy_policy_url: "https://example.com/privacy-default",
description: "Default description",
},
"en-GB": {
feedback_email: "en-gb@email.com",
marketing_url: "https://example.com/marketing-en-gb",
privacy_policy_url: "https://example.com/privacy-en-gb",
description: "en-gb description",
}
},
localized_build_info: {
"default": {
whats_new: "Default changelog",
},
"en-GB": {
whats_new: "en-gb changelog",
}
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | The bundle identifier of the app to upload or manage testers (optional) | \* |
| `app_platform` | The platform to use (optional) | |
| `apple_id` | Apple ID property in the App Information section in App Store Connect | \* |
| `ipa` | Path to the ipa file to upload | \* |
| `pkg` | Path to your pkg file | \* |
| `demo_account_required` | Do you need a demo account when Apple does review? | |
| `beta_app_review_info` | Beta app review information for contact info and demo account | |
| `localized_app_info` | Localized beta app test info for description, feedback email, marketing url, and | |
| `beta_app_description` | Provide the 'Beta App Description' when uploading a new build | |
| `beta_app_feedback_email` | Provide the beta app email when uploading a new build | |
| `localized_build_info` | Localized beta app test info for what's new | |
| `changelog` | Provide the 'What to Test' text when uploading a new build | |
| `skip_submission` | Skip the distributing action of pilot and only upload the ipa file | `false` |
| `skip_waiting_for_build_processing` | If set to true, the `distribute_external` option won't work and no build will be distributed to testers. (You might want to use this option if you are using this action on CI and have to pay for 'minutes used' on your CI plan). If set to `true` and a changelog is provided, it will partially wait for the build to appear on AppStore Connect so the changelog can be set, and skip the remaining processing steps | `false` |
| `update_build_info_on_upload` | **DEPRECATED!** Update build info immediately after validation. This is deprecated and will be removed in a future release. App Store Connect no longer supports setting build info until after build processing has completed, which is when build info is updated by default | `false` |
| `distribute_only` | Distribute a previously uploaded build (equivalent to the `fastlane pilot distribute` command) | `false` |
| `uses_non_exempt_encryption` | Provide the 'Uses Non-Exempt Encryption' for export compliance. This is used if there is 'ITSAppUsesNonExemptEncryption' is not set in the Info.plist | `false` |
| `distribute_external` | Should the build be distributed to external testers? If set to true, use of `groups` option is required | `false` |
| `notify_external_testers` | Should notify external testers? (Not setting a value will use App Store Connect's default which is to notify) | |
| `app_version` | The version number of the application build to distribute. If the version number is not specified, then the most recent build uploaded to TestFlight will be distributed. If specified, the most recent build for the version number will be distributed | |
| `build_number` | The build number of the application build to distribute. If the build number is not specified, the most recent build is distributed | |
| `expire_previous_builds` | Should expire previous builds? | `false` |
| `first_name` | The tester's first name | |
| `last_name` | The tester's last name | |
| `email` | The tester's email | |
| `testers_file_path` | Path to a CSV file of testers | `./testers.csv` |
| `groups` | Associate tester to one group or more by group name / group id. E.g. `-g "Team 1","Team 2"` This is required when `distribute_external` option is set to true or when we want to add a tester to one or more external testing groups | |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID! | \* |
| `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | |
| `wait_processing_interval` | Interval in seconds to wait for App Store Connect processing | `30` |
| `wait_processing_timeout_duration` | Timeout duration in seconds to wait for App Store Connect processing. If set, after exceeding timeout duration, this will `force stop` to wait for App Store Connect processing and exit with exception | |
| `wait_for_uploaded_build` | **DEPRECATED!** No longer needed with the transition over to the App Store Connect API - Use version info from uploaded ipa file to determine what build to use for distribution. If set to false, latest processing or any latest build will be used | `false` |
| `reject_build_waiting_for_review` | Expire previous if it's 'waiting for review' | `false` |
| `submit_beta_review` | Send the build for a beta review | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run pilot

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run pilot parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/testflight

- Docs »
- \_Actions »
- testflight
- Edit on GitHub
- ```

* * *

# testflight

Alias for the `upload_to_testflight` action

###### The best way to manage your TestFlight testers and builds from your terminal

_pilot_ makes it easier to manage your app on Apple’s TestFlight. You can:

- Upload & distribute builds
- Add & remove testers
- Retrieve information about testers & devices
- Import/export all available testers

_pilot_ uses spaceship.airforce to interact with App Store Connect 🚀

Usage •
Tips

# Usage

For all commands, you can either use an API Key or your Apple ID.

### App Store Connect API Key

The App Store Connect API Key is the preferred authentication method (if you are able to use it).

- Uses official App Store Connect API
- No need for 2FA
- Better performance over Apple ID

Specify the API key using `--api_key_path ./path/to/api_key_info.json` or `--api_key "{\"key_id\": \"D83848D23\", \"issuer_id\": \"227b0bbf-ada8-458c-9d62-3d8022b7d07f\", \"key_filepath\": \"D83848D23.p8\"}"`

Go to Using App Store Connect API for information on obtaining an API key, the _fastlane_ `api_key_info.json` format, and other API key usage.

### Apple ID

Specify the Apple ID to use using `-u felix@krausefx.com`. If you execute _pilot_ in a project already using _fastlane_ the username and app identifier will automatically be determined.

## Uploading builds

To upload a new build, just run

```no-highlight
fastlane pilot upload

This will automatically look for an `ipa` in your current directory and tries to fetch the login credentials from your fastlane setup.

You'll be asked for any missing information. Additionally, you can pass all kinds of parameters:

```no-highlight
fastlane action pilot

You can pass a changelog using

```no-highlight
fastlane pilot upload --changelog "Something that is new here"

You can also skip the submission of the binary, which means, the `ipa` file will only be uploaded and not distributed to testers:

```no-highlight
fastlane pilot upload --skip_submission

_pilot_ does all kinds of magic for you:

- Automatically detects the bundle identifier from your `ipa` file
- Automatically fetch the AppID of your app based on the bundle identifier

_pilot_ uses _spaceship_ to submit the build metadata and the iTunes Transporter to upload the binary. Because iTunes Transporter's upload capability is only supported on OS X, `pilot upload` does not work on Linux, as described in this issue

## List builds

To list all builds for specific application use

```no-highlight
fastlane pilot builds

The result lists all active builds and processing builds:

```no-highlight
+-----------+---------+----------+
| Great App Builds |
+-----------+---------+----------+
| Version # | Build # | Installs |
+-----------+---------+----------+
| 0.9.13 | 1 | 0 |
| 0.9.13 | 2 | 0 |
| 0.9.20 | 3 | 0 |
| 0.9.20 | 4 | 3 |
+-----------+---------+----------+

## Managing beta testers

### List of Testers

This command will list all your testers, both internal and external.

```no-highlight
fastlane pilot list

The output will look like this:

```no-highlight
+--------+--------+--------------------------+-----------+
| Internal Testers |
+--------+--------+--------------------------+-----------+
| First | Last | Email | # Devices |
+--------+--------+--------------------------+-----------+
| Felix | Krause | felix@krausefx.com | 2 |
+--------+--------+--------------------------+-----------+

+-----------+---------+----------------------------+-----------+
| External Testers |
+-----------+---------+----------------------------+-----------+
| First | Last | Email | # Devices |
+-----------+---------+----------------------------+-----------+
| Max | Manfred | email@email.com | 0 |
| Detlef | Müller | detlef@krausefx.com | 1 |
+-----------+---------+----------------------------+-----------+

### Add a new tester

To add a new tester to your App Store Connect account and to associate it to at least one testing group of your app, use the `pilot add` command. This will create a new tester (if necessary) or add an existing tester to the app to test.

```no-highlight
fastlane pilot add email@invite.com -g group-1,group-2

Additionally you can specify the app identifier (if necessary):

```no-highlight
fastlane pilot add email@email.com -a com.krausefx.app -g group-1,group-2

### Find a tester

To find a specific tester use

```no-highlight
fastlane pilot find felix@krausefx.com

The resulting output will look like this:

```no-highlight
+---------------------+---------------------+
| felix@krausefx.com |
+---------------------+---------------------+
| First name | Felix |
| Last name | Krause |
| Email | felix@krausefx.com |
| Latest Version | 0.9.14 (23 |
| Latest Install Date | 03/28/15 19:00 |
| 2 Devices | • iPhone 6, iOS 8.3 |
| | • iPhone 5, iOS 7.0 |
+---------------------+---------------------+

### Remove a tester

This command will remove beta tester from app (from all internal and external groups)

```no-highlight
fastlane pilot remove felix@krausefx.com

You can also use `groups` option to remove the tester from the groups specified:

```no-highlight
fastlane pilot remove felix@krausefx.com -g group-1,group-2

### Export testers

To export all external testers to a CSV file. Useful if you need to import tester info to another system or a new account.

```no-highlight
fastlane pilot export

### Import testers

Add external testers from a CSV file. Create a file (ex: `testers.csv`) and fill it with the following format:

```no-highlight
John,Appleseed,appleseed_john@mac.com,group-1;group-2

```no-highlight
fastlane pilot import

You can also specify the directory using

```no-highlight
fastlane pilot export -c ~/Desktop/testers.csv
fastlane pilot import -c ~/Desktop/testers.csv

# Tips

## Debug information

If you run into any issues you can use the `verbose` mode to get a more detailed output:

```no-highlight
fastlane pilot upload --verbose

## Firewall Issues

_pilot_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol from the command line using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" pilot ...

If you are using _pilot_ via the fastlane action, add the following to your `Fastfile`

```no-highlight
ENV["DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS"] = "-t DAV"
pilot...

Note, however, that Apple recommends you don’t specify the `-t transport` and instead allow Transporter to use automatic transport discovery to determine the best transport mode for your packages. For this reason, if the `t` option is passed, we will raise a warning.

Also note that `-t` is not the only additional parameter that can be used. The string specified in the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS` environment variable will be forwarded to Transporter. For all the available options, check Apple's Transporter User Guide.

## Credentials Issues

If your password contains special characters, _pilot_ may throw a confusing error saying your "Your Apple ID or password was entered incorrectly". The easiest way to fix this error is to change your password to something that **does not** contains special characters.

## How is my password stored?

_pilot_ uses the CredentialsManager from _fastlane_.

## Provider Short Name

If you are on multiple App Store Connect teams, iTunes Transporter may need a provider short name to know where to upload your binary. _pilot_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

## Use an Application Specific Password to upload

_pilot_/ `upload_to_testflight` can use an Application Specific Password via the `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` environment variable to upload a binary if both the `skip_waiting_for_build_processing` and `apple_id` options are set. (If any of those are not set, it will use the normal Apple login process that might require 2FA authentication.)

## Role for App Store Connect User

_pilot_/ `upload_to_testflight` updates build information and testers after the build has finished processing. App Store Connect requires the "App Manager" or "Admin" role for your Apple account to update this information. The "Developer" role will allow builds to be uploaded but _will not_ allow updating of build information and testers.

| testflight | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 7 Examples

```ruby hljs
upload_to_testflight

```ruby hljs
testflight # alias for "upload_to_testflight"

```ruby hljs
pilot # alias for "upload_to_testflight"

```ruby hljs
upload_to_testflight(skip_submission: true) # to only upload the build

```ruby hljs
upload_to_testflight(
username: "felix@krausefx.com",
app_identifier: "com.krausefx.app",
itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)

```ruby hljs
upload_to_testflight(
beta_app_feedback_email: "email@email.com",
beta_app_description: "This is a description of my app",
demo_account_required: true,
notify_external_testers: false,
changelog: "This is my changelog of things that have changed in a log"
)

```ruby hljs
upload_to_testflight(
beta_app_review_info: {
contact_email: "email@email.com",
contact_first_name: "Connect",
contact_last_name: "API",
contact_phone: "5558675309",
demo_account_name: "demo@email.com",
demo_account_password: "connectapi",
notes: "this is review note for the reviewer <3 thank you for reviewing"
},
localized_app_info: {
"default": {
feedback_email: "default@email.com",
marketing_url: "https://example.com/marketing-default",
privacy_policy_url: "https://example.com/privacy-default",
description: "Default description",
},
"en-GB": {
feedback_email: "en-gb@email.com",
marketing_url: "https://example.com/marketing-en-gb",
privacy_policy_url: "https://example.com/privacy-en-gb",
description: "en-gb description",
}
},
localized_build_info: {
"default": {
whats_new: "Default changelog",
},
"en-GB": {
whats_new: "en-gb changelog",
}
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | The bundle identifier of the app to upload or manage testers (optional) | \* |
| `app_platform` | The platform to use (optional) | |
| `apple_id` | Apple ID property in the App Information section in App Store Connect | \* |
| `ipa` | Path to the ipa file to upload | \* |
| `pkg` | Path to your pkg file | \* |
| `demo_account_required` | Do you need a demo account when Apple does review? | |
| `beta_app_review_info` | Beta app review information for contact info and demo account | |
| `localized_app_info` | Localized beta app test info for description, feedback email, marketing url, and | |
| `beta_app_description` | Provide the 'Beta App Description' when uploading a new build | |
| `beta_app_feedback_email` | Provide the beta app email when uploading a new build | |
| `localized_build_info` | Localized beta app test info for what's new | |
| `changelog` | Provide the 'What to Test' text when uploading a new build | |
| `skip_submission` | Skip the distributing action of pilot and only upload the ipa file | `false` |
| `skip_waiting_for_build_processing` | If set to true, the `distribute_external` option won't work and no build will be distributed to testers. (You might want to use this option if you are using this action on CI and have to pay for 'minutes used' on your CI plan). If set to `true` and a changelog is provided, it will partially wait for the build to appear on AppStore Connect so the changelog can be set, and skip the remaining processing steps | `false` |
| `update_build_info_on_upload` | **DEPRECATED!** Update build info immediately after validation. This is deprecated and will be removed in a future release. App Store Connect no longer supports setting build info until after build processing has completed, which is when build info is updated by default | `false` |
| `distribute_only` | Distribute a previously uploaded build (equivalent to the `fastlane pilot distribute` command) | `false` |
| `uses_non_exempt_encryption` | Provide the 'Uses Non-Exempt Encryption' for export compliance. This is used if there is 'ITSAppUsesNonExemptEncryption' is not set in the Info.plist | `false` |
| `distribute_external` | Should the build be distributed to external testers? If set to true, use of `groups` option is required | `false` |
| `notify_external_testers` | Should notify external testers? (Not setting a value will use App Store Connect's default which is to notify) | |
| `app_version` | The version number of the application build to distribute. If the version number is not specified, then the most recent build uploaded to TestFlight will be distributed. If specified, the most recent build for the version number will be distributed | |
| `build_number` | The build number of the application build to distribute. If the build number is not specified, the most recent build is distributed | |
| `expire_previous_builds` | Should expire previous builds? | `false` |
| `first_name` | The tester's first name | |
| `last_name` | The tester's last name | |
| `email` | The tester's email | |
| `testers_file_path` | Path to a CSV file of testers | `./testers.csv` |
| `groups` | Associate tester to one group or more by group name / group id. E.g. `-g "Team 1","Team 2"` This is required when `distribute_external` option is set to true or when we want to add a tester to one or more external testing groups | |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID! | \* |
| `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | |
| `wait_processing_interval` | Interval in seconds to wait for App Store Connect processing | `30` |
| `wait_processing_timeout_duration` | Timeout duration in seconds to wait for App Store Connect processing. If set, after exceeding timeout duration, this will `force stop` to wait for App Store Connect processing and exit with exception | |
| `wait_for_uploaded_build` | **DEPRECATED!** No longer needed with the transition over to the App Store Connect API - Use version info from uploaded ipa file to determine what build to use for distribution. If set to false, latest processing or any latest build will be used | `false` |
| `reject_build_waiting_for_review` | Expire previous if it's 'waiting for review' | `false` |
| `submit_beta_review` | Send the build for a beta review | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action testflight

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run testflight

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run testflight parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/deploygate

- Docs »
- \_Actions »
- deploygate
- Edit on GitHub
- ```

* * *

# deploygate

>
> More information about the available options can be found in the DeployGate Push API document.

| deploygate | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @tnj, @tomorrowkey |

## 2 Examples

```ruby hljs
deploygate(
api_token: "...",
user: "target username or organization name",
ipa: "./ipa_file.ipa",
message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
distribution_key: "(Optional) Target Distribution Key",
distribution_name: "(Optional) Target Distribution Name"
)

```ruby hljs
deploygate(
api_token: "...",
user: "target username or organization name",
apk: "./apk_file.apk",
message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
distribution_key: "(Optional) Target Distribution Key",
distribution_name: "(Optional) Target Distribution Name"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_token` | Deploygate API Token | |
| `user` | Target username or organization name | |
| `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action | \* |
| `apk` | Path to your APK file | \* |
| `message` | Release Notes | `No changelog provided` |
| `distribution_key` | Target Distribution Key | |
| `release_note` | Release note for distribution page | |
| `disable_notify` | Disables Push notification emails | `false` |
| `distribution_name` | Target Distribution Name | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `deploygate` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::DEPLOYGATE_URL` | URL of the newly uploaded build |
| `SharedValues::DEPLOYGATE_REVISION` | auto incremented revision number |
| `SharedValues::DEPLOYGATE_APP_INFO` | Contains app revision, bundle identifier, etc. |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action deploygate

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run deploygate

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run deploygate parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/apteligent

- Docs »
- \_Actions »
- apteligent
- Edit on GitHub
- ```

* * *

# apteligent

Upload dSYM file to Apteligent (Crittercism)

| apteligent | |
| --- | --- |
| Supported platforms | ios |
| Author | @Mo7amedFouad |

## 1 Example

```ruby hljs
apteligent(
app_id: "...",
api_key: "..."
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `dsym` | dSYM.zip file to upload to Apteligent | |
| `app_id` | Apteligent App ID key e.g. 569f5c87cb99e10e00c7xxxx | |
| `api_key` | Apteligent App API key e.g. IXPQIi8yCbHaLliqzRoo065tH0lxxxxx | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action apteligent

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run apteligent

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run apteligent parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/appetize

- Docs »
- \_Actions »
- appetize
- Edit on GitHub
- ```

* * *

# appetize

>
> To integrate appetize into your GitHub workflow check out the device\_grid guide.

| appetize | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @klundberg, @giginet, @steprescott |

## 2 Examples

```ruby hljs
appetize(
path: "./MyApp.zip",
api_token: "yourapitoken", # get it from
public_key: "your_public_key" # get it from
)

```ruby hljs
appetize(
path: "./MyApp.zip",
api_host: "company.appetize.io", # only needed for enterprise hosted solution
api_token: "yourapitoken", # get it from
public_key: "your_public_key" # get it from
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_host` | Appetize API host | `api.appetize.io` |
| `api_token` | Appetize.io API Token | |
| `url` | URL from which the ipa file can be fetched. Alternative to :path | |
| `platform` | Platform. Either `ios` or `android` | `ios` |
| `path` | Path to zipped build on the local filesystem. Either this or `url` must be specified | |
| `public_key` | If not provided, a new app will be created. If provided, the existing build will be overwritten | |
| `note` | Notes you wish to add to the uploaded app | |
| `timeout` | The number of seconds to wait until automatically ending the session due to user inactivity. Must be 30, 60, 90, 120, 180, 300, 600, 1800, 3600 or 7200. Default is 120 | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `appetize` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::APPETIZE_API_HOST` | Appetize API host. |
| `SharedValues::APPETIZE_PUBLIC_KEY` | a public identifier for your app. Use this to update your app after it has been initially created. |
| `SharedValues::APPETIZE_APP_URL` | a page to test and share your app. |
| `SharedValues::APPETIZE_MANAGE_URL` | a page to manage your app. |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action appetize

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appetize

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appetize parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/testfairy

- Docs »
- \_Actions »
- testfairy
- Edit on GitHub
- ```

* * *

# testfairy

| testfairy | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @taka0125, @tcurdt, @vijaysharm, @cdm2012 |

## 2 Examples

```ruby hljs
testfairy(
api_key: "...",
ipa: "./ipa_file.ipa",
comment: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
)

```ruby hljs
testfairy(
api_key: "...",
apk: "../build/app/outputs/apk/qa/release/app-qa-release.apk",
comment: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key` | API Key for TestFairy | |
| `ipa` | Path to your IPA file for iOS | \* |
| `apk` | Path to your APK file for Android | \* |
| `symbols_file` | Symbols mapping file | \* |
| `upload_url` | API URL for TestFairy | `https://upload.testfairy.com` |
| `testers_groups` | Array of tester groups to be notified | `[]` |
| `metrics` | Array of metrics to record (cpu,memory,network,phone\_signal,gps,battery,mic,wifi) | `[]` |
| `comment` | Additional release notes for this upload. This text will be added to email notifications | `No comment provided` |
| `auto_update` | Allows an easy upgrade of all users to the current version. To enable set to 'on' | `off` |
| `notify` | Send email to testers | `off` |
| `options` | Array of options (shake,video\_only\_wifi,anonymous) | `[]` |
| `custom` | Array of custom options. Contact support@testfairy.com for more information | `''` |
| `timeout` | Request timeout in seconds | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `testfairy` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::TESTFAIRY_BUILD_URL` | URL for the sessions of the newly uploaded build |
| `SharedValues::TESTFAIRY_DOWNLOAD_URL` | URL directly to the newly uploaded build |
| `SharedValues::TESTFAIRY_LANDING_PAGE` | URL of the build's landing page |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action testfairy

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run testfairy

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run testfairy parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/appaloosa

- Docs »
- \_Actions »
- appaloosa
- Edit on GitHub
- ```

* * *

# appaloosa

>
> You can create an account, push to your existing account, or manage your user groups.
>
> We accept iOS and Android applications.

| appaloosa | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @Appaloosa |

## 1 Example

```ruby hljs
appaloosa(
# Path tor your IPA or APK
binary: '/path/to/binary.ipa',
# You can find your store’s id at the bottom of the “Settings” page of your store
store_id: 'your_store_id',
# You can find your api_token at the bottom of the “Settings” page of your store
api_token: 'your_api_key',
# User group_ids visibility, if it's not specified we'll publish the app for all users in your store'
group_ids: '112, 232, 387',
# You can use fastlane/snapshot or specify your own screenshots folder.
# If you use snapshot please specify a local and a device to upload your screenshots from.
# When multiple values are specified in the Snapfile, we default to 'en-US'
locale: 'en-US',
# By default, the screenshots from the last device will be used
device: 'iPhone6',
# Screenshots' filenames should start with device's name like 'iphone6-s1.png' if device specified
screenshots: '/path/to_your/screenshots'
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `binary` | Binary path. Optional for ipa if you use the `ipa` or `xcodebuild` action | \* |
| `api_token` | Your API token | |
| `store_id` | Your Store id | |
| `group_ids` | Your app is limited to special users? Give us the group ids | `''` |
| `screenshots` | Add some screenshots application to your store or hit \[enter\] | \* |
| `locale` | Select the folder locale for your screenshots | `en-US` |
| `device` | Select the device format for your screenshots | |
| `description` | Your app description | |
| `changelog` | Your app changelog | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action appaloosa

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appaloosa

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appaloosa parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/nexus_upload

- Docs »
- \_Actions »
- nexus\_upload
- Edit on GitHub
- ```

* * *

# nexus\_upload

Upload a file to Sonatype Nexus platform

| nexus\_upload | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @xfreebird, @mdio |

## 2 Examples

```ruby hljs
# for Nexus 2
nexus_upload(
file: "/path/to/file.ipa",
repo_id: "artefacts",
repo_group_id: "com.fastlane",
repo_project_name: "ipa",
repo_project_version: "1.13",
repo_classifier: "dSYM", # Optional
endpoint: "http://localhost:8081",
username: "admin",
password: "admin123"
)

# for Nexus 3
```ruby hljs
nexus_upload(
nexus_version: 3,
mount_path: "",
file: "/path/to/file.ipa",
repo_id: "artefacts",
repo_group_id: "com.fastlane",
repo_project_name: "ipa",
repo_project_version: "1.13",
repo_classifier: "dSYM", # Optional
endpoint: "http://localhost:8081",
username: "admin",
password: "admin123"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `file` | File to be uploaded to Nexus | |
| `repo_id` | Nexus repository id e.g. artefacts | |
| `repo_group_id` | Nexus repository group id e.g. com.company | |
| `repo_project_name` | Nexus repository commandect name. Only letters, digits, underscores(\_), hyphens(-), and dots(.) are allowed | |
| `repo_project_version` | Nexus repository commandect version | |
| `repo_classifier` | Nexus repository artifact classifier (optional) | |
| `endpoint` | Nexus endpoint e.g. | |
| `mount_path` | Nexus mount path (Nexus 3 instances have this configured as empty by default) | `/nexus` |
| `username` | Nexus username | |
| `password` | Nexus password | |
| `ssl_verify` | Verify SSL | `true` |
| `nexus_version` | Nexus major version | `2` |
| `verbose` | Make detailed output | `false` |
| `proxy_username` | Proxy username | |
| `proxy_password` | Proxy password | |
| `proxy_address` | Proxy address | |
| `proxy_port` | Proxy port | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action nexus_upload

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run nexus_upload

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run nexus_upload parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/installr

- Docs »
- \_Actions »
- installr
- Edit on GitHub
- ```

* * *

# installr

Upload a new build to Installr

| installr | |
| --- | --- |
| Supported platforms | ios |
| Author | @scottrhoyt |

## 1 Example

```ruby hljs
installr(
api_token: "...",
ipa: "test.ipa",
notes: "The next great version of the app!",
notify: "dev,qa",
add: "exec,ops"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_token` | API Token for Installr Access | |
| `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action | \* |
| `notes` | Release notes | |
| `notify` | Groups to notify (e.g. 'dev,qa') | |
| `add` | Groups to add (e.g. 'exec,ops') | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `installr` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::INSTALLR_BUILD_INFORMATION` | Contains release info like :appData. See |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action installr

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run installr

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run installr parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/splunkmint

- Docs »
- \_Actions »
- splunkmint
- Edit on GitHub
- ```

* * *

# splunkmint

Upload dSYM file to Splunk MINT

| splunkmint | |
| --- | --- |
| Supported platforms | ios |
| Author | @xfreebird |

## 1 Example

```ruby hljs
splunkmint(
dsym: "My.app.dSYM.zip",
api_key: "43564d3a",
api_token: "e05456234c4869fb7e0b61"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `dsym` | dSYM.zip file to upload to Splunk MINT | |
| `api_key` | Splunk MINT App API key e.g. f57a57ca | |
| `api_token` | Splunk MINT API token e.g. e05ba40754c4869fb7e0b61 | |
| `verbose` | Make detailed output | `false` |
| `upload_progress` | Show upload progress | `false` |
| `proxy_username` | Proxy username | |
| `proxy_password` | Proxy password | |
| `proxy_address` | Proxy address | |
| `proxy_port` | Proxy port | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action splunkmint

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run splunkmint

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run splunkmint parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/tryouts

- Docs »
- \_Actions »
- tryouts
- Edit on GitHub
- ```

* * *

# tryouts

| tryouts | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @alicertel |

## 1 Example

```ruby hljs
tryouts(
api_token: "...",
app_id: "application-id",
build_file: "test.ipa",
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `app_id` | Tryouts application hash | |
| `api_token` | API Token (api\_key:api\_secret) for Tryouts Access | |
| `build_file` | Path to your IPA or APK file. Optional if you use the _gym_ or _xcodebuild_ action | \* |
| `notes` | Release notes | |
| `notes_path` | Release notes text file path. Overrides the :notes parameter | |
| `notify` | Notify testers? 0 for no | `1` |
| `status` | 2 to make your release public. Release will be distributed to available testers. 1 to make your release private. Release won't be distributed to testers. This also prevents release from showing up for SDK update | `2` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `tryouts` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::TRYOUTS_BUILD_INFORMATION` | Contains release info like :application\_name, :download\_url. See |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action tryouts

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run tryouts

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run tryouts parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/podio_item

- Docs »
- \_Actions »
- podio\_item
- Edit on GitHub
- ```

* * *

# podio\_item

>
> Pass in dictionary with field keys and their values.
>
> Field key is located under `Modify app` -\> `Advanced` -\> `Developer` -\> `External ID` (see

| podio\_item | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @pprochazka72, @laugejepsen |

## 1 Example

```ruby hljs
podio_item(
identifying_value: "Your unique value",
other_fields: {

}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `client_id` | Client ID for Podio API (see | |
| `client_secret` | Client secret for Podio API (see | |
| `app_id` | App ID of the app you intend to authenticate with (see | |
| `app_token` | App token of the app you intend to authenticate with (see | |
| `identifying_field` | String specifying the field key used for identification of an item | |
| `identifying_value` | String uniquely specifying an item within the app | |
| `other_fields` | Dictionary of your app fields. Podio supports several field types, see | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `podio_item` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::PODIO_ITEM_URL` | URL to newly created (or updated) Podio item |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action podio_item

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run podio_item

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run podio_item parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/upload_to_testflight

- Docs »
- \_Actions »
- upload\_to\_testflight
- Edit on GitHub
- ```

* * *

# upload\_to\_testflight

Upload new binary to App Store Connect for TestFlight beta testing (via _pilot_)

###### The best way to manage your TestFlight testers and builds from your terminal

_pilot_ makes it easier to manage your app on Apple’s TestFlight. You can:

- Upload & distribute builds
- Add & remove testers
- Retrieve information about testers & devices
- Import/export all available testers

_pilot_ uses spaceship.airforce to interact with App Store Connect 🚀

Usage •
Tips

# Usage

For all commands, you can either use an API Key or your Apple ID.

### App Store Connect API Key

The App Store Connect API Key is the preferred authentication method (if you are able to use it).

- Uses official App Store Connect API
- No need for 2FA
- Better performance over Apple ID

Specify the API key using `--api_key_path ./path/to/api_key_info.json` or `--api_key "{\"key_id\": \"D83848D23\", \"issuer_id\": \"227b0bbf-ada8-458c-9d62-3d8022b7d07f\", \"key_filepath\": \"D83848D23.p8\"}"`

Go to Using App Store Connect API for information on obtaining an API key, the _fastlane_ `api_key_info.json` format, and other API key usage.

### Apple ID

Specify the Apple ID to use using `-u felix@krausefx.com`. If you execute _pilot_ in a project already using _fastlane_ the username and app identifier will automatically be determined.

## Uploading builds

To upload a new build, just run

```no-highlight
fastlane pilot upload

This will automatically look for an `ipa` in your current directory and tries to fetch the login credentials from your fastlane setup.

You'll be asked for any missing information. Additionally, you can pass all kinds of parameters:

```no-highlight
fastlane action pilot

You can pass a changelog using

```no-highlight
fastlane pilot upload --changelog "Something that is new here"

You can also skip the submission of the binary, which means, the `ipa` file will only be uploaded and not distributed to testers:

```no-highlight
fastlane pilot upload --skip_submission

_pilot_ does all kinds of magic for you:

- Automatically detects the bundle identifier from your `ipa` file
- Automatically fetch the AppID of your app based on the bundle identifier

_pilot_ uses _spaceship_ to submit the build metadata and the iTunes Transporter to upload the binary. Because iTunes Transporter's upload capability is only supported on OS X, `pilot upload` does not work on Linux, as described in this issue

## List builds

To list all builds for specific application use

```no-highlight
fastlane pilot builds

The result lists all active builds and processing builds:

```no-highlight
+-----------+---------+----------+
| Great App Builds |
+-----------+---------+----------+
| Version # | Build # | Installs |
+-----------+---------+----------+
| 0.9.13 | 1 | 0 |
| 0.9.13 | 2 | 0 |
| 0.9.20 | 3 | 0 |
| 0.9.20 | 4 | 3 |
+-----------+---------+----------+

## Managing beta testers

### List of Testers

This command will list all your testers, both internal and external.

```no-highlight
fastlane pilot list

The output will look like this:

```no-highlight
+--------+--------+--------------------------+-----------+
| Internal Testers |
+--------+--------+--------------------------+-----------+
| First | Last | Email | # Devices |
+--------+--------+--------------------------+-----------+
| Felix | Krause | felix@krausefx.com | 2 |
+--------+--------+--------------------------+-----------+

+-----------+---------+----------------------------+-----------+
| External Testers |
+-----------+---------+----------------------------+-----------+
| First | Last | Email | # Devices |
+-----------+---------+----------------------------+-----------+
| Max | Manfred | email@email.com | 0 |
| Detlef | Müller | detlef@krausefx.com | 1 |
+-----------+---------+----------------------------+-----------+

### Add a new tester

To add a new tester to your App Store Connect account and to associate it to at least one testing group of your app, use the `pilot add` command. This will create a new tester (if necessary) or add an existing tester to the app to test.

```no-highlight
fastlane pilot add email@invite.com -g group-1,group-2

Additionally you can specify the app identifier (if necessary):

```no-highlight
fastlane pilot add email@email.com -a com.krausefx.app -g group-1,group-2

### Find a tester

To find a specific tester use

```no-highlight
fastlane pilot find felix@krausefx.com

The resulting output will look like this:

```no-highlight
+---------------------+---------------------+
| felix@krausefx.com |
+---------------------+---------------------+
| First name | Felix |
| Last name | Krause |
| Email | felix@krausefx.com |
| Latest Version | 0.9.14 (23 |
| Latest Install Date | 03/28/15 19:00 |
| 2 Devices | • iPhone 6, iOS 8.3 |
| | • iPhone 5, iOS 7.0 |
+---------------------+---------------------+

### Remove a tester

This command will remove beta tester from app (from all internal and external groups)

```no-highlight
fastlane pilot remove felix@krausefx.com

You can also use `groups` option to remove the tester from the groups specified:

```no-highlight
fastlane pilot remove felix@krausefx.com -g group-1,group-2

### Export testers

To export all external testers to a CSV file. Useful if you need to import tester info to another system or a new account.

```no-highlight
fastlane pilot export

### Import testers

Add external testers from a CSV file. Create a file (ex: `testers.csv`) and fill it with the following format:

```no-highlight
John,Appleseed,appleseed_john@mac.com,group-1;group-2

```no-highlight
fastlane pilot import

You can also specify the directory using

```no-highlight
fastlane pilot export -c ~/Desktop/testers.csv
fastlane pilot import -c ~/Desktop/testers.csv

# Tips

## Debug information

If you run into any issues you can use the `verbose` mode to get a more detailed output:

```no-highlight
fastlane pilot upload --verbose

## Firewall Issues

_pilot_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol from the command line using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" pilot ...

If you are using _pilot_ via the fastlane action, add the following to your `Fastfile`

```no-highlight
ENV["DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS"] = "-t DAV"
pilot...

Note, however, that Apple recommends you don’t specify the `-t transport` and instead allow Transporter to use automatic transport discovery to determine the best transport mode for your packages. For this reason, if the `t` option is passed, we will raise a warning.

Also note that `-t` is not the only additional parameter that can be used. The string specified in the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS` environment variable will be forwarded to Transporter. For all the available options, check Apple's Transporter User Guide.

## Credentials Issues

If your password contains special characters, _pilot_ may throw a confusing error saying your "Your Apple ID or password was entered incorrectly". The easiest way to fix this error is to change your password to something that **does not** contains special characters.

## How is my password stored?

_pilot_ uses the CredentialsManager from _fastlane_.

## Provider Short Name

If you are on multiple App Store Connect teams, iTunes Transporter may need a provider short name to know where to upload your binary. _pilot_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

## Use an Application Specific Password to upload

_pilot_/ `upload_to_testflight` can use an Application Specific Password via the `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` environment variable to upload a binary if both the `skip_waiting_for_build_processing` and `apple_id` options are set. (If any of those are not set, it will use the normal Apple login process that might require 2FA authentication.)

## Role for App Store Connect User

_pilot_/ `upload_to_testflight` updates build information and testers after the build has finished processing. App Store Connect requires the "App Manager" or "Admin" role for your Apple account to update this information. The "Developer" role will allow builds to be uploaded but _will not_ allow updating of build information and testers.

| upload\_to\_testflight | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 7 Examples

```ruby hljs
upload_to_testflight

```ruby hljs
testflight # alias for "upload_to_testflight"

```ruby hljs
pilot # alias for "upload_to_testflight"

```ruby hljs
upload_to_testflight(skip_submission: true) # to only upload the build

```ruby hljs
upload_to_testflight(
username: "felix@krausefx.com",
app_identifier: "com.krausefx.app",
itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)

```ruby hljs
upload_to_testflight(
beta_app_feedback_email: "email@email.com",
beta_app_description: "This is a description of my app",
demo_account_required: true,
notify_external_testers: false,
changelog: "This is my changelog of things that have changed in a log"
)

```ruby hljs
upload_to_testflight(
beta_app_review_info: {
contact_email: "email@email.com",
contact_first_name: "Connect",
contact_last_name: "API",
contact_phone: "5558675309",
demo_account_name: "demo@email.com",
demo_account_password: "connectapi",
notes: "this is review note for the reviewer <3 thank you for reviewing"
},
localized_app_info: {
"default": {
feedback_email: "default@email.com",
marketing_url: "https://example.com/marketing-default",
privacy_policy_url: "https://example.com/privacy-default",
description: "Default description",
},
"en-GB": {
feedback_email: "en-gb@email.com",
marketing_url: "https://example.com/marketing-en-gb",
privacy_policy_url: "https://example.com/privacy-en-gb",
description: "en-gb description",
}
},
localized_build_info: {
"default": {
whats_new: "Default changelog",
},
"en-GB": {
whats_new: "en-gb changelog",
}
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | The bundle identifier of the app to upload or manage testers (optional) | \* |
| `app_platform` | The platform to use (optional) | |
| `apple_id` | Apple ID property in the App Information section in App Store Connect | \* |
| `ipa` | Path to the ipa file to upload | \* |
| `pkg` | Path to your pkg file | \* |
| `demo_account_required` | Do you need a demo account when Apple does review? | |
| `beta_app_review_info` | Beta app review information for contact info and demo account | |
| `localized_app_info` | Localized beta app test info for description, feedback email, marketing url, and | |
| `beta_app_description` | Provide the 'Beta App Description' when uploading a new build | |
| `beta_app_feedback_email` | Provide the beta app email when uploading a new build | |
| `localized_build_info` | Localized beta app test info for what's new | |
| `changelog` | Provide the 'What to Test' text when uploading a new build | |
| `skip_submission` | Skip the distributing action of pilot and only upload the ipa file | `false` |
| `skip_waiting_for_build_processing` | If set to true, the `distribute_external` option won't work and no build will be distributed to testers. (You might want to use this option if you are using this action on CI and have to pay for 'minutes used' on your CI plan). If set to `true` and a changelog is provided, it will partially wait for the build to appear on AppStore Connect so the changelog can be set, and skip the remaining processing steps | `false` |
| `update_build_info_on_upload` | **DEPRECATED!** Update build info immediately after validation. This is deprecated and will be removed in a future release. App Store Connect no longer supports setting build info until after build processing has completed, which is when build info is updated by default | `false` |
| `distribute_only` | Distribute a previously uploaded build (equivalent to the `fastlane pilot distribute` command) | `false` |
| `uses_non_exempt_encryption` | Provide the 'Uses Non-Exempt Encryption' for export compliance. This is used if there is 'ITSAppUsesNonExemptEncryption' is not set in the Info.plist | `false` |
| `distribute_external` | Should the build be distributed to external testers? If set to true, use of `groups` option is required | `false` |
| `notify_external_testers` | Should notify external testers? (Not setting a value will use App Store Connect's default which is to notify) | |
| `app_version` | The version number of the application build to distribute. If the version number is not specified, then the most recent build uploaded to TestFlight will be distributed. If specified, the most recent build for the version number will be distributed | |
| `build_number` | The build number of the application build to distribute. If the build number is not specified, the most recent build is distributed | |
| `expire_previous_builds` | Should expire previous builds? | `false` |
| `first_name` | The tester's first name | |
| `last_name` | The tester's last name | |
| `email` | The tester's email | |
| `testers_file_path` | Path to a CSV file of testers | `./testers.csv` |
| `groups` | Associate tester to one group or more by group name / group id. E.g. `-g "Team 1","Team 2"` This is required when `distribute_external` option is set to true or when we want to add a tester to one or more external testing groups | |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID! | \* |
| `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | |
| `wait_processing_interval` | Interval in seconds to wait for App Store Connect processing | `30` |
| `wait_processing_timeout_duration` | Timeout duration in seconds to wait for App Store Connect processing. If set, after exceeding timeout duration, this will `force stop` to wait for App Store Connect processing and exit with exception | |
| `wait_for_uploaded_build` | **DEPRECATED!** No longer needed with the transition over to the App Store Connect API - Use version info from uploaded ipa file to determine what build to use for distribution. If set to false, latest processing or any latest build will be used | `false` |
| `reject_build_waiting_for_review` | Expire previous if it's 'waiting for review' | `false` |
| `submit_beta_review` | Send the build for a beta review | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action upload_to_testflight

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_testflight

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_testflight parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/pem

- Docs »
- \_Actions »
- pem
- Edit on GitHub
- ```

* * *

# pem

Alias for the `get_push_certificate` action

###### Automatically generate and renew your push notification profiles

Tired of manually creating and maintaining your push notification profiles for your iOS apps? Tired of generating a _pem_ file for your server?

_pem_ does all that for you, just by simply running _pem_.

_pem_ creates new .pem, .cer, and .p12 files to be uploaded to your push server if a valid push notification profile is needed. _pem_ does not cover uploading the file to your server.

To automate iOS Provisioning profiles you can use _match_.

Features •
Usage •
How does it work? •
Tips •
Need help?

# Features

Well, it's actually just one: Generate the _pem_ file for your server.

Check out this gif:

# Usage

```no-highlight
fastlane pem

Yes, that's the whole command!

This does the following:

- Create a new signing request
- Create a new push certification
- Downloads the certificate
- Generates a new `.pem` file in the current working directory, which you can upload to your server

Note that _pem_ will never revoke your existing certificates. _pem_ can't download any of your existing push certificates, as the private key is only available on the machine it was created on.

If you already have a push certificate enabled, which is active for at least 30 more days, _pem_ will not create a new certificate. If you still want to create one, use the `force`:

```no-highlight
fastlane pem --force

You can pass parameters like this:

```no-highlight
fastlane pem -a com.krausefx.app -u username

If you want to generate a development certificate instead:

```no-highlight
fastlane pem --development

If you want to generate a Website Push certificate:

```no-highlight
fastlane pem --website_push

Set a password for your `p12` file:

```no-highlight
fastlane pem -p "MyPass"

You can specify a name for the output file:

```no-highlight
fastlane pem -o my.pem

To get a list of available options run:

```no-highlight
fastlane action pem

### Note about empty `p12` passwords and Keychain Access.app

_pem_ will produce a valid `p12` without specifying a password, or using the empty-string as the password.
While the file is valid, the Mac's Keychain Access will not allow you to open the file without specifying a passphrase.

Instead, you may verify the file is valid using OpenSSL:

```no-highlight
openssl pkcs12 -info -in my.p12

If you need the `p12` in your keychain, perhaps to test push with an app like Knuff or Pusher, you can use `openssl` to export the `p12` to _pem_ and to communicate with the Apple Developer Portal to request a new push certificate for you.

## How is my password stored?

_pem_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

| pem | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
get_push_certificate

```ruby hljs
pem # alias for "get_push_certificate"

```ruby hljs
get_push_certificate(
force: true, # create a new profile, even if the old one is still valid
app_identifier: "net.sunapps.9", # optional app identifier,
save_private_key: true,
new_profile: proc do |profile_path| # this block gets called when a new profile was generated
puts profile_path # the absolute path to the new PEM file
# insert the code to upload the PEM file to the server
end
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `platform` | Set certificate's platform. Used for creation of production & development certificates. Supported platforms: ios, macos | `ios` |
| `development` | Renew the development push certificate instead of the production one | `false` |
| `website_push` | Create a Website Push certificate | `false` |
| `generate_p12` | Generate a p12 file additionally to a PEM file | `true` |
| `active_days_limit` | If the current certificate is active for less than this number of days, generate a new one | `30` |
| `force` | Create a new push certificate, even if the current one is active for 30 (or PEM\_ACTIVE\_DAYS\_LIMIT) more days | `false` |
| `save_private_key` | Set to save the private RSA key | `true` |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `p12_password` | The password that is used for your p12 file | |
| `pem_name` | The file name of the generated .pem file | |
| `output_path` | The path to a directory in which all certificates and private keys should be stored | `.` |
| `new_profile` | Block that is called if there is a new profile | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run pem

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run pem parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_urban_airship_configuration

- Docs »
- \_Actions »
- update\_urban\_airship\_configuration
- Edit on GitHub
- ```

* * *

# update\_urban\_airship\_configuration

| update\_urban\_airship\_configuration | |
| --- | --- |
| Supported platforms | ios |
| Author | @kcharwood |

## 1 Example

```ruby hljs
update_urban_airship_configuration(
plist_path: "AirshipConfig.plist",
production_app_key: "PRODKEY",
production_app_secret: "PRODSECRET"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `plist_path` | Path to Urban Airship configuration Plist | |
| `development_app_key` | The development app key | |
| `development_app_secret` | The development app secret | |
| `production_app_key` | The production app key | |
| `production_app_secret` | The production app secret | |
| `detect_provisioning_mode` | Automatically detect provisioning mode | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_urban_airship_configuration

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_urban_airship_configuration

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_urban_airship_configuration parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/onesignal

- Docs »
- \_Actions »
- onesignal
- Edit on GitHub
- ```

* * *

# onesignal

| onesignal | |
| --- | --- |
| Supported platforms | ios, android |
| Author | @timothybarraclough, @smartshowltd |

## 2 Examples

```ruby hljs
onesignal(
auth_token: "Your OneSignal Auth Token",
app_name: "Name for OneSignal App",
android_token: "Your Android GCM key (optional)",
android_gcm_sender_id: "Your Android GCM Sender ID (optional)",
fcm_json: "Path to FCM Service Account JSON File (optional)",
apns_p12: "Path to Apple .p12 file (optional)",
apns_p12_password: "Password for .p12 file (optional)",
apns_env: "production/sandbox (defaults to production)",
organization_id: "Onesignal organization id (optional)"
)

```ruby hljs
onesignal(
app_id: "Your OneSignal App ID",
auth_token: "Your OneSignal Auth Token",
app_name: "New Name for OneSignal App",
android_token: "Your Android GCM key (optional)",
android_gcm_sender_id: "Your Android GCM Sender ID (optional)",
fcm_json: "Path to FCM Service Account JSON File (optional)",
apns_p12: "Path to Apple .p12 file (optional)",
apns_p12_password: "Password for .p12 file (optional)",
apns_env: "production/sandbox (defaults to production)",
organization_id: "Onesignal organization id (optional)"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `app_id` | OneSignal App ID. Setting this updates an existing app | |
| `auth_token` | OneSignal Authorization Key | |
| `app_name` | OneSignal App Name. This is required when creating an app (in other words, when `:app_id` is not set, and optional when updating an app | |
| `android_token` | ANDROID GCM KEY | |
| `android_gcm_sender_id` | GCM SENDER ID | |
| `fcm_json` | FCM Service Account JSON File (in .json format) | |
| `apns_p12` | APNS P12 File (in .p12 format) | |
| `apns_p12_password` | APNS P12 password | |
| `apns_env` | APNS environment | `production` |
| `organization_id` | OneSignal Organization ID | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `onesignal` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::ONE_SIGNAL_APP_ID` | The app ID of the newly created or updated app |
| `SharedValues::ONE_SIGNAL_APP_AUTH_KEY` | The auth token for the newly created or updated app |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action onesignal

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run onesignal

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run onesignal parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_push_certificate

- Docs »
- \_Actions »
- get\_push\_certificate
- Edit on GitHub
- ```

* * *

# get\_push\_certificate

Ensure a valid push profile is active, creating a new one if needed (via _pem_)

###### Automatically generate and renew your push notification profiles

Tired of manually creating and maintaining your push notification profiles for your iOS apps? Tired of generating a _pem_ file for your server?

_pem_ does all that for you, just by simply running _pem_.

_pem_ creates new .pem, .cer, and .p12 files to be uploaded to your push server if a valid push notification profile is needed. _pem_ does not cover uploading the file to your server.

To automate iOS Provisioning profiles you can use _match_.

Features •
Usage •
How does it work? •
Tips •
Need help?

# Features

Well, it's actually just one: Generate the _pem_ file for your server.

Check out this gif:

# Usage

```no-highlight
fastlane pem

Yes, that's the whole command!

This does the following:

- Create a new signing request
- Create a new push certification
- Downloads the certificate
- Generates a new `.pem` file in the current working directory, which you can upload to your server

Note that _pem_ will never revoke your existing certificates. _pem_ can't download any of your existing push certificates, as the private key is only available on the machine it was created on.

If you already have a push certificate enabled, which is active for at least 30 more days, _pem_ will not create a new certificate. If you still want to create one, use the `force`:

```no-highlight
fastlane pem --force

You can pass parameters like this:

```no-highlight
fastlane pem -a com.krausefx.app -u username

If you want to generate a development certificate instead:

```no-highlight
fastlane pem --development

If you want to generate a Website Push certificate:

```no-highlight
fastlane pem --website_push

Set a password for your `p12` file:

```no-highlight
fastlane pem -p "MyPass"

You can specify a name for the output file:

```no-highlight
fastlane pem -o my.pem

To get a list of available options run:

```no-highlight
fastlane action pem

### Note about empty `p12` passwords and Keychain Access.app

_pem_ will produce a valid `p12` without specifying a password, or using the empty-string as the password.
While the file is valid, the Mac's Keychain Access will not allow you to open the file without specifying a passphrase.

Instead, you may verify the file is valid using OpenSSL:

```no-highlight
openssl pkcs12 -info -in my.p12

If you need the `p12` in your keychain, perhaps to test push with an app like Knuff or Pusher, you can use `openssl` to export the `p12` to _pem_ and to communicate with the Apple Developer Portal to request a new push certificate for you.

## How is my password stored?

_pem_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

| get\_push\_certificate | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
get_push_certificate

```ruby hljs
pem # alias for "get_push_certificate"

```ruby hljs
get_push_certificate(
force: true, # create a new profile, even if the old one is still valid
app_identifier: "net.sunapps.9", # optional app identifier,
save_private_key: true,
new_profile: proc do |profile_path| # this block gets called when a new profile was generated
puts profile_path # the absolute path to the new PEM file
# insert the code to upload the PEM file to the server
end
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `platform` | Set certificate's platform. Used for creation of production & development certificates. Supported platforms: ios, macos | `ios` |
| `development` | Renew the development push certificate instead of the production one | `false` |
| `website_push` | Create a Website Push certificate | `false` |
| `generate_p12` | Generate a p12 file additionally to a PEM file | `true` |
| `active_days_limit` | If the current certificate is active for less than this number of days, generate a new one | `30` |
| `force` | Create a new push certificate, even if the current one is active for 30 (or PEM\_ACTIVE\_DAYS\_LIMIT) more days | `false` |
| `save_private_key` | Set to save the private RSA key | `true` |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `p12_password` | The password that is used for your p12 file | |
| `pem_name` | The file name of the generated .pem file | |
| `output_path` | The path to a directory in which all certificates and private keys should be stored | `.` |
| `new_profile` | Block that is called if there is a new profile | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_push_certificate

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_push_certificate

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_push_certificate parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/deliver



---

# https://docs.fastlane.tools/actions/supply

- Docs »
- \_Actions »
- supply
- Edit on GitHub
- ```

* * *

# supply

Alias for the `upload_to_play_store` action

###### Command line tool for updating Android apps and their metadata on the Google Play Store

_supply_ uploads app metadata, screenshots, binaries, and app bundles to Google Play. You can also select tracks for builds and promote builds to production.

Features •
Setup •
Quick Start •
Commands •
Uploading an APK •
Uploading an AAB •
Images

## Features

- Update existing Android applications on Google Play via the command line
- Upload new builds (APKs and AABs)
- Retrieve and edit metadata, such as title and description, for multiple languages
- Upload the app icon, promo graphics and screenshots for multiple languages
- Have a local copy of the metadata in your git repository
- Retrieve version code numbers from existing Google Play tracks

## Setup

Setup consists of setting up your Google Developers Service Account

**Tip:** If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English. All the links below already have this to make it easier to find the correct buttons.

**Note:** if you face issues when following these instructions, you might want to refer to the official documentation by Google.

1. Open the Google Play Console
1. Click **Account Details**, and note the **Google Cloud Project ID** listed there
2. Enable the Google Play Developer API by selecting an existing Google Cloud Project that fits your needs and pushing **ENABLE**
1. If you don't have an existing project or prefer to have a dedicated one for _fastlane_, create a new one here and follow the instructions
3. Open Service Accounts on Google Cloud and select the project you'd like to use
01. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Cloud Platform Console** page
02. Verify that you are on the correct Google Cloud Platform Project by looking for the **Google Cloud Project ID** from earlier within the light gray text in the second input, preceding `.iam.gserviceaccount.com`, or by checking the project name in the navigation bar. If not, open the picker in the top navigation bar, and find the right one.
03. Provide a `Service account name` (e.g. fastlane-supply)
04. Copy the generated email address that is noted below the `Service account-ID` field for later use
05. Click **DONE** (don't click **CREATE AND CONTINUE** as the optional steps such as granting access are not needed): ![](https://docs.fastlane.tools/img/getting-started/android/creating-service-account.png)
06. Click on the **Actions** vertical three-dot icon of the service account you just created
07. Select **Manage keys** on the menu
08. Click **ADD KEY** → **Create New Key**
09. Make sure **JSON** is selected as the `Key type`, and click **CREATE**
10. Save the file on your computer when prompted and remember where it was saved at
4. Open the Google Play Console and select **Users and Permissions**
1. Click **Invite new users**
2. Paste the email address you saved for later use into the email address field
3. Click on **Account Permissions**
4. Choose the permissions you'd like this account to have. We recommend **Admin (all permissions)**, but you may want to manually select all checkboxes and leave out some of the **Releases** permissions such as **Release to production, exclude devices, and use Play App Signing**
5. Click on **Invite User**

You can use `fastlane run validate_play_store_json_key json_key:/path/to/your/downloaded/file.json` to test the connection to Google Play Store with the downloaded private key. Once that works, add the path to the JSON file to your Appfile:

```ruby hljs
json_key_file("path/to/your/play-store-credentials.json")
package_name("my.package.name")

The path is relative to where you normally run `fastlane`.

### Migrating Google credential format (from .p12 key file to .json)

In previous versions of supply, credentials to your Play Console were stored as `.p12` files. Since version 0.4.0, supply now supports the recommended `.json` key Service Account credential files. If you wish to upgrade:

- follow the Setup procedure once again to make sure you create the appropriate JSON file
- update your fastlane configuration or your command line invocation to use the appropriate argument if necessary.
Note that you don't need to take note nor pass the `issuer` argument anymore.

The previous p12 configuration is still currently supported.

- `cd [your_project_folder]`
- `fastlane supply init`
- Make changes to the downloaded metadata, add images, screenshots and/or an APK
- `fastlane supply`

## Available Commands

- `fastlane supply`: update an app with metadata, a build, images and screenshots
- `fastlane supply init`: download metadata for an existing app to a local directory
- `fastlane action supply`: show information on available commands, arguments and environment variables

You can either run _supply_ on its own and use it interactively, or you can pass arguments or specify environment variables for all the options to skip the questions.

## Uploading an APK

To upload a new binary to Google Play, simply run

```no-highlight
fastlane supply --apk path/to/app.apk

This will also upload app metadata if you previously ran `fastlane supply init`.

To gradually roll out a new build use

```no-highlight
fastlane supply --apk path/app.apk --track beta --rollout 0.5

To set the in-app update priority level for a release, set a valid update priority (an integer value from 0 to 5) using option `in_app_update_priority`

```no-highlight
fastlane supply --apk path/app.apk --track beta --in_app_update_priority 3

### Expansion files ( `.obb`)

Expansion files (obbs) found under the same directory as your APK will also be uploaded together with your APK as long as:

- they are identified as type 'main' or 'patch' (by containing 'main' or 'patch' in their file name)
- you have at most one of each type

If you only want to update the APK, but keep the expansion files from the previous version on Google Play use

```no-highlight
fastlane supply --apk path/app.apk --obb_main_references_version 21 --obb_main_file_size 666154207

or

```no-highlight
fastlane supply --apk path/app.apk --obb_patch_references_version 21 --obb_patch_file_size 666154207

## Uploading an AAB

To upload a new Android application bundle to Google Play, simply run

```no-highlight
fastlane supply --aab path/to/app.aab

```no-highlight
fastlane supply --aab path/app.aab --track beta --rollout 0.5

```no-highlight
fastlane supply --aab path/app.aab --track beta --in_app_update_priority 3

## Images and Screenshots

After running `fastlane supply init`, you will have a metadata directory. This directory contains one or more locale directories (e.g. en-US, en-GB, etc.), and inside this directory are text files such as `title.txt` and `short_description.txt`.

Inside of a given locale directory is a folder called `images`. Here you can supply images with the following file names (extension can be png, jpg or jpeg):

- `featureGraphic`
- `icon`
- `promoGraphic`
- `tvBanner`

You can also supply screenshots by creating directories within the `images` directory with the following names, containing PNGs or JPEGs:

- `phoneScreenshots/`
- `sevenInchScreenshots/` (7-inch tablets)
- `tenInchScreenshots/` (10-inch tablets)
- `tvScreenshots/`
- `wearScreenshots/`

You may name images anything you like, but screenshots will appear in the Play Store in alphanumerical filename order.
Note that these will replace the current images and screenshots on the play store listing, not add to them.

## Changelogs (What's new)

You can add changelog files under the `changelogs/` directory for each locale. The filename should exactly match the version code of the APK that it represents. You can also provide default notes that will be used if no files match the version code by adding a `default.txt` file. `fastlane supply init` will populate changelog files from existing data on Google Play if no `metadata/` directory exists when it is run.

```no-highlight
└── fastlane
└── metadata
└── android
├── en-US
│ └── changelogs
│ ├── default.txt
│ ├── 100000.txt
│ └── 100100.txt
└── fr-FR
└── changelogs
├── default.txt
└── 100100.txt

## Track Promotion

A common Play publishing scenario might involve uploading an APK version to a test track, testing it, and finally promoting that version to production.

This can be done using the `--track_promote_to` parameter. The `--track_promote_to` parameter works with the `--track` parameter to command the Play API to promote existing Play track APK version(s) (those active on the track identified by the `--track` param value) to a new track ( `--track_promote_to` value).

## Retrieve Track Release Names & Version Codes

Before performing a new APK upload you may want to check existing track version codes or release names, or you may simply want to provide an informational lane that displays the currently promoted version codes or release name for the production track. You can use the `google_play_track_version_codes` action to retrieve existing version codes for a package and track. You can use the `google_play_track_release_names` action to retrieve existing release names for a package and track.
For more information, see the `fastlane action google_play_track_version_codes` and `fastlane action google_play_track_release_names` help output.

## Parallel uploads

By default _supply_ will spawn 10 threads to upload the metadata concurrently ( _images, screenshots, texts_). If you want to change this, set either `DELIVER_NUMBER_OF_THREADS` or `FL_NUMBER_OF_THREADS` environment variable to any value between 1 and 10.

If you want _supply_ to upload with more than 10 threads in parallel then you need to **additionally** set `FL_MAX_NUMBER_OF_THREADS` environment variable to the max number of parallel upload threads you wish to have ( **Warning ⚠️** use this at your own risk!).

## Migration from AndroidPublisherV2 to AndroidPublisherV3 in _fastlane_ 2.135.0

### New Options

- `:version_name`
- Used when uploading with `:apk_path`, `:apk_paths`, `:aab_path`, and `:aab_paths`
- Can be any string such (example: "October Release" or "Awesome New Feature")
- Defaults to the version name in app/build.gradle or AndroidManifest.xml
- `:release_status`
- Used when uploading with `:apk_path`, `:apk_paths`, `:aab_path`, and `:aab_paths`
- Can set as "draft" to complete the release at some other time
- Defaults to "completed"
- `:version_code`
- Used for `:update_rollout`, `:track_promote_to`, and uploading of meta data and screenshots
- `:skip_upload_changelogs`
- Changelogs were previously included with the `:skip_upload_metadata` but is now its own option

### Deprecated Options

- `:check_superseded_tracks`
- Google Play will automatically remove releases that are superseded now
- `:deactivate_on_promote`
- Google Play will automatically deactivate a release from its previous track on promote

| supply | |
| --- | --- |
| Supported platforms | android |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
upload_to_play_store

```ruby hljs
supply # alias for "upload_to_play_store"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `package_name` | The package name of the application to use | \* |
| `version_name` | Version name (used when uploading new apks/aabs) - defaults to 'versionName' in build.gradle or AndroidManifest.xml | \* |
| `version_code` | The versionCode for which to download the generated APK | \* |
| `release_status` | Release status (used when uploading new apks/aabs) - valid values are completed, draft, halted, inProgress | \* |
| `track` | The track of the application to use. The default available tracks are: production, beta, alpha, internal | `production` |
| `rollout` | The percentage of the user fraction when uploading to the rollout track (setting to 1 will complete the rollout) | |
| `metadata_path` | Path to the directory containing the metadata files | \* |
| `key` | **DEPRECATED!** Use `--json_key` instead - The p12 File used to authenticate with Google | \* |
| `issuer` | **DEPRECATED!** Use `--json_key` instead - The issuer of the p12 file (email address of the service account) | \* |
| `json_key` | The path to a file containing service account JSON, used to authenticate with Google | \* |
| `json_key_data` | The raw service account JSON data used to authenticate with Google | \* |
| `apk` | Path to the APK file to upload | \* |
| `apk_paths` | An array of paths to APK files to upload | |
| `aab` | Path to the AAB file to upload | \* |
| `aab_paths` | An array of paths to AAB files to upload | |
| `skip_upload_apk` | Whether to skip uploading APK | `false` |
| `skip_upload_aab` | Whether to skip uploading AAB | `false` |
| `skip_upload_metadata` | Whether to skip uploading metadata, changelogs not included | `false` |
| `skip_upload_changelogs` | Whether to skip uploading changelogs | `false` |
| `skip_upload_images` | Whether to skip uploading images, screenshots not included | `false` |
| `skip_upload_screenshots` | Whether to skip uploading SCREENSHOTS | `false` |
| `sync_image_upload` | Whether to use sha256 comparison to skip upload of images and screenshots that are already in Play Store | `false` |
| `track_promote_to` | The track to promote to. The default available tracks are: production, beta, alpha, internal | |
| `track_promote_release_status` | Promoted track release status (used when promoting a track) - valid values are completed, draft, halted, inProgress | `completed` |
| `validate_only` | Only validate changes with Google Play rather than actually publish | `false` |
| `mapping` | Path to the mapping file to upload (mapping.txt or native-debug-symbols.zip alike) | |
| `mapping_paths` | An array of paths to mapping files to upload (mapping.txt or native-debug-symbols.zip alike) | |
| `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of | |
| `check_superseded_tracks` | **DEPRECATED!** Google Play does this automatically now - Check the other tracks for superseded versions and disable them | `false` |
| `timeout` | Timeout for read, open, and send (in seconds) | `300` |
| `deactivate_on_promote` | **DEPRECATED!** Google Play does this automatically now - When promoting to a new track, deactivate the binary in the origin track | `true` |
| `version_codes_to_retain` | An array of version codes to retain when publishing a new APK | |
| `changes_not_sent_for_review` | Indicates that the changes in this edit will not be reviewed until they are explicitly sent for review from the Google Play Console UI | `false` |
| `rescue_changes_not_sent_for_review` | Catches changes\_not\_sent\_for\_review errors when an edit is committed and retries with the configuration that the error message recommended | `true` |
| `in_app_update_priority` | In-app update priority for all the newly added apks in the release. Can take values between \[0,5\] | |
| `obb_main_references_version` | References version of 'main' expansion file | |
| `obb_main_file_size` | Size of 'main' expansion file in bytes | |
| `obb_patch_references_version` | References version of 'patch' expansion file | |
| `obb_patch_file_size` | Size of 'patch' expansion file in bytes | |
| `ack_bundle_installation_warning` | Must be set to true if the bundle installation may trigger a warning on user devices (e.g can only be downloaded over wifi). Typically this is required for bundles over 150MB | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action supply

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run supply

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run supply parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/appstore



---

# https://docs.fastlane.tools/actions/upload_to_play_store_internal_app_sharing

- Docs »
- \_Actions »
- upload\_to\_play\_store\_internal\_app\_sharing
- Edit on GitHub
- ```

* * *

# upload\_to\_play\_store\_internal\_app\_sharing

| upload\_to\_play\_store\_internal\_app\_sharing | |
| --- | --- |
| Supported platforms | android |
| Author | @andrewhavens |
| Returns | Returns a string containing the download URL for the uploaded APK/AAB (or array of strings if multiple were uploaded). |

## 1 Example

```ruby hljs
upload_to_play_store_internal_app_sharing

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `package_name` | The package name of the application to use | \* |
| `json_key` | The path to a file containing service account JSON, used to authenticate with Google | \* |
| `json_key_data` | The raw service account JSON data used to authenticate with Google | \* |
| `apk` | Path to the APK file to upload | \* |
| `apk_paths` | An array of paths to APK files to upload | |
| `aab` | Path to the AAB file to upload | \* |
| `aab_paths` | An array of paths to AAB files to upload | |
| `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of | |
| `timeout` | Timeout for read, open, and send (in seconds) | `300` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action upload_to_play_store_internal_app_sharing

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_play_store_internal_app_sharing

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_play_store_internal_app_sharing parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/download_app_privacy_details_from_app_store

- Docs »
- \_Actions »
- download\_app\_privacy\_details\_from\_app\_store
- Edit on GitHub
- ```

* * *

# download\_app\_privacy\_details\_from\_app\_store

| download\_app\_privacy\_details\_from\_app\_store | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @igor-makarov |

## 2 Examples

```ruby hljs
download_app_privacy_details_from_app_store(
username: "your@email.com",
team_name: "Your Team",
app_identifier: "com.your.bundle"
)

```ruby hljs
download_app_privacy_details_from_app_store(
username: "your@email.com",
team_name: "Your Team",
app_identifier: "com.your.bundle",
output_json_path: "fastlane/app_data_usages.json"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `username` | Your Apple ID Username for App Store Connect | \* |
| `app_identifier` | The bundle identifier of your app | \* |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `output_json_path` | Path to the app usage data JSON file generated by interactive questions | `./fastlane/app_privacy_details.json` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action download_app_privacy_details_from_app_store

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run download_app_privacy_details_from_app_store

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run download_app_privacy_details_from_app_store parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/upload_to_app_store

- Docs »
- \_Actions »
- upload\_to\_app\_store
- Edit on GitHub
- ```

* * *

# upload\_to\_app\_store

Upload metadata and binary to App Store Connect (via _deliver_)

_deliver_ uploads screenshots, metadata and binaries to App Store Connect. Use _deliver_ to submit your app for App Store review.

Features •
Quick Start •
Usage •
Tips

# Features

- Upload hundreds of localized screenshots completely automatically
- Upload a new ipa/pkg file to App Store Connect without Xcode from any Mac
- Maintain your app metadata locally and push changes
- Store the configuration in git to easily deploy from **any** Mac, including your Continuous Integration server
- Get a HTML preview of the fetched metadata before uploading the app metadata and screenshots to iTC
- Automatically uses _precheck_ to ensure your app has the highest chances of passing app review the first time

To upload builds to TestFlight check out _pilot_.

# Quick Start

The guide will create all the necessary files for you, using the existing app metadata from App Store Connect.

- `cd [your_project_folder]`
- `fastlane deliver init`
- Enter your App Store Connect credentials
- Enter your app identifier
- Enjoy a good drink, while the computer does all the work for you

From now on, you can run `fastlane deliver` to deploy a new update, or just upload new app metadata and screenshots.

# Usage

Check out your local `./fastlane/metadata` and `./fastlane/screenshots` folders (if you don't use _fastlane_ it's `./metadata` instead)

You'll see your metadata from App Store Connect. Feel free to store the metadata in git (not the screenshots). You can now modify it locally and push the changes you don't have to manually specify the path to your `ipa`/ `pkg` file.

This is just a small sub-set of what you can do with _deliver_, check out the full documentation in #more-options

Download existing screenshots from App Store Connect

```no-highlight
fastlane deliver download_screenshots

Download existing metadata from App Store Connect

```no-highlight
fastlane deliver download_metadata

To get a list of available options run

```no-highlight
fastlane action deliver

### Use in a `Fastfile`

```ruby hljs
deliver

```ruby hljs
deliver(
submit_for_review: true,
force: true,
metadata_path: "./metadata"
)

## More options

View all available options and their valid values

## Available options

All the options below can easily be added to your `Deliverfile`. The great thing: if you use _fastlane_ you can use all these options from your `Fastfile` too, for example:

```ruby hljs
deliver(
submit_for_review: true,
metadata_path: "../folder"
)

##### app\_identifier

The bundle identifier (e.g. "com.krausefx.app")

##### username

Your Apple ID email address

##### ipa

A path to a signed ipa file, which will be uploaded. If you don't provide this value, only app metadata will be uploaded. If you want to submit the app for review make sure to either use `fastlane deliver --submit_for_review` or add `submit_for_review true` to your `Deliverfile`

```ruby-skip-tests
ipa("App.ipa")

if you use _fastlane_ the ipa file will automatically be detected.

##### pkg

A path to a signed pkg file, which will be uploaded. Submission logic of ipa applies to pkg files.

```ruby-skip-tests
pkg("MacApp.pkg")

##### app\_version

Optional, as it is usually automatically detected. Specify the version that should be created / edited on App Store Connect:

```ruby-skip-tests
app_version("2.0")

##### skip\_app\_version\_update

The option allows uploading your app without updating "Prepare for submission" version.

This could be useful in the case if you are generating a lot of uploads while not submitting the latest build for Apple review.

The default value is false.

```ruby-skip-tests
skip_app_version_update(true)

##### submit\_for\_review

Add this to your `Deliverfile` to automatically submit the app for review after uploading metadata/binary. This will select the latest build.

```ruby-skip-tests
submit_for_review(true)

##### screenshots\_path

A path to a folder containing subfolders for each language. This will automatically detect the device type based on the image resolution. Also includes  Watch Support.

##### metadata\_path

Path to the metadata you want to use. The folder has to be structured like this

If you run `deliver init` this will automatically be created for you.

##### force

```ruby-skip-tests
force(true)

If set to `true`, no HTML report will be generated before the actual upload. You can also pass `--force` when calling _deliver_.

##### price\_tier

Pass the price tier as number. This will be active from the current day.

```ruby-skip-tests
price_tier 0

##### trade\_representative\_contact\_information

Trade Representative Contact information for Korean App Store. Available options: `first_name`, `last_name`, `address_line1`, `address_line2`, `address_line3`, `city_name`, `state`, `country`, `postal_code`, `phone_number`, `email_address`, `is_displayed_on_app_store`.

```ruby-skip-tests
trade_representative_contact_information(
first_name: "Felix",
last_name: "Krause",
address_line1: "1 Infinite Loop",
address_line2: "",
address_line3: null,
city_name: "Cupertino",
state: "California",
country: "United States",
postal_code: "95014",
phone_number: "+43 123123123",
email_address: "github@krausefx.com",
)

`is_displayed_on_app_store` is the option on App Store Connect described as: `Display Trade Representative Contact Information on the Korean App Store`

##### app\_review\_information

Contact information for the app review team. Available options: `first_name`, `last_name`, `phone_number`, `email_address`, `demo_user`, `demo_password`, `notes`.

```ruby-skip-tests
app_review_information(
first_name: "Felix",
last_name: "Krause",
phone_number: "+43 123123123",
email_address: "github@krausefx.com",
demo_user: "demoUser",
demo_password: "demoPass",
notes: "such notes, very text"
)

##### app\_review\_attachment\_file

You can provide additional information to the app review team as a file attachment. As of this writing, Apple supports following file attachment formats: .pdf, .doc, .docx, .rtf, .pages, .xls, .xlsx, .numbers, .zip, .rar, .plist, .crash, .jpg, .png, .mp4, or .avi.

Provide an empty string (i.e. "", not null) to remove the existing attachment file (if any) from the review information being edited.

```ruby-skip-tests
app_review_attachment_file: "./readme.txt"

##### submission\_information

Must be a hash. This is used as the last step for the deployment process, where you define if you use third party content or use encryption. A list of available options.

```ruby-skip-tests
submission_information({
add_id_info_serves_ads: true,
...
})

##### automatic\_release

Should the app be released to all users once Apple approves it? If set to `false`, you'll have to manually release the update once it got approved.

```ruby-skip-tests
automatic_release(true)
# or
automatic_release(false)

##### phased\_release

Enable or disable the phased releases feature of App Store Connect. If set to `true`, the update will be released over a 7 day period. Default behavior is to leave whatever you defined on App Store Connect.

```ruby-skip-tests
phased_release(true)
phased_release(false)

##### reset\_ratings

Reset your app's summary rating for all territories. If set to `true`, it will reset rating when this version is released. Default behavior is to keep existing rating.

```ruby-skip-tests
reset_ratings(true)
reset_ratings(false)

##### app\_rating\_config\_path

You can set the app age ratings using _deliver_. You'll have to create and store a `JSON` configuration file. Copy the template to your project folder and pass the path to the `JSON` file using the `app_rating_config_path` option.

The keys/values on the top allow one of 3 strings: "NONE", "INFREQUENT\_OR\_MILD" or "FREQUENT\_OR\_INTENSE", and the items on the bottom allow false or true. More information in #reference.

## Metadata

All options below are useful if you want to specify certain app metadata in your `Deliverfile` or `Fastfile`

### Localized

Localized values should be set like this

```ruby-skip-tests
description({

})

##### name

The title/name of the app

##### subtitle

Localized subtitle of the app

```ruby-skip-tests
subtitle(

)

##### description

The description of the app

##### release\_notes

The release\_notes (What's new / Changelog) of the latest version

##### support\_url, marketing\_url, privacy\_url

These URLs are shown in the AppStore

##### keywords

Keywords separated using a comma.

```ruby-skip-tests
keywords(

##### promotional\_text

Localized promotional text

```ruby-skip-tests
promotional_text(

##### app\_icon

A path to a new app icon, which must be exactly 1024x1024px

```ruby-skip-tests
app_icon('./AppIcon.png')

##### apple\_watch\_app\_icon

A path to a new app icon for the  Watch, which must be exactly 1024x1024px

```ruby-skip-tests
apple_watch_app_icon('./AppleWatchAppIcon.png')

##### platform

The platform of your application (a.e. ios, osx).

This option is optional. The default value is "ios" and deliver should be able to figure out the platform from your binary.

However, in the case if multiple binaries present, you can specify a platform which you want to deliver explicitly.

The available options:

- 'ios'
- 'appletvos'
- 'osx'

##### copyright

The up to date copyright information.

```ruby-skip-tests
copyright("#{Time.now.year} Felix Krause")

##### primary\_category

The english name of the category you want to set (e.g. `Business`, `Books`)

See #reference for a list of available categories

##### secondary\_category

The english name of the secondary category you want to set

##### primary\_first\_sub\_category

The english name of the primary first sub category you want to set

##### primary\_second\_sub\_category

The english name of the primary second sub category you want to set

##### secondary\_first\_sub\_category

The english name of the secondary first sub category you want to set

##### secondary\_second\_sub\_category

The english name of the secondary second sub category you want to set

# Submit Build

_deliver_ allows you to promote an existing build to production. Below are examples to select a previously uploaded build and submit it for review.

```no-highlight
fastlane deliver submit_build --build_number 830

### Submit build in a `Fastfile`

```ruby hljs
lane :submit_review do
deliver(
build_number: '830',
submit_for_review: true,
automatic_release: true,
force: true, # Skip HTMl report verification
skip_metadata: true,
skip_screenshots: true,
skip_binary_upload: true
)
end

Omit `build_number` to let _fastlane_ automatically select the latest build number for the current version being edited for release from App Store Connect.

### Compliance and IDFA settings

Use the `submission_information` parameter for additional submission specifiers, including compliance and IDFA settings. Look at the Spaceship's `app_submission.rb` file for options. See this example.

```no-highlight
fastlane deliver submit_build --build_number 830 --submission_information "{\"export_compliance_uses_encryption\": false, \"add_id_info_uses_idfa\": false }"

### App Privacy Details

Starting on December 8, 2020, Apple announced that developers are required to provide app privacy details that will help users understand an app's privacy practices. _deliver_ does not allow for updating of this information but this can be done with the _upload\_app\_privacy\_details\_to\_app\_store_ action. More information on Uploading App Privacy Details

# Credentials

A detailed description about how your credentials are handled is available in a credentials\_manager.

### How does this thing even work? Is magic involved? 🎩

Your password will be stored in the macOS keychain, but can also be passed using environment variables. (More information available on CredentialsManager)

Before actually uploading anything to iTunes, _deliver_ will generate a HTML summary of the collected data.

_deliver_ uses the following techniques under the hood:

- The iTMSTransporter tool is used to upload the binary to App Store Connect. iTMSTransporter is a command line tool provided by Apple.
- For all metadata related actions _deliver_ uses _spaceship_

# Tips

## Available language codes

```no-highlight
ar-SA, ca, cs, da, de-DE, el, en-AU, en-CA, en-GB, en-US, es-ES, es-MX, fi, fr-CA, fr-FR, he, hi, hr, hu, id, it, ja, ko, ms, nl-NL, no, pl, pt-BR, pt-PT, ro, ru, sk, sv, th, tr, uk, vi, zh-Hans, zh-Hant

## Available Metadata Folder Options

_deliver_ allows for metadata to be set through `.txt` files in the metadata folder. This metadata folder location is defaulted to `./fastlane/metadata` but can be overridden through the `metadata_path` parameter. Below are all allowed metadata options.

### Non-Localized Metadata

| Key | Editable While Live | Directory | Filename |
| --- | --- | --- | --- |

### Localized Metadata

### Review Information Metadata

| Key | Editable While Live | Directory | Filename | Deprecated Filename |
| --- | --- | --- | --- | --- |

## Reference

View all available categories, etc.

### Available Categories

- `FOOD_AND_DRINK`
- `BUSINESS`
- `EDUCATION`
- `SOCIAL_NETWORKING`
- `BOOKS`
- `SPORTS`
- `FINANCE`
- `REFERENCE`
- `GRAPHICS_AND_DESIGN`
- `DEVELOPER_TOOLS`
- `HEALTH_AND_FITNESS`
- `MUSIC`
- `WEATHER`
- `TRAVEL`
- `ENTERTAINMENT`
- `STICKERS`
- `GAMES`
- `LIFESTYLE`
- `MEDICAL`
- `MAGAZINES_AND_NEWSPAPERS`
- `UTILITIES`
- `SHOPPING`
- `PRODUCTIVITY`
- `NEWS`
- `PHOTO_AND_VIDEO`
- `NAVIGATION`

### Available Game Subcategories

- `MZGenre.Action`
- `MZGenre.Adventure`
- `MZGenre.Arcade`
- `MZGenre.Board`
- `MZGenre.Card`
- `MZGenre.Casino`
- `MZGenre.Dice`
- `MZGenre.Educational`
- `MZGenre.Family`
- `MZGenre.Music`
- `MZGenre.Puzzle`
- `MZGenre.Racing`
- `MZGenre.RolePlaying`
- `MZGenre.Simulation`
- `MZGenre.Sports`
- `MZGenre.Strategy`
- `MZGenre.Trivia`
- `MZGenre.Word`

- `GAMES_SPORTS`
- `GAMES_WORD`
- `GAMES_MUSIC`
- `GAMES_ADVENTURE`
- `GAMES_ACTION`
- `GAMES_ROLE_PLAYING`
- `GAMES_CASUAL`
- `GAMES_BOARD`
- `GAMES_TRIVIA`
- `GAMES_CARD`
- `GAMES_PUZZLE`
- `GAMES_CASINO`
- `GAMES_STRATEGY`
- `GAMES_SIMULATION`
- `GAMES_RACING`
- `GAMES_FAMILY`

### Available Stickers Subcategories

- `STICKERS_PLACES_AND_OBJECTS`
- `STICKERS_EMOJI_AND_EXPRESSIONS`
- `STICKERS_CELEBRATIONS`
- `STICKERS_CELEBRITIES`
- `STICKERS_MOVIES_AND_TV`
- `STICKERS_SPORTS_AND_ACTIVITIES`
- `STICKERS_EATING_AND_DRINKING`
- `STICKERS_CHARACTERS`
- `STICKERS_ANIMALS`
- `STICKERS_FASHION`
- `STICKERS_ART`
- `STICKERS_GAMING`
- `STICKERS_KIDS_AND_FAMILY`
- `STICKERS_PEOPLE`
- `STICKERS_MUSIC`

#### Non Boolean

**Values**

- 0: None (Legacy value, use `NONE` instead)
- 1: Infrequent/Mild (Legacy value, use `INFREQUENT_OR_MILD` instead)
- 2: Frequent/Intense (Legacy value, use `FREQUENT_OR_INTENSE` instead)

- `NONE`
- `INFREQUENT_OR_MILD`
- `FREQUENT_OR_INTENSE`

**Keys**

- 'alcoholTobaccoOrDrugUseOrReferences'
- 'contests'
- 'gamblingSimulated'
- 'medicalOrTreatmentInformation'
- 'profanityOrCrudeHumor'

- 'sexualContentGraphicAndNudity'
- 'sexualContentOrNudity'
- 'horrorOrFearThemes'
- 'matureOrSuggestiveThemes'
- 'unrestrictedWebAccess'
- 'violenceCartoonOrFantasy'
- 'violenceRealisticProlongedGraphicOrSadistic'
- 'violenceRealistic'
- 'kidsAgeBand'

#### Boolean

- `gambling`
- 'seventeenPlus'
- `unrestrictedWebAccess`

#### Kids Age

- `FIVE_AND_UNDER`
- `SIX_TO_EIGHT`
- `NINE_TO_ELEVEN`
- `null`

- `kidsAgeBand`

## Default values

Deliver has a special `default` language code which allows you to provide values that are not localized, and which will be used as defaults when you don’t provide a specific localized value.

In order to use `default`, you will need to tell _deliver_ which languages your app uses. You can do this in either of two ways:

1. Create the folders named with the language in the metadata folder (i.e. fastlane/metadata/en-US or fastlane/metadata/de-DE)
2. Add the following to your `Deliverfile` `languages(['en-US','de-DE'])`

You can use this either in json within your `Deliverfile` and/or as folders in your metadata folder. _deliver_ will take the union of both language sets from the `Deliverfile` and from the metadata folder and create on single set of languages which will be enabled.

Imagine that you have localized data for the following language codes: `en-US, de-DE, el, it`

You can set the following in your `Deliverfile`

```ruby-skip-tests
release_notes({

Deliver will use "Shiny and new" for en-US, el and it.

It will use "glaenzend und neu" for de-DE.

You can do the same with folders

```hljs css
default
keywords.txt
marketing_url.txt
name.txt
privacy_url.txt
support_url.txt
release_notes.txt
en-US
description.txt
de-DE
description.txt
el
description.txt
it
description.txt

In this case, default values for keywords, urls, name and release notes are used in all localizations, but each language has a fully localized description

## Uploading screenshots for "iPad Pro (12.9-inch) (3rd generation)"

Starting March 20, 2019 Apple's App Store requires 12.9-inch iPad Pro (3rd generation) screenshots additionally to the iPad Pro 2nd generation screenshots. As fastlane historically uses the screenshot dimensions to determine the "display family" of a screenshot, this poses a problem as both use the same dimensions and are recognized as the same device family.

To solve this a screenshot of a 12.9-inch iPad Pro (3rd generation) must contain either the string `iPad Pro (12.9-inch) (3rd generation)`, `IPAD_PRO_3GEN_129`, or `ipadPro129` (Apple's internal naming of the display family for the 3rd generation iPad Pro) in its filename to be assigned the correct display family and to be uploaded to the correct screenshot slot in your app's metadata.

## Automatically create screenshots

If you want to integrate _deliver_ with _snapshot_, check out _fastlane_!

## Jenkins integration

Detailed instructions about how to set up _deliver_ and _fastlane_ in `Jenkins` can be found in the fastlane README.

## Firewall Issues

_deliver_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" fastlane deliver

## HTTP Proxy

iTunes Transporter is a Java application bundled with Xcode. In addition to utilizing the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV"`, you need to configure the transporter application to use the proxy independently from the system proxy or any environment proxy settings. You can find the configuration file within Xcode:

**for Xcode11 and later**

```no-highlight
TOOLS_PATH=$( xcode-select -p )
REL_PATH='../SharedFrameworks/ContentDeliveryServices.framework/Versions/A/itms/java/lib/net.properties'
echo "$TOOLS_PATH/$REL_PATH"

**for Xcode10 or earlier**

```no-highlight
TOOLS_PATH=$( xcode-select -p )
REL_PATH='../Applications/Application Loader.app/Contents/itms/java/lib/net.properties'
echo "$TOOLS_PATH/$REL_PATH"

Add necessary proxy configuration values to the net.properties according to Java Proxy Configuration.

As an alternative to editing the properties files, proxy configuration can be specified on the command line directly:

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV -Dhttp.proxyHost=myproxy.com -Dhttp.proxyPort=8080"

## Limit

App Store Connect has a limit of 150 binary uploads per day.

## Editing the `Deliverfile`

Change syntax highlighting to _Ruby_.

## Provider Short Name

If you are on multiple App Store Connect teams, _deliver_ needs a provider short name to know where to upload your binary. _deliver_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

| upload\_to\_app\_store | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 3 Examples

```ruby hljs
upload_to_app_store(
force: true, # Set to true to skip verification of HTML preview
itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)

```ruby hljs
deliver # alias for "upload_to_app_store"

```ruby hljs
appstore # alias for "upload_to_app_store"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | The bundle identifier of your app | \* |
| `app_version` | The version that should be edited or created | |
| `ipa` | Path to your ipa file | \* |
| `pkg` | Path to your pkg file | \* |
| `build_number` | If set the given build number (already uploaded to iTC) will be used instead of the current built one | |
| `platform` | The platform to use (optional) | `ios` |
| `edit_live` | Modify live metadata, this option disables ipa upload and screenshot upload | `false` |
| `use_live_version` | Force usage of live version rather than edit version | `false` |
| `metadata_path` | Path to the folder containing the metadata files | |
| `screenshots_path` | Path to the folder containing the screenshots | |
| `skip_binary_upload` | Skip uploading an ipa or pkg to App Store Connect | `false` |
| `skip_screenshots` | Don't upload the screenshots | `false` |
| `skip_metadata` | Don't upload the metadata (e.g. title, description). This will still upload screenshots | `false` |
| `skip_app_version_update` | Don’t create or update the app version that is being prepared for submission | `false` |
| `force` | Skip verification of HTML preview file | `false` |
| `overwrite_screenshots` | Clear all previously uploaded screenshots before uploading the new ones | `false` |
| `screenshot_processing_timeout` | Timeout in seconds to wait before considering screenshot processing as failed, used to handle cases where uploads to the App Store are stuck in processing | `3600` |
| `sync_screenshots` | Sync screenshots with local ones. This is currently beta option so set true to 'FASTLANE\_ENABLE\_BETA\_DELIVER\_SYNC\_SCREENSHOTS' environment variable as well | `false` |
| `submit_for_review` | Submit the new version for Review after uploading everything | `false` |
| `verify_only` | Verifies archive with App Store Connect without uploading | `false` |
| `reject_if_possible` | Rejects the previously submitted build if it's in a state where it's possible | `false` |
| `version_check_wait_retry_limit` | After submitting a new version, App Store Connect takes some time to recognize the new version and we must wait until it's available before attempting to upload metadata for it. There is a mechanism that will check if it's available and retry with an exponential backoff if it's not available yet. This option specifies how many times we should retry before giving up. Setting this to a value below 5 is not recommended and will likely cause failures. Increase this parameter when Apple servers seem to be degraded or slow | `7` |
| `automatic_release` | Should the app be automatically released once it's approved? (Cannot be used together with `auto_release_date`) | |
| `auto_release_date` | Date in milliseconds for automatically releasing on pending approval (Cannot be used together with `automatic_release`) | |
| `phased_release` | Enable the phased release feature of iTC | `false` |
| `reset_ratings` | Reset the summary rating when you release a new version of the application | `false` |
| `price_tier` | The price tier of this application | |
| `app_rating_config_path` | Path to the app rating's config | |
| `submission_information` | Extra information for the submission (e.g. compliance specifications, IDFA settings) | |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `dev_portal_team_id` | The short ID of your Developer Portal team, if you're in multiple teams. Different from your iTC team ID! | \* |
| `dev_portal_team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | \* |
| `run_precheck_before_submit` | Run precheck before submitting to app review | `true` |
| `precheck_default_rule_level` | The default precheck rule level unless otherwise configured | `:warn` |
| `individual_metadata_items` | **DEPRECATED!** Removed after the migration to the new App Store Connect API in June 2020 - An array of localized metadata items to upload individually by language so that errors can be identified. E.g. \['name', 'keywords', 'description'\]. Note: slow | |
| `app_icon` | **DEPRECATED!** Removed after the migration to the new App Store Connect API in June 2020 - Metadata: The path to the app icon | |
| `apple_watch_app_icon` | **DEPRECATED!** Removed after the migration to the new App Store Connect API in June 2020 - Metadata: The path to the Apple Watch app icon | |
| `copyright` | Metadata: The copyright notice | |
| `primary_category` | Metadata: The english name of the primary category (e.g. `Business`, `Books`) | |
| `secondary_category` | Metadata: The english name of the secondary category (e.g. `Business`, `Books`) | |
| `primary_first_sub_category` | Metadata: The english name of the primary first sub category (e.g. `Educational`, `Puzzle`) | |
| `primary_second_sub_category` | Metadata: The english name of the primary second sub category (e.g. `Educational`, `Puzzle`) | |
| `secondary_first_sub_category` | Metadata: The english name of the secondary first sub category (e.g. `Educational`, `Puzzle`) | |
| `secondary_second_sub_category` | Metadata: The english name of the secondary second sub category (e.g. `Educational`, `Puzzle`) | |
| `trade_representative_contact_information` | **DEPRECATED!** This is no longer used by App Store Connect - Metadata: A hash containing the trade representative contact information | |
| `app_review_information` | Metadata: A hash containing the review information | |
| `app_review_attachment_file` | Metadata: Path to the app review attachment file | |
| `description` | Metadata: The localised app description | |
| `name` | Metadata: The localised app name | |
| `subtitle` | Metadata: The localised app subtitle | |
| `keywords` | Metadata: An array of localised keywords | |
| `promotional_text` | Metadata: An array of localised promotional texts | |
| `release_notes` | Metadata: Localised release notes for this version | |
| `privacy_url` | Metadata: Localised privacy url | |
| `apple_tv_privacy_policy` | Metadata: Localised Apple TV text | |
| `support_url` | Metadata: Localised support url | |
| `marketing_url` | Metadata: Localised marketing url | |
| `languages` | Metadata: List of languages to activate | |
| `ignore_language_directory_validation` | Ignore errors when invalid languages are found in metadata and screenshot directories | `false` |
| `precheck_include_in_app_purchases` | Should precheck check in-app purchases? | `true` |
| `app` | The (spaceship) app ID of the app you want to use/modify | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action upload_to_app_store

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_app_store

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_app_store parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/download_universal_apk_from_google_play



---

# https://docs.fastlane.tools/actions/upload_app_privacy_details_to_app_store



---

# https://docs.fastlane.tools/actions/download_from_play_store

- Docs »
- \_Actions »
- download\_from\_play\_store
- Edit on GitHub
- ```

* * *

# download\_from\_play\_store

| download\_from\_play\_store | |
| --- | --- |
| Supported platforms | android |
| Author | @janpio |

## 1 Example

```ruby hljs
download_from_play_store

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `package_name` | The package name of the application to use | \* |
| `version_name` | Version name (used when uploading new apks/aabs) - defaults to 'versionName' in build.gradle or AndroidManifest.xml | \* |
| `track` | The track of the application to use. The default available tracks are: production, beta, alpha, internal | `production` |
| `metadata_path` | Path to the directory containing the metadata files | \* |
| `key` | **DEPRECATED!** Use `--json_key` instead - The p12 File used to authenticate with Google | \* |
| `issuer` | **DEPRECATED!** Use `--json_key` instead - The issuer of the p12 file (email address of the service account) | \* |
| `json_key` | The path to a file containing service account JSON, used to authenticate with Google | \* |
| `json_key_data` | The raw service account JSON data used to authenticate with Google | \* |
| `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of | |
| `timeout` | Timeout for read, open, and send (in seconds) | `300` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action download_from_play_store

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run download_from_play_store

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run download_from_play_store parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/upload_to_play_store

- Docs »
- \_Actions »
- upload\_to\_play\_store
- Edit on GitHub
- ```

* * *

# upload\_to\_play\_store

Upload metadata, screenshots and binaries to Google Play (via _supply_)

###### Command line tool for updating Android apps and their metadata on the Google Play Store

_supply_ uploads app metadata, screenshots, binaries, and app bundles to Google Play. You can also select tracks for builds and promote builds to production.

Features •
Setup •
Quick Start •
Commands •
Uploading an APK •
Uploading an AAB •
Images

## Features

- Update existing Android applications on Google Play via the command line
- Upload new builds (APKs and AABs)
- Retrieve and edit metadata, such as title and description, for multiple languages
- Upload the app icon, promo graphics and screenshots for multiple languages
- Have a local copy of the metadata in your git repository
- Retrieve version code numbers from existing Google Play tracks

## Setup

Setup consists of setting up your Google Developers Service Account

**Tip:** If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English. All the links below already have this to make it easier to find the correct buttons.

**Note:** if you face issues when following these instructions, you might want to refer to the official documentation by Google.

1. Open the Google Play Console
1. Click **Account Details**, and note the **Google Cloud Project ID** listed there
2. Enable the Google Play Developer API by selecting an existing Google Cloud Project that fits your needs and pushing **ENABLE**
1. If you don't have an existing project or prefer to have a dedicated one for _fastlane_, create a new one here and follow the instructions
3. Open Service Accounts on Google Cloud and select the project you'd like to use
01. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Cloud Platform Console** page
02. Verify that you are on the correct Google Cloud Platform Project by looking for the **Google Cloud Project ID** from earlier within the light gray text in the second input, preceding `.iam.gserviceaccount.com`, or by checking the project name in the navigation bar. If not, open the picker in the top navigation bar, and find the right one.
03. Provide a `Service account name` (e.g. fastlane-supply)
04. Copy the generated email address that is noted below the `Service account-ID` field for later use
05. Click **DONE** (don't click **CREATE AND CONTINUE** as the optional steps such as granting access are not needed): ![](https://docs.fastlane.tools/img/getting-started/android/creating-service-account.png)
06. Click on the **Actions** vertical three-dot icon of the service account you just created
07. Select **Manage keys** on the menu
08. Click **ADD KEY** → **Create New Key**
09. Make sure **JSON** is selected as the `Key type`, and click **CREATE**
10. Save the file on your computer when prompted and remember where it was saved at
4. Open the Google Play Console and select **Users and Permissions**
1. Click **Invite new users**
2. Paste the email address you saved for later use into the email address field
3. Click on **Account Permissions**
4. Choose the permissions you'd like this account to have. We recommend **Admin (all permissions)**, but you may want to manually select all checkboxes and leave out some of the **Releases** permissions such as **Release to production, exclude devices, and use Play App Signing**
5. Click on **Invite User**

You can use `fastlane run validate_play_store_json_key json_key:/path/to/your/downloaded/file.json` to test the connection to Google Play Store with the downloaded private key. Once that works, add the path to the JSON file to your Appfile:

```ruby hljs
json_key_file("path/to/your/play-store-credentials.json")
package_name("my.package.name")

The path is relative to where you normally run `fastlane`.

### Migrating Google credential format (from .p12 key file to .json)

In previous versions of supply, credentials to your Play Console were stored as `.p12` files. Since version 0.4.0, supply now supports the recommended `.json` key Service Account credential files. If you wish to upgrade:

- follow the Setup procedure once again to make sure you create the appropriate JSON file
- update your fastlane configuration or your command line invocation to use the appropriate argument if necessary.
Note that you don't need to take note nor pass the `issuer` argument anymore.

The previous p12 configuration is still currently supported.

- `cd [your_project_folder]`
- `fastlane supply init`
- Make changes to the downloaded metadata, add images, screenshots and/or an APK
- `fastlane supply`

## Available Commands

- `fastlane supply`: update an app with metadata, a build, images and screenshots
- `fastlane supply init`: download metadata for an existing app to a local directory
- `fastlane action supply`: show information on available commands, arguments and environment variables

You can either run _supply_ on its own and use it interactively, or you can pass arguments or specify environment variables for all the options to skip the questions.

## Uploading an APK

To upload a new binary to Google Play, simply run

```no-highlight
fastlane supply --apk path/to/app.apk

This will also upload app metadata if you previously ran `fastlane supply init`.

To gradually roll out a new build use

```no-highlight
fastlane supply --apk path/app.apk --track beta --rollout 0.5

To set the in-app update priority level for a release, set a valid update priority (an integer value from 0 to 5) using option `in_app_update_priority`

```no-highlight
fastlane supply --apk path/app.apk --track beta --in_app_update_priority 3

### Expansion files ( `.obb`)

Expansion files (obbs) found under the same directory as your APK will also be uploaded together with your APK as long as:

- they are identified as type 'main' or 'patch' (by containing 'main' or 'patch' in their file name)
- you have at most one of each type

If you only want to update the APK, but keep the expansion files from the previous version on Google Play use

```no-highlight
fastlane supply --apk path/app.apk --obb_main_references_version 21 --obb_main_file_size 666154207

or

```no-highlight
fastlane supply --apk path/app.apk --obb_patch_references_version 21 --obb_patch_file_size 666154207

## Uploading an AAB

To upload a new Android application bundle to Google Play, simply run

```no-highlight
fastlane supply --aab path/to/app.aab

```no-highlight
fastlane supply --aab path/app.aab --track beta --rollout 0.5

```no-highlight
fastlane supply --aab path/app.aab --track beta --in_app_update_priority 3

## Images and Screenshots

After running `fastlane supply init`, you will have a metadata directory. This directory contains one or more locale directories (e.g. en-US, en-GB, etc.), and inside this directory are text files such as `title.txt` and `short_description.txt`.

Inside of a given locale directory is a folder called `images`. Here you can supply images with the following file names (extension can be png, jpg or jpeg):

- `featureGraphic`
- `icon`
- `promoGraphic`
- `tvBanner`

You can also supply screenshots by creating directories within the `images` directory with the following names, containing PNGs or JPEGs:

- `phoneScreenshots/`
- `sevenInchScreenshots/` (7-inch tablets)
- `tenInchScreenshots/` (10-inch tablets)
- `tvScreenshots/`
- `wearScreenshots/`

You may name images anything you like, but screenshots will appear in the Play Store in alphanumerical filename order.
Note that these will replace the current images and screenshots on the play store listing, not add to them.

## Changelogs (What's new)

You can add changelog files under the `changelogs/` directory for each locale. The filename should exactly match the version code of the APK that it represents. You can also provide default notes that will be used if no files match the version code by adding a `default.txt` file. `fastlane supply init` will populate changelog files from existing data on Google Play if no `metadata/` directory exists when it is run.

```no-highlight
└── fastlane
└── metadata
└── android
├── en-US
│ └── changelogs
│ ├── default.txt
│ ├── 100000.txt
│ └── 100100.txt
└── fr-FR
└── changelogs
├── default.txt
└── 100100.txt

## Track Promotion

A common Play publishing scenario might involve uploading an APK version to a test track, testing it, and finally promoting that version to production.

This can be done using the `--track_promote_to` parameter. The `--track_promote_to` parameter works with the `--track` parameter to command the Play API to promote existing Play track APK version(s) (those active on the track identified by the `--track` param value) to a new track ( `--track_promote_to` value).

## Retrieve Track Release Names & Version Codes

Before performing a new APK upload you may want to check existing track version codes or release names, or you may simply want to provide an informational lane that displays the currently promoted version codes or release name for the production track. You can use the `google_play_track_version_codes` action to retrieve existing version codes for a package and track. You can use the `google_play_track_release_names` action to retrieve existing release names for a package and track.
For more information, see the `fastlane action google_play_track_version_codes` and `fastlane action google_play_track_release_names` help output.

## Parallel uploads

By default _supply_ will spawn 10 threads to upload the metadata concurrently ( _images, screenshots, texts_). If you want to change this, set either `DELIVER_NUMBER_OF_THREADS` or `FL_NUMBER_OF_THREADS` environment variable to any value between 1 and 10.

If you want _supply_ to upload with more than 10 threads in parallel then you need to **additionally** set `FL_MAX_NUMBER_OF_THREADS` environment variable to the max number of parallel upload threads you wish to have ( **Warning ⚠️** use this at your own risk!).

## Migration from AndroidPublisherV2 to AndroidPublisherV3 in _fastlane_ 2.135.0

### New Options

- `:version_name`
- Used when uploading with `:apk_path`, `:apk_paths`, `:aab_path`, and `:aab_paths`
- Can be any string such (example: "October Release" or "Awesome New Feature")
- Defaults to the version name in app/build.gradle or AndroidManifest.xml
- `:release_status`
- Used when uploading with `:apk_path`, `:apk_paths`, `:aab_path`, and `:aab_paths`
- Can set as "draft" to complete the release at some other time
- Defaults to "completed"
- `:version_code`
- Used for `:update_rollout`, `:track_promote_to`, and uploading of meta data and screenshots
- `:skip_upload_changelogs`
- Changelogs were previously included with the `:skip_upload_metadata` but is now its own option

### Deprecated Options

- `:check_superseded_tracks`
- Google Play will automatically remove releases that are superseded now
- `:deactivate_on_promote`
- Google Play will automatically deactivate a release from its previous track on promote

| upload\_to\_play\_store | |
| --- | --- |
| Supported platforms | android |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
upload_to_play_store

```ruby hljs
supply # alias for "upload_to_play_store"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `package_name` | The package name of the application to use | \* |
| `version_name` | Version name (used when uploading new apks/aabs) - defaults to 'versionName' in build.gradle or AndroidManifest.xml | \* |
| `version_code` | The versionCode for which to download the generated APK | \* |
| `release_status` | Release status (used when uploading new apks/aabs) - valid values are completed, draft, halted, inProgress | \* |
| `track` | The track of the application to use. The default available tracks are: production, beta, alpha, internal | `production` |
| `rollout` | The percentage of the user fraction when uploading to the rollout track (setting to 1 will complete the rollout) | |
| `metadata_path` | Path to the directory containing the metadata files | \* |
| `key` | **DEPRECATED!** Use `--json_key` instead - The p12 File used to authenticate with Google | \* |
| `issuer` | **DEPRECATED!** Use `--json_key` instead - The issuer of the p12 file (email address of the service account) | \* |
| `json_key` | The path to a file containing service account JSON, used to authenticate with Google | \* |
| `json_key_data` | The raw service account JSON data used to authenticate with Google | \* |
| `apk` | Path to the APK file to upload | \* |
| `apk_paths` | An array of paths to APK files to upload | |
| `aab` | Path to the AAB file to upload | \* |
| `aab_paths` | An array of paths to AAB files to upload | |
| `skip_upload_apk` | Whether to skip uploading APK | `false` |
| `skip_upload_aab` | Whether to skip uploading AAB | `false` |
| `skip_upload_metadata` | Whether to skip uploading metadata, changelogs not included | `false` |
| `skip_upload_changelogs` | Whether to skip uploading changelogs | `false` |
| `skip_upload_images` | Whether to skip uploading images, screenshots not included | `false` |
| `skip_upload_screenshots` | Whether to skip uploading SCREENSHOTS | `false` |
| `sync_image_upload` | Whether to use sha256 comparison to skip upload of images and screenshots that are already in Play Store | `false` |
| `track_promote_to` | The track to promote to. The default available tracks are: production, beta, alpha, internal | |
| `track_promote_release_status` | Promoted track release status (used when promoting a track) - valid values are completed, draft, halted, inProgress | `completed` |
| `validate_only` | Only validate changes with Google Play rather than actually publish | `false` |
| `mapping` | Path to the mapping file to upload (mapping.txt or native-debug-symbols.zip alike) | |
| `mapping_paths` | An array of paths to mapping files to upload (mapping.txt or native-debug-symbols.zip alike) | |
| `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of | |
| `check_superseded_tracks` | **DEPRECATED!** Google Play does this automatically now - Check the other tracks for superseded versions and disable them | `false` |
| `timeout` | Timeout for read, open, and send (in seconds) | `300` |
| `deactivate_on_promote` | **DEPRECATED!** Google Play does this automatically now - When promoting to a new track, deactivate the binary in the origin track | `true` |
| `version_codes_to_retain` | An array of version codes to retain when publishing a new APK | |
| `changes_not_sent_for_review` | Indicates that the changes in this edit will not be reviewed until they are explicitly sent for review from the Google Play Console UI | `false` |
| `rescue_changes_not_sent_for_review` | Catches changes\_not\_sent\_for\_review errors when an edit is committed and retries with the configuration that the error message recommended | `true` |
| `in_app_update_priority` | In-app update priority for all the newly added apks in the release. Can take values between \[0,5\] | |
| `obb_main_references_version` | References version of 'main' expansion file | |
| `obb_main_file_size` | Size of 'main' expansion file in bytes | |
| `obb_patch_references_version` | References version of 'patch' expansion file | |
| `obb_patch_file_size` | Size of 'patch' expansion file in bytes | |
| `ack_bundle_installation_warning` | Must be set to true if the bundle installation may trigger a warning on user devices (e.g can only be downloaded over wifi). Typically this is required for bundles over 150MB | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action upload_to_play_store

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_play_store

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_play_store parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/ensure_git_status_clean

- Docs »
- \_Actions »
- ensure\_git\_status\_clean
- Edit on GitHub
- ```

* * *

# ensure\_git\_status\_clean

>
> Especially useful to put at the beginning of your Fastfile in the `before_all` block, if some of your other actions will touch your filesystem, do things to your git repo, or just as a general reminder to save your work.
>
> Also needed as a prerequisite for some other actions like `reset_git_repo`.

| ensure\_git\_status\_clean | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @lmirosevic, @antondomashnev |

## 1 Example

```ruby hljs
ensure_git_status_clean

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `show_uncommitted_changes` | The flag whether to show uncommitted changes if the repo is dirty | `false` |
| `show_diff` | The flag whether to show the git diff if the repo is dirty | `false` |
| `ignored` | The handling mode of the ignored files. The available options are: `'traditional'`, `'none'` (default) and `'matching'`. Specifying `'none'` to this parameter is the same as not specifying the parameter at all, which means that no ignored file will be used to check if the repo is dirty or not. Specifying `'traditional'` or `'matching'` causes some ignored files to be used to check if the repo is dirty or not (more info in the official docs: | |
| `ignore_files` | Array of files to ignore | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `ensure_git_status_clean` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GIT_REPO_WAS_CLEAN_ON_START` | Stores the fact that the git repo was clean at some point |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action ensure_git_status_clean

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_git_status_clean

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_git_status_clean parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_branch

- Docs »
- \_Actions »
- git\_branch
- Edit on GitHub
- ```

* * *

# git\_branch

| git\_branch | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
git_branch

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `git_branch` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GIT_BRANCH_ENV_VARS` | The git branch environment variables |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_branch

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_branch

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_branch parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/last_git_commit

- Docs »
- \_Actions »
- last\_git\_commit
- Edit on GitHub
- ```

* * *

# last\_git\_commit

Return last git commit hash, abbreviated commit hash, commit message and author

| last\_git\_commit | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @ngutman |
| Returns | Returns the following dict: |

## 1 Example

```ruby hljs
commit = last_git_commit
pilot(changelog: commit[:message]) # message of commit
author = commit[:author] # author of the commit
author_email = commit[:author_email] # email of the author of the commit
hash = commit[:commit_hash] # long sha of commit
short_hash = commit[:abbreviated_commit_hash] # short sha of commit

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action last_git_commit

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run last_git_commit

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run last_git_commit parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/reset_git_repo

- Docs »
- \_Actions »
- reset\_git\_repo
- Edit on GitHub
- ```

* * *

# reset\_git\_repo

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `files` | Array of files the changes should be discarded. If not given, all files will be discarded | |
| `force` | Skip verifying of previously clean state of repo. Only recommended in combination with `files` option | `false` |
| `skip_clean` | Skip 'git clean' to avoid removing untracked files like `.env` | `false` |
| `disregard_gitignore` | Setting this to true will clean the whole repository, ignoring anything in your local .gitignore. Set this to true if you want the equivalent of a fresh clone, and for all untracked and ignore files to also be removed | `true` |
| `exclude` | You can pass a string, or array of, file pattern(s) here which you want to have survive the cleaning process, and remain on disk, e.g. to leave the `artifacts` directory you would specify `exclude: 'artifacts'`. Make sure this pattern is also in your gitignore! See the gitignore documentation for info on patterns | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action reset_git_repo

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run reset_git_repo

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run reset_git_repo parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/changelog_from_git_commits

- Docs »
- \_Actions »
- changelog\_from\_git\_commits
- Edit on GitHub
- ```

* * *

# changelog\_from\_git\_commits

date_format: "short",# Optional, lets you provide an additional date format to dates within the pretty-formatted string
match_lightweight_tag: false, # Optional, lets you ignore lightweight (non-annotated) tags when searching for the last tag
merge_commit_filtering: "exclude_merges" # Optional, lets you filter out merge commits
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `between` | Array containing two Git revision values between which to collect messages, you mustn't use it with :commits\_count key at the same time | |
| `commits_count` | Number of commits to include in changelog, you mustn't use it with :between key at the same time | |
| `path` | Path of the git repository | `./` |
| `pretty` | The format applied to each commit while generating the collected value | `%B` |
| `date_format` | The date format applied to each commit while generating the collected value | |
| `ancestry_path` | Whether or not to use ancestry-path param | `false` |
| `tag_match_pattern` | A glob(7) pattern to match against when finding the last git tag | |
| `match_lightweight_tag` | Whether or not to match a lightweight tag when searching for the last one | `true` |
| `quiet` | Whether or not to disable changelog output | `false` |
| `include_merges` | **DEPRECATED!** Use `:merge_commit_filtering` instead - Whether or not to include any commits that are merges | |
| `merge_commit_filtering` | Controls inclusion of merge commits when collecting the changelog. Valid values: 'include\_merges', 'exclude\_merges', 'only\_include\_merges' | `include_merges` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `changelog_from_git_commits` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::FL_CHANGELOG` | The changelog string generated from the collected git commit messages |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action changelog_from_git_commits

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run changelog_from_git_commits

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run changelog_from_git_commits parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/number_of_commits



---

# https://docs.fastlane.tools/actions/git_pull

- Docs »
- \_Actions »
- git\_pull
- Edit on GitHub
- ```

* * *

# git\_pull

Executes a simple git pull command

| git\_pull | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx, @JaviSoto |

## 3 Examples

```ruby hljs
git_pull

```ruby hljs
git_pull(only_tags: true) # only the tags, no commits

```ruby hljs
git_pull(rebase: true) # use --rebase with pull

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `only_tags` | Simply pull the tags, and not bring new commits to the current branch from the remote | `false` |
| `rebase` | Rebase on top of the remote branch instead of merge | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_pull

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_pull

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_pull parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/last_git_tag

- Docs »
- \_Actions »
- last\_git\_tag
- Edit on GitHub
- ```

* * *

# last\_git\_tag

>
> Pattern parameter allows you to filter to a subset of tags.

| last\_git\_tag | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx, @wedkarz |

## 2 Examples

```ruby hljs
last_git_tag

```ruby hljs
last_git_tag(pattern: "release/v1.0/")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `pattern` | Pattern to filter tags when looking for last one. Limit tags to ones matching given shell glob. If pattern lacks ?, \*, or \, \* at the end is implied | |\
\
_\\* = default value is dependent on the user's system_\
\
* * *\
\
## Documentation\
\
To show the documentation in your terminal, run\
\
```no-highlight\
fastlane action last_git_tag\
\
```\
\
* * *\
\
## CLI\
\
It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal\
\
```no-highlight\
fastlane run last_git_tag\
\
```\
\
To pass parameters, make use of the `:` symbol, for example\
\
```no-highlight\
fastlane run last_git_tag parameter1:"value1" parameter2:"value2"\
\
```\
\
It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.\
\
It is recommended to add all _fastlane_ actions you use to your `Fastfile`.\
\
* * *\
\
## Source code\
\
This action, just like the rest of _fastlane_, is fully open source, [view the source code on GitHub\
\
* * *\
\
**\
\
[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/push_to_git_remote

- Docs »
- \_Actions »
- push\_to\_git\_remote
- Edit on GitHub
- ```

* * *

# push\_to\_git\_remote

| `remote_branch` | The remote branch to push to. Defaults to the local branch | \* |
| `force` | Force push to remote | `false` |
| `force_with_lease` | Force push with lease to remote | `false` |
| `tags` | Whether tags are pushed to remote | `true` |
| `remote` | The remote to push to | `origin` |
| `no_verify` | Whether or not to use --no-verify | `false` |
| `set_upstream` | Whether or not to use --set-upstream | `false` |
| `push_options` | Array of strings to be passed using the '--push-option' option | `[]` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action push_to_git_remote

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run push_to_git_remote

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run push_to_git_remote parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/add_git_tag

- Docs »
- \_Actions »
- add\_git\_tag
- Edit on GitHub
- ```

* * *

# add\_git\_tag

>
> - `grouping` is just to keep your tags organised under one 'folder', defaults to 'builds'
> - `lane` is the name of the current fastlane lane, if chosen to be included via 'includes\_lane' option, which defaults to 'true'
> - `prefix` is anything you want to stick in front of the version number, e.g. 'v'
> - `postfix` is anything you want to stick at the end of the version number, e.g. '-RC1'
> - `build_number` is the build number, which defaults to the value emitted by the `increment_build_number` action
>
> For example, for build 1234 in the 'appstore' lane, it will tag the commit with `builds/appstore/1234`.

| add\_git\_tag | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @lmirosevic, @maschall |

## 3 Examples

```ruby hljs
add_git_tag # simple tag with default values

```ruby hljs
add_git_tag(
grouping: "fastlane-builds",
includes_lane: true,
prefix: "v",
postfix: "-RC1",
build_number: 123
)

```ruby hljs
# Alternatively, you can specify your own tag. Note that if you do specify a tag, all other arguments are ignored.
add_git_tag(
tag: "my_custom_tag"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `tag` | Define your own tag text. This will replace all other parameters | |
| `grouping` | Is used to keep your tags organised under one 'folder' | `builds` |
| `includes_lane` | Whether the current lane should be included in the tag and message composition, e.g. '//' | `true` |
| `prefix` | Anything you want to put in front of the version number (e.g. 'v') | `''` |
| `postfix` | Anything you want to put at the end of the version number (e.g. '-RC1') | `''` |
| `build_number` | The build number. Defaults to the result of increment\_build\_number if you're using it | \* |
| `message` | The tag message. Defaults to the tag's name | \* |
| `commit` | The commit or object where the tag will be set. Defaults to the current HEAD | \* |
| `force` | Force adding the tag | `false` |
| `sign` | Make a GPG-signed tag, using the default e-mail address's key | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action add_git_tag

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run add_git_tag

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run add_git_tag parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/commit_version_bump

- Docs »
- \_Actions »
- commit\_version\_bump
- Edit on GitHub
- ```

* * *

# commit\_version\_bump

>
> It checks the repo to make sure that only the relevant files have changed. These are the files that `increment_build_number` ( `agvtool`) touches:
>
> - All `.plist` files
> - The `.xcodeproj/project.pbxproj` file
>
> Then commits those files to the repo.
>
> Customize the message with the `:message` option. It defaults to 'Version Bump'.
>
> If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the _ipa_ and or _sigh_ actions, then you can use the clean\_build\_artifacts action to clean those temporary files up before running this action.

| commit\_version\_bump | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @lmirosevic |

## 8 Examples

```ruby hljs
commit_version_bump

```ruby hljs
commit_version_bump(
message: "Version Bump",# create a commit with a custom message
xcodeproj: "./path/to/MyProject.xcodeproj" # optional, if you have multiple Xcode project files, you must specify your main project here
)

```ruby hljs
commit_version_bump(
settings: true # Include Settings.bundle/Root.plist
)

```ruby hljs
commit_version_bump(
settings: "About.plist" # Include Settings.bundle/About.plist
)

```ruby hljs
commit_version_bump(
settings: %w[About.plist Root.plist] # Include more than one plist from Settings.bundle
)

```ruby hljs
commit_version_bump(
include: %w[package.json custom.cfg] # include other updated files as part of the version bump
)

```ruby hljs
commit_version_bump(
ignore: /OtherProject/ # ignore files matching a regular expression
)

```ruby hljs
commit_version_bump(
no_verify: true # optional, default: false
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `message` | The commit message when committing the version bump | |
| `xcodeproj` | The path to your project file (Not the workspace). If you have only one, this is optional | |
| `force` | Forces the commit, even if other files than the ones containing the version number have been modified | `false` |
| `settings` | Include Settings.bundle/Root.plist with version bump | `false` |
| `ignore` | A regular expression used to filter matched plist files to be modified | |
| `include` | A list of extra files to be included in the version bump (string array or comma-separated string) | `[]` |
| `no_verify` | Whether or not to use --no-verify | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `commit_version_bump` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::MODIFIED_FILES` | The list of paths of modified files |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action commit_version_bump

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run commit_version_bump

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run commit_version_bump parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_tag_exists

- Docs »
- \_Actions »
- git\_tag\_exists
- Edit on GitHub
- ```

* * *

# git\_tag\_exists

Checks if the git tag with the given name exists in the current repo

| git\_tag\_exists | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @antondomashnev |
| Returns | Boolean value whether the tag exists or not |

## 1 Example

```ruby hljs
if git_tag_exists(tag: "1.1.0")
UI.message("Found it 🚀")
end

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `tag` | The tag name that should be checked | |
| `remote` | Whether to check remote. Defaults to `false` | `false` |
| `remote_name` | The remote to check. Defaults to `origin` | `origin` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_tag_exists

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_tag_exists

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_tag_exists parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/ensure_git_branch

- Docs »
- \_Actions »
- ensure\_git\_branch
- Edit on GitHub
- ```

* * *

# ensure\_git\_branch

>
> You may only want to make releases from a specific branch, so `ensure_git_branch` will stop a lane if it was accidentally executed on an incorrect branch.

| ensure\_git\_branch | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @dbachrach, @Liquidsoul |

## 2 Examples

```ruby hljs
ensure_git_branch # defaults to `master` branch

```ruby hljs
ensure_git_branch(
branch: 'develop'
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `branch` | The branch that should be checked for. String that can be either the full name of the branch or a regex e.g. `^feature/.*$` to match | `master` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action ensure_git_branch

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_git_branch

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_git_branch parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_commit

- Docs »
- \_Actions »
- git\_commit
- Edit on GitHub
- ```

* * *

# git\_commit

Directly commit the given file with the given message

| git\_commit | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 4 Examples

```ruby hljs
git_commit(path: "./version.txt", message: "Version Bump")

```ruby hljs
git_commit(path: ["./version.txt", "./changelog.txt"], message: "Version Bump")

```ruby hljs
git_commit(path: ["./*.txt", "./*.md"], message: "Update documentation")

```ruby hljs
git_commit(path: ["./*.txt", "./*.md"], message: "Update documentation", skip_git_hooks: true)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | The file(s) or directory(ies) you want to commit. You can pass an array of multiple file-paths or fileglobs "\*.txt" to commit all matching files. The files already staged but not specified and untracked files won't be committed | |
| `message` | The commit message that should be used | |
| `skip_git_hooks` | Set to true to pass `--no-verify` to git | `false` |
| `allow_nothing_to_commit` | Set to true to allow commit without any git changes in the files you want to commit | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_commit

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_commit

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_commit parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/push_git_tags

- Docs »
- \_Actions »
- push\_git\_tags
- Edit on GitHub
- ```

* * *

# push\_git\_tags

| push\_git\_tags | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @vittoriom |

## 1 Example

```ruby hljs
push_git_tags

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `force` | Force push to remote | `false` |
| `remote` | The remote to push tags to | `origin` |
| `tag` | The tag to push to remote | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action push_git_tags

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run push_git_tags

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run push_git_tags parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_add

- Docs »
- \_Actions »
- git\_add
- Edit on GitHub
- ```

* * *

# git\_add

Directly add the given file or all files

| git\_add | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @4brunu, @antondomashnev |

## 8 Examples

```ruby hljs
git_add

```ruby hljs
git_add(path: "./version.txt")

```ruby hljs
git_add(path: ["./version.txt", "./changelog.txt"])

```ruby hljs
git_add(path: "./Frameworks/*", shell_escape: false)

```ruby hljs
git_add(path: ["*.h", "*.m"], shell_escape: false)

```ruby hljs
git_add(path: "*.txt", shell_escape: false)

```ruby hljs
git_add(path: "./tmp/.keep", force: true)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | The file(s) and path(s) you want to add | |
| `shell_escape` | Shell escapes paths (set to false if using wildcards or manually escaping spaces in :path) | `true` |
| `force` | Allow adding otherwise ignored files | `false` |
| `pathspec` | **DEPRECATED!** Use `--path` instead - The pathspec you want to add files from | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_add

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_add

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_add parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_build_number_repository

- Docs »
- \_Actions »
- get\_build\_number\_repository
- Edit on GitHub
- ```

* * *

# get\_build\_number\_repository

>
> Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision), git (uses short hash) and mercurial (uses short hash or revision number).
>
> There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash.

| get\_build\_number\_repository | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @bartoszj, @pbrooks, @armadsen |
| Returns | The build number from the current repository |

## 1 Example

```ruby hljs
get_build_number_repository

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos) | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_build_number_repository` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::BUILD_NUMBER_REPOSITORY` | The build number from the current repository |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_build_number_repository

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_build_number_repository

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_build_number_repository parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/set_github_release

- Docs »
- \_Actions »
- set\_github\_release
- Edit on GitHub
- ```

* * *

# set\_github\_release

>
> If the tag doesn't exist, one will be created on the commit or branch passed in as commitish.
>
> Out parameters provide the release's id, which can be used for later editing and the release HTML link to GitHub. You can also specify a list of assets to be uploaded to the release with the `:upload_assets` parameter.

| set\_github\_release | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @czechboy0, @tommeier |

## 1 Example

```ruby hljs
github_release = set_github_release(
repository_name: "fastlane/fastlane",
api_token: ENV["GITHUB_TOKEN"],
name: "Super New actions",
tag_name: "v1.22.0",
description: (File.read("changelog") rescue "No changelog provided"),
commitish: "master",
upload_assets: ["example_integration.ipa", "./pkg/built.gem"]
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `repository_name` | The path to your repo, e.g. 'fastlane/fastlane' | |
| `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com` |
| `api_token` | Personal API Token for GitHub - generate one at | \* |
| `api_bearer` | Use a Bearer authorization token. Usually generated by GitHub Apps, e.g. GitHub Actions GITHUB\_TOKEN environment variable | |
| `tag_name` | Pass in the tag name | |
| `name` | Name of this release | |
| `commitish` | Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master) | |
| `description` | Description of this release | \* |
| `is_draft` | Whether the release should be marked as draft | `false` |
| `is_prerelease` | Whether the release should be marked as prerelease | `false` |
| `is_generate_release_notes` | Whether the name and body of this release should be generated automatically | `false` |
| `upload_assets` | Path to assets to be uploaded with the release | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `set_github_release` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::SET_GITHUB_RELEASE_HTML_LINK` | Link to your created release |
| `SharedValues::SET_GITHUB_RELEASE_RELEASE_ID` | Release id (useful for subsequent editing) |
| `SharedValues::SET_GITHUB_RELEASE_JSON` | The whole release JSON object |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action set_github_release

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_github_release

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_github_release parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/create_pull_request

- Docs »
- \_Actions »
- create\_pull\_request
- Edit on GitHub
- ```

* * *

# create\_pull\_request

This will create a new pull request on GitHub

| create\_pull\_request | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @seei, @tommeier, @marumemomo, @elneruda, @kagemiku |
| Returns | The pull request URL when successful |

## 1 Example

```ruby hljs
create_pull_request(
api_token: "secret", # optional, defaults to ENV["GITHUB_API_TOKEN"]
repo: "fastlane/fastlane",
title: "Amazing new feature",
head: "my-feature", # optional, defaults to current branch name
base: "master", # optional, defaults to "master"
body: "Please pull this in!", # optional
api_url: "http://yourdomain/api/v3" # optional, for GitHub Enterprise, defaults to "https://api.github.com"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_token` | Personal API Token for GitHub - generate one at | \* |
| `api_bearer` | Use a Bearer authorization token. Usually generated by GitHub Apps, e.g. GitHub Actions GITHUB\_TOKEN environment variable | |
| `repo` | The name of the repository you want to submit the pull request to | |
| `title` | The title of the pull request | |
| `body` | The contents of the pull request | |
| `draft` | Indicates whether the pull request is a draft | |
| `labels` | The labels for the pull request | |
| `milestone` | The milestone ID (Integer) for the pull request | |
| `head` | The name of the branch where your changes are implemented (defaults to the current branch name) | \* |
| `base` | The name of the branch you want your changes pulled into (defaults to `master`) | `master` |
| `api_url` | The URL of GitHub API - used when the Enterprise (default to `https://api.github.com`) | `https://api.github.com` |
| `assignees` | The assignees for the pull request | |
| `reviewers` | The reviewers (slug) for the pull request | |
| `team_reviewers` | The team reviewers (slug) for the pull request | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_pull_request` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::CREATE_PULL_REQUEST_HTML_URL` | The HTML URL to the created pull request |
| `SharedValues::CREATE_PULL_REQUEST_NUMBER` | The identifier number of the created pull request |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action create_pull_request

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_pull_request

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_pull_request parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/get_github_release

- Docs »
- \_Actions »
- get\_github\_release
- Edit on GitHub
- ```

* * *

# get\_github\_release

```no-highlight
{

"This is one of the biggest updates of _fastlane_ yet"
}

| get\_github\_release | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx, @czechboy0, @jaleksynas, @tommeier |

## 1 Example

```ruby hljs
release = get_github_release(url: "fastlane/fastlane", version: "1.0.0")
puts release["name"]

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `url` | The path to your repo, e.g. 'KrauseFx/fastlane' | |
| `server_url` | The server url. e.g. 'https://your.github.server/api/v3' (Default: 'https://api.github.com') | `https://api.github.com` |
| `version` | The version tag of the release to check | |
| `api_token` | GitHub Personal Token (required for private repositories) | \* |
| `api_bearer` | Use a Bearer authorization token. Usually generated by GitHub Apps, e.g. GitHub Actions GITHUB\_TOKEN environment variable | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_github_release` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GET_GITHUB_RELEASE_INFO` | Contains all the information about this release |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action get_github_release

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_github_release

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_github_release parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/hg_ensure_clean_status

- Docs »
- \_Actions »
- hg\_ensure\_clean\_status
- Edit on GitHub
- ```

* * *

# hg\_ensure\_clean\_status

| hg\_ensure\_clean\_status | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @sjrmanning |

## 1 Example

```ruby hljs
hg_ensure_clean_status

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `hg_ensure_clean_status` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::HG_REPO_WAS_CLEAN_ON_START` | Stores the fact that the hg repo was clean at some point |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action hg_ensure_clean_status

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_ensure_clean_status

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_ensure_clean_status parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/hg_commit_version_bump

- Docs »
- \_Actions »
- hg\_commit\_version\_bump
- Edit on GitHub
- ```

* * *

# hg\_commit\_version\_bump

>
> It checks the repo to make sure that only the relevant files have changed, these are the files that `increment_build_number` ( `agvtool`) touches:
>
> - All `.plist` files
> - The `.xcodeproj/project.pbxproj` file
>
> Then commits those files to the repo.
>
> Customize the message with the `:message` option, defaults to 'Version Bump'
>
> If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the _ipa_ and or _sigh_ actions, then you can use the clean\_build\_artifacts action to clean those temporary files up before running this action.

| hg\_commit\_version\_bump | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @sjrmanning |

## 2 Examples

```ruby hljs
hg_commit_version_bump

```ruby hljs
hg_commit_version_bump(
message: "Version Bump", # create a commit with a custom message
xcodeproj: "./path/MyProject.xcodeproj", # optional, if you have multiple Xcode project files, you must specify your main project here
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `message` | The commit message when committing the version bump | `Version Bump` |
| `xcodeproj` | The path to your project file (Not the workspace). If you have only one, this is optional | |
| `force` | Forces the commit, even if other files than the ones containing the version number have been modified | `false` |
| `test_dirty_files` | A list of dirty files passed in for testing | `file1, file2` |
| `test_expected_files` | A list of expected changed files passed in for testing | `file1, file2` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action hg_commit_version_bump

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_commit_version_bump

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_commit_version_bump parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/hg_push

- Docs »
- \_Actions »
- hg\_push
- Edit on GitHub
- ```

* * *

# hg\_push

| hg\_push | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @sjrmanning |

## 2 Examples

```ruby hljs
hg_push

```ruby hljs
hg_push(
destination: "ssh://hg@repohost.com/owner/repo",
force: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `force` | Force push to remote | `false` |
| `destination` | The destination to push to | `''` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action hg_push

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_push

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_push parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/hg_add_tag

- Docs »
- \_Actions »
- hg\_add\_tag
- Edit on GitHub
- ```

* * *

# hg\_add\_tag

This will add a hg tag to the current branch

| hg\_add\_tag | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @sjrmanning |

## 1 Example

```ruby hljs
hg_add_tag(tag: "1.3")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `tag` | Tag to create | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action hg_add_tag

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_add_tag

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_add_tag parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/github_api

- Docs »
- \_Actions »
- github\_api
- Edit on GitHub
- ```

* * *

# github\_api

>
> Out parameters provide the status code and the full response JSON if valid, otherwise the raw response body.
>
> Documentation:

| github\_api | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @tommeier |
| Returns | A hash including the HTTP status code (:status), the response body (:body), and if valid JSON has been returned the parsed JSON (:json). |

## 2 Examples

```ruby hljs
result = github_api(
server_url: "https://api.github.com",
api_token: ENV["GITHUB_TOKEN"],
http_method: "GET",
path: "/repos/:owner/:repo/readme",
body: { ref: "master" }
)

```ruby hljs
# Alternatively call directly with optional error handling or block usage
GithubApiAction.run(
server_url: "https://api.github.com",
api_token: ENV["GITHUB_TOKEN"],
http_method: "GET",
path: "/repos/:owner/:repo/readme",
error_handlers: {

UI.message("Something went wrong - I couldn't find it...")
end,

UI.message("Handle all error codes other than 404")
end
}
) do |result|
UI.message("JSON returned: #{result[:json]}")
end

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com` |
| `api_token` | Personal API Token for GitHub - generate one at | \* |
| `api_bearer` | Use a Bearer authorization token. Usually generated by GitHub Apps, e.g. GitHub Actions GITHUB\_TOKEN environment variable | |
| `http_method` | The HTTP method. e.g. GET / POST | `GET` |
| `body` | The request body in JSON or hash format | `{}` |
| `raw_body` | The request body taken verbatim instead of as JSON, useful for file uploads | |
| `path` | The endpoint path. e.g. '/repos/:owner/:repo/readme' | |
| `url` | The complete full url - used instead of path. e.g. 'https://uploads.github.com/repos/fastlane...' | |
| `error_handlers` | Optional error handling hash based on status code, or pass '\*' to handle all errors | `{}` |
| `headers` | Optional headers to apply | `{}` |
| `secure` | Optionally disable secure requests (ssl\_verify\_peer) | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `github_api` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::GITHUB_API_STATUS_CODE` | The status code returned from the request |
| `SharedValues::GITHUB_API_RESPONSE` | The full response body |
| `SharedValues::GITHUB_API_JSON` | The parsed json returned from GitHub |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action github_api

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run github_api

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run github_api parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/commit_github_file

- Docs »
- \_Actions »
- commit\_github\_file
- Edit on GitHub
- ```

* * *

# commit\_github\_file

>
> Out parameters provide the commit sha created, which can be used for later usage for examples such as releases, the direct download link and the full response JSON.
>
> Documentation:

| commit\_github\_file | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @tommeier |

## 1 Example

```ruby hljs
response = commit_github_file(
repository_name: "fastlane/fastlane",
server_url: "https://api.github.com",
api_token: ENV["GITHUB_TOKEN"],
message: "Add my new file",
branch: "master",
path: "assets/my_new_file.xcarchive"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `repository_name` | The path to your repo, e.g. 'fastlane/fastlane' | |
| `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com` |
| `api_token` | Personal API Token for GitHub - generate one at | \* |
| `api_bearer` | Use a Bearer authorization token. Usually generated by GitHub Apps, e.g. GitHub Actions GITHUB\_TOKEN environment variable | |
| `branch` | The branch that the file should be committed on (default: master) | `master` |
| `path` | The relative path to your file from project root e.g. assets/my\_app.xcarchive | |
| `message` | The commit message. Defaults to the file name | \* |
| `secure` | Optionally disable secure requests (ssl\_verify\_peer) | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `commit_github_file` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::COMMIT_GITHUB_FILE_HTML_LINK` | Link to your committed file |
| `SharedValues::COMMIT_GITHUB_FILE_SHA` | Commit SHA generated |
| `SharedValues::COMMIT_GITHUB_FILE_JSON` | The whole commit JSON object response |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action commit_github_file

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run commit_github_file

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run commit_github_file parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_submodule_update

- Docs »
- \_Actions »
- git\_submodule\_update
- Edit on GitHub
- ```

* * *

# git\_submodule\_update

Executes a git submodule update command

| git\_submodule\_update | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @braunico |

## 4 Examples

```ruby hljs
git_submodule_update

```ruby hljs
git_submodule_update(recursive: true)

```ruby hljs
git_submodule_update(init: true)

```ruby hljs
git_submodule_update(recursive: true, init: true)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `recursive` | Should the submodules be updated recursively? | `false` |
| `init` | Should the submodules be initiated before update? | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_submodule_update

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_submodule_update

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_submodule_update parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/git_remote_branch

- Docs »
- \_Actions »
- git\_remote\_branch
- Edit on GitHub
- ```

* * *

# git\_remote\_branch

| git\_remote\_branch | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @SeanMcNeil |

## 2 Examples

```ruby hljs
git_remote_branch # Query git for first available remote name

```ruby hljs
git_remote_branch(remote_name:"upstream") # Provide a remote name

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `remote_name` | The remote repository to check | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action git_remote_branch

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_remote_branch

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_remote_branch parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/slack

- Docs »
- \_Actions »
- slack
- Edit on GitHub
- ```

* * *

# slack

| slack | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
slack(message: "App successfully released!")

```ruby hljs
slack(
message: "App successfully released!",
channel: "#channel", # Optional, by default will post to the default channel configured for the POST URL.
success: true, # Optional, defaults to true.
payload: { # Optional, lets you specify any number of your own Slack attachments.

},
default_payloads: [:git_branch, :git_author], # Optional, lets you specify default payloads to include. Pass an empty array to suppress all the default payloads.
attachment_properties: { # Optional, lets you specify any other properties available for attachments in the slack API (see
# This hash is deep merged with the existing properties set using the other properties above. This allows your own fields properties to be appended to the existing fields that were created using the `payload` property for instance.
thumb_url: "http://example.com/path/to/thumb.png",
fields: [{\
title: "My Field",\
value: "My Value",\
short: true\
}]
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `message` | The message that should be displayed on Slack. This supports the standard Slack markup language | |
| `pretext` | This is optional text that appears above the message attachment block. This supports the standard Slack markup language | |
| `channel` | #channel or @username | |
| `use_webhook_configured_username_and_icon` | Use webhook's default username and icon settings? (true/false) | `false` |
| `slack_url` | Create an Incoming WebHook for your Slack group | |
| `username` | Overrides the webhook's username property if use\_webhook\_configured\_username\_and\_icon is false | `fastlane` |
| `icon_url` | Overrides the webhook's image property if use\_webhook\_configured\_username\_and\_icon is false | `https://fastlane.tools/assets/img/fastlane_icon.png` |
| `payload` | Add additional information to this post. payload must be a hash containing any key with any value | `{}` |
| `default_payloads` | Specifies default payloads to include. Pass an empty array to suppress all the default payloads | `["lane", "test_result", "git_branch", "git_author", "last_git_commit", "last_git_commit_hash"]` |
| `attachment_properties` | Merge additional properties in the slack attachment, see | `{}` |
| `success` | Was this build successful? (true/false) | `true` |
| `fail_on_error` | Should an error sending the slack notification cause a failure? (true/false) | `true` |
| `link_names` | Find and link channel names and usernames (true/false) | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action slack

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run slack

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run slack parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/notification

- Docs »
- \_Actions »
- notification
- Edit on GitHub
- ```

* * *

# notification

Display a macOS notification with custom message and title

| notification | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @champo, @cbowns, @KrauseFx, @amarcadet, @dusek |

## 1 Example

```ruby hljs
notification(subtitle: "Finished Building", message: "Ready to upload...")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `title` | The title to display in the notification | `fastlane` |
| `subtitle` | A subtitle to display in the notification | |
| `message` | The message to display in the notification | |
| `sound` | The name of a sound to play when the notification appears (names are listed in Sound Preferences) | |
| `activate` | Bundle identifier of application to be opened when the notification is clicked | |
| `app_icon` | The URL of an image to display instead of the application icon (Mavericks+ only) | |
| `content_image` | The URL of an image to display attached to the notification (Mavericks+ only) | |
| `open` | URL of the resource to be opened when the notification is clicked | |
| `execute` | Shell command to run when the notification is clicked | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action notification

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run notification

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run notification parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/hipchat

- Docs »
- \_Actions »
- hipchat
- Edit on GitHub
- ```

* * *

# hipchat

| hipchat | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @jingx23 |

## 1 Example

```ruby hljs
hipchat(
message: "App successfully released!",
message_format: "html", # or "text", defaults to "html"
channel: "Room or @username",
success: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `message` | The message to post on HipChat | `''` |
| `channel` | The room or @username | |
| `api_token` | Hipchat API Token | |
| `custom_color` | Specify a custom color, this overrides the success boolean. Can be one of 'yellow', 'red', 'green', 'purple', 'gray', or 'random' | |
| `success` | Was this build successful? (true/false) | `true` |
| `version` | Version of the Hipchat API. Must be 1 or 2 | |
| `notify_room` | Should the people in the room be notified? (true/false) | `false` |
| `api_host` | The host of the HipChat-Server API | `api.hipchat.com` |
| `message_format` | Format of the message to post. Must be either 'html' or 'text' | `html` |
| `include_html_header` | Should html formatted messages include a preformatted header? (true/false) | `true` |
| `from` | Name the message will appear to be sent from | `fastlane` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action hipchat

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hipchat

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hipchat parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/mailgun

- Docs »
- \_Actions »
- mailgun
- Edit on GitHub
- ```

* * *

# mailgun

Send a success/error message to an email group

| mailgun | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @thiagolioy |

## 2 Examples

```ruby hljs
mailgun(
to: "fastlane@krausefx.com",
success: true,
message: "This is the mail's content"
)

```ruby hljs
mailgun(
postmaster: "MY_POSTMASTER",
apikey: "MY_API_KEY",
to: "DESTINATION_EMAIL",
from: "EMAIL_FROM_NAME",
reply_to: "EMAIL_REPLY_TO",
success: true,
message: "Mail Body",
app_link: "http://www.myapplink.com",
ci_build_link: "http://www.mycibuildlink.com",
template_path: "HTML_TEMPLATE_PATH",
custom_placeholders: {

},
attachment: "dirname/filename.ext"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `mailgun_sandbox_domain` | Mailgun sandbox domain postmaster for your mail. Please use postmaster instead | |
| `mailgun_sandbox_postmaster` | Mailgun sandbox domain postmaster for your mail. Please use postmaster instead | |
| `mailgun_apikey` | Mailgun apikey for your mail. Please use postmaster instead | |
| `postmaster` | Mailgun sandbox domain postmaster for your mail | |
| `apikey` | Mailgun apikey for your mail | |
| `to` | Destination of your mail | |
| `from` | Mailgun sender name | `Mailgun Sandbox` |
| `message` | Message of your mail | |
| `subject` | Subject of your mail | `fastlane build` |
| `success` | Was this build successful? (true/false) | `true` |
| `app_link` | App Release link | |
| `ci_build_link` | CI Build Link | |
| `template_path` | Mail HTML template | |
| `reply_to` | Mail Reply to | |
| `attachment` | Mail Attachment filenames, either an array or just one string | |
| `custom_placeholders` | Placeholders for template given as a hash | `{}` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action mailgun

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run mailgun

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run mailgun parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/chatwork

- Docs »
- \_Actions »
- chatwork
- Edit on GitHub
- ```

* * *

# chatwork

| chatwork | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @astronaughts |

## 1 Example

```ruby hljs
chatwork(
message: "App successfully released!",
roomid: 12345,
success: true,
api_token: "Your Token"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_token` | ChatWork API Token | |
| `message` | The message to post on ChatWork | |
| `roomid` | The room ID | |
| `success` | Was this build successful? (true/false) | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action chatwork

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run chatwork

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run chatwork parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/ifttt

- Docs »
- \_Actions »
- ifttt
- Edit on GitHub
- ```

* * *

# ifttt

| ifttt | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @vpolouchkine |

## 1 Example

```ruby hljs
ifttt(
api_key: "...",
event_name: "...",
value1: "foo",
value2: "bar",
value3: "baz"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key` | API key | |
| `event_name` | The name of the event that will be triggered | |
| `value1` | Extra data sent with the event | |
| `value2` | Extra data sent with the event | |
| `value3` | Extra data sent with the event | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action ifttt

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ifttt

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ifttt parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/flock

- Docs »
- \_Actions »
- flock
- Edit on GitHub
- ```

* * *

# flock

| flock | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @Manav |

## 1 Example

```ruby hljs
flock(
message: "Hello",
token: "xxx"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `message` | Message text | |
| `token` | Token for the Flock incoming webhook | |
| `base_url` | Base URL of the Flock incoming message webhook | `https://api.flock.co/hooks/sendMessage` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action flock

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run flock

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run flock parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/twitter

- Docs »
- \_Actions »
- twitter
- Edit on GitHub
- ```

* * *

# twitter

| twitter | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @hjanuschka |

## 1 Example

```ruby hljs
twitter(
access_token: "XXXX",
access_token_secret: "xxx",
consumer_key: "xxx",
consumer_secret: "xxx",
message: "You rock!"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `consumer_key` | Consumer Key | |
| `consumer_secret` | Consumer Secret | |
| `access_token` | Access Token | |
| `access_token_secret` | Access Token Secret | |
| `message` | The tweet | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action twitter

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run twitter

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run twitter parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/typetalk

- Docs »
- \_Actions »
- typetalk
- Edit on GitHub
- ```

* * *

# typetalk

Post a message to Typetalk

| typetalk | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @Nulab Inc. |

## 1 Example

```ruby hljs
typetalk(
message: "App successfully released!",
note_path: "ChangeLog.md",
topicId: 1,
success: true,
typetalk_token: "Your Typetalk Token"
)

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action typetalk

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run typetalk

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run typetalk parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/produce

- Docs »
- \_Actions »
- produce
- Edit on GitHub
- ```

* * *

# produce

Alias for the `create_app_online` action

###### Create new iOS apps on App Store Connect and Apple Developer Portal using your command line

_produce_ creates new iOS apps on both the Apple Developer Portal and App Store Connect with the minimum required information.

Features •
Usage •
How does it work?

# Features

- **Create** new apps on both App Store Connect and the Apple Developer Portal
- **Modify** Application Services on the Apple Developer Portal
- **Create** App Groups on the Apple Developer Portal
- **Associate** apps with App Groups on the Apple Developer Portal
- **Create** iCloud Containers on the Apple Developer Portal
- **Associate** apps with iCloud Containers on the Apple Developer Portal
- **Create** Merchant Identifiers on the Apple Developer Portal
- **Associate** apps with Merchant Identifiers on the Apple Developer Portal
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain

# Usage

## Creating a new application

```no-highlight
fastlane produce

To get a list of all available parameters:

```no-highlight
fastlane produce --help

```no-highlight
Commands: (* default)
associate_group Associate with a group, which is created if needed or simply located otherwise
associate_merchant Associate with a merchant for use with Apple Pay. Apple Pay will be enabled for this app
create * Creates a new app on App Store Connect and the Apple Developer Portal
disable_services Disable specific Application Services for a specific app on the Apple Developer Portal
enable_services Enable specific Application Services for a specific app on the Apple Developer Portal
group Ensure that a specific App Group exists
cloud_container Ensure that a specific iCloud Container exists
help Display global or [command] help documentation
merchant Ensure that a specific Merchant exists

Global Options:
--verbose
-h, --help Display help documentation
-v, --version Display version information

Options for create:
-u, --username STRING Your Apple ID Username (PRODUCE_USERNAME)
-a, --app_identifier STRING App Identifier (Bundle ID, e.g. com.krausefx.app) (PRODUCE_APP_IDENTIFIER)
-e, --bundle_identifier_suffix STRING App Identifier Suffix (Ignored if App Identifier does not ends with .*) (PRODUCE_APP_IDENTIFIER_SUFFIX)
-q, --app_name STRING App Name (PRODUCE_APP_NAME)
-z, --app_version STRING Initial version number (e.g. '1.0') (PRODUCE_VERSION)
-y, --sku STRING SKU Number (e.g. '1234') (PRODUCE_SKU)
-j, --platform STRING The platform to use (optional) (PRODUCE_PLATFORM)
-m, --language STRING Primary Language (e.g. 'English', 'German') (PRODUCE_LANGUAGE)
-c, --company_name STRING The name of your company. It's used to set company name on App Store Connect team's app pages. Only required if it's the first app you create (PRODUCE_COMPANY_NAME)
-i, --skip_itc [VALUE] Skip the creation of the app on App Store Connect (PRODUCE_SKIP_ITC)
-d, --skip_devcenter [VALUE] Skip the creation of the app on the Apple Developer Portal (PRODUCE_SKIP_DEVCENTER)
-s, --itc_users ARRAY Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles (ITC_USERS)
-b, --team_id STRING The ID of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_ID)
-l, --team_name STRING The name of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_NAME)
-k, --itc_team_id [VALUE] The ID of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_ID)
-p, --itc_team_name STRING The name of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_NAME)

## Enabling / Disabling Application Services

If you want to enable Application Services for an App ID (HomeKit and HealthKit in this example):

```no-highlight
fastlane produce enable_services --homekit --healthkit

If you want to disable Application Services for an App ID (iCloud in this case):

```no-highlight
fastlane produce disable_services --icloud

If you want to create a new App Group:

```no-highlight
fastlane produce group -g group.krausefx -n "Example App Group"

If you want to associate an app with an App Group:

```no-highlight
fastlane produce associate_group -a com.krausefx.app group.krausefx

If you want to create a new iCloud Container:

```no-highlight
fastlane produce cloud_container -g iCloud.com.krausefx.app -n "Example iCloud Container"

If you want to associate an app with an iCloud Container:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app

If you want to associate an app with multiple iCloud Containers:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app1 iCloud.com.krausefx.app2

# Parameters

Get a list of all available options using

```no-highlight
fastlane produce enable_services --help

```no-highlight
--access-wifi Enable Access Wifi
--app-attest Enable App Attest
--app-group Enable App Group
--apple-pay Enable Apple Pay
--associated-domains Enable Associated Domains
--auto-fill-credential Enable Auto Fill Credential
--class-kit Enable Class Kit
--icloud STRING Enable iCloud, suitable values are "xcode5_compatible" and "xcode6_compatible"
--custom-network-protocol Enable Custom Network Protocol
--data-protection STRING Enable Data Protection, suitable values are "complete", "unlessopen" and "untilfirstauth"
--extended-virtual-address-space Enable Extended Virtual Address Space
--game-center STRING Enable Game Center, suitable values are "ios" and "macos
--health-kit Enable Health Kit
--hls-interstitial-preview Enable Hls Interstitial Preview
--home-kit Enable Home Kit
--hotspot Enable Hotspot
--in-app-purchase Enable In App Purchase
--inter-app-audio Enable Inter App Audio
--low-latency-hls Enable Low Latency Hls
--managed-associated-domains Enable Managed Associated Domains
--maps Enable Maps
--multipath Enable Multipath
--network-extension Enable Network Extension
--nfc-tag-reading Enable NFC Tag Reading
--personal-vpn Enable Personal VPN
--passbook Enable Passbook (deprecated)
--push-notification Enable Push Notification
--sign-in-with-apple Enable Sign In With Apple
--siri-kit Enable Siri Kit
--system-extension Enable System Extension
--user-management Enable User Management
--vpn-configuration Enable Vpn Configuration (deprecated)
--wallet Enable Wallet
--wireless-accessory Enable Wireless Accessory
--car-play-audio-app Enable Car Play Audio App
--car-play-messaging-app Enable Car Play Messaging App
--car-play-navigation-app Enable Car Play Navigation App
--car-play-voip-calling-app Enable Car Play Voip Calling App
--critical-alerts Enable Critical Alerts
--hotspot-helper Enable Hotspot Helper
--driver-kit Enable DriverKit
--driver-kit-endpoint-security Enable DriverKit Endpoint Security
--driver-kit-family-hid-device Enable DriverKit Family HID Device
--driver-kit-family-networking Enable DriverKit Family Networking
--driver-kit-family-serial Enable DriverKit Family Serial
--driver-kit-hid-event-service Enable DriverKit HID EventService
--driver-kit-transport-hid Enable DriverKit Transport HID
--multitasking-camera-access Enable Multitasking Camera Access
--sf-universal-link-api Enable SFUniversalLink API
--vp9-decoder Enable VP9 Decoder
--music-kit Enable MusicKit
--shazam-kit Enable ShazamKit
--communication-notifications Enable Communication Notifications
--group-activities Enable Group Activities
--health-kit-estimate-recalibration Enable HealthKit Estimate Recalibration
--time-sensitive-notifications Enable Time Sensitive Notifications

```no-highlight
fastlane produce disable_services --help

```no-highlight
--access-wifi Disable Access Wifi
--app-attest Disable App Attest
--app-group Disable App Group
--apple-pay Disable Apple Pay
--associated-domains Disable Associated Domains
--auto-fill-credential Disable Auto Fill Credential
--class-kit Disable Class Kit
--icloud STRING Disable iCloud
--custom-network-protocol Disable Custom Network Protocol
--data-protection STRING Disable Data Protection
--extended-virtual-address-space Disable Extended Virtual Address Space
--game-center STRING Disable Game Center
--health-kit Disable Health Kit
--hls-interstitial-preview Disable Hls Interstitial Preview
--home-kit Disable Home Kit
--hotspot Disable Hotspot
--in-app-purchase Disable In App Purchase
--inter-app-audio Disable Inter App Audio
--low-latency-hls Disable Low Latency Hls
--managed-associated-domains Disable Managed Associated Domains
--maps Disable Maps
--multipath Disable Multipath
--network-extension Disable Network Extension
--nfc-tag-reading Disable NFC Tag Reading
--personal-vpn Disable Personal VPN
--passbook Disable Passbook (deprecated)
--push-notification Disable Push Notification
--sign-in-with-apple Disable Sign In With Apple
--siri-kit Disable Siri Kit
--system-extension Disable System Extension
--user-management Disable User Management
--vpn-configuration Disable Vpn Configuration (deprecated)
--wallet Disable Wallet
--wireless-accessory Disable Wireless Accessory
--car-play-audio-app Disable Car Play Audio App
--car-play-messaging-app Disable Car Play Messaging App
--car-play-navigation-app Disable Car Play Navigation App
--car-play-voip-calling-app Disable Car Play Voip Calling App
--critical-alerts Disable Critical Alerts
--hotspot-helper Disable Hotspot Helper
--driver-kit Disable DriverKit
--driver-kit-endpoint-security Disable DriverKit Endpoint Security
--driver-kit-family-hid-device Disable DriverKit Family HID Device
--driver-kit-family-networking Disable DriverKit Family Networking
--driver-kit-family-serial Disable DriverKit Family Serial
--driver-kit-hid-event-service Disable DriverKit HID EventService
--driver-kit-transport-hid Disable DriverKit Transport HID
--multitasking-camera-access Disable Multitasking Camera Access
--sf-universal-link-api Disable SFUniversalLink API
--vp9-decoder Disable VP9 Decoder
--music-kit Disable MusicKit
--shazam-kit Disable ShazamKit
--communication-notifications Disable Communication Notifications
--group-activities Disable Group Activities
--health-kit-estimate-recalibration Disable HealthKit Estimate Recalibration
--time-sensitive-notifications Disable Time Sensitive Notifications

## Creating Apple Pay merchants and associating them with an App ID

If you want to create a new Apple Pay Merchant Identifier:

```no-highlight
fastlane produce merchant -o merchant.com.example.production -r "Example Merchant Production"

Use `--help` for more information about all available parameters

```no-highlight
fastlane produce merchant --help

If you want to associate an app with a Merchant Identifier:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production

If you want to associate an app with multiple Merchant Identifiers:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production merchant.com.example.sandbox

Use --help for more information about all available parameters

```no-highlight
fastlane produce associate_merchant --help

## Environment Variables

All available values can also be passed using environment variables, run `fastlane produce --help` to get a list of all available parameters.

## _fastlane_ Integration

Your `Fastfile` should look like this

```ruby hljs
lane :release do
produce(
username: 'felix@krausefx.com',
app_identifier: 'com.krausefx.app',
app_name: 'MyApp',
language: 'English',
app_version: '1.0',
sku: '123',
team_name: 'SunApps GmbH', # only necessary when in multiple teams

# Optional
# App services can be enabled during app creation
enable_services: {
access_wifi: "on", # Valid values: "on", "off"
app_attest: "on", # Valid values: "on", "off"
app_group: "on", # Valid values: "on", "off"
apple_pay: "on", # Valid values: "on", "off"
associated_domains: "on", # Valid values: "on", "off"
auto_fill_credential: "on", # Valid values: "on", "off"
car_play_audio_app: "on", # Valid values: "on", "off"
car_play_messaging_app: "on", # Valid values: "on", "off"
car_play_navigation_app: "on", # Valid values: "on", "off"
car_play_voip_calling_app: "on", # Valid values: "on", "off"
class_kit: "on", # Valid values: "on", "off"
icloud: "xcode5_compatible", # Valid values: "xcode5_compatible", "xcode6_compatible", "off"
critical_alerts: "on", # Valid values: "on", "off"
custom_network_protocol: "on", # Valid values: "on", "off"
data_protection: "complete", # Valid values: "complete", "unlessopen", "untilfirstauth", "off"
extended_virtual_address_space: "on", # Valid values: "on", "off"
file_provider_testing_mode: "on", # Valid values: "on", "off"
fonts: "on", # Valid values: "on", "off"
game_center: "ios", # Valid values: "ios", "macos", off"
health_kit: "on", # Valid values: "on", "off"
hls_interstitial_preview: "on", # Valid values: "on", "off"
home_kit: "on", # Valid values: "on", "off"
hotspot: "on", # Valid values: "on", "off"
hotspot_helper: "on", # Valid values: "on", "off"
in_app_purchase: "on", # Valid values: "on", "off"
inter_app_audio: "on", # Valid values: "on", "off"
low_latency_hls: "on", # Valid values: "on", "off"
managed_associated_domains: "on", # Valid values: "on", "off"
maps: "on", # Valid values: "on", "off"
multipath: "on", # Valid values: "on", "off"
network_extension: "on", # Valid values: "on", "off"
nfc_tag_reading: "on", # Valid values: "on", "off"
passbook: "on", # Valid values: "on", "off" (deprecated)
personal_vpn: "on", # Valid values: "on", "off"
push_notification: "on", # Valid values: "on", "off"
sign_in_with_apple: "on", # Valid values: "on", "off"
siri_kit: "on", # Valid values: "on", "off"
system_extension: "on", # Valid values: "on", "off"
user_management: "on", # Valid values: "on", "off"
vpn_configuration: "on", # Valid values: "on", "off" (deprecated)
wallet: "on", # Valid values: "on", "off"
wireless_accessory: "on", # Valid values: "on", "off"
driver_kit: "on", # Valid values: "on", "off"
driver_kit_endpoint_security: "on", # Valid values: "on", "off"
driver_kit_family_hid_device: "on", # Valid values: "on", "off"
driver_kit_family_networking: "on", # Valid values: "on", "off"
driver_kit_family_serial: "on", # Valid values: "on", "off"
driver_kit_hid_event_service: "on", # Valid values: "on", "off"
driver_kit_transport_hid: "on", # Valid values: "on", "off"
multitasking_camera_access: "on", # Valid values: "on", "off"
sf_universal_link_api: "on", # Valid values: "on", "off"
vp9_decoder: "on", # Valid values: "on", "off"
music_kit: "on", # Valid values: "on", "off"
shazam_kit: "on", # Valid values: "on", "off"
communication_notifications: "on", # Valid values: "on", "off"
group_activities: "on", # Valid values: "on", "off"
health_kit_estimate_recalibration: "on", # Valid values: "on", "off"
time_sensitive_notifications: "on", # Valid values: "on", "off"
}
)

deliver
end

To use the newly generated app in _deliver_, you need to add this line to your `Deliverfile`:

```ruby-skip-tests
apple_id(ENV['PRODUCE_APPLE_ID'])

This will tell _deliver_, which `App ID` to use, since the app is not yet available in the App Store.

You'll still have to fill out the remaining information (like screenshots, app description and pricing). You can use _deliver_ to upload your app metadata using a CLI

## How is my password stored?

_produce_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

| produce | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
create_app_online(
username: "felix@krausefx.com",
app_identifier: "com.krausefx.app",
app_name: "MyApp",
language: "English",
app_version: "1.0",
sku: "123",
team_name: "SunApps GmbH" # Only necessary when in multiple teams.
)

```ruby hljs
produce # alias for "create_app_online"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app) | \* |
| `bundle_identifier_suffix` | App Identifier Suffix (Ignored if App Identifier does not end with .\*) | |
| `app_name` | App Name | |
| `app_version` | Initial version number (e.g. '1.0') | |
| `sku` | SKU Number (e.g. '1234') | \* |
| `platform` | The platform to use (optional) | `ios` |
| `platforms` | The platforms to use (optional) | |
| `language` | Primary Language (e.g. 'en-US', 'fr-FR') | `English` |
| `company_name` | The name of your company. It's used to set company name on App Store Connect team's app pages. Only required if it's the first app you create | |
| `skip_itc` | Skip the creation of the app on App Store Connect | `false` |
| `itc_users` | Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles | |
| `enabled_features` | **DEPRECATED!** Please use `enable_services` instead - Array with Spaceship App Services | `{}` |
| `enable_services` | Array with Spaceship App Services (e.g. access\_wifi: (on\|off), app\_attest: (on\|off), app\_group: (on\|off), apple\_pay: (on\|off), associated\_domains: (on\|off), auto\_fill\_credential: (on\|off), class\_kit: (on\|off), icloud: (legacy\|cloudkit), custom\_network\_protocol: (on\|off), data\_protection: (complete\|unlessopen\|untilfirstauth), extended\_virtual\_address\_space: (on\|off), family\_controls: (on\|off), file\_provider\_testing\_mode: (on\|off), fonts: (on\|off), game\_center: (ios\|mac), health\_kit: (on\|off), hls\_interstitial\_preview: (on\|off), home\_kit: (on\|off), hotspot: (on\|off), in\_app\_purchase: (on\|off), inter\_app\_audio: (on\|off), low\_latency\_hls: (on\|off), managed\_associated\_domains: (on\|off), maps: (on\|off), multipath: (on\|off), network\_extension: (on\|off), nfc\_tag\_reading: (on\|off), personal\_vpn: (on\|off), passbook: (on\|off), push\_notification: (on\|off), sign\_in\_with\_apple: (on), siri\_kit: (on\|off), system\_extension: (on\|off), user\_management: (on\|off), vpn\_configuration: (on\|off), wallet: (on\|off), wireless\_accessory: (on\|off), car\_play\_audio\_app: (on\|off), car\_play\_messaging\_app: (on\|off), car\_play\_navigation\_app: (on\|off), car\_play\_voip\_calling\_app: (on\|off), critical\_alerts: (on\|off), hotspot\_helper: (on\|off), driver\_kit: (on\|off), driver\_kit\_endpoint\_security: (on\|off), driver\_kit\_family\_hid\_device: (on\|off), driver\_kit\_family\_networking: (on\|off), driver\_kit\_family\_serial: (on\|off), driver\_kit\_hid\_event\_service: (on\|off), driver\_kit\_transport\_hid: (on\|off), multitasking\_camera\_access: (on\|off), sf\_universal\_link\_api: (on\|off), vp9\_decoder: (on\|off), music\_kit: (on\|off), shazam\_kit: (on\|off), communication\_notifications: (on\|off), group\_activities: (on\|off), health\_kit\_estimate\_recalibration: (on\|off), time\_sensitive\_notifications: (on\|off)) | `{}` |
| `skip_devcenter` | Skip the creation of the app on the Apple Developer Portal | `false` |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `itc_team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `itc_team_name` | The name of your App Store Connect team if you're in multiple teams | \* |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `produce` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::PRODUCE_APPLE_ID` | The Apple ID of the newly created app. You probably need it for `deliver` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action produce

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run produce

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run produce parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/precheck

- Docs »
- \_Actions »
- precheck
- Edit on GitHub
- ```

* * *

# precheck

Alias for the `check_app_store_metadata` action

# _precheck_

###### Check your app using a community driven set of App Store review rules to avoid being rejected

Apple rejects builds for many avoidable metadata issues like including swear words 😮, other companies’ trademarks, or even mentioning an iOS bug 🐛. _fastlane precheck_ takes a lot of the guess work out by scanning your app’s details in App Store Connect for avoidable problems. fastlane precheck helps you get your app through app review without rejections so you can ship faster 🚀

Features •
Usage •
Example •
How does it work?

# Features

| | _precheck_ Features |
| --- | --- |
| 🐛 |  product bug mentions |
| 🙅 | Swear word checker |
| 🤖 | Mentioning other platforms |
| 😵 | URL reachability checker |
| 📝 | Placeholder/test words/mentioning future features |
| 📅 | Copyright date checking |
| 🙈 | Customizable word list checking |
| 📢 | You can decide if you want to warn about potential problems and continue or have _fastlane_ show an error and stop after all scans are done |

# Usage

Run _fastlane precheck_ to check the app metadata from App Store Connect

```no-highlight
fastlane precheck

To get a list of available options run

```no-highlight
fastlane action precheck

# Example

Since you might want to manually trigger _precheck_ but don't want to specify all the parameters every time, you can store your defaults in a so called `Precheckfile`.

Run `fastlane precheck init` to create a new configuration file. Example:

```ruby-skip-tests
# indicates that your metadata will not be checked by this rule
negative_apple_sentiment(level: :skip)

# when triggered, this rule will warn you of a potential problem
curse_words(level: :warn)

# show error and prevent any further commands from running after fastlane precheck finishes
unreachable_urls(level: :error)

# pass in whatever words you want to check for
custom_text(data: ["chrome", "webos"],
level: :warn)

### Use with _fastlane_

_precheck_ is fully integrated with _deliver_ another _fastlane_ tool.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :production do
# ...

# by default deliver will call precheck and warn you of any problems
# if you want precheck to halt submitting to app review, you can pass
# precheck_default_rule_level: :error
deliver(precheck_default_rule_level: :error)

end

# or if you prefer, you can run precheck alone
lane :check_metadata do
precheck
end

# How does it work?

_precheck_ will access `App Store Connect` to download your app's metadata. It uses _spaceship_ to communicate with Apple's web services.

# Want to improve precheck's rules?

Please submit an issue on GitHub and provide information about your App Store rejection! Make sure you scrub out any personally identifiable information since this will be public.

| precheck | |
| --- | --- |
| Supported platforms | ios |
| Author | @taquitos |
| Returns | true if precheck passes, else, false |

## 2 Examples

```ruby hljs
check_app_store_metadata(
negative_apple_sentiment: [level: :skip], # Set to skip to not run the `negative_apple_sentiment` rule
curse_words: [level: :warn] # Set to warn to only warn on curse word check failures
)

```ruby hljs
precheck # alias for "check_app_store_metadata"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `platform` | The platform to use (optional) | `ios` |
| `default_rule_level` | The default rule level unless otherwise configured | `:error` |
| `include_in_app_purchases` | Should check in-app purchases? | `true` |
| `use_live` | Should force check live app? | `false` |
| `negative_apple_sentiment` | mentioning  in a way that could be considered negative | |
| `placeholder_text` | using placeholder text (e.g.:"lorem ipsum", "text here", etc...) | |
| `other_platforms` | mentioning other platforms, like Android or Blackberry | |
| `future_functionality` | mentioning features or content that is not currently available in your app | |
| `test_words` | using text indicating this release is a test | |
| `curse_words` | including words that might be considered objectionable | |
| `free_stuff_in_iap` | using text indicating that your IAP is free | |
| `custom_text` | mentioning any of the user-specified words passed to custom\_text(data: \[words\]) | |
| `copyright_date` | using a copyright date that is any different from this current year, or missing a date | |
| `unreachable_urls` | unreachable URLs in app metadata | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run precheck

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run precheck parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/latest_testflight_build_number

- Docs »
- \_Actions »
- latest\_testflight\_build\_number
- Edit on GitHub
- ```

* * *

# latest\_testflight\_build\_number

>
> Fetches the most recent build number from TestFlight based on the version number. Provides a way to have `increment_build_number` be based on the latest build you uploaded to iTC.

| latest\_testflight\_build\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @daveanderson |
| Returns | Integer representation of the latest build number uploaded to TestFlight |

## 2 Examples

```ruby hljs
latest_testflight_build_number(version: "1.3")

```ruby hljs
increment_build_number({
build_number: latest_testflight_build_number + 1
})

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `live` | Query the live version (ready-for-sale) | `false` |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `version` | The version number whose latest build number we want | |
| `platform` | The platform to use (optional) | `ios` |
| `initial_build_number` | sets the build number to given value if no build is in current train | `1` |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `latest_testflight_build_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::LATEST_TESTFLIGHT_BUILD_NUMBER` | The latest build number of the latest version of the app uploaded to TestFlight |
| `SharedValues::LATEST_TESTFLIGHT_VERSION` | The version of the latest build number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action latest_testflight_build_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run latest_testflight_build_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run latest_testflight_build_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/download_dsyms

- Docs »
- \_Actions »
- download\_dsyms
- Edit on GitHub
- ```

* * *

# download\_dsyms

```ruby hljs
lane :refresh_dsyms do
download_dsyms # Download dSYM files from iTC
upload_symbols_to_crashlytics # Upload them to Crashlytics
clean_build_artifacts # Delete the local dSYM files
end

| download\_dsyms | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 6 Examples

```ruby hljs
download_dsyms

```ruby hljs
download_dsyms(version: "1.0.0", build_number: "345")

```ruby hljs
download_dsyms(version: "1.0.1", build_number: 42)

```ruby hljs
download_dsyms(version: "live")

```ruby hljs
download_dsyms(min_version: "1.2.3")

```ruby hljs
download_dsyms(after_uploaded_date: "2020-09-11T19:00:00+01:00")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#use-return-value-and-pass-in-as-an-option) | \* |
| `username` | Your Apple ID Username for App Store Connect | \* |
| `app_identifier` | The bundle identifier of your app | \* |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `platform` | The app platform for dSYMs you wish to download (ios, appletvos) | `:ios` |
| `version` | The app version for dSYMs you wish to download, pass in 'latest' to download only the latest build's dSYMs or 'live' to download only the live version dSYMs | |
| `build_number` | The app build\_number for dSYMs you wish to download | |
| `min_version` | The minimum app version for dSYMs you wish to download | |
| `after_uploaded_date` | The uploaded date after which you wish to download dSYMs | |
| `output_directory` | Where to save the download dSYMs, defaults to the current path | |
| `wait_for_dsym_processing` | Wait for dSYMs to process | `false` |
| `wait_timeout` | Number of seconds to wait for dSYMs to process | `300` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `download_dsyms` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::DSYM_PATHS` | An array to all the zipped dSYM files |
| `SharedValues::DSYM_LATEST_UPLOADED_DATE` | Date of the most recent uploaded time of successfully downloaded dSYM files |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action download_dsyms

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run download_dsyms

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run download_dsyms parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/app_store_build_number

- Docs »
- \_Actions »
- app\_store\_build\_number
- Edit on GitHub
- ```

* * *

# app\_store\_build\_number

>
> If you need to handle more build-trains please see `latest_testflight_build_number`.

| app\_store\_build\_number | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @hjanuschka |

## 4 Examples

```ruby hljs
app_store_build_number

```ruby hljs
app_store_build_number(
app_identifier: "app.identifier",
username: "user@host.com"
)

```ruby hljs
app_store_build_number(
live: false,
app_identifier: "app.identifier",
version: "1.2.9"
)

```ruby hljs
api_key = app_store_connect_api_key(
key_id: "MyKeyID12345",
issuer_id: "00000000-0000-0000-0000-000000000000",
key_filepath: "./AuthKey.p8"
)
build_num = app_store_build_number(
api_key: api_key
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | \* |
| `initial_build_number` | sets the build number to given value if no build is in current train | |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `live` | Query the live version (ready-for-sale) | `true` |
| `version` | The version number whose latest build number we want | |
| `platform` | The platform to use (optional) | `ios` |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `app_store_build_number` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::LATEST_BUILD_NUMBER` | The latest build number of either live or testflight version |
| `SharedValues::LATEST_VERSION` | The version of the latest build number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action app_store_build_number

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run app_store_build_number

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run app_store_build_number parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/set_changelog

- Docs »
- \_Actions »
- set\_changelog
- Edit on GitHub
- ```

* * *

# set\_changelog

>
> You can store the changelog in `./fastlane/changelog.txt` and it will automatically get loaded from there. This integration is useful if you support e.g. 10 languages and want to use the same "What's new"-text for all languages.
>
> Defining the version is optional. _fastlane_ will try to automatically detect it if you don't provide one.

| set\_changelog | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
set_changelog(changelog: "Changelog for all Languages")

```ruby hljs
set_changelog(app_identifier: "com.krausefx.app", version: "1.0", changelog: "Changelog for all Languages")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | \* |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `version` | The version number to create/update | |
| `changelog` | Changelog text that should be uploaded to App Store Connect | |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `platform` | The platform of the app (ios, appletvos, mac) | `ios` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action set_changelog

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_changelog

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_changelog parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/app_store_connect_api_key

- Docs »
- \_Actions »
- app\_store\_connect\_api\_key
- Edit on GitHub
- ```

* * *

# app\_store\_connect\_api\_key

| app\_store\_connect\_api\_key | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @joshdholtz |

## 3 Examples

```ruby hljs
app_store_connect_api_key(
key_id: "D83848D23",
issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
key_filepath: "D83848D23.p8"
)

```ruby hljs
app_store_connect_api_key(
key_id: "D83848D23",
issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
key_filepath: "D83848D23.p8",
duration: 200,
in_house: true
)

```ruby hljs
app_store_connect_api_key(
key_id: "D83848D23",
issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
key_content: "-----BEGIN EC PRIVATE KEY-----\nfewfawefawfe\n-----END EC PRIVATE KEY-----"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `key_id` | The key ID | |
| `issuer_id` | The issuer ID | |
| `key_filepath` | The path to the key p8 file | |
| `key_content` | The content of the key p8 file | |
| `is_key_content_base64` | Whether :key\_content is Base64 encoded or not | `false` |
| `duration` | The token session duration | `500` |
| `in_house` | Is App Store or Enterprise (in house) team? App Store Connect API cannot determine this on its own (yet) | `false` |
| `set_spaceship_token` | Authorizes all Spaceship::ConnectAPI requests by automatically setting Spaceship::ConnectAPI.token | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `app_store_connect_api_key` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::APP_STORE_CONNECT_API_KEY` | The App Store Connect API key information used for authorization requests. This hash can be passed directly into the :api\_key options on other tools or into Spaceship::ConnectAPI::Token.create method |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action app_store_connect_api_key

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run app_store_connect_api_key

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run app_store_connect_api_key parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/check_app_store_metadata

- Docs »
- \_Actions »
- check\_app\_store\_metadata
- Edit on GitHub
- ```

* * *

# check\_app\_store\_metadata

Check your app's metadata before you submit your app to review (via _precheck_)

# _precheck_

###### Check your app using a community driven set of App Store review rules to avoid being rejected

Apple rejects builds for many avoidable metadata issues like including swear words 😮, other companies’ trademarks, or even mentioning an iOS bug 🐛. _fastlane precheck_ takes a lot of the guess work out by scanning your app’s details in App Store Connect for avoidable problems. fastlane precheck helps you get your app through app review without rejections so you can ship faster 🚀

Features •
Usage •
Example •
How does it work?

# Features

| | _precheck_ Features |
| --- | --- |
| 🐛 |  product bug mentions |
| 🙅 | Swear word checker |
| 🤖 | Mentioning other platforms |
| 😵 | URL reachability checker |
| 📝 | Placeholder/test words/mentioning future features |
| 📅 | Copyright date checking |
| 🙈 | Customizable word list checking |
| 📢 | You can decide if you want to warn about potential problems and continue or have _fastlane_ show an error and stop after all scans are done |

# Usage

Run _fastlane precheck_ to check the app metadata from App Store Connect

```no-highlight
fastlane precheck

To get a list of available options run

```no-highlight
fastlane action precheck

# Example

Since you might want to manually trigger _precheck_ but don't want to specify all the parameters every time, you can store your defaults in a so called `Precheckfile`.

Run `fastlane precheck init` to create a new configuration file. Example:

```ruby-skip-tests
# indicates that your metadata will not be checked by this rule
negative_apple_sentiment(level: :skip)

# when triggered, this rule will warn you of a potential problem
curse_words(level: :warn)

# show error and prevent any further commands from running after fastlane precheck finishes
unreachable_urls(level: :error)

# pass in whatever words you want to check for
custom_text(data: ["chrome", "webos"],
level: :warn)

### Use with _fastlane_

_precheck_ is fully integrated with _deliver_ another _fastlane_ tool.

Update your `Fastfile` to contain the following code:

```ruby hljs
lane :production do
# ...

# by default deliver will call precheck and warn you of any problems
# if you want precheck to halt submitting to app review, you can pass
# precheck_default_rule_level: :error
deliver(precheck_default_rule_level: :error)

end

# or if you prefer, you can run precheck alone
lane :check_metadata do
precheck
end

# How does it work?

_precheck_ will access `App Store Connect` to download your app's metadata. It uses _spaceship_ to communicate with Apple's web services.

# Want to improve precheck's rules?

Please submit an issue on GitHub and provide information about your App Store rejection! Make sure you scrub out any personally identifiable information since this will be public.

| check\_app\_store\_metadata | |
| --- | --- |
| Supported platforms | ios |
| Author | @taquitos |
| Returns | true if precheck passes, else, false |

## 2 Examples

```ruby hljs
check_app_store_metadata(
negative_apple_sentiment: [level: :skip], # Set to skip to not run the `negative_apple_sentiment` rule
curse_words: [level: :warn] # Set to warn to only warn on curse word check failures
)

```ruby hljs
precheck # alias for "check_app_store_metadata"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | |
| `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | |
| `app_identifier` | The bundle identifier of your app | \* |
| `username` | Your Apple ID Username | \* |
| `team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `team_name` | The name of your App Store Connect team if you're in multiple teams | \* |
| `platform` | The platform to use (optional) | `ios` |
| `default_rule_level` | The default rule level unless otherwise configured | `:error` |
| `include_in_app_purchases` | Should check in-app purchases? | `true` |
| `use_live` | Should force check live app? | `false` |
| `negative_apple_sentiment` | mentioning  in a way that could be considered negative | |
| `placeholder_text` | using placeholder text (e.g.:"lorem ipsum", "text here", etc...) | |
| `other_platforms` | mentioning other platforms, like Android or Blackberry | |
| `future_functionality` | mentioning features or content that is not currently available in your app | |
| `test_words` | using text indicating this release is a test | |
| `curse_words` | including words that might be considered objectionable | |
| `free_stuff_in_iap` | using text indicating that your IAP is free | |
| `custom_text` | mentioning any of the user-specified words passed to custom\_text(data: \[words\]) | |
| `copyright_date` | using a copyright date that is any different from this current year, or missing a date | |
| `unreachable_urls` | unreachable URLs in app metadata | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action check_app_store_metadata

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run check_app_store_metadata

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run check_app_store_metadata parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/create_app_online

- Docs »
- \_Actions »
- create\_app\_online
- Edit on GitHub
- ```

* * *

# create\_app\_online

Creates the given application on iTC and the Dev Portal (via _produce_)

###### Create new iOS apps on App Store Connect and Apple Developer Portal using your command line

_produce_ creates new iOS apps on both the Apple Developer Portal and App Store Connect with the minimum required information.

Features •
Usage •
How does it work?

# Features

- **Create** new apps on both App Store Connect and the Apple Developer Portal
- **Modify** Application Services on the Apple Developer Portal
- **Create** App Groups on the Apple Developer Portal
- **Associate** apps with App Groups on the Apple Developer Portal
- **Create** iCloud Containers on the Apple Developer Portal
- **Associate** apps with iCloud Containers on the Apple Developer Portal
- **Create** Merchant Identifiers on the Apple Developer Portal
- **Associate** apps with Merchant Identifiers on the Apple Developer Portal
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain

# Usage

## Creating a new application

```no-highlight
fastlane produce

To get a list of all available parameters:

```no-highlight
fastlane produce --help

```no-highlight
Commands: (* default)
associate_group Associate with a group, which is created if needed or simply located otherwise
associate_merchant Associate with a merchant for use with Apple Pay. Apple Pay will be enabled for this app
create * Creates a new app on App Store Connect and the Apple Developer Portal
disable_services Disable specific Application Services for a specific app on the Apple Developer Portal
enable_services Enable specific Application Services for a specific app on the Apple Developer Portal
group Ensure that a specific App Group exists
cloud_container Ensure that a specific iCloud Container exists
help Display global or [command] help documentation
merchant Ensure that a specific Merchant exists

Global Options:
--verbose
-h, --help Display help documentation
-v, --version Display version information

Options for create:
-u, --username STRING Your Apple ID Username (PRODUCE_USERNAME)
-a, --app_identifier STRING App Identifier (Bundle ID, e.g. com.krausefx.app) (PRODUCE_APP_IDENTIFIER)
-e, --bundle_identifier_suffix STRING App Identifier Suffix (Ignored if App Identifier does not ends with .*) (PRODUCE_APP_IDENTIFIER_SUFFIX)
-q, --app_name STRING App Name (PRODUCE_APP_NAME)
-z, --app_version STRING Initial version number (e.g. '1.0') (PRODUCE_VERSION)
-y, --sku STRING SKU Number (e.g. '1234') (PRODUCE_SKU)
-j, --platform STRING The platform to use (optional) (PRODUCE_PLATFORM)
-m, --language STRING Primary Language (e.g. 'English', 'German') (PRODUCE_LANGUAGE)
-c, --company_name STRING The name of your company. It's used to set company name on App Store Connect team's app pages. Only required if it's the first app you create (PRODUCE_COMPANY_NAME)
-i, --skip_itc [VALUE] Skip the creation of the app on App Store Connect (PRODUCE_SKIP_ITC)
-d, --skip_devcenter [VALUE] Skip the creation of the app on the Apple Developer Portal (PRODUCE_SKIP_DEVCENTER)
-s, --itc_users ARRAY Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles (ITC_USERS)
-b, --team_id STRING The ID of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_ID)
-l, --team_name STRING The name of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_NAME)
-k, --itc_team_id [VALUE] The ID of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_ID)
-p, --itc_team_name STRING The name of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_NAME)

## Enabling / Disabling Application Services

If you want to enable Application Services for an App ID (HomeKit and HealthKit in this example):

```no-highlight
fastlane produce enable_services --homekit --healthkit

If you want to disable Application Services for an App ID (iCloud in this case):

```no-highlight
fastlane produce disable_services --icloud

If you want to create a new App Group:

```no-highlight
fastlane produce group -g group.krausefx -n "Example App Group"

If you want to associate an app with an App Group:

```no-highlight
fastlane produce associate_group -a com.krausefx.app group.krausefx

If you want to create a new iCloud Container:

```no-highlight
fastlane produce cloud_container -g iCloud.com.krausefx.app -n "Example iCloud Container"

If you want to associate an app with an iCloud Container:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app

If you want to associate an app with multiple iCloud Containers:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app1 iCloud.com.krausefx.app2

# Parameters

Get a list of all available options using

```no-highlight
fastlane produce enable_services --help

```no-highlight
--access-wifi Enable Access Wifi
--app-attest Enable App Attest
--app-group Enable App Group
--apple-pay Enable Apple Pay
--associated-domains Enable Associated Domains
--auto-fill-credential Enable Auto Fill Credential
--class-kit Enable Class Kit
--icloud STRING Enable iCloud, suitable values are "xcode5_compatible" and "xcode6_compatible"
--custom-network-protocol Enable Custom Network Protocol
--data-protection STRING Enable Data Protection, suitable values are "complete", "unlessopen" and "untilfirstauth"
--extended-virtual-address-space Enable Extended Virtual Address Space
--game-center STRING Enable Game Center, suitable values are "ios" and "macos
--health-kit Enable Health Kit
--hls-interstitial-preview Enable Hls Interstitial Preview
--home-kit Enable Home Kit
--hotspot Enable Hotspot
--in-app-purchase Enable In App Purchase
--inter-app-audio Enable Inter App Audio
--low-latency-hls Enable Low Latency Hls
--managed-associated-domains Enable Managed Associated Domains
--maps Enable Maps
--multipath Enable Multipath
--network-extension Enable Network Extension
--nfc-tag-reading Enable NFC Tag Reading
--personal-vpn Enable Personal VPN
--passbook Enable Passbook (deprecated)
--push-notification Enable Push Notification
--sign-in-with-apple Enable Sign In With Apple
--siri-kit Enable Siri Kit
--system-extension Enable System Extension
--user-management Enable User Management
--vpn-configuration Enable Vpn Configuration (deprecated)
--wallet Enable Wallet
--wireless-accessory Enable Wireless Accessory
--car-play-audio-app Enable Car Play Audio App
--car-play-messaging-app Enable Car Play Messaging App
--car-play-navigation-app Enable Car Play Navigation App
--car-play-voip-calling-app Enable Car Play Voip Calling App
--critical-alerts Enable Critical Alerts
--hotspot-helper Enable Hotspot Helper
--driver-kit Enable DriverKit
--driver-kit-endpoint-security Enable DriverKit Endpoint Security
--driver-kit-family-hid-device Enable DriverKit Family HID Device
--driver-kit-family-networking Enable DriverKit Family Networking
--driver-kit-family-serial Enable DriverKit Family Serial
--driver-kit-hid-event-service Enable DriverKit HID EventService
--driver-kit-transport-hid Enable DriverKit Transport HID
--multitasking-camera-access Enable Multitasking Camera Access
--sf-universal-link-api Enable SFUniversalLink API
--vp9-decoder Enable VP9 Decoder
--music-kit Enable MusicKit
--shazam-kit Enable ShazamKit
--communication-notifications Enable Communication Notifications
--group-activities Enable Group Activities
--health-kit-estimate-recalibration Enable HealthKit Estimate Recalibration
--time-sensitive-notifications Enable Time Sensitive Notifications

```no-highlight
fastlane produce disable_services --help

```no-highlight
--access-wifi Disable Access Wifi
--app-attest Disable App Attest
--app-group Disable App Group
--apple-pay Disable Apple Pay
--associated-domains Disable Associated Domains
--auto-fill-credential Disable Auto Fill Credential
--class-kit Disable Class Kit
--icloud STRING Disable iCloud
--custom-network-protocol Disable Custom Network Protocol
--data-protection STRING Disable Data Protection
--extended-virtual-address-space Disable Extended Virtual Address Space
--game-center STRING Disable Game Center
--health-kit Disable Health Kit
--hls-interstitial-preview Disable Hls Interstitial Preview
--home-kit Disable Home Kit
--hotspot Disable Hotspot
--in-app-purchase Disable In App Purchase
--inter-app-audio Disable Inter App Audio
--low-latency-hls Disable Low Latency Hls
--managed-associated-domains Disable Managed Associated Domains
--maps Disable Maps
--multipath Disable Multipath
--network-extension Disable Network Extension
--nfc-tag-reading Disable NFC Tag Reading
--personal-vpn Disable Personal VPN
--passbook Disable Passbook (deprecated)
--push-notification Disable Push Notification
--sign-in-with-apple Disable Sign In With Apple
--siri-kit Disable Siri Kit
--system-extension Disable System Extension
--user-management Disable User Management
--vpn-configuration Disable Vpn Configuration (deprecated)
--wallet Disable Wallet
--wireless-accessory Disable Wireless Accessory
--car-play-audio-app Disable Car Play Audio App
--car-play-messaging-app Disable Car Play Messaging App
--car-play-navigation-app Disable Car Play Navigation App
--car-play-voip-calling-app Disable Car Play Voip Calling App
--critical-alerts Disable Critical Alerts
--hotspot-helper Disable Hotspot Helper
--driver-kit Disable DriverKit
--driver-kit-endpoint-security Disable DriverKit Endpoint Security
--driver-kit-family-hid-device Disable DriverKit Family HID Device
--driver-kit-family-networking Disable DriverKit Family Networking
--driver-kit-family-serial Disable DriverKit Family Serial
--driver-kit-hid-event-service Disable DriverKit HID EventService
--driver-kit-transport-hid Disable DriverKit Transport HID
--multitasking-camera-access Disable Multitasking Camera Access
--sf-universal-link-api Disable SFUniversalLink API
--vp9-decoder Disable VP9 Decoder
--music-kit Disable MusicKit
--shazam-kit Disable ShazamKit
--communication-notifications Disable Communication Notifications
--group-activities Disable Group Activities
--health-kit-estimate-recalibration Disable HealthKit Estimate Recalibration
--time-sensitive-notifications Disable Time Sensitive Notifications

## Creating Apple Pay merchants and associating them with an App ID

If you want to create a new Apple Pay Merchant Identifier:

```no-highlight
fastlane produce merchant -o merchant.com.example.production -r "Example Merchant Production"

Use `--help` for more information about all available parameters

```no-highlight
fastlane produce merchant --help

If you want to associate an app with a Merchant Identifier:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production

If you want to associate an app with multiple Merchant Identifiers:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production merchant.com.example.sandbox

Use --help for more information about all available parameters

```no-highlight
fastlane produce associate_merchant --help

## Environment Variables

All available values can also be passed using environment variables, run `fastlane produce --help` to get a list of all available parameters.

## _fastlane_ Integration

Your `Fastfile` should look like this

```ruby hljs
lane :release do
produce(
username: 'felix@krausefx.com',
app_identifier: 'com.krausefx.app',
app_name: 'MyApp',
language: 'English',
app_version: '1.0',
sku: '123',
team_name: 'SunApps GmbH', # only necessary when in multiple teams

# Optional
# App services can be enabled during app creation
enable_services: {
access_wifi: "on", # Valid values: "on", "off"
app_attest: "on", # Valid values: "on", "off"
app_group: "on", # Valid values: "on", "off"
apple_pay: "on", # Valid values: "on", "off"
associated_domains: "on", # Valid values: "on", "off"
auto_fill_credential: "on", # Valid values: "on", "off"
car_play_audio_app: "on", # Valid values: "on", "off"
car_play_messaging_app: "on", # Valid values: "on", "off"
car_play_navigation_app: "on", # Valid values: "on", "off"
car_play_voip_calling_app: "on", # Valid values: "on", "off"
class_kit: "on", # Valid values: "on", "off"
icloud: "xcode5_compatible", # Valid values: "xcode5_compatible", "xcode6_compatible", "off"
critical_alerts: "on", # Valid values: "on", "off"
custom_network_protocol: "on", # Valid values: "on", "off"
data_protection: "complete", # Valid values: "complete", "unlessopen", "untilfirstauth", "off"
extended_virtual_address_space: "on", # Valid values: "on", "off"
file_provider_testing_mode: "on", # Valid values: "on", "off"
fonts: "on", # Valid values: "on", "off"
game_center: "ios", # Valid values: "ios", "macos", off"
health_kit: "on", # Valid values: "on", "off"
hls_interstitial_preview: "on", # Valid values: "on", "off"
home_kit: "on", # Valid values: "on", "off"
hotspot: "on", # Valid values: "on", "off"
hotspot_helper: "on", # Valid values: "on", "off"
in_app_purchase: "on", # Valid values: "on", "off"
inter_app_audio: "on", # Valid values: "on", "off"
low_latency_hls: "on", # Valid values: "on", "off"
managed_associated_domains: "on", # Valid values: "on", "off"
maps: "on", # Valid values: "on", "off"
multipath: "on", # Valid values: "on", "off"
network_extension: "on", # Valid values: "on", "off"
nfc_tag_reading: "on", # Valid values: "on", "off"
passbook: "on", # Valid values: "on", "off" (deprecated)
personal_vpn: "on", # Valid values: "on", "off"
push_notification: "on", # Valid values: "on", "off"
sign_in_with_apple: "on", # Valid values: "on", "off"
siri_kit: "on", # Valid values: "on", "off"
system_extension: "on", # Valid values: "on", "off"
user_management: "on", # Valid values: "on", "off"
vpn_configuration: "on", # Valid values: "on", "off" (deprecated)
wallet: "on", # Valid values: "on", "off"
wireless_accessory: "on", # Valid values: "on", "off"
driver_kit: "on", # Valid values: "on", "off"
driver_kit_endpoint_security: "on", # Valid values: "on", "off"
driver_kit_family_hid_device: "on", # Valid values: "on", "off"
driver_kit_family_networking: "on", # Valid values: "on", "off"
driver_kit_family_serial: "on", # Valid values: "on", "off"
driver_kit_hid_event_service: "on", # Valid values: "on", "off"
driver_kit_transport_hid: "on", # Valid values: "on", "off"
multitasking_camera_access: "on", # Valid values: "on", "off"
sf_universal_link_api: "on", # Valid values: "on", "off"
vp9_decoder: "on", # Valid values: "on", "off"
music_kit: "on", # Valid values: "on", "off"
shazam_kit: "on", # Valid values: "on", "off"
communication_notifications: "on", # Valid values: "on", "off"
group_activities: "on", # Valid values: "on", "off"
health_kit_estimate_recalibration: "on", # Valid values: "on", "off"
time_sensitive_notifications: "on", # Valid values: "on", "off"
}
)

deliver
end

To use the newly generated app in _deliver_, you need to add this line to your `Deliverfile`:

```ruby-skip-tests
apple_id(ENV['PRODUCE_APPLE_ID'])

This will tell _deliver_, which `App ID` to use, since the app is not yet available in the App Store.

You'll still have to fill out the remaining information (like screenshots, app description and pricing). You can use _deliver_ to upload your app metadata using a CLI

## How is my password stored?

_produce_ uses the password manager from _fastlane_. Take a look the CredentialsManager README for more information.

| create\_app\_online | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
create_app_online(
username: "felix@krausefx.com",
app_identifier: "com.krausefx.app",
app_name: "MyApp",
language: "English",
app_version: "1.0",
sku: "123",
team_name: "SunApps GmbH" # Only necessary when in multiple teams.
)

```ruby hljs
produce # alias for "create_app_online"

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `username` | Your Apple ID Username | \* |
| `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app) | \* |
| `bundle_identifier_suffix` | App Identifier Suffix (Ignored if App Identifier does not end with .\*) | |
| `app_name` | App Name | |
| `app_version` | Initial version number (e.g. '1.0') | |
| `sku` | SKU Number (e.g. '1234') | \* |
| `platform` | The platform to use (optional) | `ios` |
| `platforms` | The platforms to use (optional) | |
| `language` | Primary Language (e.g. 'en-US', 'fr-FR') | `English` |
| `company_name` | The name of your company. It's used to set company name on App Store Connect team's app pages. Only required if it's the first app you create | |
| `skip_itc` | Skip the creation of the app on App Store Connect | `false` |
| `itc_users` | Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles | |
| `enabled_features` | **DEPRECATED!** Please use `enable_services` instead - Array with Spaceship App Services | `{}` |
| `enable_services` | Array with Spaceship App Services (e.g. access\_wifi: (on\|off), app\_attest: (on\|off), app\_group: (on\|off), apple\_pay: (on\|off), associated\_domains: (on\|off), auto\_fill\_credential: (on\|off), class\_kit: (on\|off), icloud: (legacy\|cloudkit), custom\_network\_protocol: (on\|off), data\_protection: (complete\|unlessopen\|untilfirstauth), extended\_virtual\_address\_space: (on\|off), family\_controls: (on\|off), file\_provider\_testing\_mode: (on\|off), fonts: (on\|off), game\_center: (ios\|mac), health\_kit: (on\|off), hls\_interstitial\_preview: (on\|off), home\_kit: (on\|off), hotspot: (on\|off), in\_app\_purchase: (on\|off), inter\_app\_audio: (on\|off), low\_latency\_hls: (on\|off), managed\_associated\_domains: (on\|off), maps: (on\|off), multipath: (on\|off), network\_extension: (on\|off), nfc\_tag\_reading: (on\|off), personal\_vpn: (on\|off), passbook: (on\|off), push\_notification: (on\|off), sign\_in\_with\_apple: (on), siri\_kit: (on\|off), system\_extension: (on\|off), user\_management: (on\|off), vpn\_configuration: (on\|off), wallet: (on\|off), wireless\_accessory: (on\|off), car\_play\_audio\_app: (on\|off), car\_play\_messaging\_app: (on\|off), car\_play\_navigation\_app: (on\|off), car\_play\_voip\_calling\_app: (on\|off), critical\_alerts: (on\|off), hotspot\_helper: (on\|off), driver\_kit: (on\|off), driver\_kit\_endpoint\_security: (on\|off), driver\_kit\_family\_hid\_device: (on\|off), driver\_kit\_family\_networking: (on\|off), driver\_kit\_family\_serial: (on\|off), driver\_kit\_hid\_event\_service: (on\|off), driver\_kit\_transport\_hid: (on\|off), multitasking\_camera\_access: (on\|off), sf\_universal\_link\_api: (on\|off), vp9\_decoder: (on\|off), music\_kit: (on\|off), shazam\_kit: (on\|off), communication\_notifications: (on\|off), group\_activities: (on\|off), health\_kit\_estimate\_recalibration: (on\|off), time\_sensitive\_notifications: (on\|off)) | `{}` |
| `skip_devcenter` | Skip the creation of the app on the Apple Developer Portal | `false` |
| `team_id` | The ID of your Developer Portal team if you're in multiple teams | \* |
| `team_name` | The name of your Developer Portal team if you're in multiple teams | \* |
| `itc_team_id` | The ID of your App Store Connect team if you're in multiple teams | \* |
| `itc_team_name` | The name of your App Store Connect team if you're in multiple teams | \* |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_app_online` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::PRODUCE_APPLE_ID` | The Apple ID of the newly created app. You probably need it for `deliver` |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action create_app_online

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_app_online

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_app_online parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/puts



---

# https://docs.fastlane.tools/actions/default_platform

- Docs »
- \_Actions »
- default\_platform
- Edit on GitHub
- ```

* * *

# default\_platform

Defines a default platform to not have to specify the platform

| default\_platform | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
default_platform(:android)

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `default_platform` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::DEFAULT_PLATFORM` | The default platform |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action default_platform

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run default_platform

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run default_platform parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/fastlane_version

- Docs »
- \_Actions »
- fastlane\_version
- Edit on GitHub
- ```

* * *

# fastlane\_version

>
> Use it if you use an action that just recently came out and you need it.

| fastlane\_version | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
min_fastlane_version("1.50.0")

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action fastlane_version

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run fastlane_version

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run fastlane_version parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/lane_context

- Docs »
- \_Actions »
- lane\_context
- Edit on GitHub
- ```

* * *

# lane\_context

>
> More information about how the lane context works:

| lane\_context | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
lane_context[SharedValues::BUILD_NUMBER]

```ruby hljs
lane_context[SharedValues::IPA_OUTPUT_PATH]

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action lane_context

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run lane_context

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run lane_context parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/import

- Docs »
- \_Actions »
- import
- Edit on GitHub
- ```

* * *

# import

>
> The path must be relative to the Fastfile this is called from.

| import | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
import("./path/to/other/Fastfile")

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action import

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/import_from_git

- Docs »
- \_Actions »
- import\_from\_git
- Edit on GitHub
- ```

* * *

# import\_from\_git

| import\_from\_git | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @fabiomassimo, @KrauseFx, @Liquidsoul |

## 2 Examples

```ruby hljs
import_from_git(
url: "git@github.com:fastlane/fastlane.git", # The URL of the repository to import the Fastfile from.
branch: "HEAD", # The branch to checkout on the repository.
path: "fastlane/Fastfile", # The path of the Fastfile in the repository.

)

cache_path: "~/.cache/fastlane/imported" # A directory in which the repository will be added, which means that it will not be cloned again on subsequent calls.
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `url` | The URL of the repository to import the Fastfile from | |
| `branch` | The branch or tag to check-out on the repository | `HEAD` |
| `dependencies` | The array of additional Fastfiles in the repository | `[]` |
| `path` | The path of the Fastfile in the repository | `fastlane/Fastfile` |
| `version` | The version to checkout on the repository. Optimistic match operator or multiple conditions can be used to select the latest version within constraints | |
| `cache_path` | The path to a directory where the repository should be cloned into. Defaults to `nil`, which causes the repository to be cloned on every call, to a temporary directory | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action import_from_git

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import_from_git

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import_from_git parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/clean_build_artifacts



---

# https://docs.fastlane.tools/actions/skip_docs

- Docs »
- \_Actions »
- skip\_docs
- Edit on GitHub
- ```

* * *

# skip\_docs

| skip\_docs | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
skip_docs

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action skip_docs

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run skip_docs

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run skip_docs parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/is_ci

- Docs »
- \_Actions »
- is\_ci
- Edit on GitHub
- ```

* * *

# is\_ci

| is\_ci | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
if is_ci
puts "I'm a computer"
else
say "Hi Human!"
end

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action is_ci

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run is_ci

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run is_ci parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/setup_jenkins

- Docs »
- \_Actions »
- setup\_jenkins
- Edit on GitHub
- ```

* * *

# setup\_jenkins

>
> This action helps with Jenkins integration. Creates own derived data for each job. All build results like IPA files and archives will be stored in the `./output` directory.
>
> The action also works with Keychains and Provisioning Profiles Plugin, the selected keychain will be automatically unlocked and the selected code signing identity will be used.
>
> Match will be also set up to use the unlocked keychain and set in read-only mode, if its environment variables were not yet defined.
>
> By default this action will only work when _fastlane_ is executed on a CI system.

| setup\_jenkins | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @bartoszj |

## 1 Example

```ruby hljs
setup_jenkins

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `force` | Force setup, even if not executed by Jenkins | `false` |
| `unlock_keychain` | Unlocks keychain | `true` |
| `add_keychain_to_search_list` | Add to keychain search list, valid values are true, false, :add, and :replace | `:replace` |
| `set_default_keychain` | Set keychain as default | `true` |
| `keychain_path` | Path to keychain | |
| `keychain_password` | Keychain password | `''` |
| `set_code_signing_identity` | Set code signing identity from CODE\_SIGNING\_IDENTITY environment | `true` |
| `code_signing_identity` | Code signing identity | |
| `output_directory` | The directory in which the ipa file should be stored in | `./output` |
| `derived_data_path` | The directory where built products and other derived data will go | `./derivedData` |
| `result_bundle` | Produce the result bundle describing what occurred will be placed | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action setup_jenkins

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run setup_jenkins

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run setup_jenkins parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/unlock_keychain

- Docs »
- \_Actions »
- unlock\_keychain
- Edit on GitHub
- ```

* * *

# unlock\_keychain

>
> Keychains can be replaced with `add_to_search_list: :replace`.

| unlock\_keychain | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @xfreebird |

## 4 Examples

```ruby hljs
unlock_keychain( # Unlock an existing keychain and add it to the keychain search list
path: "/path/to/KeychainName.keychain",
password: "mysecret"
)

```ruby hljs
unlock_keychain( # By default the keychain is added to the existing. To replace them with the selected keychain you may use `:replace`
path: "/path/to/KeychainName.keychain",
password: "mysecret",
add_to_search_list: :replace # To only add a keychain use `true` or `:add`.
)

```ruby hljs
unlock_keychain( # In addition, the keychain can be selected as a default keychain
path: "/path/to/KeychainName.keychain",
password: "mysecret",
set_default: true
)

```ruby hljs
unlock_keychain( # If the keychain file is located in the standard location `~/Library/Keychains`, then it is sufficient to provide the keychain file name, or file name with its suffix.
path: "KeychainName",
password: "mysecret"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to the keychain file | `login` |
| `password` | Keychain password | |
| `add_to_search_list` | Add to keychain search list, valid values are true, false, :add, and :replace | `true` |
| `set_default` | Set as default keychain | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action unlock_keychain

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run unlock_keychain

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run unlock_keychain parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/update_fastlane

- Docs »
- \_Actions »
- update\_fastlane
- Edit on GitHub
- ```

* * *

# update\_fastlane

>
> If you are using rbenv or rvm, everything should be good to go. However, if you are using the system's default ruby, some additional setup is needed for this action to work correctly. In short, fastlane needs to be able to access your gem library without running in `sudo` mode.
>
> The simplest possible fix for this is putting the following lines into your `~/.bashrc` or `~/.zshrc` file:

```bash hljs
export GEM_HOME=~/.gems
export PATH=$PATH:~/.gems/bin

>
> Recommended usage of the `update_fastlane` action is at the top inside of the `before_all` block, before running any other action.

| update\_fastlane | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @milch, @KrauseFx |

## 1 Example

```ruby hljs
before_all do
update_fastlane
# ...
end

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `no_update` | Don't update during this run. This is used internally | `false` |
| `nightly` | **DEPRECATED!** Nightly builds are no longer being made available - Opt-in to install and use nightly fastlane builds | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action update_fastlane

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_fastlane

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_fastlane parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/bundle_install

- Docs »
- \_Actions »
- bundle\_install
- Edit on GitHub
- ```

* * *

# bundle\_install

This action runs `bundle install` (if available)

| bundle\_install | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @birmacher, @koglinjg |

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `binstubs` | Generate bin stubs for bundled gems to ./bin | |
| `clean` | Run bundle clean automatically after install | `false` |
| `full_index` | Use the rubygems modern index instead of the API endpoint | `false` |
| `gemfile` | Use the specified gemfile instead of Gemfile | |
| `jobs` | Install gems using parallel workers | |
| `local` | Do not attempt to fetch gems remotely and use the gem cache instead | `false` |
| `deployment` | Install using defaults tuned for deployment and CI environments | `false` |
| `no_cache` | Don't update the existing gem cache | `false` |
| `no_prune` | Don't remove stale gems from the cache | `false` |
| `path` | Specify a different path than the system default ($BUNDLE\_PATH or $GEM\_HOME). Bundler will remember this value for future installs on this machine | |
| `system` | Install to the system location ($BUNDLE\_PATH or $GEM\_HOME) even if the bundle was previously installed somewhere else for this application | `false` |
| `quiet` | Only output warnings and errors | `false` |
| `retry` | Retry network and git requests that have failed | |
| `shebang` | Specify a different shebang executable name than the default (usually 'ruby') | |
| `standalone` | Make a bundle that can work without the Bundler runtime | |
| `trust_policy` | Sets level of security when dealing with signed gems. Accepts `LowSecurity`, `MediumSecurity` and `HighSecurity` as values | |
| `without` | Exclude gems that are part of the specified named group | |
| `with` | Include gems that are part of the specified named group | |
| `frozen` | Don't allow the Gemfile.lock to be updated after install | `false` |
| `redownload` | Force download every gem, even if the required versions are already available locally | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action bundle_install

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run bundle_install

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run bundle_install parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/upload_symbols_to_crashlytics

- Docs »
- \_Actions »
- upload\_symbols\_to\_crashlytics
- Edit on GitHub
- ```

* * *

# upload\_symbols\_to\_crashlytics

| upload\_symbols\_to\_crashlytics | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
upload_symbols_to_crashlytics(dsym_path: "./App.dSYM.zip")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `dsym_path` | Path to the DSYM file or zip to upload | \* |
| `dsym_paths` | Paths to the DSYM files or zips to upload | |
| `api_token` | Crashlytics API Key | |
| `gsp_path` | Path to GoogleService-Info.plist | |
| `app_id` | Firebase Crashlytics APP ID | |
| `binary_path` | The path to the upload-symbols file of the Fabric app | |
| `platform` | The platform of the app (ios, appletvos, mac) | `ios` |
| `dsym_worker_threads` | The number of threads to use for simultaneous dSYM upload | `1` |
| `debug` | Enable debug mode for upload-symbols | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action upload_symbols_to_crashlytics

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_symbols_to_crashlytics

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_symbols_to_crashlytics parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/create_keychain

- Docs »
- \_Actions »
- create\_keychain
- Edit on GitHub
- ```

* * *

# create\_keychain

Create a new Keychain

| create\_keychain | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @gin0606 |

## 1 Example

```ruby hljs
create_keychain(
name: "KeychainName",
default_keychain: true,
unlock: true,
timeout: 3600,
lock_when_sleeps: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `name` | Keychain name | |
| `path` | Path to keychain | |
| `password` | Password for the keychain | |
| `default_keychain` | Should the newly created Keychain be the new system default keychain | `false` |
| `unlock` | Unlock keychain after create | `false` |
| `timeout` | timeout interval in seconds. Set `0` if you want to specify "no time-out" | `300` |
| `lock_when_sleeps` | Lock keychain when the system sleeps | `false` |
| `lock_after_timeout` | Lock keychain after timeout interval | `false` |
| `add_to_search_list` | Add keychain to search list | `true` |
| `require_create` | Fail the action if the Keychain already exists | `false` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_keychain` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::ORIGINAL_DEFAULT_KEYCHAIN` | The path to the default keychain |
| `SharedValues::KEYCHAIN_PATH` | The path of the keychain |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action create_keychain

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_keychain

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_keychain parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/delete_keychain

- Docs »
- \_Actions »
- delete\_keychain
- Edit on GitHub
- ```

* * *

# delete\_keychain

| delete\_keychain | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @gin0606, @koenpunt |

## 2 Examples

```ruby hljs
delete_keychain(name: "KeychainName")

```ruby hljs
delete_keychain(keychain_path: "/keychains/project.keychain")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `name` | Keychain name | |
| `keychain_path` | Keychain path | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action delete_keychain

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run delete_keychain

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run delete_keychain parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/backup_file

- Docs »
- \_Actions »
- backup\_file
- Edit on GitHub
- ```

* * *

# backup\_file

This action backs up your file to "\[path\].back"

| backup\_file | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @gin0606 |

## 1 Example

```ruby hljs
backup_file(path: "/path/to/file")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to the file you want to backup | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action backup_file

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run backup_file

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run backup_file parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/copy_artifacts

- Docs »
- \_Actions »
- copy\_artifacts
- Edit on GitHub
- ```

* * *

# copy\_artifacts

>
> Make sure your `:target_path` is ignored from git, and if you use `reset_git_repo`, make sure the artifacts are added to the exclude list.

| copy\_artifacts | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @lmirosevic |

## 2 Examples

```ruby hljs
copy_artifacts(
target_path: "artifacts",
artifacts: ["*.cer", "*.mobileprovision", "*.ipa", "*.dSYM.zip", "path/to/file.txt", "another/path/*.extension"]
)

# Reset the git repo to a clean state, but leave our artifacts in place
reset_git_repo(
exclude: "artifacts"
)

```ruby hljs
# Copy the .ipa created by _gym_ if it was successfully created
artifacts = []
artifacts << lane_context[SharedValues::IPA_OUTPUT_PATH] if lane_context[SharedValues::IPA_OUTPUT_PATH]
copy_artifacts(
artifacts: artifacts
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `keep_original` | Set this to false if you want move, rather than copy, the found artifacts | `true` |
| `target_path` | The directory in which you want your artifacts placed | `artifacts` |
| `artifacts` | An array of file patterns of the files/folders you want to preserve | `[]` |
| `fail_on_missing` | Fail when a source file isn't found | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action copy_artifacts

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run copy_artifacts

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run copy_artifacts parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/prompt

- Docs »
- \_Actions »
- prompt
- Edit on GitHub
- ```

* * *

# prompt

>
> When this is executed on a CI service, the passed `ci_input` value will be returned.
>
> This action also supports multi-line inputs using the `multi_line_end_keyword` option.

| prompt | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
changelog = prompt(text: "Changelog: ")

```ruby hljs
changelog = prompt(
text: "Changelog: ",
multi_line_end_keyword: "END"
)

pilot(changelog: changelog)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `text` | The text that will be displayed to the user | `Please enter some text:` |
| `ci_input` | The default text that will be used when being executed on a CI service | `''` |
| `boolean` | Is that a boolean question (yes/no)? This will add (y/n) at the end | `false` |
| `secure_text` | Is that a secure text (yes/no)? | `false` |
| `multi_line_end_keyword` | Enable multi-line inputs by providing an end text (e.g. 'END') which will stop the user input | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action prompt

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run prompt

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run prompt parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/reset_simulator_contents

- Docs »
- \_Actions »
- reset\_simulator\_contents
- Edit on GitHub
- ```

* * *

# reset\_simulator\_contents

Shutdown and reset running simulators

| reset\_simulator\_contents | |
| --- | --- |
| Supported platforms | ios |
| Author | @danramteke |

## 2 Examples

```ruby hljs
reset_simulator_contents

```ruby hljs
reset_simulator_contents(os_versions: ["10.3.1","12.2"])

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `ios` | **DEPRECATED!** Use `:os_versions` instead - Which OS versions of Simulators you want to reset content and settings, this does not remove/recreate the simulators | |
| `os_versions` | Which OS versions of Simulators you want to reset content and settings, this does not remove/recreate the simulators | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action reset_simulator_contents

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run reset_simulator_contents

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run reset_simulator_contents parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/restore_file

- Docs »
- \_Actions »
- restore\_file
- Edit on GitHub
- ```

* * *

# restore\_file

This action restore your file that was backed up with the `backup_file` action

| restore\_file | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @gin0606 |

## 1 Example

```ruby hljs
restore_file(path: "/path/to/file")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Original file name you want to restore | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action restore_file

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run restore_file

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run restore_file parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/say

- Docs »
- \_Actions »
- say
- Edit on GitHub
- ```

* * *

# say

This action speaks the given text out loud

| say | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
say("I can speak")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `text` | Text to be spoken out loud (as string or array of strings) | |
| `mute` | If say should be muted with text printed out | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action say

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run say

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run say parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/zip

- Docs »
- \_Actions »
- zip
- Edit on GitHub
- ```

* * *

# zip

Compress a file or folder to a zip

| zip | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |
| Returns | The path to the output zip file |

## 6 Examples

```ruby hljs
zip

```ruby hljs
zip(
path: "MyApp.app",
output_path: "Latest.app.zip"
)

```ruby hljs
zip(
path: "MyApp.app",
output_path: "Latest.app.zip",
verbose: false
)

```ruby hljs
zip(
path: "MyApp.app",
output_path: "Latest.app.zip",
verbose: false,
symlinks: true
)

```ruby hljs
zip(
path: "./",
output_path: "Source Code.zip",
exclude: [".git/*"]
)

```ruby hljs
zip(
path: "./",
output_path: "Swift Code.zip",
include: ["**/*.swift"],
exclude: ["Package.swift", "vendor/*", "Pods/*"]
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | Path to the directory or file to be zipped | |
| `output_path` | The name of the resulting zip file | |
| `verbose` | Enable verbose output of zipped file | `true` |
| `password` | Encrypt the contents of the zip archive using a password | |
| `symlinks` | Store symbolic links as such in the zip archive | `false` |
| `include` | Array of paths or patterns to include | `[]` |
| `exclude` | Array of paths or patterns to exclude | `[]` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action zip

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run zip

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run zip parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/danger

- Docs »
- \_Actions »
- danger
- Edit on GitHub
- ```

* * *

# danger

>
> More information:

| danger | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 2 Examples

```ruby hljs
danger

```ruby hljs
danger(
danger_id: "unit-tests",
dangerfile: "tests/MyOtherDangerFile",
github_api_token: ENV["GITHUB_API_TOKEN"],
verbose: true
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true` |
| `verbose` | Show more debugging information | `false` |
| `danger_id` | The identifier of this Danger instance | |
| `dangerfile` | The location of your Dangerfile | |
| `github_api_token` | GitHub API token for danger | |
| `github_enterprise_host` | GitHub host URL for GitHub Enterprise | |
| `github_enterprise_api_base_url` | GitHub API base URL for GitHub Enterprise | |
| `fail_on_errors` | Should always fail the build process, defaults to false | `false` |
| `new_comment` | Makes Danger post a new comment instead of editing its previous one | `false` |
| `remove_previous_comments` | Makes Danger remove all previous comment and create a new one in the end of the list | `false` |
| `base` | A branch/tag/commit to use as the base of the diff. \[master\|dev\|stable\] | |
| `head` | A branch/tag/commit to use as the head. \[master\|dev\|stable\] | |
| `pr` | Run danger on a specific pull request. e.g. "https://github.com/danger/danger/pull/518" | |
| `fail_if_no_pr` | Fail Danger execution if no PR is found | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action danger

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run danger

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run danger parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/artifactory

- Docs »
- \_Actions »
- artifactory
- Edit on GitHub
- ```

* * *

# artifactory

| artifactory | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @koglinjg, @tommeier |

## 2 Examples

```ruby hljs
artifactory(
username: "username",
password: "password",
endpoint: "https://artifactory.example.com/artifactory/",
file: "example.ipa", # File to upload
repo: "mobile_artifacts", # Artifactory repo
repo_path: "/ios/appname/example-major.minor.ipa" # Path to place the artifact including its filename
)

```ruby hljs
artifactory(
api_key: "api_key",
endpoint: "https://artifactory.example.com/artifactory/",
file: "example.ipa", # File to upload
repo: "mobile_artifacts", # Artifactory repo
repo_path: "/ios/appname/example-major.minor.ipa" # Path to place the artifact including its filename
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `file` | File to be uploaded to artifactory | |
| `repo` | Artifactory repo to put the file in | |
| `repo_path` | Path to deploy within the repo, including filename | |
| `endpoint` | Artifactory endpoint | |
| `username` | Artifactory username | |
| `password` | Artifactory password | |
| `api_key` | Artifactory API key | |
| `properties` | Artifact properties hash | `{}` |
| `ssl_pem_file` | Location of pem file to use for ssl verification | |
| `ssl_verify` | Verify SSL | `true` |
| `proxy_username` | Proxy username | |
| `proxy_password` | Proxy password | |
| `proxy_address` | Proxy address | |
| `proxy_port` | Proxy port | |
| `read_timeout` | Read timeout | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `artifactory` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::ARTIFACTORY_DOWNLOAD_URL` | The download url for file uploaded |
| `SharedValues::ARTIFACTORY_DOWNLOAD_SIZE` | The reported file size for file uploaded |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action artifactory

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run artifactory

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run artifactory parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/version_bump_podspec

- Docs »
- \_Actions »
- version\_bump\_podspec
- Edit on GitHub
- ```

* * *

# version\_bump\_podspec

>
> For example, you can use it to bump the version of a CocoaPods' podspec file.
>
> It also supports versions that are not semantic: `1.4.14.4.1`.
>
> For such versions, there is an option to change the appendix (e.g. `4.1`).

| version\_bump\_podspec | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @Liquidsoul, @KrauseFx |

## 2 Examples

```ruby hljs
version = version_bump_podspec(path: "TSMessages.podspec", bump_type: "patch")

```ruby hljs
version = version_bump_podspec(path: "TSMessages.podspec", version_number: "1.4")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | You must specify the path to the podspec file to update | \* |
| `bump_type` | The type of this version bump. Available: patch, minor, major | `patch` |
| `version_number` | Change to a specific version. This will replace the bump type value | |

| `require_variable_prefix` | true by default, this is used for non CocoaPods version bumps only | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `version_bump_podspec` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::PODSPEC_VERSION_NUMBER` | The new podspec version number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action version_bump_podspec

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run version_bump_podspec

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run version_bump_podspec parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/team_id

- Docs »
- \_Actions »
- team\_id
- Edit on GitHub
- ```

* * *

# team\_id

Specify the Team ID you want to use for the Apple Developer Portal

| team\_id | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
team_id("Q2CBPK58CA")

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action team_id

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run team_id

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run team_id parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/backup_xcarchive

- Docs »
- \_Actions »
- backup\_xcarchive
- Edit on GitHub
- ```

* * *

# backup\_xcarchive

Save your \[zipped\] xcarchive elsewhere from default path

| backup\_xcarchive | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @dral3x |

## 1 Example

```ruby hljs
backup_xcarchive(
xcarchive: "/path/to/file.xcarchive", # Optional if you use the `xcodebuild` action
destination: "/somewhere/else/", # Where the backup should be created
zip_filename: "file.xcarchive", # The name of the backup file
zip: false, # Enable compression of the archive. Defaults to `true`.
versioned: true # Create a versioned (date and app version) subfolder where to put the archive
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `xcarchive` | Path to your xcarchive file. Optional if you use the `xcodebuild` action | \* |
| `destination` | Where your archive will be placed | |
| `zip` | Enable compression of the archive | `true` |
| `zip_filename` | Filename of the compressed archive. Will be appended by `.xcarchive.zip`. Default value is the output xcarchive filename | \* |
| `versioned` | Create a versioned (date and app version) subfolder where to put the archive | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `backup_xcarchive` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::BACKUP_XCARCHIVE_FILE` | Path to your saved xcarchive (compressed) file |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action backup_xcarchive

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run backup_xcarchive

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run backup_xcarchive parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/pod_lib_lint

- Docs »
- \_Actions »
- pod\_lib\_lint
- Edit on GitHub
- ```

* * *

# pod\_lib\_lint

| pod\_lib\_lint | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @thierryxing |

## 4 Examples

```ruby hljs
pod_lib_lint

```ruby hljs
# Allow output detail in console
pod_lib_lint(verbose: true)

# Allow warnings during pod lint
```ruby hljs
pod_lib_lint(allow_warnings: true)

# If the podspec has a dependency on another private pod, then you will have to supply the sources
```ruby hljs
pod_lib_lint(sources: ["https://github.com/username/Specs", "https://github.com/CocoaPods/Specs"])

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true` |
| `podspec` | Path of spec to lint | |
| `verbose` | Allow output detail in console | |
| `allow_warnings` | Allow warnings during pod lint | |
| `sources` | The sources of repos you want the pod spec to lint with, separated by commas | |
| `subspec` | A specific subspec to lint instead of the entire spec | |

| `swift_version` | The SWIFT\_VERSION that should be used to lint the spec. This takes precedence over a .swift-version file | |
| `use_libraries` | Lint uses static libraries to install the spec | `false` |

| `fail_fast` | Lint stops on the first failing platform or subspec | `false` |
| `private` | Lint skips checks that apply only to public specs | `false` |
| `quick` | Lint skips checks that would require to download and build the spec | `false` |
| `no_clean` | Lint leaves the build directory intact for inspection | `false` |
| `no_subspecs` | Lint skips validation of subspecs | `false` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action pod_lib_lint

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run pod_lib_lint

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run pod_lib_lint parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/erb

- Docs »
- \_Actions »
- erb
- Edit on GitHub
- ```

* * *

# erb

>
> If no `:destination` is set, it returns the rendered template as string.

| erb | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @hjanuschka |

## 1 Example

```ruby hljs
# Example `erb` template:

template: "1.erb",
destination: "/tmp/rendered.out",
placeholders: {

}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `template` | ERB Template File | |
| `destination` | Destination file | |
| `placeholders` | Placeholders given as a hash | `{}` |
| `trim_mode` | Trim mode applied to the ERB | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action erb

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run erb

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run erb parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/download

- Docs »
- \_Actions »
- download
- Edit on GitHub
- ```

* * *

# download

>
> Automatically parses JSON into a Ruby data structure.
>
> For more advanced networking code, use the Ruby functions instead:

| download | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
data = download(url: "https://host.com/api.json")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `url` | The URL that should be downloaded | |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `download` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::DOWNLOAD_CONTENT` | The content of the file we just downloaded |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action download

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run download

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run download parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/rocket

- Docs »
- \_Actions »
- rocket
- Edit on GitHub
- ```

* * *

# rocket

| rocket | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @JaviSoto, @radex |

## 1 Example

```ruby hljs
rocket

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action rocket

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run rocket

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run rocket parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/debug

- Docs »
- \_Actions »
- debug
- Edit on GitHub
- ```

* * *

# debug

Print out an overview of the lane context values

| debug | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
debug

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action debug

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run debug

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run debug parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/make_changelog_from_jenkins

- Docs »
- \_Actions »
- make\_changelog\_from\_jenkins
- Edit on GitHub
- ```

* * *

# make\_changelog\_from\_jenkins

| make\_changelog\_from\_jenkins | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @mandrizzle |

## 1 Example

```ruby hljs
make_changelog_from_jenkins(
# Optional, lets you set a changelog in the case is not generated on Jenkins or if ran outside of Jenkins
fallback_changelog: "Bug fixes and performance enhancements"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `fallback_changelog` | Fallback changelog if there is not one on Jenkins, or it couldn't be read | `''` |
| `include_commit_body` | Include the commit body along with the summary | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `make_changelog_from_jenkins` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::FL_CHANGELOG` | The changelog generated by Jenkins |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action make_changelog_from_jenkins

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run make_changelog_from_jenkins

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run make_changelog_from_jenkins parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/pod_push

- Docs »
- \_Actions »
- pod\_push
- Edit on GitHub
- ```

* * *

# pod\_push

Push a Podspec to Trunk or a private repository

| pod\_push | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @squarefrog |

## 4 Examples

```ruby hljs
# If no path is supplied then Trunk will attempt to find the first Podspec in the current directory.
pod_push

# Alternatively, supply the Podspec file path
```ruby hljs
pod_push(path: "TSMessages.podspec")

# You may also push to a private repo instead of Trunk
```ruby hljs
pod_push(path: "TSMessages.podspec", repo: "MyRepo")

# If the podspec has a dependency on another private pod, then you will have to supply the sources you want the podspec to lint with for pod_push to succeed. Read more here -
```ruby hljs
pod_push(path: "TMessages.podspec", repo: "MyRepo", sources: ["https://github.com/username/Specs", "https://github.com/CocoaPods/Specs"])

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `false` |
| `path` | The Podspec you want to push | |
| `repo` | The repo you want to push. Pushes to Trunk by default | |
| `allow_warnings` | Allow warnings during pod push | |
| `use_libraries` | Allow lint to use static libraries to install the spec | |
| `sources` | The sources of repos you want the pod spec to lint with, separated by commas | |
| `swift_version` | The SWIFT\_VERSION that should be used to lint the spec. This takes precedence over a .swift-version file | |
| `skip_import_validation` | Lint skips validating that the pod can be imported | |
| `skip_tests` | Lint skips building and running tests during validation | |
| `use_json` | Convert the podspec to JSON before pushing it to the repo | |
| `verbose` | Show more debugging information | `false` |
| `use_modular_headers` | Use modular headers option during validation | |
| `synchronous` | If validation depends on other recently pushed pods, synchronize | |
| `no_overwrite` | Disallow pushing that would overwrite an existing spec | |
| `local_only` | Does not perform the step of pushing REPO to its remote | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action pod_push

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run pod_push

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run pod_push parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/dsym_zip



---

# https://docs.fastlane.tools/actions/ensure_no_debug_code

- Docs »
- \_Actions »
- ensure\_no\_debug\_code
- Edit on GitHub
- ```

* * *

# ensure\_no\_debug\_code

>
> This can be used to check if there is any debug code still in your codebase or if you have things like `// TO DO` or similar.

| ensure\_no\_debug\_code | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @KrauseFx |

## 5 Examples

```ruby hljs
ensure_no_debug_code(text: "// TODO")

```ruby hljs
ensure_no_debug_code(text: "Log.v",
extension: "java")

```ruby hljs
ensure_no_debug_code(text: "NSLog",
path: "./lib",
extension: "m")

```ruby hljs
ensure_no_debug_code(text: "(^#define DEBUG|NSLog)",
path: "./lib",
extension: "m")

```ruby hljs
ensure_no_debug_code(text: "<<<<<<",
extensions: ["m", "swift", "java"])

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `text` | The text that must not be in the code base | |
| `path` | The directory containing all the source files | `.` |
| `extension` | The extension that should be searched for | |
| `extensions` | An array of file extensions that should be searched for | |
| `exclude` | Exclude a certain pattern from the search | |
| `exclude_dirs` | An array of dirs that should not be included in the search | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action ensure_no_debug_code

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_no_debug_code

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_no_debug_code parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/cloc

- Docs »
- \_Actions »
- cloc
- Edit on GitHub
- ```

* * *

# cloc

>
> See and for more information.

| cloc | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @intere |

## 1 Example

```ruby hljs
cloc(
exclude_dir: "ThirdParty,Resources",
output_directory: "reports",
source_directory: "MyCoolApp"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `binary_path` | Where the cloc binary lives on your system (full path including 'cloc') | `/usr/local/bin/cloc` |
| `exclude_dir` | Comma separated list of directories to exclude | |
| `output_directory` | Where to put the generated report file | `build` |
| `source_directory` | Where to look for the source code (relative to the project root folder) | `''` |
| `xml` | Should we generate an XML File (if false, it will generate a plain text file)? | `true` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action cloc

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run cloc

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run cloc parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/team_name

- Docs »
- \_Actions »
- team\_name
- Edit on GitHub
- ```

* * *

# team\_name

Set a team to use by its name

| team\_name | |
| --- | --- |
| Supported platforms | ios |
| Author | @KrauseFx |

## 1 Example

```ruby hljs
team_name("Felix Krause")

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action team_name

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run team_name

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run team_name parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/scp

- Docs »
- \_Actions »
- scp
- Edit on GitHub
- ```

* * *

# scp

Transfer files via SCP

| scp | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @hjanuschka |

## 2 Examples

```ruby hljs
scp(
host: "dev.januschka.com",
username: "root",
upload: {
src: "/root/dir1",
dst: "/tmp/new_dir"
}
)

```ruby hljs
scp(
host: "dev.januschka.com",
username: "root",
download: {
src: "/root/dir1",
dst: "/tmp/new_dir"
}
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `username` | Username | |
| `password` | Password | |
| `host` | Hostname | |
| `port` | Port | `22` |
| `upload` | Upload | |
| `download` | Download | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action scp

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run scp

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run scp parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/verify_build

- Docs »
- \_Actions »
- verify\_build
- Edit on GitHub
- ```

* * *

# verify\_build

| verify\_build | |
| --- | --- |
| Supported platforms | ios |
| Author | @CodeReaper |

## 1 Example

```ruby hljs
verify_build(
provisioning_type: "distribution",
bundle_identifier: "com.example.myapp"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `provisioning_type` | Required type of provisioning | |
| `provisioning_uuid` | Required UUID of provisioning profile | |
| `team_identifier` | Required team identifier | |
| `team_name` | Required team name | |
| `app_name` | Required app name | |
| `bundle_identifier` | Required bundle identifier | |
| `ipa_path` | Explicitly set the ipa path | |
| `build_path` | Explicitly set the ipa, app or xcarchive path | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action verify_build

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_build

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_build parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/install_on_device

- Docs »
- \_Actions »
- install\_on\_device
- Edit on GitHub
- ```

* * *

# install\_on\_device

| install\_on\_device | |
| --- | --- |
| Supported platforms | ios |
| Author | @hjanuschka |

## 1 Example

```ruby hljs
install_on_device(
device_id: "a3be6c9ff7e5c3c6028597513243b0f933b876d4",
ipa: "./app.ipa"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `extra` | Extra Command-line arguments passed to ios-deploy | |
| `device_id` | id of the device / if not set defaults to first found device | |
| `skip_wifi` | Do not search for devices via WiFi | |
| `ipa` | The IPA file to put on the device | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action install_on_device

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run install_on_device

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run install_on_device parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/version_get_podspec

- Docs »
- \_Actions »
- version\_get\_podspec
- Edit on GitHub
- ```

* * *

# version\_get\_podspec

Receive the version number from a podspec file

| version\_get\_podspec | |
| --- | --- |
| Supported platforms | ios, mac |
| Author | @Liquidsoul, @KrauseFx |

## 1 Example

```ruby hljs
version = version_get_podspec(path: "TSMessages.podspec")

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `path` | You must specify the path to the podspec file | \* |
| `require_variable_prefix` | true by default, this is used for non CocoaPods version bumps only | `true` |

_\\* = default value is dependent on the user's system_

## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `version_get_podspec` action generates the following Lane Variables:

| SharedValue | Description |
| --- | --- |
| `SharedValues::PODSPEC_VERSION_NUMBER` | The podspec version number |

To get more information check the Lanes documentation.

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action version_get_podspec

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run version_get_podspec

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run version_get_podspec parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/rsync

- Docs »
- \_Actions »
- rsync
- Edit on GitHub
- ```

* * *

# rsync

| rsync | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @hjanuschka |

## 1 Example

```ruby hljs
rsync(
source: "root@host:/tmp/1.txt",
destination: "/tmp/local_file.txt"
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `extra` | Port | `-av` |
| `source` | source file/folder | |
| `destination` | destination file/folder | |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action rsync

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run rsync

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run rsync parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/adb_devices

- Docs »
- \_Actions »
- adb\_devices
- Edit on GitHub
- ```

* * *

# adb\_devices

| adb\_devices | |
| --- | --- |
| Supported platforms | android |
| Author | @hjanuschka |
| Returns | Returns an array of all currently connected android devices |

## 1 Example

```ruby hljs
adb_devices.each do |device|
model = adb(command: "shell getprop ro.product.model",
serial: device.serial).strip

puts "Model #{model} is connected"
end

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `adb_path` | The path to your `adb` binary (can be left blank if the ANDROID\_SDK\_ROOT environment variable is set) | `adb` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action adb_devices

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run adb_devices

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run adb_devices parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/actions/dotgpg_environment

- Docs »
- \_Actions »
- dotgpg\_environment
- Edit on GitHub
- ```

* * *

# dotgpg\_environment

| dotgpg\_environment | |
| --- | --- |
| Supported platforms | ios, android, mac |
| Author | @simonlevy5 |

## 1 Example

```ruby hljs
dotgpg_environment(dotgpg_file: './path/to/gpgfile')

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `dotgpg_file` | Path to your gpg file | \* |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action dotgpg_environment

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run dotgpg_environment

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run dotgpg_environment parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

