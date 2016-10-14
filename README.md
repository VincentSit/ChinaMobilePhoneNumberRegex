# ChinaMobilePhoneNumberRegex

## [中文文档](https://github.com/VincentSit/ChinaMobilePhoneNumberRegex/blob/master/README-CN.md "Chinese documentation")

A set of regular expressions to match the mobile phone number in mainland China.

## Regular Expressions

#### Match all:

[`^(?:13\d|14[57]|15[^4\D]|17[^249\D]|18\d)\d{8}$`](https://regexper.com/#%5E(%3F%3A13%5Cd%7C14%5B57%5D%7C15%5B%5E4%5CD%5D%7C17%5B%5E249%5CD%5D%7C18%5Cd)%5Cd%7B8%7D%24)

#### Except satellite phone numbers:

[`^(?:13(?!49)\d|14[57]|15[^4\D]|17[^249\D]|18\d)\d{8}$`](https://regexper.com/#%5E(%3F%3A13(%3F!49)%5Cd%7C14%5B57%5D%7C15%5B%5E4%5CD%5D%7C17%5B%5E249%5CD%5D%7C18%5Cd)%5Cd%7B8%7D%24)

#### Except data-only phone numbers:

[`^(?:13\d|15[^4\D]|17[^249\D]|18\d)\d{8}$`](https://regexper.com/#%5E(%3F%3A13%5Cd%7C15%5B%5E4%5CD%5D%7C17%5B%5E249%5CD%5D%7C18%5Cd)%5Cd%7B8%7D%24)

#### Except both satellite and data-only phone numbers:

[`^(?:13(?!49)\d|15[^4\D]|17[^249\D]|18\d)\d{8}$`](https://regexper.com/#%5E(%3F%3A13(%3F!49)%5Cd%7C15%5B%5E4%5CD%5D%7C17%5B%5E249%5CD%5D%7C18%5Cd)%5Cd%7B8%7D%24)

<br>
Note: These regular expressions can only match the **mobile phone number** in **mainland China**.


## Test/Debug Online

[https://regex101.com/](https://regex101.com/)

## Rules

| Prefix | Provider | Network |
| --- | --- | --- |
| 130/1/2 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 133 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom")<sup>[1]<sup/> | [CDMA](https://en.wikipedia.org/wiki/CDMA "CDMA") |
| 1340–1348 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 1349 | [ChinaSat](https://en.wikipedia.org/wiki/ChinaSat "ChinaSat") | [Satellite](https://en.wikipedia.org/wiki/Satellite "Satellite") |
| 135/6/7/8/9 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 145 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")<sup>[2]<sup/> |
| 147 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [TD-SCDMA](https://en.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA")/[GSM](https://en.wikipedia.org/wiki/GSM "GSM")<sup>[3]<sup/> |
| 150/1/2/8/9 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 153 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom")<sup>[4]<sup/> | [CDMA](https://en.wikipedia.org/wiki/CDMA "CDMA") |
| 155 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 156 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM")/[WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")<sup>[5]<sup/> |
| 157 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [TD-SCDMA](https://en.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA") |
| 1700/1/2 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom") | [CDMA2000](https://en.wikipedia.org/wiki/CDMA2000 "CDMA2000") |
| 1703/5/6 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [TD-SCDMA](https://en.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA")/[GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 1704/7/8/9 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")/[GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 171 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")/[GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 176 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | FDD-LTE/[TD-LTE](https://en.wikipedia.org/wiki/TD-LTE "TD-LTE") |
| 177 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom") | FDD-LTE/[TD-LTE](https://en.wikipedia.org/wiki/TD-LTE "TD-LTE") |
| 178 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [TD-LTE](https://en.wikipedia.org/wiki/TD-LTE "TD-LTE") |
| 180/1 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom") | [CDMA2000](https://en.wikipedia.org/wiki/CDMA2000 "CDMA2000") |
| 182/3/4 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [GSM](https://en.wikipedia.org/wiki/GSM "GSM") |
| 185/6 | [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA") |
| 187/8 | [China Mobile](https://en.wikipedia.org/wiki/China_Mobile "China Mobile") | [TD-SCDMA](https://en.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA") |
| 189 | [China Telecom](https://en.wikipedia.org/wiki/China_Telecom "China Telecom") | [CDMA2000](https://en.wikipedia.org/wiki/CDMA2000 "CDMA2000") |

1. Formerly [China Unicom](https://en.wikipedia.org/wiki/China_Unicom "China Unicom")
2. Data-plans only. Have the ability to send or receive text or multimedia messages. Do not have the ability to make or receive calls.
3. Same as 2.
4. Same as 1.
5. Upgradeable to WCDMA.

Note: 170 and 171, are allocated to [Mobile virtual network operator](https://en.wikipedia.org/wiki/Mobile_virtual_network_operator "Mobile virtual network operator").

This table is quote from [Telephone numbers in China](https://en.wikipedia.org/wiki/Telephone_numbers_in_China#Mobile_phones) in Wikipedia and made some changes to suit the actual situation.

Recommended that you [watch](https://github.com/VincentSit/ChinaMobilePhoneNumberRegex/subscription) this project to get notifications once it has been updated.

## License

Regular expressions are MIT-licensed. 

The documentation is licensed CC BY-SA 3.0.


