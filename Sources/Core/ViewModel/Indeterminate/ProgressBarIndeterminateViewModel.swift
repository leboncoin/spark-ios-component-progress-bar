//
//  ProgressBarIndeterminateViewModel.swift
//  SparkProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
/// Indeterminate ViewModel use the IndeterminateStyle ViewModel because the style are the same
final class ProgressBarIndeterminateViewModel: ProgressBarMainViewModel<ProgressBarGetColorsUseCase> {

    // MARK: - Properties

    @Published var isAnimating: Bool {
        didSet {
            self.isAnimatedDidUpdate()
        }
    }
    @Published private(set) var animatedData: ProgressBarAnimatedData?
    @Published private(set) var animationType: ProgressBarIndeterminateAnimationType?
    @Published private(set) var animationStatus: ProgressBarIndeterminateStatus?
    @Published private(set) var indicatorOpacity: Double?

    private let getAnimatedDataUseCase: ProgressBarGetAnimatedDataUseCaseable

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: Theme,
        intent: ProgressBarIntent,
        shape: ProgressBarShape,
        isAnimating: Bool,
        getColorsUseCase: ProgressBarGetColorsUseCase = ProgressBarGetColorsUseCase(),
        getAnimatedDataUseCase: ProgressBarGetAnimatedDataUseCaseable = ProgressBarGetAnimatedDataUseCase()
    ) {
        self.isAnimating = isAnimating

        self.getAnimatedDataUseCase = getAnimatedDataUseCase

        super.init(
            for: frameworkType,
            theme: theme,
            intent: intent,
            shape: shape,
            getColorsUseCase: getColorsUseCase
        )
    }

    // MARK: - Update

    override func updateAll() {
        super.updateAll()

        self.isAnimatedDidUpdate()
    }

    private func isAnimatedDidUpdate() {
        self.animationStatus = self.isAnimating ? .start : .stop
        self.animationType = self.isAnimating ? .easeIn : .none
        self.indicatorOpacity = (self.animationType == .none) ? 0 : 1
    }

    // MARK: - Animation

    func updateAnimatedData(from trackWidth: CGFloat) {
        self.animatedData = self.getAnimatedDataUseCase.execute(
            type: self.animationType,
            trackWidth: trackWidth
        )
    }

    func animationStepIsDone() {
        if self.isAnimating {
            self.animationType?.next()
        } else {
            self.animationStatus = .stop
        }
    }

    func easeInAnimatedData(trackWidth: CGFloat) -> ProgressBarAnimatedData {
        return self.getAnimatedDataUseCase.execute(
            type: .easeIn,
            trackWidth: trackWidth
        )
    }

    func easeOutAnimatedData(trackWidth: CGFloat) -> ProgressBarAnimatedData  {
        return self.getAnimatedDataUseCase.execute(
            type: .easeOut,
            trackWidth: trackWidth
        )
    }

    func resetAnimatedData(trackWidth: CGFloat) -> ProgressBarAnimatedData {
        return self.getAnimatedDataUseCase.execute(
            type: .reset,
            trackWidth: trackWidth
        )
    }
}
