# ChinaMobilePhoneNumberRegex

一组匹配中国大陆手机号码的正则表达式。

## 正则表达式

### 匹配所有：

[`^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A3%5Cd%7C4%5B4-9%5D%7C5%5B0-35-9%5D%7C6%5B67%5D%7C7%5B013-8%5D%7C8%5Cd%7C9%5Cd)%5Cd%7B8%7D%24)

### 匹配除虚拟运营商外的：

[`^1(?:3\d|4[4-9]|5[0-35-9]|66|7[3-8]|8\d|9\d)\d{8}$`](https://regexper.com/#%5E(%3F%3D%5Cd%7B11%7D%24)%5E1(%3F%3A3%5Cd%7C4%5B57%5D%7C5%5B%5E4%5CD%5D%7C66%7C7%5B%5E01249%5CD%5D%7C8%5Cd%7C9%5B89%5D)%5Cd%7B8%7D%24)

### 匹配除卫星号码外的：

[`/^1(?:3(?!49)\d|4[4-9]|5[0-35-9]|6[67]|7[0135-8]|8\d|9\d)\d{8}$/`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A3(%3F!49)%5Cd%7C4%5B4-9%5D%7C5%5B0-35-9%5D%7C6%5B67%5D%7C7%5B0135-8%5D%7C8%5Cd%7C9%5Cd)%5Cd%7B8%7D%24)

### 匹配除上网卡外的：

[`^1(?:3\d|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A3%5Cd%7C5%5B0-35-9%5D%7C6%5B67%5D%7C7%5B013-8%5D%7C8%5Cd%7C9%5Cd)%5Cd%7B8%7D%24)

#### 只匹配中国移动号码：

[`^1(?:34(?=[0-8])|3[5-9]|4[478]|5[012789]|70(?=[356])|78|8[23478]|98)\d{8}$`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A34(%3F%3D%5B0-8%5D)%7C3%5B5-9%5D%7C4%5B478%5D%7C5%5B012789%5D%7C70(%3F%3D%5B356%5D)%7C78%7C8%5B23478%5D%7C98)%5Cd%7B8%7D%24)

### 只匹配中国联通号码：

[`^1(?:3[012]|4[056]|5[56]|67|70(?=[4789])|7[156]|8[56])\d{8}$`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A3%5B012%5D%7C4%5B056%5D%7C5%5B56%5D%7C67%7C70(%3F%3D%5B4789%5D)%7C7%5B156%5D%7C8%5B56%5D)%5Cd%7B8%7D%24)

### 只匹配中国电信号码：

[`^1(?:33|34(?=9)|41(?=[1-9])|49|53|70(?=[012])|7[37]|74(?=0[0-5])|8[019]|9[19])\d{8}$`](https://jex.im/regulex/#!flags=&re=%5E1(%3F%3A33%7C34(%3F%3D9)%7C41(%3F%3D%5B1-9%5D)%7C49%7C53%7C70(%3F%3D%5B012%5D)%7C7%5B37%5D%7C74(%3F%3D0%5B0-5%5D)%7C8%5B019%5D%7C9%5B19%5D)%5Cd%7B8%7D%24)

<br>
注：这些正则表达式只能匹配**中国大陆**的**手机号码**。

## 在线测试/调试

https://jex.im/regulex

## 规则

| 号段 | 运营商 | 网络 | 卡类型 |
| --- | --- | --- | --- |
| 130/1/2 | [中国联通] | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 133 | [中国电信]<sup>[1]<sup/> | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 1340/1/2/3/4/5/6/7/8 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 1349 | [中国电信] | [人造卫星] | 卫星手机卡 |
| 135/6/7/8/9 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 14000~14099 | [中国联通] 预留号段 | [物联网]网号 | - |
| 14110~14199 | [中国电信] 预留号段 | [物联网]网号 | - |
| 14200~14299 | 未分配 | [物联网]网号 | - |
| 14300~14399 | 未分配 | [物联网]网号 | - |
| 1440 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM]<sup>[6]<sup/> | [USIM] 数据卡 |
| 14410~14499 | [中国移动] 预留号段 | [物联网]网号 | - |
| 145/6 | [中国联通] | [LTE]/[WCDMA]/[GSM]<sup>[2]<sup/> | [USIM] 数据卡 |
| 147/8 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM]<sup>[3]<sup/> | [USIM] 数据卡 |
| 149 | [中国电信] | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 数据卡 |
| 150/1/2/7/8/9 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 153 | [中国电信]<sup>[4]<sup/> | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 154 | 未分配 | 公众移动通信网网号 | - |
| 155/6 | [中国联通] | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 161/2/4/5 | 未分配 | 公众移动通信网网号 | - |
| 166 | [中国联通] | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 167 | [中国联通] 虚拟运营商 | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 1700/1/2 | [中国电信] 虚拟运营商 | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 1703/5/6 | [中国移动] 虚拟运营商 | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 1704/7/8/9 | [中国联通] 虚拟运营商 | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 171 | [中国联通] 虚拟运营商 | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 172 | 未分配 | 公众移动通信网网号 | - |
| 173/7 | [中国电信] | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 17400/1/2/3/4/5 | [中国电信] | [人造卫星] | 卫星手机卡 |
| 174-13~89 | 未分配 | 卫星移动通信业务专用号段 | - |
| 1749 | [北京船舶通信导航有限公司] | [Inmarsat] | 卫星手机卡 |
| 175/6 | [中国联通] | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 178 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 180/1/9 | [中国电信] | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 182/3/4/7/8 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |
| 185/6 | [中国联通] | [LTE]/[WCDMA]/[GSM] | [USIM] 手机卡 |
| 190/2/3/4/5/6/7 | 未分配 | 公众移动通信网网号 | - |
| 191/9 | [中国电信] | [LTE]/[CDMA2000]/[cdmaOne] | [USIM] 手机卡 |
| 198 | [中国移动] | [LTE]/[TD-SCDMA]/[GSM] | [USIM] 手机卡 |

1. 之前是[中国联通]。
2. 数据卡（上网卡）。可以上网或收发短信，不可以接听或拨打电话。
3. 同 2。
4. 同 1。
5. 可以升级到 WCDMA。
6. USIM 数据卡，[物联网]业务专用号段。

注：170 和 171 号段被分配给了[移动虚拟运营商](https://zh.wikipedia.org/wiki/%E7%A7%BB%E5%8A%A8%E8%99%9A%E6%8B%9F%E8%BF%90%E8%90%A5%E5%95%86 "移动虚拟运营商")。

上表引用自维基百科的[中国内地移动终端通讯号码](https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E5%86%85%E5%9C%B0%E7%A7%BB%E5%8A%A8%E7%BB%88%E7%AB%AF%E9%80%9A%E8%AE%AF%E5%8F%B7%E7%A0%81)并做了一些适当的修改。

## 更新日志

#### 2017.08.09
- 添加 166\*/198\*/199\* 号段支持。

#### 2016.10.15
- 添加英文文档。
- 添加 175 号段支持。
- 移除测试工程。
- 修复 1349\* 号段匹配问题。

#### 2016.04.05
- 添加 171 号段支持。
- 分离 14\* 号段匹配。
- 完善虚拟运营商号段匹配。

#### 2014.12.19
- 初次发布。

## 协议

正则表达式基于 MIT 协议。

文档基于 CC BY-SA 3.0 协议。


[中国移动]: https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8 "中国移动"
[中国电信]: https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1 "中国电信"
[中国联通]: https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A "中国联通"
[中国卫通]: https://en.wikipedia.org/wiki/ChinaSat "中国卫通"

[GSM]: https://zh.wikipedia.org/wiki/GSM "GSM"
[CDMA]: https://zh.wikipedia.org/wiki/CDMA "CDMA"
[CDMA2000]: https://zh.wikipedia.org/wiki/CDMA2000 "CDMA2000"
[cdmaOne]: https://zh.wikipedia.org/wiki/CdmaOne "cdmaOne"
[WCDMA]: https://en.wikipedia.org/wiki/WCDMA "WCDMA"
[LTE]: https://zh.wikipedia.org/wiki/LTE "LTE"
[TD-LTE]: https://zh.wikipedia.org/zh-cn/%E9%95%B7%E6%9C%9F%E6%BC%94%E9%80%B2%E6%8A%80%E8%A1%93 "TD-LTE"
[TD-SCDMA]: https://zh.wikipedia.org/wiki/TD-SCDMA "TD-SCDMA"
[Inmarsat]: https://zh.wikipedia.org/wiki/Inmarsat "Inmarsat"
[北京船舶通信导航有限公司]: https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E5%86%85%E5%9C%B0%E7%A7%BB%E5%8A%A8%E7%BB%88%E7%AB%AF%E9%80%9A%E8%AE%AF%E5%8F%B7%E6%AE%B5#%E5%8C%97%E4%BA%AC%E8%88%B9%E8%88%B6%E9%80%9A%E4%BF%A1%E5%AF%BC%E8%88%AA%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8 "北京船舶通信导航有限公司"

[人造卫星]: https://zh.wikipedia.org/zh-cn/%E4%BA%BA%E9%80%A0%E8%A1%9B%E6%98%9F "人造卫星"
[物联网]: https://zh.wikipedia.org/wiki/%E7%89%A9%E8%81%94%E7%BD%91 "物联网"
[移动虚拟运营商]: https://zh.wikipedia.org/wiki/%E7%A7%BB%E5%8A%A8%E8%99%9A%E6%8B%9F%E8%BF%90%E8%90%A5%E5%95%86 "移动虚拟运营商"
[USIM]: https://zh.wikipedia.org/wiki/USIM "USIM"
