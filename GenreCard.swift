//
//  GenreCard.swift
//  Culture Critic
//
//  Created by Elegant Media on 2024-02-14.
//

import SwiftUI

struct GenreCard: View {
    
    var genre:Genre?
    var cardHeight = 200.0
    var cornerRedius = 20.0
    var blurRadius = 0.0
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                
                if let genre = genre{
                    //img
                    Image(genre.films[0].img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width,height: cardHeight)
                        .clipped()
                        .overlay{
                            Color.black.opacity(0.6)
                        }
                        .cornerRadius(cornerRedius)
                        .blur(radius: blurRadius)
                    //Text
                    Text(genre.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .position(x:geo.size.width/2,y:geo.size.height/2)
                    
                    
                    
                }else{
                    Color.red
                        .frame(width:geo.size.width , height: cardHeight)
                        .cornerRadius(cornerRedius)
                }
                
            }//GeometryReader
            
        }.frame(height:cardHeight)
        //ZStack
    }
}

struct GenreCard_Previews: PreviewProvider {
    static var previews: some View {
        GenreCard(genre:Genre(id: "1", name: "Action", films:Mock.films))
    }
}
