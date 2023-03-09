//
//  IntroViewController.swift
//  Events
//
//  Created by m.malyshev on 20.01.2023.
//

import UIKit
import CommonUI

final class IntroViewController: LifecycleObserveViewController {

    private let presenter: IntroPresenterProtocol
    private let introView: IntroViewProtocol

    init(presenter: IntroPresenterProtocol, introView: IntroViewProtocol) {
        self.presenter = presenter
        self.introView = introView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = introView as? UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadFeatures()
    }

    override func willEnterForeground() {
        view.layoutSubviews()
    }
}
