//
//  FileManagerModel.swift
//  FileManagerList
//
//  Created by Guru Mahan on 06/01/23.
//

import Foundation
import UIKit

struct FilemanagerModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var image = UIImage(named: "")
    var isSelected: Bool = false
    
}











//
//struct PhotoModel: Identifiable, Codable {
//    let albumId: Int
//    let id: Int
//    let title: String
//    let url: String
//    let thumbnailUrl: String
//
//}

/*
{
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
*/
