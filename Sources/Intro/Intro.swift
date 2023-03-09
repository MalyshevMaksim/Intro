//
//  IntroProps.swift
//  Events
//
//  Created by m.malyshev on 21.01.2023.
//

struct Intro {
    let features: [Feature]
    let onContinueButtonTapped: () -> Void
}

public struct Feature {
    let title: String
    let description: String
    let animation: String
}
