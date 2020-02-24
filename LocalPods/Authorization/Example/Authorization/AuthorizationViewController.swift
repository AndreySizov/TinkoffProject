//
//  AuthorizationViewController.swift
//  Authorization_Example
//
//  Created by Oleg on 23.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PinLayout
import RxSwift
import RxCocoa

final class AuthorizationViewController: UIViewController {

    // MARK: - Subviews
    private let titleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.text = "Введите логин"
        $0.textColor = .black
    }
    private let subtitleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        $0.text = "и пароль"
        $0.textColor = .black
    }
    private lazy var loginTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Введите логин"
        $0.delegate = self
    }
    private lazy var passwordTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Введите пароль"
        $0.delegate = self
    }
    private let continueButton = UIButton().with {
        $0.backgroundColor = UIColor(named: "MainColor")
        $0.setTitle("Далее", for: .normal)
        $0.layer.cornerRadius = 26
        $0.alpha = 0.4
    }
    private let checkButton = UIButton().with {
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.setTitle("Задать пин", for: .normal)
        $0.setImage(UIImage(named: "Unchecked"), for: .normal)
        $0.setImage(UIImage(named: "Checked"), for: .selected)
    }

    // MARK: - Properties
    private var keyboardHeight: CGFloat = 0
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        configureView()
        bindObservables()
    }

    // MARK: - Binding
    private func bindObservables() {
        checkButton.rx.tap.subscribe(onNext: { [unowned self] in
            //TODO: Make output calls
            self.checkButton.isSelected = !self.checkButton.isSelected
        }).disposed(by: disposeBag)
    }

    // MARK: - Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

    private func layout() {
        let textFieldHeight: CGFloat = 54
        let continueButtonHeight: CGFloat = 54
        let continueButtonWidth: CGFloat = 344

        titleLabel.pin
            .top(view.pin.safeArea.top)
            .marginTop(16)
            .sizeToFit()
            .hCenter()

        subtitleLabel.pin
            .below(of: titleLabel, aligned: .center)
            .marginTop(8)
            .sizeToFit()

        loginTextField.pin
            .height(textFieldHeight)
            .horizontally(16)
            .below(of: subtitleLabel)
            .marginTop(16)

        passwordTextField.pin
            .height(textFieldHeight)
            .horizontally(16)
            .below(of: loginTextField)

        checkButton.pin
            .height(30)
            .sizeToFit(.height)
            .below(of: passwordTextField, aligned: .left)

        continueButton.pin
            .height(continueButtonHeight)
            .width(continueButtonWidth)
            .bottom(keyboardHeight)
            .marginBottom(40)
            .hCenter()
    }

    // MARK: - Private methods
    private func addSubviews() {
        view.addSubviews([
            loginTextField,
            passwordTextField,
            titleLabel,
            subtitleLabel,
            continueButton,
            checkButton
        ])
    }

    private func configureView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }
}

extension AuthorizationViewController: UITextFieldDelegate {}
