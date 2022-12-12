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
``` -->

# Credit Card Flutterme

This is a credit card customizable widget and validation package by Flutterme.

The credit card package have support for majority of the credit cards available with automatic detection and validations. These detection and validations can be disable in cases where no needed. Below are they list of supported cards validations. To know what type a value accept, check [Values & Types](#values--types)

> **Note:** Supported cards are updated and will be more in the future updates.

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
|11   |Verve            |`false`  |

## Features
<details>
  <summary>
    <h4>UI Customization</h4>
  </summary>
  
  - ##### Background Color (backgroundColor):
    To set the background color of the card. This can not be a gradient. To set a gradient background color use the `backgroundGradient`. *backgroundColor* and *backgroundGradient* can't be set at same time.
  - ##### Background Gradient Color (backgroundGradient):
    This is to set a background gradient color for the card. *backgroundColor* and *backgroundGradient* can't be set at same time.
  - ##### Background Image(backgroundImage):
	This is to set a background image for the card. When set, *backgroundColor* and *backgroundGradient* have no effects.
  - ##### Border Radius (borderRadius):
	Adjustment of card border radius.
  - ##### Border Shadow (borderShadow):
	Allows the controls of card elevation and shadow directions.
  - ##### Card Title (title):
	To display the card title.
  - ##### Card Title Style (titleStyle):
	To style the card title text.
  - ##### Card Number (number):
	To display the card number.
  - ##### Card Number Style (numberStyle):
	To style the card number text.
  - ##### Card Valid Thru (validThru):
	To display the card valid thru date.
  - ##### Card Valid Thru (validThruStyle):
	To style the card valid thru date.
  - ##### Card CVV (cvv):
	To display the card cvv.
  - ##### Card CVV Style (cvvStyle):
	To style the card cvv text.
  - ##### Card Holder (holder):
	To display the card Holder.
  - ##### Card HolderStyle (holderStyle):
	To style the card holder name.
</details>

<details>
  <summary>
    <h4>Validation Customization</h4>
  </summary>

  - ##### Card Number Mask (CardNumberMask): 
    This allow you to choose how your card number is been masked for privacy reasons from list of options which are:
    -  **`full`** - This display non of the characters of your card number. E.g `**** **** **** ****`
    - **`first4Last4`** - This display only the first 4 and last 4 characters of your card number. E.g `1234 **** **** 5678`
    - **`first6last2`** - This display only the first 6 and last 2 characters of your card number. E.g `1234 56** **** **76`
    - **`first2last6`** - This display only the first 2 and last 6 characters of your card number. E.g `12** **** **68 9876`
    - **`none`** - This display all the characters of your card number. E.g `1234 5678 9876 5633`
  - ##### CVV Mask (CVVMask):
    This allow you to choose how your card number is been masked for privacy reasons from list of options which are:
    -  **`full`** - This display non of the characters of your card CVV. E.g `***`
    - **`none`** - This display all the characters of your card number. E.g `123`
</details>
		 
## Values & Types

| No: |       Value       |      Type      |
|-----|-------------------|----------------|
|1    |American Express   |`true`          |
|2    |Diners Club        |`true`          |
|3    |Discover           |`true`          |
|4    |Elo                |`true`          |
|5    |Hiper/Hipercard    |`true`          |
|6    |JCB                |`true`          |
|7    |Maestro            |`true`          |
|8    |Mastercard         |`true`          |
|9    |Mir                |`true`          |
|10   |Union Pay          |`true`          |
|11   |Visa               |`true`          |


<div align="center">
  <h2>Flutterme Dashatar Is Here 🥳!</h2>
  
  <img src="https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png" width="500" alt="Dashatar"/>
  
  <h4>Special THANKS to our authors and contributions</h4>
  <a href="https://github.com/orgs/fluttermeorg/people">
    <img src="https://contrib.rocks/image?repo=fluttermeorg/credit_card_flutterme" alt="authors and contributions"/>
  </a>
  
  Any issue(s) discovered should be reported at [issues](https://github.com/fluttermeorg/credit_card_flutterme/issues)
  <br/>
  Any contribution(s) should be submitted at [contributions](https://github.com/fluttermeorg/credit_card_flutterme/pulls)
  <br/>
  Checkout [flutterme for more](https://github.com/fluttermeorg)
</div>