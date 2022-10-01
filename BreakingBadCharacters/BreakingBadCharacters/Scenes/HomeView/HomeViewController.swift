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
    var collectionView: UICollectionView?
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        viewModel.getData {
            DispatchQueue.main.async {
                guard let collectionView = self.collectionView else { return }
                collectionView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.createTimer {
            DispatchQueue.main.async {
                guard let collectionView = self.collectionView else { return }
                collectionView.reloadData()
            }
        }
    }
}
