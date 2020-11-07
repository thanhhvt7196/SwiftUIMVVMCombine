//
//  APIRouter.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation
import Moya

enum APIRouter {
    case getListABC
}

extension APIRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return [
            HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue
        ]
    }

    var path: String {
        switch self {
        default:
            return ""
        }
    }
}
