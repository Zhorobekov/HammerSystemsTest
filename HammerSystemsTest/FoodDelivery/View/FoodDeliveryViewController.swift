//
//  FoodDeliveryViewController.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit
import SnapKit

protocol FoodDeliveryDisplayLogic: AnyObject {
    func displayData(viewModel: FoodDelivery.Model.ViewModel.ViewModelData)
}


final class FoodDeliveryViewController: UIViewController, FoodDeliveryDisplayLogic {
    
    private var interactor: FoodDeliveryBusinessLogic?
    private var router: (NSObjectProtocol & FoodDeliveryRoutingLogic)?
    private var lastContentOffset: CGFloat = 0
   
    var cityLabelText: String? {
        didSet {
            cityLabel.text = cityLabelText
        }
    } 
    
    private let cityLabel = UILabel(text: "Москва")
    private let chevronImageView = UIImageView(image: UIImage(named: "chevron_down"))    
    private lazy var chooseCityView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCity)))
        return view
    }()
    private let tableHeaderView: BannersView = {
        let width = UIView.screenWidth
        let height = width * 0.3
        let bannerView = BannersView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 24
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = tableHeaderView
        tableView.backgroundColor = .clear
        tableView.register(MovieCell.self)
        return tableView
    }()
    var categories: [String] = []
    var movieViewModel = MovieViewModel(cells: []) {
        didSet {
            movieViewModel.cells.forEach({ movie in
                if !categories.contains(movie.category) {
                    categories.append(movie.category)
                }
            })
        }
    }
    
    // MARK: Setup
    private func setup() {
        let viewController        = self
        let interactor            = FoodDeliveryInteractor()
        let presenter             = FoodDeliveryPresenter()
        let router                = FoodDeliveryRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        
        interactor?.makeRequest(request: .getMovies)
    }
    
    func displayData(viewModel: FoodDelivery.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayMovies(movieViewModel: let movieViewModel):
            self.movieViewModel = movieViewModel
            tableView.reloadData()
        }
    }
    
    @objc private func didTapCity() {
        router?.presentCitiesViewController()
    }
    
    private func setupViews() {
        
        view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
        }
        
        view.addSubview(chevronImageView)
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(cityLabel).offset(1)
            make.leading.equalTo(cityLabel.snp.trailing).offset(8)
            make.size.equalTo(CGSize(width: 14, height: 8))
        }
        
        view.addSubview(chooseCityView)
        chooseCityView.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(cityLabel)
            make.trailing.equalTo(chevronImageView)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(chooseCityView.snp.bottom).offset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
}


extension FoodDeliveryViewController: ScrollToCategoryViewDelegate {
    func scrollToRow(with category: String) {
        guard let index = movieViewModel.cells.firstIndex(where: {$0.category == category}) else { fatalError() }
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}
