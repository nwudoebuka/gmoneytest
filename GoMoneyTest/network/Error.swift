//
//  Error.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 14/11/2021.
//

import Foundation
enum FailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
    case serverError = 500
}
