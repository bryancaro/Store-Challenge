//
//  Endpoint.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 14.1
//
//  Created by Bryan Caro on 4/11/23.
//  
//

import Foundation

struct Endpoint {
    var path       : String
    var queryItems : [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components        = URLComponents()
        components.scheme     = "https"
        components.host       = ConfigReader.baseHost()
        components.path       = "/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var headers: [String: Any] {
        /*
         let user              = "some api security"
         let password          = "some api security"
         let credentialData    = "\(user):\(password)".data(using: String.Encoding.utf8)!
         let base64Credentials = credentialData.base64EncodedString(options: [])

         return ["Authorization": "Basic \(base64Credentials)"]
         */
        return [String: Any]()
    }
}
