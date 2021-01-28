//
//  DataModel.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import Foundation

struct Items: Decodable, Identifiable, Hashable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
