//
//  ItemDetail.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import SwiftUI

struct ItemDetail: View {
    
    @State var items: [Items] = []
    @State var index = 1

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                                 
                // Load the image
                ImageViewWidget(imageUrl: items[index-1].url)
                    .frame(height: 180)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                Divider()
                
                // Item name
                Text("Item name:")
                    .font(.title3)
                
                HStack {
                    Text(items[index-1].title)
                        .font(.title)
                    Spacer()
                    
                }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(2)

                
                                 
                
                Spacer()
            }
            .padding()
            
            .navigationTitle("Item Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail()
    }
}
