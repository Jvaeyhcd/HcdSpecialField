# HcdSpecialField

[![Version](https://img.shields.io/cocoapods/v/HcdSpecialField.svg?style=flat)](http://cocoapods.org/pods/HcdSpecialField)
[![Platform](https://img.shields.io/cocoapods/p/HcdSpecialField.svg)](http://cocoapods.org/pods/HcdSpecialField)
[![License](https://img.shields.io/github/license/Jvaeyhcd/HcdSpecialField.svg)](http://cocoapods.org/pods/HcdSpecialField)
[![Tag](https://img.shields.io/github/tag/Jvaeyhcd/HcdSpecialField.svg
)](http://cocoapods.org/pods/HcdSpecialField)
[![Author](https://img.shields.io/badge/author-Jvaeyhcd-f07c3d.svg)](http://www.jvaeyhcd.cc)

HcdSpecialField is a special field, it can be used in 3 different scene.

![Example](https://github.com/Jvaeyhcd/HcdSpecialField/blob/master/images/example.gif?raw=true)

You can use it when you want to input a redeem code to exchange a coupon in your App.

![Redeem Code](https://github.com/Jvaeyhcd/HcdSpecialField/blob/master/images/redeem_code.png?raw=true)

Also it can be used in your App when you want to design a input passcode viewController like iPhone passcode's viewController.

![Passcode](https://github.com/Jvaeyhcd/HcdSpecialField/blob/master/images/passcode.png?raw=true)

Finally i used it in my App to input a bike number like Mobike's App.

![Mobike](https://github.com/Jvaeyhcd/HcdSpecialField/blob/master/images/mobike_number.png?raw=true)

## Requirements
* Swift3 or higher
* Xcode 8 or higher
* iOS 8.0 or higher

## Demo
Build and run the Example/HcdSpecialField.xcworkspace project in Xcode to see HcdSpecialField in action.

## Installation

### Manual Install
All you need to do is drop `HcdSpecialField` files into your project.

### CocoaPods
The recommended approach for installating `HcdSpecialField` is via the CocoaPods package manager, as it provides flexible dependency management and dead simple installation. For best results, it is recommended that you install via CocoaPods >= 0.28.0 using Git >= 1.8.0 installed via Homebrew.

Install CocoaPods if not already available:
```
$ [sudo] gem install cocoapods
$ pod setup
```
Change to the directory of your Xcode project:
```
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
```
Edit your Podfile and add `HcdSpecialField`:
```
platform :ios, '8.0'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
target 'MyProject' do
  pod 'HcdSpecialField'

end
```
Install into your Xcode project:
```
$ pod install
```
Open your project in Xcode from the .xcworkspace file (not the usual project file)
```
$ open MyProject.xcworkspace
```

## Contact
If you have some suggest please post me an [issue](https://github.com/Jvaeyhcd/HcdSpecialField/issues/new).

## Author
* **Huang ChengDa** - [Jvaeyhcd](www.jvaeyhcd.cc)

## LICENSE

MIT License.
