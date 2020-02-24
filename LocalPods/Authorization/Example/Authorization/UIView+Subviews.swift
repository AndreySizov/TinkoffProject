//
//  UIView+Subviews.swift
//  Authorization_Example
//
//  Created by Oleg on 23.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit.UIView

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

}
