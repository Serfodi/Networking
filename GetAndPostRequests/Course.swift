//
//  Course.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 05.08.2023.
//

import Foundation

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
}
