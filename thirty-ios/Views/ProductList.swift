//
//  ProductList.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/12.
//

import SwiftUI
import PopupView


struct ProductList: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var fridge: Fridge
    @State var showingPopup: Bool = false
    @State var selectProduct: Product? = nil
    
    var body: some View {
        
    
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        ProductItem(product: product)
                            .onTapGesture {
                                if (!showingPopup) {
                                    selectProduct = product
                                }
                                showingPopup = !showingPopup
                                
                            }
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .scaleEffect(0.9)
                Spacer()
            }.navigationTitle(fridge.name)
        }
        .popup(isPresented: Binding<Bool>(
            get: { return (showingPopup && selectProduct != nil) },
            set: { _ in })
        ) {
            ProductDetail(product: selectProduct!)
        }
        
        
    }
}


struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList(fridge: fridges[0])
    }
}
