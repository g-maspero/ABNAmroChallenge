//
//  CustomLocationSelectorView.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol CustomLocationSelectorViewDelegate: AnyObject {
    func takeMeThereButtonWasTapped(_ customLocationSelectorView: CustomLocationSelectorView)
}

class CustomLocationSelectorView: UIView {
    private struct Constants {
        static let TitleFontSize: CGFloat = 16
        static let ButtonFontSize: CGFloat = 16
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: Constants.TitleFontSize)
        return label
    }()
    
    private lazy var latitudeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.delegate = self
        return textField
    }()
    
    private lazy var longitudeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.delegate = self
        return textField
    }()
    
    private lazy var takeMeThereButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapTakeMeThereButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.ButtonFontSize)
        return button
    }()
    
    weak var delegate: CustomLocationSelectorViewDelegate?
    
    var latitude: Double? {
        guard let latitudeText = latitudeTextField.text else { return nil }
        return Double(latitudeText)
    }
    
    var longitude: Double? {
        guard let longitudeText = longitudeTextField.text else { return nil }
        return Double(longitudeText)
    }
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: CustomLocationSelectorViewModel) {
        titleLabel.text = viewModel.title
        latitudeTextField.placeholder = viewModel.latitudePlaceholder
        longitudeTextField.placeholder = viewModel.longitudePlaceholder
        takeMeThereButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    private func setupViews() {
        addSubviews(titleLabel,
                    latitudeTextField,
                    longitudeTextField,
                    takeMeThereButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            latitudeTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            latitudeTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            latitudeTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            longitudeTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            longitudeTextField.leadingAnchor.constraint(equalTo: latitudeTextField.trailingAnchor, constant:  8),
            longitudeTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            takeMeThereButton.topAnchor.constraint(equalTo: longitudeTextField.bottomAnchor, constant: 8),
            takeMeThereButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            takeMeThereButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            takeMeThereButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func didTapTakeMeThereButton() {
        delegate?.takeMeThereButtonWasTapped(self)
    }
}

extension CustomLocationSelectorView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "-."))
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            
        return true
    }
}
