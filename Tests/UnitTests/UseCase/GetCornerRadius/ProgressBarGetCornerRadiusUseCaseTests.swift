//
//  ProgressBarGetCornerRadiusUseCaseTests.swift
//  SparkProgressBarTests
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkProgressBar
@_spi(SI_SPI) import SparkThemingTesting

final class ProgressBarGetCornerRadiusUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let borderMock = BorderGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_cornerRadius_when_shape_is_rounded_case() {
        self.testExecute(
            givenShape: .rounded,
            expectedRadius: self.borderMock.radius.full
        )
    }

    func test_execute_cornerRadius_when_shape_is_square_case() {
        self.testExecute(
            givenShape: .square,
            expectedRadius: 0
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarGetCornerRadiusUseCaseTests {

    func testExecute(
        givenShape: ProgressBarShape,
        expectedRadius: CGFloat
    ) {
        // GIVEN
        let useCase = ProgressBarGetCornerRadiusUseCase()

        // WHEN
        let cornerRadius = useCase.execute(
            shape: givenShape,
            border: self.borderMock
        )

        // THEN
        XCTAssertEqual(
            cornerRadius,
            expectedRadius,
            "Wrong corner radius for .\(givenShape) shape case"
        )
    }
}
