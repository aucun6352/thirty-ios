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
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
