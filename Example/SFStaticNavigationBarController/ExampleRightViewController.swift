//
//  ExampleRightViewController.swift
//  IntuitiveNavigationController_Example
//
//  Created by Seth Folley on 12/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Cartography
import ChameleonFramework

class ExampleRightViewController: UIViewController {

    lazy var vcLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .flatOrangeDark
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = "Right View Controller"
        label.textAlignment = .center
        label.textColor = .flatWhite
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    lazy var pushVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push VC", for: .normal)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .flatMagenta
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var presentVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present VC", for: .normal)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .flatCoffee
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .flatWhite
        view.addSubview(vcLabel)
        view.addSubview(pushVCButton)
        view.addSubview(presentVCButton)

        setupAutoLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = .flatWhite

        // set navigation bar attributes
        navigationController?.navigationBar.barTintColor = .flatOrangeDark
        navigationController?.navigationBar.tintColor = .flatWhite
        staticNavigationController?.staticNavigationBar?.sliderColor = .flatLime

        // adjust bar items
        staticNavigationController?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)
        staticNavigationController?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: nil, action: nil)
        staticNavigationController?.centerItem = UIButton(type: .infoDark) // can be any UIView
    }

    func setupAutoLayout() {
        constrain(vcLabel) { view in
            view.leading  == view.superview!.leading + 20
            view.trailing == view.superview!.trailing - 20
            view.height   == 60
            view.top      == view.superview!.top + 50
        }

        constrain(pushVCButton) { view in
            view.width   == 100
            view.height  == 50
            view.centerX == view.superview!.centerX * 0.5
            view.bottom  == view.superview!.bottom - 50
        }

        constrain(presentVCButton) { view in
            view.width   == 100
            view.height  == 50
            view.centerX == view.superview!.centerX * 1.5
            view.bottom  == view.superview!.bottom - 50
        }
    }

    @objc private func pushButtonTapped() {
        navigationController?.pushViewController(ExampleAdditionalViewController(), animated: true)
    }

    @objc private func presentButtonTapped() {
        present(ExampleAdditionalViewController(), animated: true)
    }
}
