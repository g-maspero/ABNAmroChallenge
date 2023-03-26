//
//  HomeViewController.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
    func displayLocations(_ locationsViewModel: LocationsViewModel)
}

class HomeViewController: BaseView {
    private struct Constraints {
        static let TopMargin: CGFloat = 8
        static let SideMargin: CGFloat = 8
        static let InterItemMargin: CGFloat = 4
        static let ActivityIndicatorSize: CGFloat = 80
    }
    
    private struct Constants {
        static let GifsPerRow = 3
        static let GifsInterSpacing: CGFloat = 4
        static let ScreenBackgroundColor: UIColor = .systemBackground
    }
    
    private let presenter: HomePresenterProtocol
    
    private lazy var locationsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.CellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private var locationsViewModel: LocationsViewModel?
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        presenter.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.viewWillDisappear()
    }
    
    private func setupViews() {
        title = HomeWording.Title
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = Constants.ScreenBackgroundColor
        view.addSubview(locationsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            locationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayLocations(_ locationsViewModel: LocationsViewModel) {
        self.locationsViewModel = locationsViewModel
        locationsTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.CellIdentifier, for: indexPath) as? LocationCell,
        let viewModel = locationsViewModel else { return UITableViewCell() }
        
        cell.setup(with: viewModel.locations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsViewModel?.locations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.cellTapped(at: indexPath)
    }
}
