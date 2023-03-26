//
//  BaseRouter.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol BaseRouterProtocol {
    var navigation: (() -> UINavigationController?) { get set }
}

class BaseRouter: BaseRouterProtocol {
    lazy var navigation: (() -> UINavigationController?) = { nil }
    
    var navigationController: UINavigationController? { navigation() }
}
