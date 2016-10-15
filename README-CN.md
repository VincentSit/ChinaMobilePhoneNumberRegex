# ChinaMobilePhoneNumberRegex

一组匹配中国大陆手机号码的正则表达式。

## 正则表达式

#### 匹配所有：

[`^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A3%5Cd%7C4%5B57%5D%7C5%5B%5E4%5CD%5D%7C7%5B%5E249%5CD%5D%7C8%5Cd)%5Cd%7B8%7D%24)

#### 匹配除虚拟运营商外的：

[`^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^01249\D]|8\d)\d{8}$`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A3%5Cd%7C4%5B57%5D%7C5%5B%5E4%5CD%5D%7C7%5B%5E01249%5CD%5D%7C8%5Cd)%5Cd%7B8%7D%24)

#### 匹配除卫星号码外的：

[`^(?=\d{11}$)^1(?:3(?!49)\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A3(%3F!49)%5Cd%7C4%5B57%5D%7C5%5B%5E4%5CD%5D%7C7%5B%5E249%5CD%5D%7C8%5Cd)%5Cd%7B8%7D%24)

#### 匹配除上网卡外的：

[`^(?=\d{11}$)^1(?:3\d|5[^4\D]|7[^249\D]|8\d)\d{8}$`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A3%5Cd%7C5%5B%5E4%5CD%5D%7C7%5B%5E249%5CD%5D%7C8%5Cd)%5Cd%7B8%7D%24)

#### 只匹配中国移动号码：
[`^(?=\d{11}$)^1((?:3(?!49)[4-9\D]|47|5[012789]|7[8]|8[23478])\d{8}$|70[356]\d{7}$)`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1((%3F%3A3(%3F!49)%5B4-9%5CD%5D%7C47%7C5%5B012789%5D%7C7%5B8%5D%7C8%5B23478%5D)%5Cd%7B8%7D%24%7C70%5B356%5D%5Cd%7B7%7D%24))

#### 只匹配中国联通号码：
[`^(?=\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\d{8}$|70[4789]\d{7}$)`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1((%3F%3A3%5B0-2%5D%7C45%7C5%5B56%5D%7C7%5B156%5D%7C8%5B56%5D)%5Cd%7B8%7D%24%7C70%5B4789%5D%5Cd%7B7%7D%24))

#### 只匹配中国电信号码：
[`^(?=\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\d{8}$|(?:349|70[0-2])\d{7}$)`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A(%3F%3A33%7C49%7C53%7C7%5B37%5D%7C8%5B019%5D)%5Cd%7B8%7D%24%7C(%3F%3A349%7C70%5B0-2%5D)%5Cd%7B7%7D%24))

<br>
注：这些正则表达式只能匹配**中国大陆**的**手机号码**。

## 在线测试/调试

[https://regex101.com/](https://regex101.com/)

## 规则

| 号段 | 运营商 | 网络 |
| --- | --- | --- |
| 130/1/2 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 133 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信")<sup>[1]<sup/> | [CDMA](https://zh.wikipedia.org/wiki/CDMA "CDMA") |
| 1340–1348 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 1349 | [中国卫通](https://en.wikipedia.org/wiki/ChinaSat "中国卫通") | [人造卫星](https://zh.wikipedia.org/zh-cn/%E4%BA%BA%E9%80%A0%E8%A1%9B%E6%98%9F "人造卫星") |
| 135/6/7/8/9 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 145 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")<sup>[2]<sup/> |
| 147 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [TD-SCDMA](https://zh.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA")/[GSM](https://zh.wikipedia.org/wiki/GSM "GSM")<sup>[3]<sup/> |
| 150/1/2/8/9 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 153 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信")<sup>[4]<sup/> | [CDMA](https://zh.wikipedia.org/wiki/CDMA "CDMA") |
| 155 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 156 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM")/[WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")<sup>[5]<sup/> |
| 157 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [TD-SCDMA](https://zh.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA") |
| 1700/1/2 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信") | [CDMA2000](https://zh.wikipedia.org/wiki/CDMA2000 "CDMA2000") |
| 1703/5/6 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [TD-SCDMA](https://zh.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA")/[GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 1704/7/8/9 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")/[GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 171 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA")/[GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 176 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | FDD-LTE/[TD-LTE](https://zh.wikipedia.org/zh-cn/%E9%95%B7%E6%9C%9F%E6%BC%94%E9%80%B2%E6%8A%80%E8%A1%93 "TD-LTE") |
| 177 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信") | FDD-LTE/[TD-LTE](https://zh.wikipedia.org/zh-cn/%E9%95%B7%E6%9C%9F%E6%BC%94%E9%80%B2%E6%8A%80%E8%A1%93 "TD-LTE") |
| 178 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [TD-LTE](https://zh.wikipedia.org/zh-cn/%E9%95%B7%E6%9C%9F%E6%BC%94%E9%80%B2%E6%8A%80%E8%A1%93 "TD-LTE") |
| 180/1 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信") | [CDMA2000](https://zh.wikipedia.org/wiki/CDMA2000 "CDMA2000") |
| 182/3/4 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [GSM](https://zh.wikipedia.org/wiki/GSM "GSM") |
| 185/6 | [中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通") | [WCDMA](https://en.wikipedia.org/wiki/WCDMA "WCDMA") |
| 187/8 | [中国移动](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动") | [TD-SCDMA](https://zh.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA") |
| 189 | [中国电信](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信") | [CDMA2000](https://zh.wikipedia.org/wiki/CDMA2000 "CDMA2000") |

1. 之前是[中国联通](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通")。
2. 数据卡（上网卡）。可以上网或收发短信，不可以接听或拨打电话。
3. 同 2。
4. 同 1。
5. 可以升级到 WCDMA。

注：170 和 171 号段被分配给了[移动虚拟运营商](https://zh.wikipedia.org/wiki/%E7%A7%BB%E5%8A%A8%E8%99%9A%E6%8B%9F%E8%BF%90%E8%90%A5%E5%95%86 "移动虚拟运营商")。

上表引用自维基百科的[中国内地移动终端通讯号码](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E5%86%85%E5%9C%B0%E7%A7%BB%E5%8A%A8%E7%BB%88%E7%AB%AF%E9%80%9A%E8%AE%AF%E5%8F%B7%E7%A0%81)并做了一些适当的修改。

为了在未来更新时第一时间得到通知，建议您关注这个 [issue](https://github.com/VincentSit/ChinaMobilePhoneNumberRegex/issues/5)。

## 协议

正则表达式基于 MIT 协议。

文档基于 CC BY-SA 3.0 协议。

