//
//  ContentView.swift
//  Culture Critic
//
//  Created by Elegant Media on 2024-02-13.
//

import SwiftUI

struct GenreListView: View {
    
    @ObservedObject var model = GenreModel()
    
    var body: some View {
        
        //Navigation View
        NavigationView{
            ScrollView{
                VStack(spacing: 0){
                    ForEach(model.genres){
                        genre in
                        NavigationLink{ FilmFeedView(films: genre.films)
                                .navigationTitle(genre.name)
                                .navigationBarTitleDisplayMode(.inline)
                            
                        }label: {
                            GenreCard(genre:genre)
                        }
                        
                    }.padding()
                }.navigationTitle("Genres")
                //VStack
            }//ScrollView
            //            List(model.genres){ genre in
            //
            //                NavigationLink(genre.name){
            //
            //                    //FilmFeedView
            //                    FilmFeedView(films: genre.films)
            //                    //genre.view
            //                }
            //
            //            }
        }.environmentObject(model)
        //environmentObject can access any child objcets
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GenreListView()
    }
}


