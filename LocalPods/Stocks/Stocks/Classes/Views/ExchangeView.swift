//
//  ExchangeView.swift
//  Stocks
//
//  Created by Андрей on 08/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit
import PinLayout

class ExchangeView: UIView {

    // MARK: - Dependency injection
    private weak var viewController: UIViewController?
    
    // MARK: - Subviews
    var mainLabel: UILabel!
    var subLabel: UILabel!
    var searchBar: UISearchBar!
    var availabilityLabel: UILabel!
    var companiesTableView: UITableView!
    var tickerCollectionView: UICollectionView!
    
    // MARK: - Internal Controllers
    var tickerCollectionVC: TickerCollectionViewController!
    
    // MARK: - Init
    init(frame: CGRect,viewController: UIViewController) {
        self.viewController = viewController
        super.init(frame: frame)
        configureView()
        configureSubviews()
        addSubviews()
        addChildrenToController(children: [tickerCollectionVC])
        registerDelegates()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setLayout(){
        mainLabel.pin
        .top(self.pin.safeArea.top)
        .marginTop(70)
        .sizeToFit()
        .left(self.pin.safeArea.left)
        .marginLeft(20)
        
        subLabel.pin
        .below(of: mainLabel)
        .marginTop(8)
        .sizeToFit()
        .left(self.pin.safeArea.left)
        .marginLeft(20)
        
        searchBar.pin
        .below(of: subLabel)
        .marginTop(8)
        .left(self.pin.safeArea.left)
        .marginLeft(12)
        .right(self.pin.safeArea.right)
        .marginRight(12)
        .height(50)
        
        availabilityLabel.pin
        .below(of: searchBar)
        .marginTop(8)
        .sizeToFit()
        .left(self.pin.safeArea.left)
        .marginLeft(20)
        
        tickerCollectionView.pin
        .below(of: availabilityLabel)
        .marginTop(8)
        .left(self.pin.safeArea.left)
        .marginLeft(0)
        .right(self.pin.safeArea.right)
        .marginRight(0)
        .height(35)
        
        companiesTableView.pin
        .below(of: tickerCollectionView)
        .marginTop(10)
        .left(self.pin.safeArea.left)
        .marginLeft(0)
        .right(self.pin.safeArea.right)
        .marginRight(0)
        .bottom(self.pin.safeArea.bottom)
        .marginBottom(0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    // MARK: - Private methods
    private func prepareLayoutForCollectionView() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 50, height: 20)
        return layout
    }

    private func configureView() {
        self.backgroundColor = UIColor.white
    }
        
    private func configureSubviews(){
                
        mainLabel = UILabel()
        mainLabel.text = "Companies"
        mainLabel.textAlignment = .left
        mainLabel.font = UIFont.systemFont(ofSize: 37, weight: .bold)
                        
        subLabel = UILabel()
        subLabel.text = "of US exchanges"
        subLabel.textAlignment = .left
        subLabel.font = UIFont.systemFont(ofSize: 35, weight: .regular)
                        

        tickerCollectionVC = TickerCollectionViewController.init(collectionViewLayout: prepareLayoutForCollectionView())
        tickerCollectionVC.collectionView.layoutSubviews()
        tickerCollectionView = tickerCollectionVC.collectionView
                        
        searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
                        
        availabilityLabel = UILabel()
        availabilityLabel.text = "Available exchanges:"
        availabilityLabel.textAlignment = .left
        availabilityLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
        companiesTableView = UITableView()
    }
    
    private func registerDelegates(){
        searchBar.delegate = viewController as? UISearchBarDelegate
    }
    
    private func addChildrenToController(children: [UIViewController]){
        for controller in children{
            viewController?.addChild(controller)
        }
    }
    
    private func addSubviews(){
            self.addSubview(mainLabel)
            self.addSubview(subLabel)
            self.addSubview(tickerCollectionView)
            self.addSubview(searchBar)
            self.addSubview(availabilityLabel)
            self.addSubview(companiesTableView)
    }
    
    // MARK: - Reload Subviews
    func reloadTableView(with adapter: Adapter){
        companiesTableView.setAdapter(adapter)
        companiesTableView.reloadData()
    }
    
    func reloadTickerCollectionView(with tickers: [String]){
        tickerCollectionVC.tickersArray = tickers
        tickerCollectionView.reloadData()
    }
}
