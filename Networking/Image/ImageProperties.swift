//
//  ImageProperties.swift
//  Networking
//
//  Created by Nikita Kuprik on 8/19/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

struct ImagePropetries {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
}
