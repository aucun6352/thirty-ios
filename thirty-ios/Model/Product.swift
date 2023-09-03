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
    
//    private var imageName: String
    var image: Image {
        Image("ProductIcon")
    }
    
    static func getList(fridege_id: Int) async throws -> [Product] {
        let data = try await HTTPManager.requestGET(url: "http://localhost:8000/fridges/\(fridege_id)/products")
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(Response<Product>.self, from: data)
        return response.data
    }
}
