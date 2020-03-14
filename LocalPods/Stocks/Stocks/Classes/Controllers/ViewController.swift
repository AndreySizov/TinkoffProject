//
//  ViewController.swift
//  Stocks
//
//  Created by Андрей on 03/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit
import PinLayout
import RxSwift

public final class ViewController: UIViewController, SpinnerAvailableProtocol{
    
    // MARK: - Subviews
    private var exchangeView: ExchangeView!
    
    // MARK: - Properties
    private var spinner: UIActivityIndicatorView!
    private var symbols: [Symbol]!
    private var symbolsToShow: [Symbol]!
    private var shortSymbols: [String]!
    private var adapter: Adapter!
    private var interactor: ExchangeInteractor!
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    public override func loadView() {
        exchangeView = ExchangeView(frame: UIScreen.main.bounds, viewController: self)
        view = exchangeView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        spinner = self.showSpinner()
        getData()
    }
    
    // MARK: - Layout
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.layoutSubviews()
    }
    
    
    // MARK: - Private methods
    
    private func reloadAdapter(){
        let accountsSection = GenericSectionModel<Symbol, CompanyTableViewCell>(items: symbolsToShow)
        accountsSection.onSelected = { m, c in
                //do smth on tap
        }
        adapter = Adapter(sections: [accountsSection])
        (view as! ExchangeView).reloadTableView(with: adapter)
    }
    
    private func getData(){
        interactor = ExchangeInteractor()
        interactor.getData(with: "US").subscribe(onSuccess: { [unowned self] symbols in
            self.registerData(array: symbols)
        }, onError: {
            print("!! error = ", $0)
        }).disposed(by: disposeBag)
    }
    
    private func registerData(array: [Symbol]){
        
        DispatchQueue.main.async {
            self.symbols = array
            self.symbolsToShow = self.symbols
            self.shortSymbols = []
            for symbol in self.symbols{
                self.shortSymbols.append(symbol.displaySymbol)
            }
            self.reloadAdapter()
            (self.view as! ExchangeView).reloadTickerCollectionView(with: Array(Set(self.shortSymbols)))
            self.hideSpinner()
        }
        
    }
    
    private func hideSpinner(){
        self.stopSpinner(indicator: self.spinner)
    }
    
}

// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate{
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            self.symbolsToShow = self.symbols
            self.reloadAdapter()
        }else{
            let printedText = searchText.uppercased()
            if self.shortSymbols.contains(printedText){
                for i in self.symbols{
                    if i.displaySymbol == printedText{
                        self.symbolsToShow = self.symbols.filter{$0.displaySymbol == printedText}
                        self.reloadAdapter()
                    }
                }
            }else{
                self.symbolsToShow = []
                self.reloadAdapter()
            }
        }
    }
}

