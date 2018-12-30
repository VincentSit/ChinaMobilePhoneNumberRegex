# ChinaMobilePhoneNumberRegex

## [中文文档](https://github.com/VincentSit/ChinaMobilePhoneNumberRegex/blob/master/README-CN.md "Chinese documentation")

A set of regular expressions to match the mobile phone number in mainland China.

## Regular Expressions ([PCRE])

### Match all numbers (Phone number + IoT number + Data only number)
`^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7[^29\D](?(?<=4)(?:0\d|1[0-2]|9\d)|\d{2})|9[189]\d{2}|6[67]\d{2}|4(?:10\d|40\d|6\d{2}|8\d{2}|[579]\d{2}))\d{6}$`

### Match all numbers with SMS (Phone number + Data only number)
`^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7[^29\D](?(?<=4)(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[67]\d{2}|4[579]\d{2})\d{6}$`

### Mobile phone number

#### Match all（Carrier + MVNO）
`^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7[^29\D](?(?<=4)(?:0[0-5]|9\d))|9[189]\d{2}|6[67]\d{2})\d{6}$`

#### Match all（Carrier + MVNO + Satellite + Emergency）
`^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7[^29\D](?(?<=4)(?:0\d|1[0-2]|9\d)|\d{2})|9[189]\d{2}|6[67]\d{2})\d{6}$`

#### Match Carrier
`^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7[^0129\D](?(?<=4)(?:0[0-5]|9\d))|9[189]\d{2}|66\d{2})\d{6}$`

##### Match China Mobile
`^(?:\+?86)?1(?:3[^0-3\D](?(?<=4)[^9\D])|5[^3-6\D]|8[23478]|78|98)\d{8}$`

##### Match China Unicom
`^(?:\+?86)?1(?:3[0-2]|[578][56]|66)\d{8}$`

##### Match China Telecom
`^(?:\+?86)?1(?:3[34](?(?<=4)(?:9)|\d)\d|53\d{2}|8[019]\d{2}|7[347](?(?<=4)(?:0[0-5]))|9[19]\d{2})\d{6}$`

##### Match Inmarsat (Satellite Communications)
`^(?:\+?86)?1749\d{7}$`

##### Match Emergency Communication Support Center of [MIIT]() (Emergency communications)
`^(?:\+?86)?174(0[0-6]|1[0-2])\d{6}$`

#### Match MVNO
`^(?:\+?86)?1(?:7[01]|67)\d{8}$`

##### Match China Mobile
`^(?:\+?86)?170[356]\d{7}$`

##### Match China Unicom
`^(?:\+?86)?1(?:70[4789]|71\d|67\d)\d{7}$`

##### Match China Telecom
`^(?:\+?86)?170[0-2]\d{7}$`

### IoT number

#### Match all
`^(?:\+?86)?14(?:10\d|40\d|6\d{2}|8\d{2})\d{8}$`

#### Match China Mobile
`^(?:\+?86)?14(40|8\d)\d{9}$`

#### Match China Unicom
`^(?:\+?86)?146\d{10}$`

#### Match China Telecom
`^(?:\+?86)?1410\d{9}$`

### Data only number

#### Match all
`(?:\+?86)?^14[579]\d{8}$`

#### Match China Mobile
`^(?:\+?86)?147\d{8}$`

#### Match China Unicom
`^(?:\+?86)?145\d{8}$`

#### Match China Telecom
`^(?:\+?86)?149\d{8}$`

## Test/Debug Online

https://regex101.com   
https://regexr.com   
https://www.debuggex.com （PCRE visualizer）

## Rules

#### Carrier

- Voice calls / SMS / Data traffic
- 11 digits
 
| Carrier <sup>[1]<sup/> | Prefix |
| --- | --- |
| China Mobile | 134-0~8 / 135 / 136 / 137 / 138 / 139 / 150 / 151 / 152 / 157 / 158 / 159 / 178 / 182 / 183 / 184 / 187 / 188 / 198 |
| China Unicom | 130 / 131 / 132 / 155 / 156 / 166 / 175 / 176 / 185 / 186 |
| China Telecom | 133 / 134-9 / 153 / 173 / 174-00~05 / 177 / 180 / 181 / 189 / 191 / 199 |
| Inmarsat (Satellite) <sup>[2]<sup/> | 174-9 |
| Emergency Communication Support Center of MIIT (Emergency communications) | 174-06~12 |


#### MVNO

- Voice calls / SMS / Data traffic
- 11 digits

| Carrier <sup>[1]<sup/> | Prefix |
| --- | --- |
| China Mobile | 1703 / 1705 / 1706 |
| China Unicom | 167 / 1704 / 1707 / 1708 / 1709 / 171 |
| China Telecom | 1700 / 1701 / 1702 |

#### IoT

- Data traffic
- 13 digits

| Carrier <sup>[1]<sup/> | Prefix |
| --- | --- |
| China Mobile | 1440X / 148XX |
| China Unicom | 146XX |
| China Telecom | 1410X |

#### Data-plans only

- Voice calls (Partial) / SMS / Data traffic
- 11 digits

| Carrier <sup>[1]<sup/> | Prefix | Voice calls <sup>[3]<sup/> |
| --- | --- | --- |
| China Mobile | 147 | Yes |
| China Unicom | 145 | No |
| China Telecom | 149 | Yes |

1. Since [MNP] has been piloted in some areas, for users who have changed to another carrier, the mobile phone number prefix can no longer reflect its current carrier.
2. Operated by China Transport Telecommunication & Information Center.
3. According to the relevant documents of the [MIIT], the voice call function is allowed in 145 / 147 / 149 prefixes, carriers can decide whether to provide voice call function according to the needs of their customers. At present, the 147 / 149 prefixes that supports voice calls is available.

## Reference

[Telephone numbers in China - Wikipedia]


## Release Notes

#### 2018.12.30
- Add an optional country code match.
- Fix 17X prefix cannot match when matching non-174X prefix (e.g. 178).
- Fix non-numbers in negated character classes is not excluded.

#### 2018.12.29
- Add support for 146 / 149 / 167 / 191 / 1440X / 148XX / 1410X / 174\-00\~05 / 174\-06\~12 / 174\-9 prefix.

#### 2017.08.09
- Add support for 166 / 198 / 199 prefix.

#### 2016.10.15
- Add English documentation.
- Add support for 175 prefix.
- Remove test project.
- Fix 1349 matching issues.

#### 2016.04.05
- Add the 171 prefix support.
- Separate 14\* prefix matching.
- Improve the MVNO prefix matching.

#### 2014.12.19
- Initial release.


## License

MIT

[PCRE]: https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions

[MNP]: https://en.wikipedia.org/wiki/Mobile_number_portability

[MIIT]: https://en.wikipedia.org/wiki/Ministry_of_Industry_and_Information_Technology

[Telephone numbers in China - Wikipedia]: https://en.wikipedia.org/wiki/Telephone_numbers_in_China


