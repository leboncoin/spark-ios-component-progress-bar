//
//  ProgressBarDoubleViewSnapshotTests.swift
//  SparkProgressBarTests
//
//  Created by robin.lemaire on 05/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkProgressBar
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class ProgressBarDoubleViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ProgressBarScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [ProgressBarConfigurationSnapshotTests<ProgressBarDoubleIntent>] = try scenario.configuration()
            for configuration in configurations {
                let view = ProgressBarDoubleView(
                    theme: self.theme,
                    intent: configuration.intent,
                    shape: configuration.shape,
                    topValue: configuration.value,
                    bottomValue: configuration.bottomValue
                )
                    .frame(width: configuration.width)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}
