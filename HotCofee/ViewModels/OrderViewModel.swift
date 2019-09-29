//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Mauro Romito on 29/09/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

struct OrderViewModel {
    let order: Order
    
    var name: String {
        return order.name
    }
    
    var email: String {
        return order.email
    }
    
    var size: String {
        return order.size.capitalized
    }
    
    var type: String {
        return order.type.capitalized
    }
}
