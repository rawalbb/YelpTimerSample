//
//  Business.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import Foundation

struct Businesses: Codable{
    let business: [Business]
}

struct Business: Codable{
    let name: String
}
