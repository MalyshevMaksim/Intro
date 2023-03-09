
import UIKit
import CommonUI

struct IntroViewModel {
    let feature: Feature
    let countOfFeatures: Int
    let currentFeature: Int
}

final class IntroCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let cardView = UIView()
    private let animationContainerView = UIView()
    private let animationView = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()

    private let pageControlView: PageControlView = PageControlView()

    func setup(with viewModel: IntroViewModel) {
        titleLabel.text = viewModel.feature.title
        subtitleLabel.text = viewModel.feature.description
        setupAnimation(with: viewModel.feature.animation)
        pageControlView.numberOfPages = viewModel.countOfFeatures
        pageControlView.currentPage = viewModel.currentFeature
    }

    private func setupAnimation(with name: String) {
//        animationView.pause()
//        animationView.animation = LottieAnimation.named(name)
//        animationView.backgroundBehavior = .pauseAndRestore
//        animationView.contentMode = .scaleAspectFit
//        animationView.play()
    }

    private func setupSubviews() {
        cardView.addSubviews(subviews: animationContainerView, titleLabel, subtitleLabel)
        animationContainerView.addSubview(animationView)
        contentView.addSubviews(subviews: cardView, pageControlView)
        // contentView.backgroundColor = Colors.background.color
    }

    private func setupConstraints() {
//        cardView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(24)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//        animationContainerView.snp.makeConstraints {
//            $0.leading.trailing.top.equalToSuperview()
//            $0.bottom.equalTo(titleLabel.snp.top)
//        }
//        animationView.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//            $0.height.equalTo(animationView.snp.width)
//            $0.width.equalToSuperview().multipliedBy(0.5)
//        }
//        titleLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.centerX.equalToSuperview()
//            $0.leading.trailing.equalToSuperview().inset(24)
//        }
//        subtitleLabel.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.leading.trailing.equalToSuperview().inset(24)
//            $0.top.equalTo(titleLabel.snp.bottom).inset(-16)
//            $0.bottom.equalTo(subtitleLabel)
//        }
//        pageControlView.snp.makeConstraints {
//            $0.bottom.equalToSuperview().multipliedBy(0.75)
//            $0.centerX.equalToSuperview()
//        }
    }
}

// MARK: - ScaleTransformView
//extension IntroCollectionViewCell: ScaleTransformView {
//
//    func transform(progress: CGFloat) {
//        let alpha = 1 - abs(progress) * 2
//
//        titleLabel.alpha = alpha
//        subtitleLabel.alpha = alpha
//
//        titleLabel.frame.origin.x = frame.width * 0.6 * progress + 24
//        subtitleLabel.frame.origin.x = frame.width * progress + 24
//
//        let angle = .pi * progress
//        var transform = CATransform3DIdentity
//        transform.m34 = -0.001_5
//        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
//
//        animationView.layer.transform = transform
//        animationView.alpha = abs(progress) > 0.5 ? 0 : 1
//    }
//}
