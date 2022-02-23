//
//  ArticleModel.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation

struct ArticleModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable ,Identifiable{
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


struct ListModel: Codable ,Identifiable{
    var id = UUID()
    let url: String?
    let metadata: Metadata?
    enum CodingKeys: String, CodingKey {
        case url,metadata
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let status: Int?
    let url: String?
    let name, metadataDescription: String?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case status, url, name
        case metadataDescription = "description"
        case images
    }
}

