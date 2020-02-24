//
//  EnterPinViewController.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit

class EnterPinViewController: UIViewController {

    // MARK: - Subviews

    // MARK: - Properties
    let output: EnterPinViewOutput

    // MARK: - Init
    init(output: EnterPinViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - EnterPinViewInput
extension EnterPinViewController: EnterPinViewInput {}
