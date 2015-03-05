//
//  SortiererTestTests.swift
//  SortiererTestTests
//
//  Created by Udemy on 26.02.15.
//  Copyright (c) 2015 benchr. All rights reserved.
//

import UIKit
import XCTest

class SortiererTestTests: XCTestCase {
    
    var zahlen: [Int]!
    
    override func setUp() {
        super.setUp()
        zahlen = getRandomInts(1000000)
    }
    
    func getRandomInts(count: Int) -> [Int] {
        var erg = [Int]()
        for _ in 0..<count {
            erg.append(Int(arc4random_uniform(100)))
        }
        return erg
    }
    
    
    func testSortiererSollteArraySortierenMitBubbleSort() {
        
        var systemSorted = zahlen.sorted(<)
        
        measureBlock {
            var mySorted = Sortierer.bubbleSort(self.zahlen)
            XCTAssertEqual(systemSorted, mySorted, "Der Sortierer sollte das Array genauso sortiert haben wie die Systemfuntion sort()")
        }
    }
    
    func testSortiererSollteArraySortierenMitMergeSort() {
        
        var systemSorted = zahlen.sorted(<)
        
        measureBlock {
            var mySorted = Sortierer.mergeSort(self.zahlen)
            XCTAssertEqual(systemSorted, mySorted, "Der Sortierer sollte das Array genauso sortiert haben wie die Systemfuntion sort()")
        }
    }
    
//    func testSortiererSollteArraySortierenMitQuickSort() {
//        
//        var systemSorted = zahlen.sorted(<)
//        
//        measureBlock {
//            var mySorted = Sortierer.quickSort(self.zahlen)
//            XCTAssertEqual(systemSorted, mySorted, "Der Sortierer sollte das Array genauso sortiert haben wie die Systemfuntion sort()")
//        }
//    }
    
    func testSortiererSollteArraySortierenMitAppleSort() {
        
        
        measureBlock {
            var mySorted = self.zahlen.sorted(<)
        }
    }
    
    func testAsynchDownload() {
        
        let url = NSURL(string: "http://www.google.de")!
        let expectation = expectationWithDescription("Downloade Quelltext von \(url)")
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: url), queue: NSOperationQueue.mainQueue()) {
            response, data, error in
            
            expectation.fulfill()
            
            XCTAssertNil(error, "Error sollte nil sein")
            XCTAssertNotNil(data, "Daten sollten nicht nil sein")
            XCTAssertNotNil(response, "Response sollte nicht nil sein")
            
            if let httpRes = response as? NSHTTPURLResponse {
                XCTAssertEqual(httpRes.statusCode, 200, "HTTP-Status Code sollte 200 (OK) sein.")
            }
            else {
                XCTFail("Response ist kein NSHTTPURLResponse")
            }
            
        }
        
        waitForExpectationsWithTimeout(2, handler: nil)
    }
    
    
}


















