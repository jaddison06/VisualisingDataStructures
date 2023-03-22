//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {
    func testStack() {
        let stack = Stack<Int>();
        
        XCTAssert(stack.count == 0)
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssert(stack.count == 3)
        
        XCTAssert(try stack.pop() == 3)
        XCTAssert(try stack.pop() == 2)
        XCTAssert(try stack.pop() == 1)
        
        XCTAssert(stack.count == 0)
    }
    
    func testQueue() {
        let queue = Queue<Int>();
        
        XCTAssert(queue.count == 0)
        
        queue.push(1)
        queue.push(2)
        queue.push(3)
        
        XCTAssert(queue.count == 3)
        
        XCTAssert(try queue.pop() == 1)
        XCTAssert(try queue.pop() == 2)
        XCTAssert(try queue.pop() == 3)
        
        XCTAssert(queue.count == 0)
    }
}
