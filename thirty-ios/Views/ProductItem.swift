//
//  productItem.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/12.
//

import Foundation
import SwiftUI


struct ProductItem: View {
    var product: Product
    
    var body: some View {
        VStack {
            product.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(25)
            
            Text(product.name)
                .font(.caption)
        }
    }
}


struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: products[0])
            
    }
}

