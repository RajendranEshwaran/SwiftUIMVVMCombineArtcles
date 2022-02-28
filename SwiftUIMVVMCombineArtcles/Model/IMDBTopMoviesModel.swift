//
//  IMDBTopMoviesModel.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import Foundation
// MARK: - IMDBTopMoviesModel

/*
struct IMDBTopMoviesModel: Decodable {
    //let items: [IMDBItem]
    let errorMessage: String?
//    enum CodingKeys: String,CodingKey{
//        case errorMessage,items
//    }
}

// MARK: - Item
struct IMDBItem: Decodable,Identifiable {
    var id = UUID()
    let ids: String?
    let rank: Int?
    let title: String?
    let fullTitle: String?
    let year: Int?
    let image: String?
    let crew: String?
    let imDBRating: Double?
    let imDBRatingCount: Int?

    enum CodingKeys: String, CodingKey {
        case rank, title, fullTitle, year, image, crew
        case ids = "id"
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
*/

struct IMDBTopMoviesModel: Decodable,Identifiable {
    var id = UUID()
    let items: [IMDBItem]?
    let errorMessage: String?
    enum CodingKeys: String, CodingKey {
        case items,errorMessage
    }
}

// MARK: - Item
struct IMDBItem: Decodable , Hashable{
    let ids, rank, rankUpDown, title: String?
    let fullTitle, year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case ids = "id", rank, rankUpDown, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}

