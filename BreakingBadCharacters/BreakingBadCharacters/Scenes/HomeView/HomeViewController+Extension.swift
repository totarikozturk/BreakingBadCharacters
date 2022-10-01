//
//  HomeViewController+Extension.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 29.09.2022.
//

import UIKit

// MARK: UICollectionViewDelegate, UICollectionViewDataSource UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                                        withReuseIdentifier: CellIdent.BBCell,
                                        for: indexPath) as? HomeViewCell else { return UICollectionViewCell() }
        let data = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellValue(data)
        return cell
    }
}

// MARK: UISearchBarDelegate, UISearchResultsUpdating
extension HomeViewController: UISearchBarDelegate, UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        let name = text.trimmingCharacters(in:
                        .whitespacesAndNewlines)
                        .lowercased()
                        .replacingOccurrences(of: " ", with: "+")
                        .capitalized
        DispatchQueue.main.async {
            self.viewModel.getSearchCharData(name: name) {
                guard let collectionView = self.collectionView else { return }
                    collectionView.reloadData()
            }
        }
    }
}
