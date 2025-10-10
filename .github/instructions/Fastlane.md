<!--
Downloaded via https://llm.codes by @steipete on September 24, 2025 at 08:08 PM
Source URL: https://docs.fastlane.tools/
Total pages processed: 35
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://docs.fastlane.tools/

- Docs »
- Home
- Edit on GitHub
- ```

* * *

# fastlane

![Twitter: @FastlaneTools](https://twitter.com/FastlaneTools)![License](https://github.com/fastlane/fastlane/blob/master/LICENSE)![Gem](https://rubygems.org/gems/fastlane)![Platforms](https://docs.fastlane.tools/#)

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. 🚀 It handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.

You can start by creating a `Fastfile` file in your repository, here’s one that defines your beta or App Store release process:

```ruby hljs
lane :beta do
increment_build_number
build_app
upload_to_testflight
end

lane :release do
capture_screenshots
build_app
upload_to_app_store # Upload the screenshots and the binary to iTunes
slack # Let your team-mates know the new version is live
end

You just defined 2 different lanes, one for beta deployment, one for App Store. To release your app in the App Store, all you have to do is

```no-highlight
fastlane release

## Why fastlane?

| | fastlane |
| --- | --- |
| 🚀 | Save **hours** every time you push a new release to the store or beta testing service |
| ✨ | Integrates with all your existing tools and services (more than 400 integrations) |
| 📖 | 100% open source under the MIT license |
| 🎩 | Easy setup assistant to get started in a few minutes |
| ⚒ | Runs on **your** machine, it's your app and your data |
| 👻 | Integrates with all major CI systems |
| 🖥 | Supports iOS, Mac, and Android apps |
| 🔧 | Extend and customise _fastlane_ to fit your needs, you're not dependent on anyone |
| 💭 | Never remember any commands anymore, just _fastlane_ |
| 🚢 | Deploy from any computer, including a CI server |

## Getting Started

### Installing _fastlane_

_fastlane_ can be installed in multiple ways. The preferred method is with _Bundler_. _fastlane_ can also be installed directly through Homebrew (if on macOS). It is possible to use macOS's system Ruby, but it's not recommended, as it can be hard to manage dependencies and cause conflicts.

#### Managed Ruby environment + Bundler (macOS/Linux/Windows)

**Ruby**

If you use macOS, system Ruby is not recommended. There are a variety of ways to install Ruby without having to modify your system environment. For macOS and Linux, _rbenv_ is one of the most popular ways to manage your Ruby environment.

_fastlane_ supports Ruby versions 2.5 or newer. Verify which Ruby version you're using:

```sh hljs bash
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]

**Bundler**

It is recommended that you use _Bundler_ and `Gemfile` to define your dependency on _fastlane_. This will clearly define the _fastlane_ version to be used and its dependencies, and will also speed up _fastlane_ execution.

- Install _Bundler_ by running `gem install bundler`
- Create a `./Gemfile` in the root directory of your project with the content

```ruby hljs
source "https://rubygems.org"

gem "fastlane"

- Run `bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `bundle install` as your first build step
- To update _fastlane_, just run `bundle update fastlane`

#### Homebrew (macOS)

This way, you don't have to install Ruby separately, and instead _homebrew_ installs the adequate Ruby version for _fastlane_.
See this page for details.

```sh hljs bash
brew install fastlane

#### System Ruby + RubyGems (macOS/Linux/Windows)

This is not recommended for your local environment, but you can still install _fastlane_ to system Ruby's environment. Using `sudo` often occurs unwanted results later due to file permission and makes managing your environment harder.

```sh hljs bash
sudo gem install fastlane

### Setting up _fastlane_

Navigate to your iOS or Android app and run

```no-highlight
fastlane init

_fastlane_ will automatically detect your project, and ask for any missing information.

For more details about how to get up and running, check out the getting started guides:

- fastlane Getting Started guide for iOS
- fastlane Getting Started guide for Android

## Questions and support

Before submitting a new GitHub issue, please make sure to search for existing GitHub issues.

If that doesn't help, please submit an issue on GitHub and provide information about your setup, in particular the output of the `fastlane env` command.

## System requirements

_fastlane_ is officially supported to run on macOS.

🐧 Linux and 🖥️ Windows are partially supported. Some underlying software like Xcode are only available on macOS, but many other tools, actions, and the `spaceship` module can work on other platforms.

## _fastlane_ team

| | | | | |
| --- | --- | --- | --- | --- |

Special thanks to all contributors for extending and improving _fastlane_.

## Metrics

_fastlane_ tracks a few key metrics to understand how developers are using the tool and to help us know what areas need improvement. No personal/sensitive information is ever collected. Metrics that are collected include:

- The number of _fastlane_ runs
- A salted hash of the app identifier or package name, which helps us anonymously identify unique usage of _fastlane_

You can easily opt-out of metrics collection by adding `opt_out_usage` at the top of your `Fastfile` or by setting the environment variable `FASTLANE_OPT_OUT_USAGE`. Check out the metrics code on GitHub

## License

### Where to go from here?

GitHubNext »

---

# https://docs.fastlane.tools/img/fastlane_text.png



---

# https://docs.fastlane.tools/getting-started/ios/setup

- Docs »
- iOS »
- Getting Started »
- Setup
- Edit on GitHub
- ```

* * *

# Getting started with _fastlane_ for iOS

### Xcode command line tools (macOS)

```no-highlight
xcode-select --install

### Installing _fastlane_

_fastlane_ can be installed in multiple ways. The preferred method is with _Bundler_. _fastlane_ can also be installed directly through Homebrew (if on macOS). It is possible to use macOS's system Ruby, but it's not recommended, as it can be hard to manage dependencies and cause conflicts.

#### Managed Ruby environment + Bundler (macOS/Linux/Windows)

**Ruby**

If you use macOS, system Ruby is not recommended. There are a variety of ways to install Ruby without having to modify your system environment. For macOS and Linux, _rbenv_ is one of the most popular ways to manage your Ruby environment.

_fastlane_ supports Ruby versions 2.5 or newer. Verify which Ruby version you're using:

```sh hljs bash
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]

**Bundler**

It is recommended that you use _Bundler_ and `Gemfile` to define your dependency on _fastlane_. This will clearly define the _fastlane_ version to be used and its dependencies, and will also speed up _fastlane_ execution.

- Install _Bundler_ by running `gem install bundler`
- Create a `./Gemfile` in the root directory of your project with the content

```ruby hljs
source "https://rubygems.org"

gem "fastlane"

- Run `bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `bundle install` as your first build step
- To update _fastlane_, just run `bundle update fastlane`

#### Homebrew (macOS)

This way, you don't have to install Ruby separately, and instead _homebrew_ installs the adequate Ruby version for _fastlane_.
See this page for details.

```sh hljs bash
brew install fastlane

#### System Ruby + RubyGems (macOS/Linux/Windows)

This is not recommended for your local environment, but you can still install _fastlane_ to system Ruby's environment. Using `sudo` often occurs unwanted results later due to file permission and makes managing your environment harder.

```sh hljs bash
sudo gem install fastlane

### Setting up _fastlane_

Navigate your terminal to your project's directory and run

```no-highlight
fastlane init

Note that if you want to create your first app on your App Store Connect account, you need to set the developer name ( `company_name`) with `PRODUCE_COMPANY_NAME` environment variable:

```no-highlight
PRODUCE_COMPANY_NAME="YOUR COMPANY NAME" fastlane init

To get more information check `company_name` description in the Create app documentation.

To have your `Fastfile` configuration written in Swift (Beta)

```no-highlight
fastlane init swift

**Swift setup is still in beta. See Fastlane.swift docs for more information.**

Depending on what kind of setup you choose, different files will be set up for you. If you chose to download the existing app metadata, you'll end up with new folders that look like this:

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

### What's next?

_fastlane_ created all the required files for you. Now you can go ahead and customise _fastlane_ to generate screenshots, or automatically distribute new builds, and much, much more. Here are some examples:

- Generate localized iOS screenshots for the App Store
- Automatic iOS Beta deployment
- Automatic iOS App Store deployment
- Discover all _fastlane_ actions

Do note that if the automation you're building requires connectivity with Apple's servers, such as for code signing when building your app, or uploading your app to the App Store Connect, and so on, you will need to authenticate. Check out Authenticating with Apple services to learn the best ways to authenticate, catered for your specific use case.

#### Set up environment variables

_fastlane_ requires some environment variables set up to run correctly. In particular, having your locale not set to a UTF-8 locale will cause issues with building and uploading your build. In your shell profile add the following lines:

```sh hljs bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

You can find your shell profile at `~/.bashrc`, `~/.bash_profile`, `~/.profile` or `~/.zshrc` depending on your system.

#### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `./Gemfile` in the root directory of your project with the content

- Run `[sudo] bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `[sudo] bundle install` as your first build step
- To update _fastlane_, just run `[sudo] bundle update fastlane`

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/android/setup

- Docs »
- Android »
- Getting Started »
- Setup
- Edit on GitHub
- ```

* * *

# Getting started with _fastlane_ for Android

### Installing _fastlane_

_fastlane_ can be installed in multiple ways. The preferred method is with _Bundler_. _fastlane_ can also be installed directly through Homebrew (if on macOS). It is possible to use macOS's system Ruby, but it's not recommended, as it can be hard to manage dependencies and cause conflicts.

#### Managed Ruby environment + Bundler (macOS/Linux/Windows)

**Ruby**

If you use macOS, system Ruby is not recommended. There are a variety of ways to install Ruby without having to modify your system environment. For macOS and Linux, _rbenv_ is one of the most popular ways to manage your Ruby environment.

_fastlane_ supports Ruby versions 2.5 or newer. Verify which Ruby version you're using:

```sh hljs bash
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]

**Bundler**

It is recommended that you use _Bundler_ and `Gemfile` to define your dependency on _fastlane_. This will clearly define the _fastlane_ version to be used and its dependencies, and will also speed up _fastlane_ execution.

- Install _Bundler_ by running `gem install bundler`
- Create a `./Gemfile` in the root directory of your project with the content

```ruby hljs
source "https://rubygems.org"

gem "fastlane"

- Run `bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `bundle install` as your first build step
- To update _fastlane_, just run `bundle update fastlane`

#### Homebrew (macOS)

This way, you don't have to install Ruby separately, and instead _homebrew_ installs the adequate Ruby version for _fastlane_.
See this page for details.

```sh hljs bash
brew install fastlane

#### System Ruby + RubyGems (macOS/Linux/Windows)

This is not recommended for your local environment, but you can still install _fastlane_ to system Ruby's environment. Using `sudo` often occurs unwanted results later due to file permission and makes managing your environment harder.

```sh hljs bash
sudo gem install fastlane

### Setting up _fastlane_

Navigate your terminal to your project's directory and run

```no-highlight
fastlane init

You'll be asked to confirm that you're ready to begin, and then for a few pieces of information. To get started quickly:

1. Provide the package name for your application when asked (e.g. io.fabric.yourapp)
2. Press enter when asked for the path to your json secret file
3. Answer 'n' when asked if you plan on uploading info to Google Play via fastlane (we can set this up later)

That's it! _fastlane_ will automatically generate a configuration for you based on the information provided.

You can see the newly created `./fastlane` directory, with the following files:

- `Appfile` which defines configuration information that is global to your app
- `Fastfile` which defines the "lanes" that drive the behavior of _fastlane_

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

### Setting up _supply_

_supply_ is a _fastlane_ tool that uploads app metadata, screenshots and binaries to Google Play. You can also select tracks for builds and promote builds to production!

For _supply_ to be able to initialize, you need to have successfully uploaded an APK to your app in the Google Play Console at least once.

Setting it up requires downloading a credentials file from your Google Developers Service Account.

#### Collect your Google credentials

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

#### Configure _supply_

Edit your `fastlane/Appfile` and change the `json_key_file` line to have the path to your credentials file:

```ruby hljs
json_key_file "/path/to/your/downloaded/key.json"

#### Fetch your app metadata

If your app has been created on the Google Play developer console, you're ready to start using _supply_ to manage it! Run:

```no-highlight
fastlane supply init

and all of your current Google Play store metadata will be downloaded to `fastlane/metadata/android`.

Due to limitations of the Google Play API, _supply_ can't download existing screenshots or videos.

### What's next?

_fastlane_ is ready to generate screenshots and automatically distribute new builds! To learn more, check out:

- _fastlane_ screenshots for Android
- Deploy to Google Play using _fastlane_

#### Set up environment variables

_fastlane_ requires some environment variables set up to run correctly. In particular, having your locale not set to a UTF-8 locale will cause issues with building and uploading your build. In your shell profile add the following lines:

```sh hljs bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

You can find your shell profile at `~/.bashrc`, `~/.bash_profile`, `~/.profile` or `~/.zshrc` depending on your system.

#### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `./Gemfile` in the root directory of your project with the content

- Run `[sudo] bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `[sudo] bundle install` as your first build step
- To update _fastlane_, just run `[sudo] bundle update fastlane`

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/img/fastlane_text.png)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/ios/setup/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/android/setup/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

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

# https://docs.fastlane.tools/getting-started/ios/fastlane-swift

- Docs »
- iOS »
- Getting Started »
- Swift
- Edit on GitHub
- ```

* * *

# Getting Started with Fastlane.swift (beta)

Welcome to Fastlane.swift. Fastlane.swift allows you to write your _fastlane_ configuration using Xcode, in Swift - the language you have come to know and love from the world of iOS development.

Fastlane.swift is currently in beta. Please provide feedback by opening an issue in the _fastlane_ repo.

### Currently Supported

Fastlane.swift currently supports all built-in fastlane actions and 3rd party plugins. Make sure to update to the most recent _fastlane_ release to try these features.

#### Step 1

Run the following command in your terminal:

```no-highlight
fastlane init swift

#### Step 2

Open the file located at `[project]/fastlane/swift/FastlaneSwiftRunner/FastlaneSwiftRunner.xcodeproj` to configure your lanes in `Fastfile.swift`.

```swift hljs
func betaLane() {
desc("Submit a new Beta Build to Apple TestFlight. This will also make sure the profile is up to date")

syncCodeSigning(gitUrl: "URL/for/your/git/repo", appIdentifier: [appIdentifier], username: appleID)
// Build your app - more options available
buildIosApp(scheme: "SchemeName")
uploadToTestflight(username: appleID)
// You can also use other beta testing services here (run `fastlane actions`)
}

#### Step 4

🎉

### Get Started (SPM) (Beta)

Swift Package Manager (SPM) support adds the ability to distribute _fastlane_ as a Swift Package Manager package, which allows other packages to integrate with the toolset.

#### Step 1

Create an executable Swift Package Manager project with `swift package init --type executable`.

#### Step 2

Add the _fastlane_ dependency to your `Package.swift`.

```swift hljs
.package(name: "Fastlane", url: "https://github.com/fastlane/fastlane", from: "2.179.0")

A full example of a working package description would be the following.

```swift hljs
// swift-tools-version:5.2

import PackageDescription

let package = Package(
name: "fastlaneRunner",
products: [\
.executable(name: "fastlaneRunner", targets: ["fastlaneRunner"])\
],
dependencies: [\
.package(name: "Fastlane", url: "https://github.com/fastlane/fastlane", from: "2.179.0")\
],
targets: [\
.target(\
name: "fastlaneRunner",\
dependencies: ["Fastlane"],\
path: "Sources/Thingy"\
)\
]
)

#### Step 3

Create your Fastfile.swift file in your package and add the desired lanes, as follows.

```swift hljs
import Fastlane

// Create a class with:
class FastFile: LaneFile {
// Your lanes goes here.
}

#### Step 4

Add an entry point ( `@main`) or a `main.swift` file (mandatory for executable SPM packages) and don't forget to start the _fastlane_ runloop as follows:

Main().run(with: Fastfile())

#### Step 5

Modify the target of your executable to have executable arguments `lane myLane` or add them in the call after making `swift build`.

```no-highlight
myExecutable lane myLane

##### Notes:

- You can edit the created `Package.swift` file to add your desired dependencies so you can use them in the Fastfile.

- If you want to just push your `Package.swift` and `Package.resolved` to the repo, you'd need to `swift build` the package to create your executable again which can be found in the `.debug` or `.release` folders, depending on how you built the package ( `.debug` by default).

### Defining Lanes

Lanes are defined with functions that end with `Lane` within the `class Fastfile: LaneFile`.

```swift hljs
class Fastfile: LaneFile {
func testLane() {
desc("This is a lane")
}

func helper() {
// This is not a lane but can be called from a lane
}
}

### Passing Parameters

To pass parameters from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] key:value key2:value2

fastlane deploy submit:false build_number:24

To access those values, change your lane declaration to also include `withOptions options:[String: String]?`

```swift hljs
class Fastfile: LaneFile {
func deployLane(withOptions options:[String: String]?) {
// ...
if let submit = options?["submit"], submit == "true" {
// Only when submit is true
}
// ...
incrementBuildNumber(buildNumber: options?["build_number"])
// ...
}
}

### Using Plugins

Once you add a plugin, _fastlane_ will automatically generate the corresponding API and make it available in `fastlane/swift/Plugins.swift`.

Example:

```sh hljs bash
bundle exec fastlane add_plugin ascii_art

The `fastlane/swift/Plugins.swift` file should now contain the function `asciiArt()`, and you can access it in your lanes in `fastlane/Fastlane.swift`.

### Run Parallel

`Fastlane Swift` uses socket internally. Therefore, for several `Lane` s to run in parallel at the same time, each `Lane` must be specified different `socket port` (lane's default `socket port` is `2000`)

To specify `socket port` from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] --swift_server_port [socket port]

### We Would Love Your Feedback

Please feel free to open an issue on GitHub to report any problems you are having with Fastlane.swift and we will respond as quickly as possible.

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/ios/screenshots

- Docs »
- iOS »
- Getting Started »
- Screenshots
- Edit on GitHub
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

# _fastlane_ screenshots for iOS and tvOS

Your App Store screenshots are probably the most important thing when it comes to convincing potential users to download or purchase your app. Unfortunately, many apps don't do screenshots well. This is often because taking screenshots of your app and then preparing them for display is time consuming, and it's hard to get everything right and consistent! For example:

- Are the screenshots in the App Store inconsistent with your latest app design?
- Is your app localized into many languages that require different screenshots for each?
- Have you made sure that no loading indicators are showing?
- Is the same content displayed for each of your size variations?

_fastlane_ tools can automate this process making it fast, and consistent while giving you beautiful results!

### Alternatives

For the full story about the many ways that developers can capture and beautify screenshots check out this article.

#### Manually Capturing Screenshots

Manually taking screenshots takes too much time, which also decreases the quality of the screenshots. Since it is not automated, the screenshots will show slightly different content on the various devices and languages. Many companies choose to create screenshots in one language and use them for all languages. While this might seem okay to us developers, there are many potential users out there that cannot read the text on your app screenshots if they are not localised. Have you ever looked at a screenshot with content in a language you don't know? It won't convince you to download the app.

However, the biggest disadvantage of this method is what happens when you need to repeat the process. If you notice a spelling mistake in the screenshots, if you release an update with a new design, or if you just want to show more up to date content, you'll have to create new screenshots for all languages and devices... manually.

The positive side of this approach is that your screenshots will all be crisp and correctly sized, with readable text.

#### Scaled Screenshots via App Store Connect

App Store Connect allows you to use one set of screenshots per device type, which will then be scaled to the appropriate size when viewed in the App Store on a user's device.

While this is convenient, this approach has the same problems as the device frame approach: The screenshots don't actually show how the app looks on the user's device. It's a valid way to start though, since you can gradually overwrite screenshots for specific languages and devices.

## Capture Screenshots Automatically

_snapshot_ works with _fastlane_ to automate the process of capturing screenshots of your app. It allows you to:

- Capture hundreds of screenshots in multiple languages on all simulators
- Take screenshots in multiple device simulators concurrently to cut down execution time
- Do something else while the computer takes the screenshots for you
- Configure it once, and store the configuration so anyone on the team can run it
- Generate a beautiful web page showing all screenshots on all devices. This is perfect to send to Q&A, marketing, or translators for verification
- Avoid having loading indicators in your App Store screenshots by intelligently waiting for network requests to be finished
- Get a summary of how your app looks like across all supported devices and languages

After _snapshot_ successfully captures all the screenshots, it will show you a beautiful HTML page to summarize all the screens that were captured:

![HTML summary page](https://docs.fastlane.tools/img/getting-started/ios/htmlPagePreviewFade.jpg)

### Getting Started Using UI Tests

_snapshot_ uses the capabilities of Apple's UI Tests to drive interactions with your app. To get familiar with writing UI Tests, check out the following introductions:

- WWDC 2015 Introduction to UI Tests
- A first look into UI Tests
- UI Testing in Xcode 7
- HSTestingBackchannel : ‘Cheat’ by communicating directly with your app
- Automating App Store screenshots using fastlane snapshot and frameit

To jump-start your UI tests, you can use the UI Test recorder, which you can start by clicking the red record button on the bottom of the window. By interacting with your app through the simulator while using it, Xcode will generate UI Test code for you. To learn more, check out this this blog post!

### Setting Up _snapshot_

01. Create a new UI Test target in your Xcode project (See the top part of this article)
02. Run `fastlane snapshot init` in your project folder
03. Add the `./SnapshotHelper.swift` file to your UI Test target (You can move the file anywhere you want)
04. Add a new Xcode scheme for the newly created UI Test target
05. Edit the scheme
06. In the list on the left click "Build", and enable the checkbox under the "Run" column for your target.
07. Enable the `Shared` box of the newly created scheme
08. (Objective C only) Add the bridging header to your test class.
- `#import "MYUITests-Swift.h"`
- The bridging header is named after your test target with -Swift.h appended.
09. In your UI Test class, click the `Record` button on the bottom left and record your interaction
10. To take a screenshot, call the following between interactions
- Swift: `snapshot("01LoginScreen")`
- Objective C: `[Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];`
11. Add the following code to your `setUp()` method:

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

12. In the terminal run `fastlane snapshot`.

WARNING: Running the test in Xcode does not create the snapshots and will not generate the correct results - although no tests will fail. The command line program creates the necessary subdirectories, renames the files as appropriate, and generates the overview html page.

The setup process will also generate a `Snapfile`, looking similar to

```ruby hljs
# A list of devices you want to take the screenshots from
# devices([\
# "iPad (7th generation)",\
# "iPad Air (3rd generation)",\
# "iPad Pro (11-inch)",\
# "iPad Pro (12.9-inch) (3rd generation)",\
# "iPad Pro (9.7-inch)",\
# "iPhone 11",\
# "iPhone 11 Pro",\
# "iPhone 11 Pro Max",\
# "iPhone 8",\
# "iPhone 8 Plus"\
# ])

languages([\
"en-US",\
"de-DE"\
])

# The name of the scheme which contains the UI Tests
# scheme "SchemeName"

# Where should the resulting screenshots be stored?
# output_directory "./screenshots"

# clear_previous_screenshots true # remove the '#' to clear all previously generated screenshots before creating new ones

# Choose which project/workspace to use
# project "./Project.xcodeproj"
# workspace "./Project.xcworkspace"

# For more information about all available options run
# fastlane action snapshot

You can adapt this file to fit your project. Every time you run `fastlane snapshot` the file will be loaded automatically.

For a list of all available parameters that can be used in the `Snapfile` run `fastlane action snapshot`.

If you have _fastlane_ installed, it's easy to give _snapshot_ a try. First clone the _fastlane_ repo, head over to the _snapshot_ example project, and then run `fastlane snapshot`

```no-highlight
git clone # Clone the fastlane repo
cd fastlane/snapshot/example # Navigate to the example project
fastlane snapshot # Generate screenshots for the sample app

## Upload Screenshots to the App Store

After generating your screenshots using `fastlane snapshot`, you usually want to upload them to App Store Connect.

If you followed the setup guide, you already ran `fastlane init` before, so you should have your existing screenshots and metadata inside the `fastlane/screenshots` and `fastlane/metadata` directory. Running `fastlane snapshot` will store the screenshots in the `fastlane/screenshots` directory by default.

To upload the screenshots stored in `fastlane/screenshots`, just run

```no-highlight
fastlane deliver

This will also show you a metadata summary, before actually uploading the screenshots, as this will overwrite the metadata and screenshots you already have on App Store Connect.

## Use in Fastfile

To put all of this together so that anyone on your team could trigger generating and uploading new screenshots, you can define a _fastlane_ lane called `screenshots`. It would be responsible for:

1. Running your app through _snapshot_ to automatically capture your screenshots
2. Having _deliver_ send your final screenshots to App Store Connect for use in the App Store

Add the following code to your `fastlane/Fastfile`:

```ruby hljs
lane :screenshots do
capture_screenshots
upload_to_app_store
end

To get a list of all available options for each of the steps, run

```no-highlight
fastlane action capture_screenshots
fastlane action upload_to_app_store

## Put Your Screenshots Into Device Frames

_frameit_ helps you beautify your screenshots with device frames and text by running one simple command. It provides support for:

- Multiple device types
- Portrait and landscape orientations
- Black and silver devices
- Setting a background color and decorating the image with text

![frameit results](https://docs.fastlane.tools/img/getting-started/ios/frameit-results.png)

### Usage

To automatically add device frames around all screenshots in the current directory and its subdirectories, just run:

```no-highlight
fastlane frameit

This will only add a device frame around the screenshots, not the background and title. Those images can be used for your website, email newsletter and similar.

If you want to implement the custom titles and background, you'll have to setup a `Framefile.json`, more information can be found here.

If you want to upload the screenshots to the App Store, you **have** to provide a `Framefile.json`, with titles and background, otherwise the resolution of the framed screenshots doesn't match the requirements of App Store Connect.

### Dependencies

Installing ImageMagick

To perform image manipulation, _frameit_ depends on a tool called `imagemagick`. The easiest way to install it is through homebrew:

```no-highlight
brew install libpng jpeg imagemagick

Troubleshooting ImageMagick

If you have installed _imagemagick_ but are seeing error messages like:

```no-highlight
mogrify: no decode delegate for this image format `PNG'

You may need to reinstall and build from source. Run:

```no-highlight
brew uninstall imagemagick; brew install libpng jpeg; brew install imagemagick --build-from-source

Setting Up Device Frames

To download the latest device frames, you can run

```no-highlight
fastlane frameit setup

This usually happens automatically when you use _frameit_ for the first time on a new machine

To add the framing to your deployment process, use the following code in your `Fastfile`:

```ruby hljs
lane :screenshots do
capture_screenshots
frame_screenshots(white: true)
upload_to_app_store
end

To get a list of all available options for _frame\_screenshots_ (which calls into _frameit_)

```no-highlight
fastlane action frame_screenshots

## Advanced _snapshot_

Sample uses

```ruby hljs
lane :screenshots do
capture_screenshots
end

Your screenshots will be stored in the `./screenshots/` folder by default (or `./fastlane/screenshots` if you're using _fastlane_)

If any error occurs while running the snapshot script on a device, that device will not have any screenshots, and _snapshot_ will continue with the next device or language. To stop the flow after the first error, run

```ruby hljs
capture_screenshots(stop_after_first_error: true)

Also by default, _snapshot_ will open the HTML after all is done. This can be skipped with the following command

```ruby hljs
capture_screenshots(skip_open_summary: true)

There are a lot of options available that define how to build your app, for example

```ruby hljs
capture_screenshots(scheme: "UITests", configuration: "Release", sdk: "iphonesimulator")

Reinstall the app before running _snapshot_

```ruby hljs
capture_screenshots(reinstall_app: true, app_identifier: "tools.fastlane.app")

By default _snapshot_ automatically retries running UI Tests if they fail. This is due to randomly failing UI Tests (e.g. #372). You can adapt this number using

```ruby hljs
capture_screenshots(number_of_retries: 3)

Add photos and/or videos to the simulator before running _snapshot_

```ruby hljs
capture_screenshots(add_photos: "MyTestApp/demo.jpg", add_videos: "MyTestApp/demo.mp4")

For a list for all available options run

```no-highlight
fastlane action capture_screenshots

Reset Xcode simulators

You can run this command in the terminal to delete and re-create all iOS simulators. This is useful when Xcode duplicated your local simulators.

```no-highlight
fastlane snapshot reset_simulators

Launch Arguments

You can provide additional arguments to your app on launch. These strings will be available in your app (eg. not in the testing target) through `ProcessInfo.processInfo.arguments`. Alternatively, use user-default syntax ( `-key value`) and they will be available as key-value pairs in `UserDefaults.standard`.

```ruby hljs
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

# Snapfile for A/B Test Comparison
```ruby hljs
launch_arguments([\
"-secretFeatureEnabled YES",\
"-secretFeatureEnabled NO"\
])

Update snapshot helpers

Some updates require the helper files to be updated. _snapshot_ will automatically warn you and tell you how to update.

Basically you can run

```no-highlight
fastlane snapshot update

to update your `SnapshotHelper.swift` files. In case you modified your `SnapshotHelper.swift` and want to manually update the file, check out SnapshotHelper.swift.

Clean status bar

To clean the status bar (9:41, full battery and full signal), use the `override_status_bar` parameter.

How does \_snapshot\_ work?

The easiest solution would be to just render the UIWindow into a file. That's not possible because UI Tests don't run on a main thread. So _snapshot_ uses a different approach:

When you run unit tests in Xcode, the reporter generates a plist file, documenting all events that occurred during the tests ( More Information). Additionally, Xcode generates screenshots before, during and after each of these events. There is no way to manually trigger a screenshot event. The screenshots and the plist files are stored in the DerivedData directory, which _snapshot_ stores in a temporary folder.

When the user calls `snapshot(...)` in the UI Tests (Swift or Objective C) the script actually does a rotation to `.Unknown` which doesn't have any effect on the actual app, but is enough to trigger a screenshot. It has no effect to the application and is not something you would do in your tests. The goal was to find _some_ event that a user would never trigger, so that we know it's from _snapshot_. On tvOS, there is no orientation so we ask for a count of app views with type "Browser" (which should never exist on tvOS).

_snapshot_ then iterates through all test events and check where we either did this weird rotation (on iOS) or searched for browsers (on tvOS). Once _snapshot_ has all events triggered by _snapshot_ it collects a ordered list of all the file names of the actual screenshots of the application.

_snapshot_ finds all these entries using a regex. The number of _snapshot_ outputs in the terminal and the number of _snapshot_ events in the plist file should be the same. Knowing that, _snapshot_ automatically matches these 2 lists to identify the name of each of these screenshots. They are then copied over to the output directory and separated by language and device.

Two things have to be passed on from _snapshot_ to the `xcodebuild` command line tool:

- The device type is passed via the `destination` parameter of the `xcodebuild` parameter
- The language is passed via a temporary file which is written by _snapshot_ before running the tests and read by the UI Tests when launching the application

If you find a better way to do any of this, please submit an issue on GitHub or even a pull request :+1:

Also, feel free to duplicate radar 23062925.

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/ios/beta-deployment

- Docs »
- iOS »
- Getting Started »
- Beta Deployment
- Edit on GitHub
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

# iOS Beta deployment using _fastlane_

## Building your app

_fastlane_ takes care of building your app using an action called _build\_app_, just add the following to your `Fastfile`:

```ruby hljs
lane :beta do
build_app(scheme: "MyApp")
end

Additionally you can specify more options for building your app, for example

```ruby hljs
lane :beta do
build_app(scheme: "MyApp",
workspace: "Example.xcworkspace",
include_bitcode: true)
end

Try running the lane using

```no-highlight
fastlane beta

If everything works, you should have a `[ProductName].ipa` file in the current directory. To get a list of all available parameters for _build\_app_, run `fastlane action build_app`.

### Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own Code Signing Guide that helps you setting up the right code signing approach for your project.

## Uploading your app

After building your app, it's ready to be uploaded to a beta testing service of your choice. The beauty of _fastlane_ is that you can easily switch beta provider, or even upload to multiple at once, without any extra work.

All you have to do is to put the name of the beta testing provider of your choice after building the app using _build\_app_:

```ruby hljs
lane :beta do
sync_code_signing(type: "appstore") # see code signing guide for more information
build_app(scheme: "MyApp")
upload_to_testflight
slack(message: "Successfully distributed a new beta build")
end

_fastlane_ automatically passes on information about the generated `.ipa` file from _build\_app_ to the beta testing provider of your choice.

To get a list of all available parameters for a given action, run

```no-highlight
fastlane action slack

#### Beta testing services

TestFlight

You can easily upload new builds to TestFlight (which is part of App Store Connect) using _fastlane_. To do so, just use the built-in `testflight` action after building your app

```ruby hljs
lane :beta do
# ...
build_app
upload_to_testflight
end

Some example use cases

```ruby hljs
lane :beta do
build_app

# Variant 1: Provide a changelog to your build
upload_to_testflight(changelog: "Add rocket emoji")

# Variant 2: Skip the "Waiting for processing" of the binary
# While this will speed up your build, it will not distribute
# the binary to your tests, nor set a changelog
upload_to_testflight(skip_waiting_for_build_processing: true)
end

If you used `fastlane init` to setup _fastlane_, your Apple ID is stored in the `fastlane/Appfile`. You can also overwrite the username, using `upload_to_testflight(username: "bot@fastlane.tools")`.

To get a list of all available options, run

```no-highlight
fastlane action upload_to_testflight

With _fastlane_, you can also automatically manage your beta testers, check out the other actions available.

Firebase App Distribution

Install the Firebase App Distribution plugin:

```no-highlight
fastlane add_plugin firebase_app_distribution

Authenticate with Firebase by running the `firebase_app_distribution_login` action (or using one of the other authentication methods):

```no-highlight
fastlane run firebase_app_distribution_login

Then add the `firebase_app_distribution` action to your lane:

firebase_app_distribution(
app: "1:123456789:ios:abcd1234",
groups: "qa-team, trusted-testers"
)
end

For more information and options (such as adding release notes) see the full Getting Started guide.

HockeyApp

```ruby hljs
lane :beta do
build_app
hockey(api_token: "[insert_key_here]")
end

To get your API token, open API Tokens in Account Settings. From there, you can find your existing API token, or create a new one.

To get a list of all available options see the `hockey` action docs, or run

```no-highlight
fastlane action hockey

TestFairy

testfairy(api_key: "[insert_key_here]")

# Variant 1: Provide a changelog
testfairy(api_key: "[insert_key_here]",
comment: "Add rocket emoji")

# Variant 2: Specify tester groups
testfairy(api_key: "[insert_key_here]", testers_groups: ["group1"])
end

```no-highlight
fastlane action testfairy

More information about the service on TestFairy.com.

More information about additional supported beta testing services can be found in the list of "Beta" actions

# Release Notes

Automatically based on git commits

Your changelog changes, so it doesn't make a lot of sense to store a static release note in the `Fastfile`.

```ruby hljs
lane :beta do
sync_code_signing
build_app

changelog_from_git_commits # this will generate the changelog based on your last commits
upload_to_testflight
end

Get a list of all available options using `fastlane action changelog_from_git_commits`, here are some examples

```ruby hljs
changelog_from_git_commits(
between: ['7b092b3', 'HEAD'], # Optional, lets you specify a revision/tag range between which to collect commit info
merge_commit_filtering: 'exclude_merges' # Optional, lets you filter out merge commits
)

Prompt for changelog

You can automatically be asked for the changelog in your terminal using the `prompt` action:

# Variant 1: Ask for a one line input
```ruby hljs
lane :beta do
changelog = prompt(text: "Changelog: ")

# Variant 2: Ask for a multi-line input
# The user confirms their input by typing `END` and Enter
changelog = prompt(
text: "Changelog: ",
multi_line_end_keyword: "END"
)

sync_code_signing
build_app

upload_to_testflight(changelog: changelog)
end

Fetching the changelog from the file system or remote server

You can fetch values from anywhere in your `Fastfile`, including the file system and remote server

# Variant 1: Read from file system
# note the `..`, since fastlane runs in the _fastlane_ directory
```ruby hljs
lane :beta do
changelog = File.read("../Changelog.txt")

# Variant 2: Fetch data from a remote web server
changelog = download(url: "https://lookatmycms.com/changelog.txt")

## Best Practices

Manage devices and testers using \_fastlane\_TestFlight

If you're using TestFlight you don't need to worry about UDIDs of your devices. Instead you just maintain a list of testers based on their Apple ID email address.

_fastlane_ supports automatically registering devices using different approaches

##### boarding

boarding allows you set up a registration page for your beta testers, so they can enter their email address and start testing your application.

Check out the boarding GitHub repo for more information.

##### pilot

_pilot_ is automatically installed with _fastlane_, you can use it to register individual testers to TestFlight

```no-highlight
# Register a new external tester
fastlane pilot add email@invite.com

# Register a new external tester and add them to your app
fastlane pilot add email@invite.com -a com.app.name

Third party beta testing services

If you're using a third party beta testing service, you'll need to manage your registered devices and their UDIDs. _fastlane_ already supports device registrations and updating provisioning profiles out of the box.

# Before calling match, we make sure all our devices are registered on the Apple Developer Portal
```ruby hljs
lane :beta do
register_devices(devices_file: "devices.txt")

# After registering the new devices, we'll make sure to update the provisioning profile if necessary
# Note how we make sure to pass "adhoc" to get and use a provisioning profile for Ad Hoc distribution
sync_code_signing(force_for_new_devices: true, type: "adhoc")
build_app

The `devices.txt` should look like this:

```no-highlight
Device ID Device Name
A123456789012345678901234567890123456789 DeviceName1
B123456789012345678901234567890123456789 DeviceName2

Incrementing the build number

Depending on the beta testing service you use, you'll have to increment the build number each time you upload a new build. This is a requirement for TestFlight for example.

To do so, there are some built-in fastlane actions available, here are some examples

#### Fetching the latest build number from TestFlight

The code sample below will use the latest build number from TestFlight and temporarily set it.

```ruby hljs
lane :beta do
increment_build_number(
build_number: latest_testflight_build_number + 1,
xcodeproj: "Example.xcodeproj"
)
end

#### Committing the build number to version control

The code sample below will increment the build number and commit the project changes to version control.

# Ensure that your git status is not dirty
```ruby hljs
lane :beta do
ensure_git_status_clean

# Increment the build number (not the version number)
# Providing the xcodeproj is optional
increment_build_number(xcodeproj: "Example.xcodeproj")

# Commit the version bump
commit_version_bump(xcodeproj: "Example.xcodeproj")

# Add a git tag for this build. This will automatically
# use an appropriate git tag name
add_git_tag

# Push the new commit and tag
push_to_git_remote
end

For all the steps above, there are more parameters available, run the following to get a full list:

```no-highlight
fastlane action [action_name]

#### Use the number of commits

This isn't recommended, however some teams prefer this approach. You can use the number of commits of the current branch (via `number_of_commits`) as the build number. This will only work if you always run the build on the same branch.

```ruby hljs
lane :beta do
increment_build_number(build_number: number_of_commits)
end

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/ios/appstore-deployment

- Docs »
- iOS »
- Getting Started »
- App Store Deployment
- Edit on GitHub
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

# iOS App Store deployment using _fastlane_

## Building your app

_fastlane_ takes care of building your app using an action called _build\_app_, just add the following to your `Fastfile`:

```ruby hljs
lane :release do
build_app(scheme: "MyApp")
end

Additionally you can specify more options for building your app, for example

```ruby hljs
lane :release do
build_app(scheme: "MyApp",
workspace: "Example.xcworkspace",
include_bitcode: true)
end

Try running the lane using

```no-highlight
fastlane release

If everything works, you should have a `[ProductName].ipa` file in the current directory. To get a list of all available parameters for _build\_app_, run `fastlane action build_app`.

### Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own Code Signing Guide that helps you setting up the right code signing approach for your project.

## Submitting your app

### Generating screenshots

To find out more about how to automatically generate screenshots for the App Store, check out _fastlane_ screenshots for iOS and tvOS.

### Upload the binary and app metadata

After building your app, it's ready to be uploaded to the App Store. If you've already followed iOS Beta deployment using _fastlane_, the following code might look similar already.

```ruby hljs
lane :release do
capture_screenshots # generate new screenshots for the App Store
sync_code_signing(type: "appstore") # see code signing guide for more information
build_app(scheme: "MyApp")
upload_to_app_store # upload your app to App Store Connect
slack(message: "Successfully uploaded a new App Store build")
end

_fastlane_ automatically passes on information about the generated screenshots and the binary to the `upload_to_app_store` action of your `Fastfile`.

For a list of all options for each of the steps run `fastlane action [action_name]`.

### More details

For more details on how `upload_to_app_store` works, how you can define more options, check out upload\_to\_app\_store.

## Best Practices

Push Notifications

To make sure your latest push notification certificate is still valid during your submission process, add the following at the beginning of your lane:

```ruby hljs
lane :release do
get_push_certificate
# ...
end

_get\_push\_certificate_ will ensure your certificate is valid for at least another 2 weeks, and create a new one if it isn't.

If you don't have any push certificates already, _get\_push\_certificate_ will create one for you and store locally in your project's directory. To get more information about the available options run `fastlane action get_push_certificate`.

Incrementing the build number

The code sample below will use the latest build number from App Store Connect and temporarily set it.

```ruby hljs
lane :beta do
increment_build_number(
build_number: app_store_build_number + 1,
xcodeproj: "Example.xcodeproj"
)
end

For all the steps above, there are more parameters available, run the following to get a full list:

```no-highlight
fastlane action [action_name]

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

# https://docs.fastlane.tools/getting-started/ios/authentication

- Docs »
- iOS »
- Getting Started »
- Authentication
- Edit on GitHub
- ```

* * *

## Authenticating with Apple services

Several _fastlane_ actions communicate with Apple services that need authentication. As this can pose several challenges especially on CI, this document focuses on those challenges, but everything described here can be done on your local machine as well.

There are 4 ways to connect to Apple services:

### Method 1: App Store Connect API key (recommended)

This is the recommended and official way of authenticating with Apple services. However, it doesn't support all of the _fastlane_ features yet. Check out App Store Connect API for more information.

### Method 2: Two-step or two-factor authentication

For actions that aren't yet supported by the official App Store Connect API, you will need to authenticate with your Apple ID. Luckily, _fastlane_ fully supports 2-factor authentication (2FA) (and legacy 2-step verification (2SV)) for logging in to your Apple ID and Apple Developer account. 🌟

#### Manual verification

With 2-factor authentication (or 2-step verification) enabled, you will be asked to verify your identity by entering a security code. If you already have a trusted device configured for your account, then the code will appear on the device. If you don't have any devices configured, but have trusted a phone number, then the code will be sent to your phone.

The resulting session will be stored in `~/.fastlane/spaceship/[email]/cookie`.

#### Storing a manually verified session using `spaceauth`

As your CI machine will not be able to prompt you for your two-factor authentication or two-step verification information, you can generate a login session for your Apple ID in advance by running:

```hljs sql
fastlane spaceauth -u user@email.com

The generated value then has to be stored inside the `FASTLANE_SESSION` environment variable on your CI system. This session will be reused instead of triggering a new login each time _fastlane_ communicates with Apple's APIs.

It's advised that you run `spaceauth` in the same machine as your CI, instead of running it locally on your machine - see the notes below regarding session duration.

#### Important note about session duration

The session generated, stored and reused as part of a 2FA/2SV authentication, or as part of _spaceauth_ is subject to technical limitations imposed by Apple. Namely:

- An Apple ID session is only valid within a certain region, meaning if the region you're using your session (e.g. CI system) is different than the region where you created that session (e.g. your local machine), you might run into issues. It's advised that you create the session in the same machine that will be used to consume it, to make the session last longer.
- The session's validity can greatly vary (anything between 1 day and 1 month, depending on factors such as geolocation of the session usage). This means you'll have to generate a new session at least once a month. Usually you'd only know about it when your build starts failing.

Unfortunately there is nothing _fastlane_ can do better in this regard, as these are technical limitations on how App Store Connect sessions are handled.

### Method 3: Application-specific passwords

If you want to upload builds to App Store Connect (actions `upload_to_app_store` and `deliver`) or TestFlight (actions `upload_to_testflight`, `pilot` or `testflight`) from your CI machine, you may generate an _application specific password_:

1. Visit appleid.apple.com/account/manage
2. Generate a new application specific password
3. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

This will supply the application specific password to iTMSTransporter, the tool used by those actions to perform the upload.

Note: The application specific password will **not** work if your action usage does anything else than uploading the binary, e.g. updating any metadata like setting release notes or distributing to testers, etc. For those actions, you **must** use one of the other methods.

### Method 4: Apple ID without 2FA (deprecated)

Apple announced that as of February 27th 2019, it would enforce 2-factor authentication on developer Apple IDs with the "Account Holder" role. Since then, they extended this rule to all roles, and then later throughout 2020 they slowly enforced all existing accounts to register 2FA. As of March 3rd 2021, no accounts without 2FA registered are able to login until they register a 2FA method, essentially breaking all "non-2FA compliant Apple IDs" that still existed. For this reason, when using _fastlane_ in your CI, you **will** have to work your way with 2FA.

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/ios/fastlane-swift/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/img/getting-started/ios/fastlane-init.png)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/ios/screenshots/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/ios/beta-deployment/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/ios/appstore-deployment/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/actions)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/ios/authentication/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/actions/validate_play_store_json_key

- Docs »
- \_Actions »
- validate\_play\_store\_json\_key
- Edit on GitHub
- ```

* * *

# validate\_play\_store\_json\_key

| validate\_play\_store\_json\_key | |
| --- | --- |
| Supported platforms | android |
| Author | @janpio |

## 1 Example

```ruby hljs
validate_play_store_json_key(
json_key: 'path/to/you/json/key/file'
)

## Parameters

| Key | Description | Default |
| --- | --- | --- |
| `json_key` | The path to a file containing service account JSON, used to authenticate with Google | \* |
| `json_key_data` | The raw service account JSON data used to authenticate with Google | \* |
| `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of | |
| `timeout` | Timeout for read, open, and send (in seconds) | `300` |

_\\* = default value is dependent on the user's system_

## Documentation

To show the documentation in your terminal, run

```no-highlight
fastlane action validate_play_store_json_key

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run validate_play_store_json_key

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run validate_play_store_json_key parameter1:"value1" parameter2:"value2"

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

## Source code

This action, just like the rest of _fastlane_, is fully open source, view the source code on GitHub

[GitHub« PreviousNext »

---

# https://docs.fastlane.tools/advanced/Appfile

- Docs »
- Advanced »
- Appfile
- Edit on GitHub
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

# Appfile

The `Appfile` stores useful information that are used across all _fastlane_ tools like your _Apple ID_ or the application _Bundle Identifier_, to deploy your lanes faster and tailored on your project needs.

The `Appfile` has to be inside your `./fastlane` directory.

By default an `Appfile` looks like:

```ruby hljs
app_identifier "net.sunapps.1" # The bundle identifier of your app
apple_id "felix@krausefx.com" # Your Apple email address

# You can uncomment the lines below and add your own
# team selection in case you're in multiple teams
# team_name "Felix Krause"
# team_id "Q2CBPJ58CA"

# To select a team for App Store Connect use
# itc_team_name "Company Name"
# itc_team_id "18742801"

If you have different credentials for App Store Connect and the Apple Developer Portal use the following code:

```ruby hljs
app_identifier "tools.fastlane.app" # The bundle identifier of your app

apple_dev_portal_id "portal@company.com" # Apple Developer Account
itunes_connect_id "tunes@company.com" # App Store Connect Account

team_id "Q2CBPJ58CA" # Developer Portal Team ID
itc_team_id "18742801" # App Store Connect Team ID

If your project has different bundle identifiers per environment (i.e. beta, app store), you can define that by using `for_platform` and/or `for_lane` block declaration.

```ruby hljs
app_identifier "net.sunapps.1"
apple_id "felix@krausefx.com"
team_id "Q2CBPJ58CC"

for_platform :ios do
team_id '123' # for all iOS related things
for_lane :test do
app_identifier 'com.app.test'
end
end

You only have to use `for_platform` if you're using `platform [platform_name] do` in your `Fastfile`.

_fastlane_ will always use the lane specific value if given, otherwise fall « PreviousNext »

---

# https://docs.fastlane.tools/getting-started/android/screenshots

- Docs »
- Android »
- Getting Started »
- Screenshots
- Edit on GitHub
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

# _fastlane_ screenshots for Android

Your app screenshots are probably the most important thing when it comes to convincing potential users to download or purchase your app. Unfortunately, many apps don't do screenshots well. This is often because taking screenshots of your app and then preparing them for display is time consuming, and it's hard to get everything right and consistent! For example:

- Are the screenshots in Google Play inconsistent with your latest app design?
- Is your app localized into many languages that require different screenshots for each?
- Is the same content displayed for each of your size variations?

_fastlane_ tools can automate this process, making it fast and consistent while giving you beautiful results!

## Capture Screenshots Automatically

_screengrab_ works with _fastlane_ to automate the process of capturing screenshots of your app. It allows you to:

- Capture hundreds of screenshots in multiple languages on any simulator
- Do something else while the computer takes the screenshots for you
- Configure it once, and store the configuration so anyone on the team can run it
- Get a summary of how your app looks like across all supported devices and languages

After _screengrab_ completes, it will show you summary of the screenshots you captured:

### Getting Started Using Espresso

_screengrab_ uses the capabilities of Android's built-in Instrumented tests combined with Espresso to drive interactions with your app.

To start writing UI Tests with Espresso, checkout the Create UI tests with Espresso Test Recorder video which talks about the Espresso Recording feature for writing UI tests. To learn more about UI testing in Android, refer to the Testing UI for a Single App guide.

### Installing _screengrab_

Install the gem:

```hljs nginx
sudo gem install screengrab

#### Gradle dependency

Add the test dependency to your Gradle build:

```java hljs
androidTestImplementation 'tools.fastlane:screengrab:x.x.x'

The latest version is ![Download](https://search.maven.org/artifact/tools.fastlane/screengrab)

#### Configuring your Manifest Permissions

Ensure that the following permissions exist in your `src/debug/AndroidManifest.xml`

```xml hljs

### Configuring your UI Tests for _screengrab_

1. To handle automatic switching of locales, add `@ClassRule public static final LocaleTestRule localeTestRule = new LocaleTestRule();` to /app/java/(AndroidTest)/ExampleInstrumentedTest.java or to your tests class
2. To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

###### Example UI Test Class (Using JUnit4)

```java hljs
@RunWith(JUnit4.class)
public class ExampleInstrumentedTest {
@ClassRule
public static final LocaleTestRule localeTestRule = new LocaleTestRule();

@Rule

@Test
public void testTakeScreenshot() {
Screengrab.screenshot("before_button_click");

// Your custom onView...
onView(withId(R.id.fab)).perform(click());

Screengrab.screenshot("after_button_click");
}
}

There is an example project showing how to use JUnit 3 or 4 and Espresso with the screengrab Java library to capture screenshots during a UI test run.

Using JUnit 4 is preferable because of its ability to perform actions before and after the entire test class is run. This means you will change the device's locale far fewer times when compared with JUnit 3 running those commands before and after each test method.

When using JUnit 3 you'll need to add a bit more code:

- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getTestLocale());` in `setUp()`
- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getEndingLocale());` in `tearDown()`
- Use `Screengrab.screenshot("name_of_screenshot_here");` to capture screenshots at the appropriate points in your tests

If you're having trouble getting your device unlocked and the screen activated to run tests, try using `ScreenUtil.activateScreenForTesting(activity);` in your test setup.

#### Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to UI Automator which fixes a number of problems compared to the original strategy:

- Shadows/elevation are correctly captured for Material UI
- Multi-window situations are correctly captured (dialogs, etc.)
- Works on Android N

```java hljs
Screengrab.setDefaultScreenshotStrategy(new UiAutomatorScreenshotStrategy());

### Clean Status Bar

You can use QuickDemo to clean up the status bar for your screenshots.

### Generating Screenshots with Screengrab

- Run `./gradlew assembleDebug assembleAndroidTest` manually to generate debug and test APKs
- You can also create a lane and use `build_android_app`:
`ruby
desc "Build debug and test APK for screenshots"
lane :build_for_screengrab do
gradle(
task: 'clean'
)
build_android_app(
task: 'assemble',
build_type: 'Debug'
)
build_android_app(
task: 'assemble',
build_type: 'AndroidTest'
)
end`
- Run `fastlane screengrab` in your app project directory to generate screenshots
- You will be prompted to provide any required parameters which are not in your `Screengrabfile`, or provided as command line arguments
- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran `fastlane screengrab`

## Upload Screenshots to Google Play

After generating your screenshots using `fastlane screengrab`, you'll usually want to upload them to Google Play.

To upload the screenshots stored in `fastlane/metadata/android`, just run:

```no-highlight
fastlane supply

## Use in Fastfile

To put all of this together so that anyone on your team could trigger generating and uploading new screenshots, you can define a _fastlane_ lane called `screenshots`. It would be responsible for:

1. Running your app through _screengrab_ to automatically capture your screenshots
2. Having _supply_ send your screenshots to Google Play for use in the store

Add the following code to your `fastlane/Fastfile`:

```ruby hljs
lane :screenshots do
capture_android_screenshots
upload_to_play_store
end

To get a list of all available options for each of the steps, run

```no-highlight
fastlane action capture_android_screenshots
fastlane action upload_to_play_store

## Advanced _screengrab_

Launch Arguments

You can provide additional arguments to your testcases on launch. These strings will be available in your tests through `InstrumentationRegistry.getArguments()`.

```ruby hljs
launch_arguments([\
"username hjanuschka",\
"build_number 201"\
])

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

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/android/release-deployment

- Docs »
- Android »
- Getting Started »
- Release Deployment
- Edit on GitHub
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

# Deploy to Google Play using _fastlane_

## Building your app

_fastlane_ takes care of building your app by delegating to your existing Gradle build. Just add the following to your `Fastfile`:

```ruby hljs
lane :playstore do
gradle(
task: 'assemble',
build_type: 'Release'
)
end

Try running the lane with:

```no-highlight
fastlane playstore

When that completes you should have the appropriate APK ready to go in the standard output directory. To get a list of all available parameters for the `gradle` action, run:

```no-highlight
fastlane action gradle

## Uploading your APK

To upload your binary to Google Play, _fastlane_ uses a tool called _supply_. Because _supply_ needs authentication information from Google, if you haven't yet done the _supply_ setup steps, please do those now!

With that done, simply add a call to _supply_ to the lane you set up above:

```ruby hljs
lane :playstore do
gradle(
task: 'assemble',
build_type: 'Release'
)
upload_to_play_store # Uploads the APK built in the gradle step above and releases it to all production users
end

This will also:

- Upload app metadata from `fastlane/metadata/android` if you previously ran `fastlane supply init`
- Upload expansion files (obbs) found under the same directory as your APK as long as:
- They are identified by type as **main** or **patch** by containing `main` or `patch` in their file names
- There is at most one of each type
- Upload screenshots from `fastlane/metadata/android` if you previously ran _screengrab_
- Create a new production build
- Release the production build to all users

If you would like to capture and upload screenshots automatically as part of your deployment process, check out the fastlane screenshots for Android guide to get started!

To gradually roll out a new build you can use:

```ruby hljs
lane :playstore do
# ...
upload_to_play_store(
track: 'rollout',
rollout: '0.5'
)
end

To get a list of all available parameters for the _upload\_to\_play\_store_ action, run:

```no-highlight
fastlane action upload_to_play_store

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/getting-started/android/running-tests

- Docs »
- Android »
- Getting Started »
- Running Tests
- Edit on GitHub
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

# Running Android tests using _fastlane_

To run your unit tests using fastlane, add the following to your `Fastfile`

```ruby hljs
lane :tests do
gradle(task: "test")
end

Replace `"test"` with the gradle task name for running unit tests of your app.

Additionally you can specify more options for building and testing your app, check out the list of all available parameters

To use the newly created lane, just run

```no-highlight
fastlane tests

### Setting up _fastlane_ to run on CI

To run Android tests using _fastlane_ on a Continuous Integration service, check out the Continuous Integration docs.

Since _fastlane_ stores all configuration in simple configuration files, and runs via the command line, it supports every kind of CI system.

We also prepared some docs to help you get started with some of the popular CI systems.

**Self-Hosted CIs**

- Jenkins
- Bamboo
- GitLab

**Hosted CIs**

- Circle
- Travis
- Visual Studio

If your CI system isn't listed here, no problem, _fastlane_ runs on any CI. To trigger _fastlane_, just add the command you would usually run from your terminal:

### Posting build results

If you want to post test results on Slack, Hipchat, or other team chat client, check out the available fastlane actions.

##### Hipchat

To post a message when _fastlane_ encounters a test or build failure, add the following to your `Fastfile`:

```ruby hljs
error do |ex|
hipchat(message: "Tests have failed!",
channel: "Room or @username",
success: false)
end

##### Other services

The above example uses Hipchat, but _fastlane_ supports many other services out there.

GitHub« PreviousNext »

---

# https://docs.fastlane.tools/img/getting-started/android/fastlane-init.png)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/img/getting-started/android/creating-service-account.png)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/actions/validate_play_store_json_key/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/advanced/Appfile):

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/img/getting-started/android/supply-init.png)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/android/screenshots/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/android/release-deployment/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

# https://docs.fastlane.tools/getting-started/android/running-tests/)

- Docs »
- ```

* * *

# 404

**Page not found**

GitHub

---

