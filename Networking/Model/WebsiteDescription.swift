//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Maxim Mitin on 25.01.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct websiteDescription: Codable {
    let courses: [Course]
    
    let websiteName: String
    let websiteDescription: String
}
