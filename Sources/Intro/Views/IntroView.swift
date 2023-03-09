
import UIKit
import CommonUI

protocol IntroViewProtocol {
    func render(_ props: Intro)
}

final class IntroView: UIView {

    private var props: Intro?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        continueButton.stopShimmeringAnimation()
        super.layoutSubviews()
        continueButton.startShimmeringAnimation()
    }

    private lazy var continueButton: ContinueButton = {
        let button = ContinueButton(type: .system)
        //button.setTitle(Strings.EnterPhoneNumber.Buttons.continueButton, for: .normal)
        button.addTarget(self, action: #selector(onContinueButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        //layout.delegate = self
        //layout.numberOfVisibleItems = 1

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: IntroCollectionViewCell.self)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private func setupSubviews() {
        // view.backgroundColor = Colors.background.color
        addSubviews(subviews: collectionView, continueButton)
    }

    private func setupConstraints() {
//        collectionView.snp.makeConstraints {
//            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
//            $0.bottom.equalTo(continueButton.snp.top)
//        }
//        continueButton.snp.makeConstraints {
//            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(24)
//            $0.bottom.equalTo(safeAreaLayoutGuide).inset(24)
//            $0.height.equalTo(50)
//        }
    }

    @objc private func onContinueButtonTapped() {
        props?.onContinueButtonTapped()
    }
}

// MARK: - IntroViewProtocol
extension IntroView: IntroViewProtocol {

    func render(_ props: Intro) {
        self.props = props
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension IntroView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        props?.features.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let props = props else { fatalError() }

        let viewModel = IntroViewModel(
            feature: props.features[indexPath.row],
            countOfFeatures: props.features.count,
            currentFeature: indexPath.row
        )

        let cell: IntroCollectionViewCell = collectionView.dequeueCell(with: indexPath)
        cell.setup(with: viewModel)
        return cell
    }
}

//// MARK: - CollectionViewPagingLayoutDelegate
//extension IntroView: CollectionViewPagingLayoutDelegate {
//    func onCurrentPageChanged(layout: CollectionViewPagingLayout, currentPage: Int) {
//        UIImpactFeedbackGenerator(style: .light).impactOccurred()
//    }
//}
