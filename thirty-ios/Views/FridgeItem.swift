//
//  FridgeView.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/11.
//

import Foundation
import SwiftUI


struct FridgeItem: View {
    let fridge: Fridge
    
    var body: some View {
        VStack {
            fridge.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(25)
            
            Text(fridge.name)
                .font(.caption)
        }
    }
}


struct FridgeItem_Previews: PreviewProvider {
    static var previews: some View {
        FridgeItem(fridge: fridges[0])
            
    }
}
