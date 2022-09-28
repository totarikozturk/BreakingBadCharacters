//
//  MakeSplashView.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import SnapKit
import UIKit

extension SplashViewController {

    func configureView() {
        view.addSubview(appTitle)
        view.addSubview(appSubtitle)
        view.addSubview(activityIndicator)
        view.backgroundColor = CustomColor.backGroundColor
        makeAppTitle()
        makeAppSubTitle()
        makeActivityIndicator()
    }

    func makeAppTitle() {
        appTitle.text = "Splash.appTitle".localized
        appTitle.textColor = CustomColor.titleColor
        appTitle.font = .systemFont(ofSize: 54, weight: .bold )
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(72)
            make.centerX.equalTo(view.center.x)
        }
    }

    func makeAppSubTitle() {
        appSubtitle.text = "Splash.appSubTitle".localized
        appSubtitle.textColor = CustomColor.titleColor
        appSubtitle.font = .systemFont(ofSize: 54, weight: .bold )
        appSubtitle.snp.makeConstraints { make in
            make.top.equalTo(appTitle.snp.bottomMargin).offset(16)
            make.centerX.equalTo(view.center.x)
        }
    }

    func makeActivityIndicator() {
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(view.center.y)
            make.centerX.equalTo(view.center.x)
        }
    }

    func setupHomeView() {
        DispatchQueue.main.async {
            let controller = HomeViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            self.view.window?.rootViewController = controller
        }
    }
}
