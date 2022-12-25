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

# <b>Credit Card Flutterme</b>

This is a credit card customizable widget and validation package by [Flutterme](https://github.com/fluttermeorg).

The credit card package has support for the majority of the credit cards available with automatic detection and validations. This detection and validation can be disabled in cases where not needed. Below is they list of supported card validations. To know what type of value accept.

> **Note:** Supported cards are updated and will be more in future updates.

| No: | Card Type        | Support |
| --- | ---------------- | ------- |
| 1   | American Express | `true`  |
| 2   | Diners Club      | `true`  |
| 3   | Discover         | `true`  |
| 4   | Elo              | `true`  |
| 5   | Hiper/Hipercard  | `true`  |
| 6   | JCB              | `true`  |
| 7   | Maestro          | `true`  |
| 8   | Mastercard       | `true`  |
| 9   | Mir              | `true`  |
| 10  | Union Pay        | `true`  |
| 11  | Visa             | `true`  |
| 11  | Verve            | `false` |

## <b>Features</b>

### <b>UI Customization For FMCreditCard()</b>

- #### <b>Width (width)</b>
  This controls the width of the credit card. Note that the width can be your device width, however, know that width restriction has been set between [300]-[430].

- #### <b>Height (height)</b>
  This controls the height of the credit card. Note that the height can be your device height, however, know that height restriction has been set between [200]-[250].

- #### <b>Padding (padding)</b>
  Creates an inner space [padding] between the credit card border and the inner widgets.

- #### <b>Margin (margin)</b>
  Creates an outer space [margin] between the credit card border and the outside layouts.

- #### <b>Color (color)</b>
  To set the background color of the card. This can not be a gradient. To set a gradient background color use the `backgroundGradient`. `backgroundColor` and `backgroundGradient` can't be set at the same time.

- #### <b>Image (image)</b>
  This is to set a background image for the card. When set, `backgroundColor` and `backgroundGradient` have no effects.

- #### <b>Border (border)</b>
  Adjustment of card border.

- #### <b>Border Radius (borderRadius)</b>
  Adjustment of card border radius.

- #### <b>Box Shadow (boxShadow)</b>
  Allows the controls of card elevation and shadow directions.

- #### <b>Gradient(gradient)</b>
  This is to set a background gradient color for the card. `backgroundColor` and `backgroundGradient` can't be set at the same time.

- #### <b>Title (title)</b>
  This is the card title placement area.

- #### <b>Title Style (titleStyle)</b>
  This is to style the card title name placement area.

- #### <b>Number (number)</b>
  This is the card number placement area.

- #### <b>Number Style (numberStyle)</b>
  This is to style the card number placement area.

- #### <b>Number Mask Type (numberMaskType)</b>
  To mask the card number for security reasons. This accepts all Mask Types.

- #### <b>Valid Thur (validThur)</b>
  This is the card valid thur placement area.

- #### <b>Valid Thur Style (validThurStyle)</b>
  This is to style the card valid thur placement area.

- #### <b>Valid Thur Mask Type (validThurMaskType)</b>
  To mask the Valid Thur for security reasons. This only accepts the `full` and `none` Mask Types. If any other type is passed it will return "****".

- #### <b>CVV (cvv)</b>
  This is the CVV placement area.

- #### <b>CVV Style (cvvStyle)</b>
  This is to style the CVV placement area.

- #### <b>CVV Mask Type (cvvMaskType)</b>
  To mask the CVV for security reasons. This only accepts the `full` and `none` Mask Types. If any other type is passed it will return "***".

- #### <b>Holder (holder)</b>
  This is the card holder name placement area.

- #### <b>Holder Style (holderStyle)</b>
  This is to style the card holder name placement area.

<br/>

### <b>Validation Customization For FMCreditCard()</b>

- #### Number Mask (FMMaskType): 
  This allows you to choose how your card number is been masked for privacy reasons from a list of options which are:
  -  **`full`** - This display non of the characters of your card number. E.g `**** **** **** ****`
  - **`first4Last4`** - This display only the first 4 and last 4 characters of your card number. E.g `1234 **** **** 5678`
  - **`first6last2`** - This display only the first 6 and last 2 characters of your card number. E.g `1234 56** **** **76`
  - **`first2last6`** - This display only the first 2 and last 6 characters of your card number. E.g `12** **** **68 9876`
  - **`none`** - This display all the characters of your card number. E.g `1234 5678 9876 5633`
  
- #### Valid Thur Mask (FMMaskType):
  This allows you to choose how your card is valid thru the date is been masked:
  -  **`full`** - This display non of the characters of your card CVV. E.g `****`
  - **`none`** - This display all the characters of your card number. E.g `1234`
  - 
- #### CVV Mask (FMMaskType):
  This allows you to choose how your card CVV number is been masked:
  -  **`full`** - This display non of the characters of your card CVV. E.g `***`
  - **`none`** - This display all the characters of your card number. E.g `123`

<br/>
<br/>
<br/>

<div align="center">
  <h2>Flutterme Dashatar Is Here 🥳!</h2>
  
  <img src="https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png" width="500" alt="Dashatar"/>
  
  <h4>Special THANKS to our authors and contributions</h4>
  <a href="https://github.com/orgs/fluttermeorg/people">
    <img src="https://contrib.rocks/image?repo=fluttermeorg/flutterme_credit_card" alt="authors and contributions"/>
  </a>
  
  Any issue(s) discovered should be reported at [issues](https://github.com/fluttermeorg/flutterme_credit_card/issues)
  <br/>
  Any contribution(s) should be submitted at [contributions](https://github.com/fluttermeorg/flutterme_credit_card/pulls)
  <br/>
  Checkout [flutterme for more](https://github.com/fluttermeorg)
</div>