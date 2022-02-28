//
//  IMDBServiceManager.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import Foundation

class IMDBTopMoviesServiceManager{
    
    func getIMDBTopMoviesData(completion:@escaping(Result<IMDBTopMoviesModel,NetworkError>) -> Void){
        guard let url = URL.getMovieUrl() else {return completion(Result.failure(.urlError))}
        URLSession.shared.dataTask(with: url, completionHandler: {data , response ,error in
            guard let data = data, error == nil else {return completion(Result.failure(.responseError))}
            let decoder = try? JSONDecoder().decode(IMDBTopMoviesModel.self, from: data)
            if let response = decoder {
                completion(Result.success(response))
            }
            else{
                completion(Result.failure(.decodeError))
            }
        }).resume()
    }
    
    func getIMDBTopMoviesData2(completion:@escaping(IMDBTopMoviesModel) -> Void){
        guard let url = URL.getMovieUrl() else {return print("urlError")}
        URLSession.shared.dataTask(with: url, completionHandler: {data , response ,error in
            guard let data = data, error == nil else {return print("responseError")}
            let decoder = try? JSONDecoder().decode(IMDBTopMoviesModel.self, from: data)
            if let response = decoder {
                print(response)
                completion(response)
            }
            else{
                print("decodeError")
            }
        }).resume()
    }
}
