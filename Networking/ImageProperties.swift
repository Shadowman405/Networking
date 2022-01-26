//
//  ImageProperties.swift
//  Networking
//
//  Created by Maxim Mitin on 26.01.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
import UIKit

struct ImageProperties {
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        guard let data = image.pngData() else {return nil}
        self.key = key
        self.data = data
    }
}
