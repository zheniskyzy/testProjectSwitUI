//
//  PhotoPost.swift
//  TestProjectSwiftUI
//
//  Created by Madina Olzhabek on 03.07.2024.
//

import Foundation
import SwiftyJSON

class PhotoPost: Identifiable {
    var id = UUID()
    var postPhoto1 = ""
    var postPhoto2 = ""
    var postPhoto3 = ""
    var postPhoto4 = ""
    
    init() {
        
    }
    
    init(json: JSON) {
        if let temp = json["postPhoto1"].string{
            self.postPhoto1 = temp
        }
        if let temp = json["postPhoto2"].string{
            self.postPhoto2 = temp
        }
        if let temp = json["postPhoto3"].string{
            self.postPhoto3 = temp
        }
        if let temp = json["postPhoto4"].string{
            self.postPhoto4 = temp
        }
    }
    
}
