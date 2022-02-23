//
//  ContentView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/19/22.
//

import SwiftUI
import Foundation


struct ContentView: View {
    @StateObject var articleVMObject = ArticleViewModel()
    var body: some View {
        NavigationView{
            List{
            ForEach(articleVMObject.articleData.indices,id:\.self){item in
            NavigationLink(destination: DetailView(articles: articleVMObject.articleData), label: {
                VStack{
                    Text(articleVMObject.articleData[item].title ?? "").fontWeight(.bold)
                    //Text(articleVMObject.articleData[item].articleDescription ?? "")
                    Text("\(articleVMObject.articleData[item].date ?? Date())").fontWeight(.thin)
                }
            })
            }.onDelete(perform: deleteItem(at:))
        }
        .onAppear{
            articleVMObject.getCallServiceManager()
        }.navigationTitle("Articles")
        }
    }
    func deleteItem(at index:IndexSet)
    {
        articleVMObject.articleData.remove(atOffsets: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContentView()
    }
}


struct DetailView : View{
    var articles:[Article] = []
    var body:some View{
        VStack{
            Text("Title:\(articles[0].title ?? "")").font(.largeTitle).padding(.bottom,10)
            Text("Publish Date:\(articles[0].date ?? Date())").font(.caption).padding()
            Text("Author:\(articles[0].author ?? "")").font(.caption2)
            AsyncImage(url: URL(string: articles[0].image ?? "") ?? URL(string: "d")){image in
                image
                    .resizable()
                    .scaledToFill()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 150)
            .background(.gray)
            .clipShape(Rectangle())
            .padding()
            
            Text(articles[0].articleDescription ?? "")
            Spacer()
        }
    }
}


