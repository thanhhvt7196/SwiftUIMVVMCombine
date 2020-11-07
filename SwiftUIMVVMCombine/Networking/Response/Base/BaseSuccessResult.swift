//
//  BaseSuccessResult.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

struct BaseSuccessResult: Error, Codable {
    var success: Bool?
    var status_code: Int?
    var status_message: String?
}
