//
//  Models.swift
//  Culture Critic
//
//  Created by Elegant Media on 2024-02-13.
//

import Foundation
struct Genre:Identifiable,Decodable{
    private(set) var id:String
    private(set) var name:String
    private(set) var films:[Film]
    
    //func
    mutating func changeToWatchForFilmId(_ filmId:String){
        for i in films.indices{
            if films[i].id == filmId
            {
                films[i].toggleToWatch()
            }
        }
    }//changeToWatchForFilmId
    
    mutating func changeTheRatingTo(_ rating:Int,filmId:String){
        for i in films.indices{
            if films[i].id == filmId
            {
                films[i].changeRatingTo(rating)
            }
        }
    }//changeTheRatingTo
    
    
}

//Film is part of Genre
struct Film:Decodable,Identifiable{
    private(set) var id:String
    private(set) var title:String
    private(set) var duration:Int
    private(set) var rating:Int
    private(set) var toWatch:Bool
    private(set) var img:String
    private(set) var description:String
    private(set) var rank:Int
    
    //func
    mutating fileprivate func toggleToWatch(){
        toWatch.toggle()
    }//toggleToWatch
    
    mutating fileprivate func changeRatingTo(_ rating:Int){
        self.rating = rating
    }//changeRatingTo
    
}

struct Mock {
    static let films =
    [Film(id: "1",
          title: "Lion King",
          duration: 88,
          rating: 3,
          toWatch: true,
          img:"lion-king",
          description:"Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.",
          rank:1),
     
     Film (id: "2",
           title: "Wall -E",
           duration: 90,
           rating: 2,
           toWatch: false,
           img:"wall-e",
           description:"In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.",
           rank:2),]
}
