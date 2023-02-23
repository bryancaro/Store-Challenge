//
//  DataManager-Protocol.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    var callbackDelegate: DataAlertProtocol? { get set }
}
