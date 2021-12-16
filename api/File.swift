//
//  File.swift
//  api
//
//  Created by Muhammad Faisal Imran Khan on 2021-12-15.
//  Copyright © 2021 Muhammad Faisal Imran Khan. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

//separate class because complex type

public class Header: Decodable{
    public var headerTitle: String
    public var headerDescription: String
}
//separate class because complex type

public class Product: Identifiable, Decodable {
    public let id = UUID()
    public var name: String?
    public var type: String?
    public var imageURL: String?
    public var available: Bool?
    public var description: String?
    public var longDescription: String?
    public var rating: Float?
    public var price: Price?
    public var releaseDate: Int?
    
}

public class Price: Decodable {
    public var value: Float?
    public var currency: String?
    
}

//this model decode the necessary part from the json

public class DataModel:  Decodable {
    
    public var header: Header?
    public var products: [Product]?
    
    init(){
        header = nil
        products = nil
    }
    enum CodingKeys: String, CodingKey {
        case header = "header"
        case products = "products"
    }
    
    func encode(to decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        products =  try container.decode([Product].self, forKey: .products)
    }
    
    
}



class Api {
    func getDataModel(completion: @escaping(DataModel) -> ()){
        guard let url = URL(string: "https://app.check24.de/products-test.json") else {return}
        
        URLSession.shared.dataTask(with: url){data,_,_ in
        //    let posts = try! JSONDecoder().decode([Post].self, from: data!)
            let decoder = JSONDecoder()
                       let model = try! decoder.decode(DataModel.self, from: data!)
            DispatchQueue.main.async {
               completion(model)
            }
            
        }
    .resume()
    }
}
