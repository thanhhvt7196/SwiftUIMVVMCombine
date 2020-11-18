//
//  ImageHelper.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/16/20.
//

import Foundation

enum ImageSize: String {
    case w200 = "/w200"
    case w300 = "/w300"
    case w400 = "/w400"
    case w500 = "/w500"
    case original = "/original"
}

class ImageHelper {
    static let shared = ImageHelper()
    
    func pathToURL(path: String?, imageSize: ImageSize) -> URL? {
        guard let path = path else {
            return nil
        }
        return URL(string: APIURL.imageBaseURL + imageSize.rawValue + path)
    }
}
