//
//  IMDBContentView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import SwiftUI

struct IMDBContentView: View {
    @ObservedObject var imdbVM = IMDMViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(imdbVM.imdbData,id:\.self){ movies in
                    NavigationLink(destination: IMDBBDetailView(), label: {
                        CrewView(title: movies.fullTitle ?? "", rank: movies.rank ?? "",year: movies.year ?? "",image: movies.image ?? "")
                    })
                }
            }.navigationTitle("IMDB Movies")
        }
        .onAppear{imdbVM.startIMDBService()}
        
    }
}

struct IMDBContentView_Previews: PreviewProvider {
    static var previews: some View {
        IMDBContentView()
    }
}

struct IMDBBDetailView:View{
    var body: some View{
        Text("Deails")
    }
}
