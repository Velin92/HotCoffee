//
//  File.swift
//  HotCofee
//
//  Created by Mauro Romito on 29/09/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

enum CoffeeType: String {
    case cappuccino
    case latte
    case cortado
    case espresso
}

enum CoffeeSize: String {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: String
    let size: String
}
