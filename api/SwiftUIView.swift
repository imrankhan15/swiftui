//
//  SwiftUIView.swift
//  api
//
//  Created by Muhammad Faisal Imran Khan on 2021-12-15.
//  Copyright © 2021 Muhammad Faisal Imran Khan. All rights reserved.
//

import SwiftUI
import Cosmos


// A SwiftUI wrapper for Cosmos view
struct MyCosmosView: UIViewRepresentable {
    @Binding var rating: Double

    func makeUIView(context: Context) -> CosmosView {
        CosmosView()
    }

    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    
        // Autoresize Cosmos view according to it intrinsic size
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
      
        // Change Cosmos view settings here
        uiView.settings.starSize = 40
    }
}



struct SwiftUIView: View {
    @State var model: DataModel = DataModel()
    @State var ratingSelf = 3.0
    var body: some View {
        NavigationView {
            List(model.products ?? [] ) { product in
                NavigationLink(
                    destination: ProductDetailView(product: product), label: {
                        
                        AsyncImage(url: URL(string: product.imageURL!)!,
                                      placeholder: { Text("Loading ...") },
                                      image: { Image(uiImage: $0).resizable() })
                              
                                                         .scaledToFit()
                                                         .frame(height: 70)
                                                         .cornerRadius(4)
                                                         .padding(.vertical, 4)
                        VStack(alignment: .leading, spacing: 5){
                            Text(product.name!)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            Text(product.description!)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                           // ratingSelf = Double(product.rating!)
                            //MyCosmosView(rating: $ratingSelf)
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

