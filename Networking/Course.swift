//
//  Course.swift
//  Networking
//
//  Created by Maxim Mitin on 25.01.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct Course: Codable {
    let id: Int?
    let name: String
    let link: String
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}
