//
//  CheckPinViewController.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CheckPinViewController: UIViewController {

    // MARK: - Subviews
    private let titleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.text = "Введите пин-код"
        $0.textColor = .black
    }
    private lazy var pinTextField = UITextField().with {
        $0.keyboardType = .numberPad
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.placeholder = "Ваш пин-код"
    }
    private let continueButton = UIButton().with {
        $0.backgroundColor = UIColor(named: "MainColor")
        $0.setTitle("Далее", for: .normal)
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.layer.cornerRadius = 12
        $0.alpha = 0.4
    }

    // MARK: - Properties
    let output: CheckPinViewOutput

    // MARK: - Properties
    private var keyboardHeight: CGFloat = 0
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(output: CheckPinViewOutput) {
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

        addSubviews()
        configureView()
        bindObservables()
    }

    // MARK: - Binding
    private func bindObservables() {
        continueButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.output.didTapContinueButton()
        }).disposed(by: disposeBag)
        
        pinTextField.rx.text.asObservable()
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] string in
                self.output.didChangePinCode(with: string)
            }).disposed(by: disposeBag)
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

        pinTextField.pin
            .height(textFieldHeight)
            .horizontally(16)
            .below(of: titleLabel)
            .marginTop(16)

        continueButton.pin
            .height(continueButtonHeight)
            .width(continueButtonWidth)
            .bottom(keyboardHeight)
            .marginBottom(40)
            .hCenter()
    }

    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubviews([
            titleLabel,
            pinTextField,
            continueButton
        ])
    }

    private func configureView() {
        view.backgroundColor = .white
    }

}

// MARK: - CheckPinViewInput
extension CheckPinViewController: CheckPinViewInput {

    func setButtonEnabled(to isEnabled: Bool) {
        continueButton.isUserInteractionEnabled = isEnabled
        continueButton.alpha = isEnabled ? 1 : 0.4
    }

}
