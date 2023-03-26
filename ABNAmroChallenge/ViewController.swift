//
//  ViewController.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEST GAS"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        view.backgroundColor = .white
    }
}
