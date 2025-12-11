//
//  ViewModel.swift
//  ApiIntegrationAsync
//
//  Created by Heshi on 12/4/25.
//

import Foundation
import SwiftUI
func fetchData() async throws -> ProductModel{
    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
    let (data,_) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(ProductModel.self, from: data)
}
func helperForAsyncImage(url: URL?) -> some View {
    AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .scaledToFit()
        case .failure:
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
        @unknown default:
            EmptyView()
        }
    }
}
extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
