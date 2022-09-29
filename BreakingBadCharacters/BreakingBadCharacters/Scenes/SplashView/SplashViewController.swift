//
//  ViewController.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import Alamofire
import NVActivityIndicatorView
import UIKit

class SplashViewController: UIViewController {

    let appTitle = UILabel()
    let appSubtitle = UILabel()
    var elements = [SearchElement]()
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
        CharacterService.getCharacters { [weak self] result in
            switch result {
            case .success(let element):
                self?.elements = element
                print(self?.elements as Any)

            case .failure(let error):
                print(error)
            }
        }
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupHomeView()
            self.activityIndicator.stopAnimating()
        }
    }
}
