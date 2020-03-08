//
//  SpinnerProtocol.swift
//  GenericTableTest
//
//  Created by Андрей on 08/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit

protocol SpinnerAvailableProtocol {
    //добавляет возможность включать и выключать индикатор загрузки
}

extension SpinnerAvailableProtocol where Self: UIViewController{
    
    func showSpinner() -> UIActivityIndicatorView{
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.frame = CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height*0.6, width: 100, height: 100)
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        return activityIndicator
    }
    
    func stopSpinner(indicator: UIActivityIndicatorView){
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
    
}
