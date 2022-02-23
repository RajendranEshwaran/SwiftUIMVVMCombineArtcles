//
//  ScrollContentView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import SwiftUI

struct ScrollContentView : View{
    @StateObject var articleVMObject = ArticleViewModel()
    let layout = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    var body: some View{
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(columns: layout,spacing: 50){
                    ForEach(articleVMObject.articleData.indices,id:\.self){ datas in
                        NavigationLink(destination: SelectedView(url: URL(string: articleVMObject.articleData[datas].image ?? "")), label: {
                            HStack{
                                AsyncImage(url: URL(string: articleVMObject.articleData[datas].image ?? "")){ image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        //.frame(width: 80, height: 100) // No need to give frame while use gridItem
                                        //.padding()
                                }placeholder: {
                                    ProgressView()
                                }
                            }
                        })
                    }
                }
            }).navigationTitle("Scroll")
        }.onAppear{
            articleVMObject.getCallServiceManager()
        }
    }
}

struct SelectedView: View{
    var url : URL?
    var body: some View{
        AsyncImage(url: url){image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 180)
                .padding()
        }placeholder: {
            ProgressView()
        }
        Spacer()
    }
}

struct ScrollContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContentView()
    }
}
