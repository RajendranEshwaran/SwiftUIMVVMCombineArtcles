//
//  ArticleServiceManager.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation
import Combine

enum NetworkError:Error{
    case urlError
    case responseError
    case decodeError
    case unknownError
}

class ArticleServiceManager{
    
    func getArticleServiceData() -> AnyPublisher<ArticleModel,NetworkError>{
        return URLSession
            .shared
            .dataTaskPublisher(for: URL.getArticlesUrl()!)
            .receive(on: DispatchQueue.main)
            .mapError{_ in NetworkError.unknownError}
            .flatMap{data,response -> AnyPublisher<ArticleModel,NetworkError> in
                guard let response = response as? HTTPURLResponse else{return Fail(error: NetworkError.responseError).eraseToAnyPublisher()}
                if (200...299).contains(response.statusCode){
                    let jsondecoder = JSONDecoder()
                    jsondecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: ArticleModel.self, decoder: jsondecoder)
                        .mapError{_ in NetworkError.decodeError}
                        .eraseToAnyPublisher()
                }
                else {
                    return Fail(error: NetworkError.decodeError).eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
