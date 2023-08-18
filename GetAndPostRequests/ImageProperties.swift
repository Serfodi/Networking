//
//  ImageProperties.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 18.08.2023.
//

import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
    
}

