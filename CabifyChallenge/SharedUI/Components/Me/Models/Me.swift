//
//  Me.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import Foundation

struct Me {
    let ME_NAME = "Bryan Caro Monsalve"
    let COMPANY_IMAGE = "cabify_logo"
    let ME_TITLE = "Nice to meet you!"
    let ME_DESCRIPTION = """
                         As a skilled and experienced iOS developer with a passion for mentorship, I deliver engaging and efficient software solutions that users love. With a strong background in Swift and various iOS frameworks, I have a proven track record of success in developing and launching successful iOS applications.

                         My interest in Data Science and IoT technology allows me to create even more innovative solutions for my clients. As a self-motivated and dedicated professional, I enjoy taking on new challenges and sharing my knowledge and experience with others. Whether working on a new project or mentoring team members, I bring a strong work ethic and desire to succeed to everything I do.
                         """
}

extension Me {
    static let mockedData: [Me] = [Me]()
}
