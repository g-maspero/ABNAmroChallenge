//
//  BaseView.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol BaseViewProtocol: UIViewController {
    func showLoader()
    func hideLoader()
}

class BaseView: UIViewController, BaseViewProtocol {
    private struct Constraints {
        static let ActivityIndicatorSize: CGFloat = 80
    }
    
    private lazy var activityIndicator: ActivityIndicator = {
        let activityIndicator = ActivityIndicator()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func showLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
    }
    
    private func setupViews() {
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        activityIndicator.centerInSuperview()
        activityIndicator.constraintSizeWithEqualSides(Constraints.ActivityIndicatorSize)
    }
}
