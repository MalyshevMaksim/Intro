public struct Feature {
    let title: String
    let description: String
    let animation: String
}

struct Intro {
    let features: [Feature]
    let onContinueButtonTapped: () -> Void
}
