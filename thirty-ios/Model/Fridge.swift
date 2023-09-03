//
//  Fridge.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/11.
//

import Foundation
import SwiftUI

struct Fridge: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
//    private var imageName: String
    var image: Image {
        Image("DefaultIcon")
    }
    
    static func getList() async throws -> [Fridge] {
        let data = try await HTTPManager.requestGET(url: "http://localhost:8000/fridges")
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(Response<Fridge>.self, from: data)
        return response.data
    }
}
