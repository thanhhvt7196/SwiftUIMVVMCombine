//
//  ViewModelBased.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

protocol ViewModel {
    
}

protocol UsecaseViewModel: ViewModel {
    associatedtype UseCase
    var useCase: UseCase! { get set }
}
