//
//  UIViewExtensionTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class UIViewExtensionTests: XCTestCase {
    func testAllSubviews() {
        //given
        let sut = UIView()
        
        //when
        let nestedView_level1_a = UIView()
        let nestedView_level1_b = UIView()
        let nestedView_level2 = UIView()
        nestedView_level1_a.addSubview(nestedView_level2)
        sut.addSubviews(nestedView_level1_a)
        sut.addSubviews(nestedView_level1_b)
        
        //then
        XCTAssertEqual(sut.allSubviews.count, 3)
    }
    
    func testAddSubviews() {
        //given
        let sut = UIView()
        
        //when
        let view_a = UIView()
        let view_b = UIView()
        let view_c = UIView()
        
        sut.addSubviews(view_a, view_b, view_c)
        
        //then
        XCTAssertIdentical(view_a.superview, sut)
        XCTAssertIdentical(view_b.superview, sut)
        XCTAssertIdentical(view_c.superview, sut)
    }
}
