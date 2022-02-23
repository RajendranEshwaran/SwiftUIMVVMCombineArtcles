//
//  ArticleViewModel.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation
import Combine
class ArticleViewModel:ObservableObject{
    
    @Published var articleData:[Article] = []
   
    private var service : ArticleServiceManager = ArticleServiceManager()
    init(){
       // self.service = ArticleServiceManager()
    }
    private var cancellable =  Set<AnyCancellable>()
    func getCallServiceManager()
    {
        let cancellable = service.getArticleServiceData().sink(receiveCompletion: { result in
            switch result{
            case .finished:
                print("Service fetch finished")
                break
            case .failure:
                print("Service fetch failed")
                break
            }
        },receiveValue: { response in
            self.articleData = response.articles
        })
        
//            .sink{ result in
//                switch result{
//                case .finished:
//                    print("Service fetch finished")
//                    break
//                case .failure:
//                    print("Service fetch failed")
//                    break
//                }
//            }receiveValue: { response in
//                self.articleData = response.articles
//            }
        self.cancellable.insert(cancellable)
    }
}
