# [POSIX] Standard Regular Expressions

## [中文文档](/POSIX-CN.md "Chinese documentation")

Regular expressions mainly have [PCRE] and [POSIX] two standards, The [POSIX] standard has five flavors: BRE (Basic Regular Expressions), GNU BRE, ERE (Extended Regular Expressions), GNU ERE, and the deprecated SRE (Simple Regular Expressions). The syntax is not consistent between each other.

Since the [PCRE] standard is widely supported by various popular programming languages, the regular expressions in this project are all [PCRE]. The [POSIX] standard is currently supported primarily by various Unix-like system built-in commands, such as `awk`, `sed` and other commands in Linux.

Due to the large number of Unix-like systems and a long history, there are many implementation versions of the same command (for example, `awk` has many implementations such as `awk`, `gawk`, `mawk`, `nawk`), they may use different flavors and it's difficult to be compatible with all flavors and commands. Therefore, the regular expressions listed in this document are only compatible with the following two flavors:

- GNU BRE (gsed - GNU sed)
- GNU ERE (gawk - GNU awk, ggrep - GNU grep)

Read more about regular expression standards in [Wikipedia - Regular expression].

## Regular Expressions

### Match all numbers (Phone number + IoT number + Data only number)

<!--
Caution:

GitHub Markdown requires the '|' symbol inserted in the table to be escaped, so:

- The '\' on the left of the '|' in all GNU ERE regular expressions is used to escape '|'.
- The '\\' on the left of the '|' in all GNU BRE regular expressions is used to escape '\|'.

In order to confirm that the rendering is correct, an unescaped regular expression must be written in the comment above the escaped regular expression.

See https://help.github.com/articles/organizing-information-with-tables/#formatting-content-within-your-table
-->

<!--
| GNU ERE | `^(+?86)?1(3[0-9]{3}|5[01235-9][0-9]{2}|8[0-9]{3}|7([0-35-9][0-9]{2}|4(0[0-9]|1[0-2]|9[0-9]))|9[0-35-9][0-9]{2}|6[2567][0-9]{2}|4((10|4[01])[0-9]{3}|[68][0-9]{4}|[579][0-9]{2}))[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\|5[01235-9][0-9]\{2\}\|8[0-9]\{3\}\|7\([0-35-9][0-9]\{2\}\|4\(0[0-9]\|1[0-2]\|9[0-9]\)\)\|9[0-35-9][0-9]\{2\}\|6[2567][0-9]\{2\}\|4\((10|4[01])[0-9]\{3\}\|[68][0-9]\{4\}\|[579][0-9]\{2\}\)\)[0-9]\{6\}$` 
-->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3[0-9]{3}\|5[01235-9][0-9]{2}\|8[0-9]{3}\|7([0-35-9][0-9]{2}\|4(0[0-9]\|1[0-2]\|9[0-9]))\|9[0-35-9][0-9]{2}\|6[2567][0-9]{2}\|4((10\|4[01])[0-9]{3}\|[68][0-9]{4}\|[579][0-9]{2}))[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\\|5[01235-9][0-9]\{2\}\\|8[0-9]\{3\}\\|7\([0-35-9][0-9]\{2\}\\|4\(0[0-9]\\|1[0-2]\\|9[0-9]\)\)\\|9[0-35-9][0-9]\{2\}\\|6[2567][0-9]\{2\}\\|4\(\(10\\|4[01]\)[0-9]\{3\}\\|[68][0-9]\{4\}\\|[579][0-9]\{2\}\)\)[0-9]\{6\}$` |

### Match all numbers with SMS (Phone number + Data only number)

<!-- 
| GNU ERE | `^(+?86)?1(3[0-9]{3}|5[01235-9][0-9]{2}|8[0-9]{3}|7([0-35-9][0-9]{2}|4(0[0-9]|1[0-2]|9[0-9]))|9[0-35-9][0-9]{2}|6[2567][0-9]{2}|4[579][0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\|5[01235-9][0-9]\{2\}\|8[0-9]\{3\}\|7\([0-35-9][0-9]\{2\}\|4\(0[0-9]\|1[0-2]\|9[0-9]\)\)\|9[0-35-9][0-9]\{2\}\|6[2567][0-9]\{2\}\|4[579][0-9]\{2\}\)[0-9]\{6\}$` |
 -->
 
| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3[0-9]{3}\|5[01235-9][0-9]{2}\|8[0-9]{3}\|7([0-35-9][0-9]{2}\|4(0[0-9]\|1[0-2]\|9[0-9]))\|9[0-35-9][0-9]{2}\|6[2567][0-9]{2}\|4[579][0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\\|5[01235-9][0-9]\{2\}\\|8[0-9]\{3\}\\|7\([0-35-9][0-9]\{2\}\\|4\(0[0-9]\\|1[0-2]\\|9[0-9]\)\)\\|9[0-35-9][0-9]\{2\}\\|6[2567][0-9]\{2\}\\|4[579][0-9]\{2\}\)[0-9]\{6\}$` |

### Mobile phone number

#### Match all

<!-- 
| GNU ERE | `^(+?86)?1(3[0-9]{3}|5[01235-9][0-9]{2}|8[0-9]{3}|7([235-8][0-9]{2}|4(0[0-9]|1[0-2]|9[0-9]))|9[0-35-9][0-9]{2}|66[0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\|5[01235-9][0-9]\{2\}\|8[0-9]\{3\}\|7\([235-8][0-9]\{2\}\|4\(0[0-9]\|1[0-2]\|9[0-9]\)\)\|9[0-35-9][0-9]\{2\}\|66[0-9]\{2\}\)[0-9]\{6\}$` |
 -->
 
| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3[0-9]{3}\|5[01235-9][0-9]{2}\|8[0-9]{3}\|7([235-8][0-9]{2}\|4(0[0-9]\|1[0-2]\|9[0-9]))\|9[0-35-9][0-9]{2}\|66[0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-9]\{3\}\\|5[01235-9][0-9]\{2\}\\|8[0-9]\{3\}\\|7\([235-8][0-9]\{2\}\\|4\(0[0-9]\\|1[0-2]\\|9[0-9]\)\)\\|9[0-35-9][0-9]\{2\}\\|66[0-9]\{2\}\)[0-9]\{6\}$` |

#### Match China Mobile

<!-- 
| GNU ERE | `^(+?86)?1(3(4[0-8]|[5-9][0-9])|5[012789][0-9]|7[28][0-9]|8[23478][0-9]|9[578][0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(3\(4[0-8]\|[5-9][0-9]\)\|5[012789][0-9]\|7[28][0-9]\|8[23478][0-9]\|9[578][0-9]\)[0-9]\{7\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3(4[0-8]\|[5-9][0-9])\|5[012789][0-9]\|7[28][0-9]\|8[23478][0-9]\|9[578][0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(3\(4[0-8]\\|[5-9][0-9]\)\\|5[012789][0-9]\\|7[28][0-9]\\|8[23478][0-9]\\|9[578][0-9]\)[0-9]\{7\}$` |

#### Match China Unicom

<!-- 
| GNU ERE | `^(+?86)?1(3[0-2]|[578][56]|66|96)[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-2]\|[578][56]\|66|96\)[0-9]\{8\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3[0-2]\|[578][56]\|66\|96)[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?1\(3[0-2]\\|[578][56]\\|66\\|96\)[0-9]\{8\}$` |

#### Match China Telecom

<!-- 
| GNU ERE | `^(+?86)?1(3(3[0-9]|49)[0-9]|53[0-9]{2}|8[019][0-9]{2}|7([37][0-9]{2}|40[0-5])|9[0139][0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3\(3[0-9]\|49\)[0-9]\|53[0-9]\{2\}\|8[019][0-9]\{2\}\|7\([37][0-9]\{2\}\|40[0-5]\)\|9[0139][0-9]\{2\}\)[0-9]\{6\}$` |
 -->
 
| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(3(3[0-9]\|49)[0-9]\|53[0-9]{2}\|8[019][0-9]{2}\|7([37][0-9]{2}\|40[0-5])\|9[0139][0-9]{2})[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?1\(3\(3[0-9]\\|49\)[0-9]\\|53[0-9]\{2\}\\|8[019][0-9]\{2\}\\|7\([37][0-9]\{2\}\\|40[0-5]\)\\|9[0139][0-9]\{2\}\)[0-9]\{6\}$` |

#### Match China Broadcast Network

<!-- 
| GNU ERE | `^(+?86)?192[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?192[0-9]\{8\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?192[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?192[0-9]\{8\}$` |

#### Match Inmarsat (Satellite Communications)

<!-- 
| GNU ERE | `^(+?86)?1749[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1749[0-9]\{7\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1749[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1749[0-9]\{7\}$` |

#### Match Emergency Communication Support Center of MIIT (Emergency communications)

<!-- 
| GNU ERE | `^(+?86)?174(0[6-9]|1[0-2])[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?174\(0[6-9]\|1[0-2]\)[0-9]\{6\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?174(0[6-9]\|1[0-2])[0-9]{6}$` |
| GNU BRE | `^\(+\?86\)\?174\(0[6-9]\\|1[0-2]\)[0-9]\{6\}$` |

### MVNO number

#### Match all

<!-- 
| GNU ERE | `^(+?86)?1(7[01]|6[257])[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?1\(7[01]\|6[257]\)[0-9]\{8\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(7[01]\|6[257])[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?1\(7[01]\\|6[257]\)[0-9]\{8\}$` |

#### Match China Mobile

<!-- 
| GNU ERE | `^(+?86)?1(65[0-9]|70[356])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(65[0-9]\|70[356]\)[0-9]\{7\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(65[0-9]\|70[356])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(65[0-9]\\|70[356]\)[0-9]\{7\}$` |

#### Match China Unicom

<!-- 
| GNU ERE | `^(+?86)?1(70[4789]|71[0-9]|67[0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(70[4789]\|71[0-9]\|67[0-9]\)[0-9]\{7\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(70[4789]\|71[0-9]\|67[0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(70[4789]\\|71[0-9]\\|67[0-9]\)[0-9]\{7\}$` |

#### Match China Telecom

<!-- 
| GNU ERE | `^(+?86)?1(70[012]|62[0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(70[012]\|62[0-9]\)[0-9]\{7\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1(70[012]\|62[0-9])[0-9]{7}$` |
| GNU BRE | `^\(+\?86\)\?1\(70[012]\\|62[0-9]\)[0-9]\{7\}$` |

### IoT number

#### Match all

<!-- 
| GNU ERE | `^(+?86)?14([14]0|41|[68][0-9])[0-9]{9}$` |
| GNU BRE | `^\(+\?86\)\?14\([14]0\|41\|[68][0-9]\)[0-9]\{9\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?14([14]0\|41\|[68][0-9])[0-9]{9}$` |
| GNU BRE | `^\(+\?86\)\?14\([14]0\\|41\\|[68][0-9]\)[0-9]\{9\}$` |

#### Match China Mobile

<!-- 
| GNU ERE | `^(+?86)?14(4[01]|8[0-9])[0-9]{9}$` |
| GNU BRE | `^\(+\?86\)\?14\(4[01]\|8[0-9]\)[0-9]\{9\}$` |
 -->

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?14(4[01]\|8[0-9])[0-9]{9}$` |
| GNU BRE | `^\(+\?86\)\?14\(4[01]\\|8[0-9]\)[0-9]\{9\}$` |

#### Match China Unicom

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?146[0-9]{10}$` |
| GNU BRE | `^\(+\?86\)\?146[0-9]\{10\}$` |

#### Match China Telecom

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?1410[0-9]{9}$` |
| GNU BRE | `^\(+\?86\)\?1410[0-9]\{9\}$` |

### Data only number

#### Match all

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?14[579][0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?14[579][0-9]\{8\}$` |

#### Match China Mobile

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?147[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?147[0-9]\{8\}$` |

#### Match China Unicom

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?145[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?145[0-9]\{8\}$` |

#### Match China Telecom

| Command | Regular Expression |
| --- | --- |
| GNU ERE | `^(+?86)?149[0-9]{8}$` |
| GNU BRE | `^\(+\?86\)\?149[0-9]\{8\}$` |


[PCRE]: https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions

[POSIX]: https://en.wikipedia.org/wiki/Regular_expression#Standards

[Wikipedia - Regular expression]: https://en.wikipedia.org/wiki/Regular_expression

