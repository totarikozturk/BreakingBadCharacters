//
//  ViewController.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import Alamofire
import NVActivityIndicatorView
import UIKit

// Before App launching logics are handled here
// for example if user is authenticated, fetch the initial data
class SplashViewController: UIViewController {

    let appTitle = UILabel()
    let appSubtitle = UILabel()
    let activityIndicator = NVActivityIndicatorView(
        frame: CGRect(
            x: 0,
            y: 0,
            width: 100,
            height: 100
        ),
        type: .ballScaleRippleMultiple,
        color: CustomColor.textColor,
        padding: 1
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        activityIndicator.startAnimating()

        // I want to show the splashview at list one seconds otherwise the splash will be
        //        like flashing and user does not understand what is going on the splash
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.activityIndicator.stopAnimating()
            self.setupHomeView()
        }
    }
}
