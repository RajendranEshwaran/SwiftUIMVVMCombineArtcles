//
//  MainView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import SwiftUI

struct MainView: View {
    init(){
        UITabBar.appearance().barTintColor = .yellow
    }
    var body: some View {
        TabView{
            ContentView()
                .tabItem({
                    Image(systemName: "newspaper").resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("Articles")
                })
            ListContentView()
                .tabItem({
                    Image(systemName: "filemenu.and.cursorarrow").resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("Files")
                })
            ScrollContentView()
                .tabItem({
                    Image(systemName: "square.grid.2x2").resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("Grid")
                })
            IMDBContentView()
                .tabItem({
                    Image(systemName: "film").resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("TopMovies")
                })
        
        }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
