public struct Feature {
    
    public  init(title: String, description: String, animation: String) {
        self.title = title
        self.description = description
        self.animation = animation
    }
    
    let title: String
    let description: String
    let animation: String
}

struct Intro {
    let features: [Feature]
    let onContinueButtonTapped: () -> Void
}
