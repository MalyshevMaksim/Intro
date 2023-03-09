//
//  IntroViewController.swift
//  Events
//
//  Created by m.malyshev on 20.01.2023.
//

import UIKit
import CommonUI

public final class IntroViewController: LifecycleObserveViewController {

    private let features: [Feature]
    private let router: IntroRouterProtocol
    private let introView = IntroView()

    public init(features: [Feature], router: IntroRouterProtocol) {
        self.features = features
        self.router = router
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
        introView.render(Intro(
            features: features,
            onContinueButtonTapped: {
                self.router.route(to: .auth)
            }
        ))
    }

    public override func willEnterForeground() {
        view.layoutSubviews()
    }
}
