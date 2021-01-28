//
//  DataViewModel.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import Foundation

let apiURL = "https://jsonplaceholder.typicode.com/photos"

class DevoraViewModel: ObservableObject {
    @Published var errorOccurred = false
    @Published var items: [Items] = [
        .init(albumID: 0, id: 0, title: "Loading data, please wait!", url: "url 0", thumbnailURL: "url 0")
    ]
    
    func fetchAPI() {
        /// fetch JSON and decode
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    self.errorOccurred = true
                }
                
                return
            }
            
            if let data = data {
                /// async work
                DispatchQueue.main.async {
                    self.items = try! JSONDecoder().decode([Items].self, from: data)
                }
            }
           
            
        }.resume()
    }
}
