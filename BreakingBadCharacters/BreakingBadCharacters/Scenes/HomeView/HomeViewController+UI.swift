//
//  HomeViewController+UI.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 29.09.2022.
//

import UIKit

extension HomeViewController {

// MARK: configureView
    func configureView() {
        view.backgroundColor = CustomColor.backGroundColor
        navigationBarAppearance()
        makeSearchBar()
        makeCollectionViewLayout()
        makeCollectionView()
    }

// MARK: makeSearchBar
        func makeSearchBar() {
            searchBar.searchBar.searchBarStyle = .minimal
            searchBar.searchBar.placeholder = "Home.searchBarPlaceHolderText".localized
            searchBar.searchResultsUpdater = self
            searchBar.searchBar.tintColor = CustomColor.textColor
            searchBar.searchBar.barTintColor = CustomColor.textColor
            searchBar.searchBar.searchTextField.textColor = CustomColor.textColor
        }

// MARK: makeCollectionViewLayout
    func makeCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Frame.ten,
                                           left: Frame.ten,
                                           bottom: Frame.ten,
                                           right: Frame.ten)
        layout.itemSize = CGSize(width: self.view.frame.width / 2.15,
                                 height: self.view.frame.height / 4.4)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
    }

// MARK: makeCollectionView
    func makeCollectionView() {
        guard let collectionView = collectionView else { return }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = CustomColor.backGroundColor
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: CellIdent.BBCell)
    }

// MARK: navigationBarAppearance
    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Home.title".localized
        navigationItem.titleView?.tintColor = CustomColor.titleColor
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationItem.searchController = searchBar
    }
}
