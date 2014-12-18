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
 中国电信
 2G/3G号段：133、153、180、181、189
 4G号段： 177
 虚拟运营商号段：1700

 中国联通
 2G号段：130、131、132、155、156
 3G号段：185、186
 4G号段：176、185
 上网卡：145
 虚拟运营商号段：1709

 中国移动
 2G号段：134、135、136、137、138、139、150、151、152、158、159、182、183、184
 3G号段：157、187、188
 4G号段：178
 上网卡：147
 虚拟运营商号段：1705

 总结
 130、131、132、133、134、135、136、137、138、139
 145、147
 150、151、152、153、155、156、157、158、159      // 缺少 154
 176、177、178、1700、1705、1709
 180、181、182、183、184、185、186、187、188、189
*/

class ChinaMobilePhoneNumberRegexTests: XCTestCase {
  var predicate: NSPredicate!
  var ChinaMobilePrefixes: NSArray!
  var ChinaUnicomPrefixes: NSArray!
  var ChinaTelecomPrefixes: NSArray!
  
  override func setUp() {
    super.setUp()
    
    let regex = "(^(13\\d|14[57]|15[^4,\\D]|17[678]|18\\d)\\d{8}|170[059]\\d{7})$"
    self.predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    
    self.ChinaMobilePrefixes = ["134", "135", "136", "137", "138", "139", "150",
                                "151", "152", "158", "159", "182", "183", "184",
                                "157", "187", "188", "178", "147", "1705"]
    
    self.ChinaUnicomPrefixes = ["130", "131", "132", "155", "156", "185", "186",
                                "176", "185", "145", "1709"]
    
    self.ChinaTelecomPrefixes = ["133", "153", "180", "181", "189", "177", "1700"]
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
    
    for prefix in phoneNumbers as [NSString] {
      for _ in 0...testingTimes {
        let randomNumber = arc4random() % 99999999 + 10000000
        var phoneNumber: NSString = prefix + String(randomNumber)

        if phoneNumber.length > phoneNumberLength {
          phoneNumber = phoneNumber.substringToIndex(phoneNumberLength)
        }
        
        XCTAssertTrue(self.predicate.evaluateWithObject(phoneNumber), "Pass")
      }
    }
  }
  
  func doTestIncorrectPhoneNumbers(phoneNumbers: NSArray!) {
    //TODO: 错误 case 测试.
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
  
}
