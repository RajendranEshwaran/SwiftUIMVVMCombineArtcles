//
//  IMDMViewModel.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import Foundation

class IMDMViewModel : ObservableObject{
    @Published var imdbData:[IMDBItem] = []

    func startIMDBService()
    {
        IMDBTopMoviesServiceManager().getIMDBTopMoviesData(completion: {result in
            switch result{
            case .success(let success):
                DispatchQueue.main.async {
                    self.imdbData = success.items ?? []
                print(success)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
