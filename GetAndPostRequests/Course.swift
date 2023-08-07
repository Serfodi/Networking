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
    let number_of_lessons: Int?
    let number_of_tests: Int?
    
}
