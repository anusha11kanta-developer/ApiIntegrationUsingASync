//
//  ContentView.swift
//  ApiIntegrationAsync
//
//  Created by Heshi on 12/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var productsList = ProductModel()
    var body: some View {
        List(productsList.categories, id: \.idCategory) { post in
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    helperForAsyncImage(url: post.strCategoryThumb.asURL)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text(post.strCategory)
                        .font(.headline)
                    
                }
                       

                    Text(post.strCategoryDescription)
                        .font(.subheadline)
                       
              //  }
            }

        }
        .task {
            do {
                productsList = try await fetchData()
                print(productsList)
            } catch {
                print("fetch error:", error)
            }
        }
    }
}

#Preview {
    ContentView()
}

