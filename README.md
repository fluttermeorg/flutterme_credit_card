<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<!-- TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->

# Credit Card Flutterme

This is a credit card customizable widget and validation package by Flutterme.

The credit card widget have support for majority of the credit cards available with automatic detection and validations. These detection and validations can be disable in cases where no needed. Below are they list of supported cards validations.
> **Note:** Supports are updated and will be more in future updates.

| No: |    Card Type    | Support |
|-----|-----------------|---------|
|1    |American Express |`true`   |
|2    |Diners Club      |`true`   |
|3    |Discover         |`true`   |
|4    |Elo              |`true`   |
|5    |Hiper/Hipercard  |`true`   |
|6    |JCB              |`true`   |
|7    |Maestro          |`true`   |
|8    |Mastercard       |`true`   |
|9    |Mir              |`true`   |
|10   |Union Pay        |`true`   |
|11   |Visa             |`true`   |

## Features
 - #### High UI Customization
	 - **Card Mask Format (MaskFormat):** This allow you to choose how your card number is been masked for privacy reasons from list of options which are:
		 -  **`full`** - This display non of the characters of your card number. E.g `**** **** **** ****`
		 - **`first4Last4`** - This display only the first 4 and last 4 characters of your card number. E.g `1234 **** **** 5678`
		 - **`first6last4`** - This display only the first 6 and last 4 characters of your card number. E.g `1234 5678 **** 9876`
		 - **`first4last6`** - This display only the first 4 and last 6 characters of your card number. E.g `1234 **** 5678 9876`

	 - **Card Background Color (backgroundColor):** To set the background color of your card. This can not be a gradient. To set a gradient background color use the `backgroundGradient`. *backgroundColor* and *backgroundGradient* can't be set at same time.
	 - **Card Background Gradient Color (backgroundGradient):** This is to set a background gradient color for your card. *backgroundColor* and *backgroundGradient* can't be set at same time.
	 - **Card Color (color):** To set the general text color of your card. Although, you can custom individual card section text color.