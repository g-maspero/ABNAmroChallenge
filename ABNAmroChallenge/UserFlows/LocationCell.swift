//
//  LocationCell.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

class LocationCell: UITableViewCell {
    static let CellIdentifier = "LocationCellIdentifier"
    
    private struct Constants {
        static let TitleFontSize: CGFloat = 16
        static let LatitudeFontSize: CGFloat = 14
        static let LongitudeFontSize: CGFloat = 14
    }
    
    private struct Constraints {
        static let LeadingMargin: CGFloat = 16
        static let LatitudeToTitleSeparation: CGFloat = 8
        static let LatitudeToLongitudeSeparation: CGFloat = 4
        static let TopAndBottomMargins: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: Constants.TitleFontSize)
        return label
    }()
    
    private let latitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.LatitudeFontSize)
        return label
    }()
    
    private let longitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.LongitudeFontSize)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(latitudeLabel)
        contentView.addSubview(longitudeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraints.LeadingMargin),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constraints.TopAndBottomMargins),
            latitudeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            latitudeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.LatitudeToTitleSeparation),
            longitudeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            longitudeLabel.topAnchor.constraint(equalTo: latitudeLabel.bottomAnchor, constant: Constraints.LatitudeToLongitudeSeparation),
            longitudeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constraints.TopAndBottomMargins)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with locationViewModel: LocationViewModel) {
        titleLabel.text = locationViewModel.name
        latitudeLabel.text = "\(HomeWording.Latitude): \(String(locationViewModel.latitude))"
        longitudeLabel.text = "\(HomeWording.Longitude): \(String(locationViewModel.longitude))"
        
    }
}
