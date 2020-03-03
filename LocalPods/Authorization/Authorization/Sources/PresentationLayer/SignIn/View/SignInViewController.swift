//
//  SignInViewController.swift
//  Authorization_Example
//
//  Created by Oleg on 24.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PinLayout
import RxSwift
import RxCocoa

public final class SignInViewController: UIViewController {

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
        $0.textColor = R.color.textColor()
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Введите логин (только латинские)"
    }
    private lazy var passwordTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textColor = R.color.textColor()
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Введите пароль"
    }
    private let continueButton = UIButton().with {
        $0.backgroundColor = R.color.mainColor()
        $0.setTitle("Далее", for: .normal)
        $0.setTitleColor( R.color.textColor(), for: .normal)
        $0.layer.cornerRadius = 12
        $0.alpha = 0.4
    }
    private let checkButton = UIButton().with {
        $0.setTitleColor( R.color.textColor(), for: .normal)
        $0.setTitle("Задать пин", for: .normal)
        $0.setImage(R.image.unchecked(), for: .normal)
        $0.setImage(R.image.checked(), for: .selected)
    }

    // MARK: - Protocol Properties
    private let output: SignInViewOutput

    // MARK: - Properties
    private var keyboardHeight: CGFloat = 0
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(output: SignInViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        configureView()
        bindObservables()
    }

    @objc
    private func keyboardWillShowNotification(_ notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        self.keyboardHeight = keyboardSize.height
        view.setNeedsLayout()
    }

    @objc
    private func keyboardWillHideNotification(_ notification: NSNotification) {
        self.keyboardHeight = 0
        view.setNeedsLayout()
    }

    // MARK: - Binding
    private func bindObservables() {
        loginTextField.rx.text.asObservable()
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] string in
                self.output.didEnterLogin(string)
            }).disposed(by: disposeBag)

        passwordTextField.rx.text.asObservable()
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] string in
                self.output.didEnterPassword(string)
            }).disposed(by: disposeBag)

        checkButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.checkButton.isSelected = !self.checkButton.isSelected
            self.output.didTapCheckButton(isSelected: self.checkButton.isSelected)
        }).disposed(by: disposeBag)

        continueButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.output.didTapContinueButton()
        }).disposed(by: disposeBag)

        let notifier = NotificationCenter.default
        notifier.addObserver(self,
                             selector: #selector(keyboardWillShowNotification(_:)),
                             name: UIResponder.keyboardWillShowNotification,
                             object: nil)
        notifier.addObserver(self,
                             selector: #selector(keyboardWillHideNotification(_:)),
                             name: UIResponder.keyboardWillHideNotification,
                             object: nil)

    }

    // MARK: - Layout
    override public func viewWillLayoutSubviews() {
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
            .bottom(keyboardHeight + 20)
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
        view.backgroundColor =  R.color.backgroundColor()
    }
}

extension SignInViewController: SignInViewInput {

    func setButtonAvailability(to isEnabled: Bool) {
        continueButton.isUserInteractionEnabled = isEnabled
        continueButton.alpha = isEnabled ? 1 : 0.4
    }

}
