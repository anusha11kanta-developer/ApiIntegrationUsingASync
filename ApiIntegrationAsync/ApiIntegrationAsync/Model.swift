//
//  Model.swift
//  ApiIntegrationAsync
//
//  Created by Heshi on 12/4/25.
//

//import Foundation
struct ProductModel: Codable {
    var categories: [CategoryModel] = []
    
}
struct CategoryModel: Codable{
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
    
}

