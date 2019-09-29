//
//  OrdersListViewModel.swift
//  HotCoffee
//
//  Created by Mauro Romito on 29/09/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

class OrdersListViewModel {
    var orderViewModels = [OrderViewModel]()

    func getOrderViewModel(at index: Int) -> OrderViewModel {
        return orderViewModels[index]
    }
}
