public struct Intro {
    let features: [Feature]
    let buttonTitle: String
    let onContinueButtonTapped: () -> Void
    
    public init(features: [Feature], buttonTitle: String, onContinueButtonTapped: @escaping () -> Void) {
        self.features = features
        self.buttonTitle = buttonTitle
        self.onContinueButtonTapped = onContinueButtonTapped
    }
    
    public struct Feature {
        let title: String
        let description: String
        let animation: String

        public init(title: String, description: String, animation: String) {
            self.title = title
            self.description = description
            self.animation = animation
        }
    }
}
