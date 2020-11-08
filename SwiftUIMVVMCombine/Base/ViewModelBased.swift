//
//  ViewModelBased.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

protocol ViewModel {
    
}

protocol ServicesViewModel: ViewModel {
    associatedtype Services
    var services: Services! { get set }
}

protocol ViewModelBased: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}
