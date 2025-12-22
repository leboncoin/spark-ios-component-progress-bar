//
//  ProgressBarIntentTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarIntentTests: XCTestCase {

    // MARK: - Tests

    func test_default_value() {
        // GIVEN / WHEN
        let defaultIntent = ProgressBarIntent.default

        // THEN
        XCTAssertEqual(defaultIntent, .basic)
    }

    func test_all_cases_count() {
        // GIVEN / WHEN
        let allCases = ProgressBarIntent.allCases

        // THEN
        XCTAssertEqual(allCases.count, 9)
    }

    func test_all_cases_contain_expected_values() {
        // GIVEN / WHEN
        let allCases = ProgressBarIntent.allCases

        // THEN
        XCTAssertTrue(allCases.contains(.accent))
        XCTAssertTrue(allCases.contains(.alert))
        XCTAssertTrue(allCases.contains(.basic))
        XCTAssertTrue(allCases.contains(.danger))
        XCTAssertTrue(allCases.contains(.info))
        XCTAssertTrue(allCases.contains(.main))
        XCTAssertTrue(allCases.contains(.neutral))
        XCTAssertTrue(allCases.contains(.success))
        XCTAssertTrue(allCases.contains(.support))
    }
}
