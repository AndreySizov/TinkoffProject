//
//  TickerCollectionViewCell.swift
//  Stocks
//
//  Created by Андрей on 03/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit
import PinLayout

class TickerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    var tickerLabel: UILabel!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.layer.cornerRadius = 8
        tickerLabel = UILabel()
        tickerLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        tickerLabel.textColor = UIColor.black
        tickerLabel.textAlignment = .center
        addSubview(tickerLabel)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    func setLayout(){
        tickerLabel.pin.all(0)
    }
    
    
}
