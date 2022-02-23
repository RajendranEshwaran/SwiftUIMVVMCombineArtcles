//
//  ListViewModel.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import Foundation
import Combine
class ListViewModel : ObservableObject{
    @Published var listdata:ListModel?
    private var cancellable = Set<AnyCancellable>()
    private var listSM = ListServiceManager()
    init()
    {
    
    }
    func startServiceManager(){
        let cancelable = listSM.getListServiceData()
            .sink{ result in
                switch result{
                case .finished:
                    print("Fetch finished")
                    break
                case .failure:
                    print("Fetch failed")
                    break
                }
            }receiveValue: { response in
                self.listdata = response
                print(self.listdata)
            }
        self.cancellable.insert(cancelable)
    }
}
