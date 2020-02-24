//
//  NSObjectProtocol.swift
//  Authorization_Example
//
//  Created by Oleg on 23.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

extension NSObjectProtocol {

    func with(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }

}

