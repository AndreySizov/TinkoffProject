//
//  TickerCollectionViewController.swift
//  Stocks
//
//  Created by Андрей on 03/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit

// MARK: - Properties
private let reuseIdentifier = "TickerCell"

class TickerCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    var tickersArray: [String]?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView!.register(TickerCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.showsHorizontalScrollIndicator = false
        
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let array = tickersArray else {
            return 0
        }
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TickerCollectionViewCell
        if let array = tickersArray{
            cell.tickerLabel.text = array[indexPath.row]
        }
        
        return cell
    }
}

