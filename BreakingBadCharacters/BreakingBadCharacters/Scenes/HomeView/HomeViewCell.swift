//
//  HomeViewCell.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 30.09.2022.
//
import Kingfisher
import UIKit

class HomeViewCell: UICollectionViewCell {

    let image = UIImageView()
    let name = UILabel()
    let nickName = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCellValue(_ characters: SearchElement) {
        updateCell(image: characters.img,
                   name: characters.name,
                   nickName: characters.nickname)
    }

    private func updateCell(image: String?, name: String?, nickName: String?) {
        guard let imageString = image else { return }
        let url = URL(string: imageString)
        self.image.kf.setImage(with: url)
        self.name.text = name
        self.nickName.text = nickName
    }
}
