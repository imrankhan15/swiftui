//
//  SwiftUIView.swift
//  api
//
//  Created by Muhammad Faisal Imran Khan on 2021-12-15.
//  Copyright © 2021 Muhammad Faisal Imran Khan. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State var model: DataModel = DataModel()
    var body: some View {
        
        
        NavigationView {
            
            
            List(model.products ?? [] ) { product in
                
                NavigationLink(
                    destination: ProductDetailView(product: product), label: {
                        
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text(product.name!)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            
                        }
                })
                    
                    
                    
                    
                    
                    
                    
                    
                    .navigationBarTitle("Products")
                
            }
        }
        .onAppear() {
            Api().getDataModel{(model) in
                self.model = model
                
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
