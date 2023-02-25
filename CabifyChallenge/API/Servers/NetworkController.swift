//
//  NetworkController.swift
//  MVVMSwiftUI
//
//  Created by Bryan Caro on 3/9/22.
//

import Foundation
import Combine

class Network: NetworkProtocol {
    var manager: NetworkController = NetworkController()
}

class NetworkController: NetworkControllerProtocol {
    //  MARK: - Generic Error
    let genericError = NSError(domain: "", code: -1)
    
    //  MARK: - Async Await
    func request<T : Decodable>(_ method: HttpMethod,
                                type: T.Type, decoder: JSONDecoder,
                                url: URL,
                                headers: Headers,
                                params: [String : Any]?) async throws -> T {
        let randomRequest = "\(Int.random(in: 0 ..< 100))"
        var timeDateRequest = Date()
        
        print("🌎🔵 [API] [id: \(randomRequest)] [URL]: [\(String(describing: url))]")
        print("🌎🔵 [API] [id: \(randomRequest)] [PARAMETERS]: [\(String(describing: params))]")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = params?.paramsEncoded()
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        do {
            timeDateRequest = Date()
            print("🌎🔵 [API] [id: \(randomRequest)] [SUBSCRIPTION]")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            print("🌎🔵 [API] [id: \(randomRequest)] [COMPLETION][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔵 [API] [id: \(randomRequest)] [OUTPUT]: [\(String(decoding: data, as: UTF8.self))]")
            
            guard let response = response as? HTTPURLResponse else {
                print("🌎🔴 [API] [id: \(randomRequest)] [RESPONSE ERROR]: [noResponse]")
                throw NetworkError.noResponse
            }
            
            if response.statusCode >= 200 && response.statusCode < 299 {
                if T.Type.self == EmptyResponse.Type.self {
                    print("🌎🔵 [API] [id: \(randomRequest)] [PARSER]: [EmptyResponse]")
                    return EmptyResponse() as! T
                } else {
                    let value = try decoder.decode(T.self, from: data)
                    print("🌎🔵 [API] [id: \(randomRequest)] [PARSER]: [OK]")
                    return value
                }
            } else {
                let errorValue = try decoder.decode(ErrorResponse.self, from: data)
                print("🌎⚠️ [API] [id: \(randomRequest)] [ERROR RESPONSE]: [\(errorValue)]")
                throw NetworkError.serverError(errorValue.errorMessage ?? "default.error.message".localized)
            }
        } catch let DecodingError.dataCorrupted(context) {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [dataCorrupted]: [\(context)]")
            throw NetworkError.decode("decoding error".localized)
        } catch let DecodingError.keyNotFound(key, context) {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [keyNotFound]: [Key \(key) not found: \(context.debugDescription)]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [keyNotFound]: [CodingPath: \(context.codingPath)]")
            throw NetworkError.decode("decoding error".localized)
        } catch let DecodingError.valueNotFound(value, context) {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [valueNotFound]: [Value \(value) not found: \(context.debugDescription)]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [valueNotFound]: [CodingPath: \(context.codingPath)]")
            throw NetworkError.decode("decoding error".localized)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [typeMismatch]: [Type \(type) mismatch: \(context.debugDescription)]")
            print("🌎🔴 [API] [id: \(randomRequest)] [DECODING-ERROR] [typeMismatch]: [CodingPath: \(context.codingPath)]")
            throw NetworkError.decode("decoding error".localized)
        } catch URLError.Code.notConnectedToInternet {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [NO INTERNET CONNECTION]")
            throw NetworkError.noInternet("default.connection.error.message".localized)
        } catch {
            print("🌎🔴 [API] [id: \(randomRequest)] [CANCEL][TIME]: [\(Date().timeIntervalSince(timeDateRequest).milliseconds)ms]")
            print("🌎🔴 [API] [id: \(randomRequest)] [ERROR]: [\(error)]")
            throw error
        }
    }
}
