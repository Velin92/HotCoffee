//
//  OrderListViewController.swift
//  HotCofee
//
//  Created by Mauro Romito on 29/09/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit

class OrdersListViewController: UITableViewController {
    
    let ordersListViewModel = OrdersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let ordersUrl = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("Invalid url")
        }
        let resource = Resource<[Order]>(url: ordersUrl)
        WebService.get(resource: resource) { [weak self] result in
            switch (result) {
            case .success (let orders):
                self?.ordersListViewModel.orderViewModels = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                break
            case .failure (let error):
                print(error)
                break
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersListViewModel.orderViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orderViewModel = ordersListViewModel.getOrderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        cell.textLabel?.text = orderViewModel.type
        cell.detailTextLabel?.text = orderViewModel.size
        return cell
    }
    
}
