//
//  HomeViewController.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let searchBar = UISearchController()
    let viewModel: HomeViewModel

    lazy var collectionView: UICollectionView = {
        let view: UICollectionView = .init(frame: .zero, collectionViewLayout: collectionLayout)
        view.dataSource = self
        view.delegate = self
        view.alwaysBounceVertical = true
        view.backgroundColor = CustomColor.backGroundColor
        view.register(HomeViewCell.self, forCellWithReuseIdentifier: CellIdentifier.BreakingBadCell)
        return view
    }()

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Frame.ten,
                                           left: Frame.ten,
                                           bottom: Frame.ten,
                                           right: Frame.ten)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.15,
                                 height: UIScreen.main.bounds.width / 2)
        layout.scrollDirection = .horizontal
        layout.collectionView?.isScrollEnabled = true
        return layout
    }()

    init(viewModel: HomeViewModel = .init()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()

        viewModel.getData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.createTimer {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        viewModel.timer?.invalidate()
    }
}
