//
//  ProductDetail.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/06/12.
//

import Foundation
import SwiftUI


struct ProductDetail: View {
    var product: Product
    
    var body: some View {
        VStack {
            
            
            product.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(25)
            
            Text(product.name)
                .font(.body)
            
            Grid {
                GridRow {
                    Text("유통기한: " + product.purchase_date)
                        .font(.body)
                    
                    Text("구입날짜: " + product.expiry)
                        .font(.body)
                }
            }
        }
    }
}


struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: products[0])
            
    }
}
