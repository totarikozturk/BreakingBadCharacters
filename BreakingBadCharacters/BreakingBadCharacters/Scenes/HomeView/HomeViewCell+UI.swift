//
//  HomeViewCell+UI.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 30.09.2022.
//

import SnapKit
import UIKit

extension HomeViewCell {

// MARK: configure
    func configure() {
        backgroundColor = CustomColor.backGroundColor
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = CustomColor.titleColor?.cgColor
        addSubview(image)
        addSubview(name)
        addSubview(nickName)
        makeImageView()
        makeNameView()
        makeNickNameView()
    }

// MARK: makeImageView
    func makeImageView() {
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-44)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
    }

// MARK: makeNameView
    func makeNameView() {
        name.lineBreakMode = .byWordWrapping
        name.numberOfLines = 0
        name.textAlignment = .center
        name.minimumScaleFactor = 1
        name.adjustsFontSizeToFitWidth = true
        name.font = .boldSystemFont(ofSize: 14)
        name.textColor = CustomColor.textColor
        name.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
    }

// MARK: makeNickNameView
    func makeNickNameView() {
        nickName.lineBreakMode = .byWordWrapping
        nickName.numberOfLines = 0
        nickName.textAlignment = .center
        nickName.minimumScaleFactor = 1
        nickName.adjustsFontSizeToFitWidth = true
        nickName.font = .boldSystemFont(ofSize: 14)
        nickName.textColor = CustomColor.textColor
        nickName.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(1)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
    }
}
