//
//  EnterPinViewController.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit
import PinLayout
import RxSwift
import RxCocoa

class EnterPinViewController: UIViewController {

    // MARK: - Subviews
    private let titleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.text = "Введите пин"
        $0.textColor = .black
    }
    private let subtitleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        $0.text = "и подтвердите его"
        $0.textColor = .black
    }
    private lazy var pinTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Введите пин"
        $0.textContentType = .password
        $0.isSecureTextEntry = true
    }
    private lazy var confirmPinTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textContentType = .password
        $0.isSecureTextEntry = true
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Подтвердите пин"
    }
    private let continueButton = UIButton().with {
        $0.backgroundColor = UIColor(named: "MainColor")
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.setTitle("Далее", for: .normal)
        $0.layer.cornerRadius = 12
        $0.alpha = 0.4
        $0.isUserInteractionEnabled = false
    }

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

    // MARK: - Properties
    private var keyboardHeight: CGFloat = 0
    private let disposeBag = DisposeBag()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        configureView()
        bindObservables()
    }

    // MARK: - Binding
    private func bindObservables() {
        pinTextField.rx.text.asObservable()
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] string in
                self.output.didChangePinCode(with: string)
            }).disposed(by: disposeBag)

        confirmPinTextField.rx.text.asObservable()
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] string in
                self.output.didChangeConfirmPinCode(with: string)
            }).disposed(by: disposeBag)

        continueButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.output.didTapContinueButton()
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

        pinTextField.pin
            .height(textFieldHeight)
            .horizontally(16)
            .below(of: subtitleLabel)
            .marginTop(16)

        confirmPinTextField.pin
            .height(textFieldHeight)
            .horizontally(16)
            .below(of: pinTextField)

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
            pinTextField,
            confirmPinTextField,
            titleLabel,
            subtitleLabel,
            continueButton,
        ])
    }

    private func configureView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }

}

// MARK: - EnterPinViewInput
extension EnterPinViewController: EnterPinViewInput {

    func setButtonEnabled(to isEnabled: Bool) {
        continueButton.isUserInteractionEnabled = isEnabled
        continueButton.alpha = isEnabled ? 1 : 0.4
    }

}

