//
//  WebsiteDescription.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 05.08.2023.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]?
    
}
