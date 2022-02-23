//
//  ListContentView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import SwiftUI

struct ListContentView: View {
    @StateObject var listvm = ListViewModel()
    var body: some View {
        NavigationView{
            VStack{
        AsyncImage(url: URL(string: listvm.listdata?.metadata?.images?[0] ?? "")){img in
            img
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }placeholder: {
            ProgressView()
        }
        Text("Name:\(listvm.listdata?.metadata?.name ?? "")")
        Text("Status:\(listvm.listdata?.metadata?.status ?? 0)")
        Text("Status:\(listvm.listdata?.metadata?.url ?? "")")
        Text("Status:\(listvm.listdata?.metadata?.metadataDescription ?? "")")
            
            .navigationTitle("Google")
            }
            .onAppear{
                listvm.startServiceManager()
            }
        }
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView()
    }
}
