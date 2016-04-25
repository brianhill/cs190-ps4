/*:
# CS 190 Problem Set #4&mdash;Transforming Arrays

CS 190 [Course Home Page]( http://physics.stmarys-ca.edu/classes/CS190_S16/index.html )

Due: Thursday, March 3rd, 2016.

## Reading for this Problem Set

* In the [Intermediate Swift GitHub Repository]( https://github.com/brianhill/intermediate-swift ) study the two playgrounds numbered 3_1 and 3_2.

* The above two playgrounds follow _and_ _simplify_ _to_ _an_ _intermediate_ _level_, Sections 3.1 and 3.2 in the "Collections" Chapter of [Advanced Swift]( https://www.objc.io/books/advanced-swift/ ), by Chris Eidhof and Airspeed Velocity. Although the above two playground stand on their own, they could be used with Eidhof and Velocity in hand to take your understanding to an advanced level.

## Directions for this Problem Set

* Fork this repo and make a local copy.
* Open this playground in Xcode. If necessary, adjust Xcode so that it shows the output of the unit tests.
* Follow the directions in Parts 1, 2 and 3.
* When the unit tests pass, commit your changes to your local repo and then push them to your fork.

## Part 1 (2 pts): Using Closures

Implement raiseArrayToPower using anyPower. It's a one-liner once you figure out how to use anyPower. When you have it implemented it right, the two Part 1 unit tests will pass.
*/

let oneTwoThree = [1, 2, 3]

func anyPower(n: Int) -> (Int->Int) {
    func nthPower(base: Int) -> Int {
        var result = 1
        for _ in 0 ..< n {
            result *= base
        }
        return result
    }
    return nthPower
}

func raiseArrayToPower(n: Int, arrayOfInts: [Int]) -> [Int] {
    return [1, 5] // a meaningless hard-coded implementation for you to replace with an actual implementation
}

/*:
## Part 2 (2 pts): Using Filter

Implement the following function using filter. When you have it implemented right, the two Part 2 unit tests will pass.
*/

func keepOnlyEvenValues(arrayOfInts: [Int]) -> [Int] {
    return [1, 5] // a meaningless hard-coded implementation for you to replace with an actual implementation
}

/*:
## Part 3 (1 pt): Using Reduce

Implement totalRentalHours using reduce(). When you have it implemented right, the last of the five unit tests will pass.
*/

struct CarRental {
    var price = 0.0
    var hours = 0.0
}

let thisMonthsRentals = [
    CarRental(price: 29.99, hours: 24.0),
    CarRental(price: 99.50, hours: 168.0),
    CarRental(price: 15.25, hours: 2.5)
]

func totalRentalHours(rentals: [CarRental]) -> Double {
    return 5.0 // a meaningless hard-coded implementation for you to replace with an actual implementation
}

import XCTest

class CollectionsTestSuite: XCTestCase {
    
    // Part 1 unit tests
    func testPart1Count() {
        let oneThirtytwoTwofortythree = raiseArrayToPower(5, arrayOfInts: oneTwoThree)
        XCTAssertEqual(oneThirtytwoTwofortythree.count, oneTwoThree.count, "Oh-oh.")
    }
    
    func testPart1Last() {
        let oneThirtytwoTwofortythree = raiseArrayToPower(5, arrayOfInts: oneTwoThree)
        XCTAssertEqual(243, oneThirtytwoTwofortythree.last, "Drat.")
    }
    
    // Part 2 unit tests
    func testPart2Count() {
        let evenValues = keepOnlyEvenValues(oneTwoThree)
        XCTAssertEqual(1, evenValues.count, "Rats.")
    }
    
    func testPart2Last() {
        let evenValues = keepOnlyEvenValues(oneTwoThree)
        XCTAssertEqual(2, evenValues.last, "Ratz.")
    }
    
    // Part 3 unit test
    func testPart3() {
        XCTAssertEqual(194.5, totalRentalHours(thisMonthsRentals), "Darn.")
    }
}

/*:
The following arcana is necessary to support the execution of unit tests in a playground, but isn't documented in [Apple's XCTest Library]( https://github.com/apple/swift-corelibs-xctest ). I gratefully acknowledge Stuart Sharpe for sharing it in his blog post, [TDD in Swift Playgrounds]( http://initwithstyle.net/2015/11/tdd-in-swift-playgrounds/ ).
*/

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(description)")
    }
}

XCTestObservationCenter.sharedTestObservationCenter().addTestObserver(PlaygroundTestObserver())

CollectionsTestSuite.defaultTestSuite().runTest()
