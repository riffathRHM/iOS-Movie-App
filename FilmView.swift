//
//  FilmView.swift
//  Culture Critic
//
//  Created by Elegant Media on 2024-02-13.
//

import SwiftUI

struct FilmView: View {
    
    @State var showDescription = false
    var film:Film?
    var body: some View {
        
        VStack(spacing:0){
            
            if let film = film {
                Header(film: film) //Title,Rank,Duration
                Poster(showDescription:showDescription,film: film)//Poster
                Footer(showDescription:$showDescription,film:film) //Rating ,DescriptionButton,Bookmark
            }
            else {
                Text("No film to Display")
            }
            
            
            
            
            
            
            
            
        } //VStack
        
        
    }
}
struct Header: View {
    let film:Film
    var body : some View
    {
        VStack(alignment: .leading){
            HStack{
                //String Interpalation
                Text("\(film.title)")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.bold)//Title
                Spacer()
                Text("# \(film.rank)")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.bold)//Rank
            }
            Text("\(film.duration) min")
                .font(.caption)
        }.padding()//Header VStack
        
    }
}

struct Poster: View {
    let showDescription:Bool
    let film:Film
    var body : some View
    {
        ZStack{
            Image(film.img)
                .resizable()
                .aspectRatio(contentMode:.fill)//Image
            //Description Overlay
            if showDescription{
                Rectangle()
                    .opacity(0.6)
                    
                Text(film.description)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
    }
}

struct Footer: View {
    
    @Binding var showDescription:Bool
    @EnvironmentObject var model:GenreModel
    let film:Film
    
    var body : some View
    {
        HStack{
            //MARK: Rating Stars
            HStack{
                ForEach(1...4, id: \.self) {
                    index in
                    let star = index <= film.rating ? "star.fill":"star"
                    //star
                    ActionImage(symbolName: star){
                        //update the model to the next rating
                        model.changeTheRatingTo(index, forFilmId: film.id)
                    }
                        .foregroundColor(.yellow)
                }
            }
            //MARK: Description button
            Spacer()
            ActionImage(symbolName: "info.circle"){
                showDescription.toggle()
            }
            //MARK: Favourite Button
             let bookmark = film.toWatch ? "bookmark.fill":"bookmark"
            ActionImage(symbolName:bookmark){
                //update the value to new toWatch value
                model.toggleBookmarkForFilmId(film.id)
                
            }
        }.padding()
    }
}

struct ActionImage: View {
    let symbolName:String
    var action:(()->Void)?
    
    var body : some View
    {
        Button{
            if let action = action{
                action()
            }
        } label:{
            Image(systemName: symbolName)
                .resizable()
                .frame(width: 25.0,height: 25.0)
                .padding(5)
        }
        
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(showDescription: false,film:Mock.films[0])
            .environmentObject(GenreModel())
    }
}
