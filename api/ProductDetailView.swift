//
//  ProductDetailView.swift
//  api
//
//  Created by Muhammad Faisal Imran Khan on 2021-12-16.
//  Copyright © 2021 Muhammad Faisal Imran Khan. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product?
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            
            
            Text(product!.name!)
            
            Spacer()
                     
            
            Text(product!.description!)
                .font(.body)
                .padding()
            
         
            Spacer()
                     
            
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
