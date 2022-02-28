//
//  CrewView.swift
//  SwiftUIMVVMCombineArtcles
//
//  Created by Rajendran Eshwaran on 2/28/22.
//

import SwiftUI

struct CrewView: View {
    var title : String = ""
    var rank : String = ""
    var year : String = ""
    var image : String = ""
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: image)){image in
                image
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .leading)
            }placeholder: {
                ZStack{
                    Image(systemName: "photo").resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.5)
                ProgressView()//.frame(alignment:.center)
                }
            }
            VStack(alignment:.leading){
                Text("Title: \(title)")
                Text("Rank: \(rank)")
                Text("Release Year: \(year)")
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static var previews: some View {
        CrewView(title: "", rank: "", year: "",image: "").previewLayout(.sizeThatFits)
    }
}
