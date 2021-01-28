//
//  ImageLoader.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import SwiftUI
import Foundation
import Combine


struct ImageViewWidget: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        self.imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    // Activating
    var loadingIndicator: some View {
        Spinner(isAnimating: true, style: .medium, color: .gray)
    }
    
    // Error Image
    var errorView: some View {
        Image(systemName: "exclamationmark")
            .resizable()
            .scaledToFit()
            .foregroundColor(.blue)
            .animation(.easeInOut)
    }
    
    // Load image
    var loadedImage: some View {
        Image(uiImage: UIImage(data: imageLoader.imageData!)!)
            .resizable()
            .animation(.easeInOut)
    }

    var body: some View {
        VStack {
            if imageLoader.errorOccurred {
                errorView
            }
            else if imageLoader.imageData == nil {
                loadingIndicator
            }
            else {
                loadedImage
            }
        }
        // Guarantees the parent container will be filled
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
    }
}

final class ImageLoader: ObservableObject {
    @Published var errorOccurred = false
    @Published var imageData: Data?
    
    init(imageUrl: String) {
        loadImage(imageUrl: imageUrl)
    }

    func loadImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    self.errorOccurred = true
                }
                
                return
            }
            
            if let data = data {                
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }

        }.resume()
    }

}

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    let color: UIColor

    func makeUIView(context: UIViewRepresentableContext<Spinner>) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.color = color
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Spinner>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

