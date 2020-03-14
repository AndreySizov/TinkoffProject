//
//  CompanyTableViewCell.swift
//  Stocks
//
//  Created by Андрей on 03/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit
import PinLayout

class CompanyTableViewCell: UITableViewCell, Adaptable {
    
    // MARK: - Subviews
    var companyLabel: UILabel!
    var circleView: UIView!
    var viewForCompanyLabel: UIView!
    var tickerLabel: UILabel!
    
    // MARK: Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        configureSubviews()
        addSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    func setLayout(){
            
        circleView.pin
        .left(20)
        .top(10)
        .bottom(10)
        .aspectRatio(1)
            
        viewForCompanyLabel.pin
        .after(of: circleView)
        .right(0)
        .top(10)
        .bottom(10)
            
        tickerLabel.pin
        .all(0)
           
        companyLabel.pin
        .left(20)
        .right(0)
        .bottom(0)
        .top(0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
        circleView.layer.cornerRadius = (circleView.frame.size.height)/2
    }
    
    // MARK: - Private methods
    private func configureCell(){
        self.backgroundColor = UIColor.white
    }
    
    private func configureSubviews(){
        companyLabel = UILabel()
        companyLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        companyLabel.textColor = UIColor.black
        companyLabel.textAlignment = .left
        
        circleView = UIView()
        circleView.backgroundColor = UIColor.red
        circleView.layer.cornerRadius = self.frame.size.height/2
        
        viewForCompanyLabel = UIView()
        
        tickerLabel = UILabel()
        tickerLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        tickerLabel.textColor = UIColor.black
        tickerLabel.textAlignment = .center
    }
    
    private func addSubviews(){
        viewForCompanyLabel.addSubview(companyLabel)
        addSubview(viewForCompanyLabel)
        circleView.addSubview(tickerLabel)
        addSubview(circleView)
    }
    
    // MARK: - Obtain model
    func adapt(model: Symbol) {
        companyLabel.text = model.symbolDescription.uppercased()
        companyLabel.textColor = UIColor.black
        companyLabel.font = UIFont.systemFont(ofSize: 20)
       
        tickerLabel.text = model.displaySymbol.uppercased()
    }
}
