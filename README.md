# yandex_mapkit_lite

[![Build Status](https://shields.io/github/actions/workflow/status/surfstudio/yandex-mapkit-lite-flutter/main.yml?logo=github&logoColor=white)](https://github.com/surfstudio/yandex-mapkit-lite-flutter)
[![Coverage Status](https://img.shields.io/codecov/c/github/surfstudio/yandex-mapkit-lite-flutter?logo=codecov&logoColor=white)](https://app.codecov.io/gh/surfstudio/yandex-mapkit-lite-flutter)
[![Pub Version](https://img.shields.io/pub/v/yandex_mapkit_lite?logo=dart&logoColor=white)](https://pub.dev/packages/yandex_mapkit_lite)
[![Pub Likes](https://badgen.net/pub/likes/yandex_mapkit_lite)](https://pub.dev/packages/yandex_mapkit_lite)
[![Pub popularity](https://badgen.net/pub/popularity/yandex_mapkit_lite)](https://pub.dev/packages/yandex_mapkit_lite/score)
![Flutter Platform](https://badgen.net/pub/flutter-platform/yandex_mapkit_lite)

## Description

**This library is a fork of the package yandex_mapkit 3.4.0.**

**yandex_mapkit** implements the functionality of MapKit full version (https://yandex.ru/dev/mapkit/doc/en/).

**yandex_mapkit_lite** contains basic MapKit features, including working with the map, a traffic layer, 
offline maps (only in the paid version), LocationManager, and UserLocationLayer.

Using the lite version of MapKit allows you to reduce the application size by an average of 30%.

### Features

* [X] Working with Placemarks/Polylines/Polygons/Circles - adding, updating, removing, tap events, styling
* [X] Working with collections of map objects
* [X] Working with clusters
* [X] Moving around the map
* [X] Setting map bounds
* [X] Showing current user location
* [X] Styling the map
* [X] Working with geo objects

**Removed:**
* [X] Address suggestions
* [X] Basic driving/bicycle routing
* [X] Basic address direct/reverse search
* [X] Showing current traffic conditions

❗️If you need all the features, we recommend using the original package [yandex_mapkit](https://pub.dev/packages/yandex_mapkit)

A flutter plugin for displaying yandex maps on iOS and Android.

|             | Android |   iOS   |
|-------------|---------|---------|
| __Support__ | SDK 21+ | iOS 12+ |

__Disclaimer__: This project uses Yandex Mapkit which belongs to Yandex  
When using Mapkit refer to these [terms of use](https://yandex.com/dev/mapkit/doc/en/conditions)

## Installation

Add `yandex_mapkit_lite` to your `pubspec.yaml` file:

```yaml
dependencies:
  yandex_mapkit_lite: $currentVersion$
```

## Getting Started

### Generate your API Key

1. Go to https://developer.tech.yandex.ru/services/
2. Create a `MapKit Mobile SDK` key

### Setup for iOS

* Specify your API key and locale in `ios/Runner/AppDelegate.swift`. It should be similar to the following

```swift
import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    YMKMapKit.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    YMKMapKit.setApiKey("YOUR_API_KEY") // Your generated API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

* Uncomment `platform :ios, '9.0'` in `ios/Podfile` and change to `platform :ios, '12.0'`

```ruby
# Uncomment this line to define a global platform for your project
platform :ios, '12.0'
```

### Setup for Android

* Add dependency `implementation 'com.yandex.android:maps.mobile:4.4.0-lite'` to `android/app/build.gradle`

```groovy
dependencies {
    implementation 'com.yandex.android:maps.mobile:4.4.0-lite'
}
```

* Specify your API key and locale in your custom application class.  
  If you don't have one the you can create it like so

`android/app/src/main/.../MainApplication.java`

```java
import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        MapKitFactory.setLocale("YOUR_LOCALE"); // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("YOUR_API_KEY"); // Your generated API key
    }
}
```

`android/app/src/main/.../MainApplication.kt`

```kotlin
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("YOUR_API_KEY") // Your generated API key
  }
}
```

* In your `android/app/src/main/AndroidManifest.xml`

Add permissions `<uses-permission android:name="android.permission.INTERNET"/>` and `<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>`

Find `application` tag and replace `android:name` to the name of your custom application class prefixed by a dot `.`.
In the end it should look like the following

```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <application
      android:name=".MainApplication" >
```

### Example

For usage examples refer to example [app](https://github.com/Unact/yandex_mapkit/tree/master/example)

![image](https://user-images.githubusercontent.com/8961745/100362969-26e23880-300d-11eb-9529-6ab36beffa51.png)

### Additional remarks

YandexMapkit always works with __one language__ only.  
Due to native constraints after the application is launched it can't be changed.

#### Android

##### Hybrid Composition

By default android views are rendered using [Hybrid Composition](https://flutter.dev/docs/development/platform-integration/platform-views).
To render the `YandexMap` widget on Android using Virtual Display(old composition), set AndroidYandexMap.useAndroidViewSurface to false.
Place this anywhere in your code, before using `YandexMap` widget.

```dart
AndroidYandexMap.useAndroidViewSurface = false;
```
