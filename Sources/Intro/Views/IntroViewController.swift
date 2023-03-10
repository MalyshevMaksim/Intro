import UIKit
import CommonUI

public final class IntroViewController: LifecycleObserveViewController {

    private let intro: Intro
    private let introView = IntroView()

    public init(intro: Intro) {
        self.intro = intro
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = introView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        introView.render(intro)
    }

    public override func willEnterForeground() {
        view.layoutSubviews()
    }
}
