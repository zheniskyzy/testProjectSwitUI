//
//  Person.swift
//  TestProjectSwiftUI
//
//  Created by Madina Olzhabek on 02.07.2024.
//

import Foundation
import SwiftyJSON

class Person: Identifiable {
    var id = UUID()
    var name = ""
    var likes = ""
    var comments = ""
    var image = ""
    var description = ""
    var country = ""
    var share = ""
//    var postImageURL = ""
    var profession = ""
    var following = ""
    var followers = ""
    var commonLikes = ""
    var postPhoto1 = ""
//    var postPhoto: [PhotoPost] = []

   
    
    init(){
        
    }
    
    init(json: JSON){
        if let temp = json["image"].string{
            self.image = temp
        }
        if let temp = json["likes"].string{
            self.likes = temp
        }
        if let temp = json["name"].string{
            self.name = temp
        }
        if let temp = json["comments"].string{
            self.comments = temp
        }
        if let temp = json["description"].string{
            self.description = temp
        } 
        if let temp = json["country"].string{
            self.country = temp
        } 
//        if let temp = json["postImageURL"].string{
//            self.postImageURL = temp
//        }
        if let temp = json["share"].string{
            self.share = temp
        }
        if let temp = json["profession"].string{
            self.profession = temp
        }
        if let temp = json["following"].string{
            self.following = temp
        }
        if let temp = json["followers"].string{
            self.followers = temp
        } 
        if let temp = json["commonLikes"].string{
            self.commonLikes = temp
        }
            if let temp = json["postPhoto1"].string{
                self.postPhoto1 = temp
            }
//        if let array = json["postPhoto"].array{
//            for item in array{
//                let temp = PhotoPost(json: item)
//                self.postPhoto.append(temp)
//            }
//        }

        
    }
    
}
