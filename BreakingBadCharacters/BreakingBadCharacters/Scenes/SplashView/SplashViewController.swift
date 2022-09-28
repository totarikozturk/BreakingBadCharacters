//
//  ViewController.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import NVActivityIndicatorView
import UIKit

class SplashViewController: UIViewController {

    let appTitle = UILabel()
    let appSubtitle = UILabel()
    let activityIndicator = NVActivityIndicatorView(
        frame: CGRect(x: 0,
                      y: 0,
                      width: 100,
                      height: 100),
        type: .ballScaleRippleMultiple,
        color: CustomColor.textColor,
        padding: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        activityIndicator.startAnimating()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setupHomeView()
            self.activityIndicator.stopAnimating()
        }
    }
}
