//
//  ChinaMobilePhoneNumberRegexTests.swift
//  ChinaMobilePhoneNumberRegexTests
//
//  Created by Vincent Sit on 14/12/19.
//  Copyright (c) 2014年 Vincent Sit. All rights reserved.
//

import Cocoa
import XCTest

/*
电信
2G/3G号段（CDMA2000网络）133、153、180、181、189
4G号段 177、173

联通
2G号段（GSM网络）130、131、132、155、156
3G上网卡145
3G号段（WCDMA网络）185、186
4G号段 176、185

移动
2G号段（GSM网络）有134x（0-8）、135、136、137、138、139、150、151、152、158、159、182、183、184。
3G号段（TD-SCDMA网络）有157、187、188
3G上网卡 147
4G号段 178、184

卫星通信 1349


虚拟运营商号码段：

电信 1700、1701、1702
联通 1707、1708、1709、171
移动 1705


整理如下：

```
130、131、132、133、134、135、136、137、138、139
150、151、152、153、155、156、157、158、159
173、176、177、178
180、181、182、183、184、185、186、187、188、189
171、1700、1701、1702、1705、1707、1708、1709
```
*/

class ChinaMobilePhoneNumberRegexTests: XCTestCase {
  var predicate: NSPredicate!
  var ChinaMobilePrefixes: NSArray!
  var ChinaUnicomPrefixes: NSArray!
  var ChinaTelecomPrefixes: NSArray!
  var VNOPrefixes: NSArray!
  
  override func setUp() {
    super.setUp()
    
    let regex = "(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$"
    
    self.predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    
    self.ChinaMobilePrefixes = ["134", "135", "136", "137", "138", "139", "150",
                                "151", "152", "158", "159", "182", "183", "184",
                                "157", "187", "188", "178", "184"]
    
    self.ChinaUnicomPrefixes = ["130", "131", "132", "155", "156", "185", "186",
                                "176"]
    
    self.ChinaTelecomPrefixes = ["133", "153", "180", "181", "189", "177", "173"]
    
    self.VNOPrefixes = ["171", "1700", "1701", "1702", "1705", "1707", "1708", "1709"]
  }
  
  override func tearDown() {
    self.predicate = nil
    self.ChinaMobilePrefixes = nil
    self.ChinaUnicomPrefixes = nil
    self.ChinaTelecomPrefixes = nil
    
    super.tearDown()
  }
  
  
  func doTestCorrectPhoneNumbers(phoneNumbers: NSArray!) {
    let testingTimes = 100
    let phoneNumberLength = 11
    
    for prefix in phoneNumbers as! [NSString] {
      for _ in 0...testingTimes {
        let randomNumber = arc4random() % 99999999 + 10000000
        var phoneNumber: NSString = (prefix as String) + String(randomNumber)

        if phoneNumber.length > phoneNumberLength {
          phoneNumber = phoneNumber.substringToIndex(phoneNumberLength)
        }
        
        XCTAssertTrue(self.predicate.evaluateWithObject(phoneNumber), "Pass")
      }
    }
  }
  
  func testChinaMobile() {
    self.doTestCorrectPhoneNumbers(self.ChinaMobilePrefixes)
  }
  
  func testChinaUnicom() {
    self.doTestCorrectPhoneNumbers(self.ChinaUnicomPrefixes)
  }
  
  func testChinaTelecom() {
    self.doTestCorrectPhoneNumbers(self.ChinaTelecomPrefixes)
  }
  
  func testVNO() {
    self.doTestCorrectPhoneNumbers(self.VNOPrefixes)
  }
  
}
