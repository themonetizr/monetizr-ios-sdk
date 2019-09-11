[![Version](https://img.shields.io/cocoapods/v/Monetizr.svg?style=flat)](http://cocoapods.org/pods/Monetizr)
[![License](https://img.shields.io/cocoapods/l/Monetizr.svg?style=flat)](http://cocoapods.org/pods/Monetizr)
[![Platform](https://img.shields.io/cocoapods/p/Monetizr.svg?style=flat)](http://cocoapods.org/pods/Monetizr)
# TheMonetizr SDK
### Useful links

* [API reference] (https://api3.themonetizr.com/docs)
* [API Integration guide] (https://docs.themonetizr.com/api/index.html)

### Dependencies
* [Alamofire - Elegant HTTP Networking in Swift] (https://github.com/Alamofire/Alamofire)
* [AlamofireImage - an image component library for Alamofire] (https://github.com/Alamofire/AlamofireImage)
* [ImageSlideshow - Swift image slideshow] (https://github.com/zvonicek/ImageSlideshow)

### Installation
Requires iOS 10.0+

#### CocoaPods

```swift
pod 'Monetizr', '~> 3.1'
```

#### Manual
```swift
Copy "Monetizr-SDK" folder to your project and resolve dependencies
```

### Usage

In applicationDidFinishLaunching(_:) do the initialization with token provided to you

```swift
Monetizr.shared.token = String
```

If Apple Pay support is planned in applicationDidFinishLaunching(_:) do the configuration

```swift
Monetizr.shared.setApplePayMerchantID(id: String)
Monetizr.shared.setCompanyName(name: String)
Monetizr.shared.setStripeToken(token: String)
```

Optionally you can set languge - might not be availeble, check with Monetizr team

```swift
Monetizr.shared.setLanguage(language: "en_EN")
```
Import "Monetizr" to your project

```swift
import Monetizr
```

To show product or to get product data and show in your custom view

```swift
Monetizr.shared.getProductForTag(tag: String, show: Bool) { success, error, product in ()}
```

If custom product view is used to start checkout with Apple Pay

```swift
Monetizr.shared.buyWithApplePay(selectedVariant: selectedVariant!, tag: tag!) { success, error in ()}
```

### Manual usage of *Monetizr.shared* with custom product views

Open product view

```swift
func openProductViewForProduct(product: Product, tag: String)
```

Checkout variant for product with tag

```swift
func checkoutSelectedVariantForProduct(selectedVariant: PurpleNode, tag: String, completionHandler: @escaping (Bool, Error?, Checkout?) -> Void)
```

Increase impression count for session

```swift
func increaseImpressionCount()
```

Increase click count for session

```swift
func increaseClickCountInSession()
```

Increase checkout count for session

```swift
func increaseCheckoutCountInSession()
```

Get session duration in seconds

```swift
func sessionDurationSeconds() -> Int
```

Get session duration in miliseconds

```swift
func sessionDurationMiliseconds() -> Int
```

Telemetrics - Create a new entry for impressionvisible

```swift
func impressionvisibleCreate(tag: String?, fromDate:Date?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for clickreward

```swift
func clickrewardCreate(tag: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for design

```swift
func designCreate(numberOfTriggers: Int?, funnelTriggerList: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for dismiss

```swift
func dismissCreate(tag: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for install

```swift
func installCreate(deviceIdentifier: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for update

```swift
func updateCreate(deviceIdentifier: String, bundleVersion: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for firstimpression

```swift
func firstimpressionCreate(sessionDuration: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for playerbehaviour

```swift
func playerbehaviourCreate(deviceIdentifier: String, gameProgress: Int?, sessionDuration: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for purchase

```swift
func purchaseCreate(deviceIdentifier: String, triggerTag: String?, productPrice: String?, currency: String?, country: String?, city: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for session end

```swift
func sessionEnd(deviceIdentifier: String, startDate: String?, endDate: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for session start

```swift
func sessionCreate(deviceIdentifier: String, startDate: String?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for encounter

```swift
func encounterCreate(triggerType: String?, completionStatus: Int?, triggerTag: String?, levelName: String?, difficultyLevelName: String?, difficultyEstimation: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for firstimpressionclick

```swift
func firstimpressionclickCreate(firstImpressionClick: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for firstimpressioncheckout

```swift
func firstimpressioncheckoutCreate(firstImpressionCheckout: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```

Telemetrics - Create a new entry for firstimpressionpurchase

```swift
func firstimpressionpurchaseCreate(firstImpressionPurchase: Int?, completionHandler: @escaping (Bool, Error?, Any?) -> Void)
```