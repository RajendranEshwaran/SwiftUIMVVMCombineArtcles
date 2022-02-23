//
//  ListServiceManager.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation
import Combine

class ListServiceManager{
    
    func getListServiceData() -> AnyPublisher<ListModel,NetworkError>{
        
        return URLSession
            .shared
            .dataTaskPublisher(for: URL.getListUrl()!)
            .receive(on: DispatchQueue.main)
            .mapError{_ in NetworkError.urlError}
            .flatMap{data, response -> AnyPublisher<ListModel,NetworkError> in
                guard let response = response as? HTTPURLResponse else{return Fail(error: NetworkError.responseError).eraseToAnyPublisher()}
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    return Just(data)
                        .decode(type:ListModel.self, decoder: jsonDecoder)
                        .mapError{_ in NetworkError.decodeError}
                        .eraseToAnyPublisher()
                }
                else{
                   return Fail(error: NetworkError.unknownError).eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
