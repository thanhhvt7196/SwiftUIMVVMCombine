//
//  APIClient.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation
import Combine

class APIClient {
    static func request<T: Codable>(router: APIRouter, type: T.Type) -> AnyPublisher<T, Error> {
        return Deferred {
            Future { promise in
                NetworkManager.apiProvider.request(router) { result in
                    switch result {
                    case .failure(let error):
                        if let data = error.response?.data {
                            do {
                                let response = try JSONDecoder().decode(APIError.self, from: data)
                                promise(.failure(response))
                            } catch let error {
                                print(error)
                                promise(.failure(APIError(status_code: nil, status_message: ErrorMessage.errorOccur)))
                            }
                        }
                        let statusCode = error.response?.statusCode
                        switch statusCode {
                        case HTTPStatusCodes.InternalServerError.rawValue:
                            promise(.failure(APIError(status_code: statusCode, status_message: ErrorMessage.serverError)))
                        case HTTPStatusCodes.NotFound.rawValue:
                            promise(.failure(APIError(status_code: statusCode, status_message: ErrorMessage.notFound)))
                        case HTTPStatusCodes.BadRequest.rawValue:
                            promise(.failure(APIError(status_code: statusCode, status_message: ErrorMessage.badRequest)))
                        default:
                            promise(.failure(APIError(status_code: statusCode, status_message: ErrorMessage.errorOccur)))
                        }
                    case .success(let response):
                        let statusCode = response.statusCode
                        if statusCode == HTTPStatusCodes.OK.rawValue || statusCode == HTTPStatusCodes.Created.rawValue {
                            let data = response.data
                            do {
                                let object = try JSONDecoder().decode(T.self, from: data)
                                promise(.success(object))
                            } catch let error {
                                print(error)
                                promise(.failure(error))
                            }
                        } else {
                            let data = response.data
                            do {
                                let error = try JSONDecoder().decode(APIError.self, from: data)
                                promise(.failure(error))
                            } catch let error {
                                print(error)
                                promise(.failure(error))
                            }
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
