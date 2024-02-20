//
//  FilmFeedView.swift
//  Culture Critic
//
//  Created by Elegant Media on 2024-02-13.
//

import SwiftUI

struct FilmFeedView: View {
    
    var films:[Film]?
    
    var body: some View {
        
        if let films = films {
            ScrollView {
                VStack{
                    ForEach(films) { film in
                        FilmView(showDescription: false,film: film)
                    }
                }
            }//VStack
        }else{
            Text("No films!")
        }
        
        
    }
}

struct FilmFeedView_Previews: PreviewProvider {
    static var previews: some View {
        FilmFeedView(films: Mock.films)
    }
}
