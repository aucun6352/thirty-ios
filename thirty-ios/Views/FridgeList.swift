//
//  Fridge.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/11.
//

import SwiftUI


struct FridgeList: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(fridges) { fridge in
                        NavigationLink {
                            ProductList(fridge: fridge)
                        } label: {
                            FridgeItem(fridge: fridge)
                        }
                        
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .scaleEffect(0.9)
                Spacer()
            }
        }
        
        
    }
}


struct FridgeList_Previews: PreviewProvider {
    static var previews: some View {
        FridgeList()
            
    }
}
