//
//  URLExtension.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation

extension URL{
    
    static func getArticlesUrl()-> URL?
    {
        guard let url = URL(string: "https://api.lil.software/news") else {return nil}
        return url
    }
    
    static func getListUrl()-> URL?
    {
        guard let url = URL(string: "https://list.ly/api/v4/meta?url=http://google.com") else {return nil}
        return url
    }
    
    static func getMovieUrl() -> URL?
    {
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_p6xx9arv") else {return nil}
        return url
    }
}
