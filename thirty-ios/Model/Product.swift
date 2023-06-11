//
//  Product.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/12.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var expiry: String
    var purchase_date: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
