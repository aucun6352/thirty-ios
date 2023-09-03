//
//  Fridge.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/11.
//

import SwiftUI


struct FridgeList: View {
    @State private var fridges: [Fridge] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(fridges, id: \.id) { fridge in
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
        .onAppear {
            Task {
                do {
                    fridges = try await Fridge.getList()
                } catch {
                    // Handle error if needed
                    print("Error fetching fridge list: \(error)")
                }
            }
        }
        
        
    }
}


struct FridgeList_Previews: PreviewProvider {
    static var previews: some View {
        FridgeList()
            
    }
}
