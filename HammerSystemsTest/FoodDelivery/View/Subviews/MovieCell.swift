//
//  ProductCell.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import SnapKit
import UIKit

protocol MovieCellViewModel {
    var title: String { get }
    var subtitle: String { get }
    var imageUrl: String { get }
    var rating: String { get }
    var category: String { get }
}


final class MovieCell: UITableViewCell {    
    
    var category: String?
    
    private let movieImageView = WebImageView()
    private let titleLabel = UILabel(font: .bold17, numberOfLines: 2)
    private let subtitleLabel = UILabel(font: .regular13, numberOfLines: 0)
    private let ratingLabel: UILabel = {
        let label = UILabel(font: .bold13)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        
        let priceLabelContainer = UIView()
        let borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        priceLabelContainer.layer.borderWidth = 1
        priceLabelContainer.layer.borderColor = borderColor
        priceLabelContainer.layer.cornerRadius = 8
        
        let insets = UIEdgeInsets(top: -8, left: -18, bottom: -8, right: -18)
        label.addSubview(priceLabelContainer)
        priceLabelContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(insets)
        }
        
        return label
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel(font: .bold13, numberOfLines: 1, alignment: .left)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        return label
    }()
    private lazy var labelsStackView = UIStackView(axis: .vertical, distribution: .fill, spacing: 8, arrangedSubviews: [titleLabel, categoryLabel, subtitleLabel])
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    func set(viewModel: MovieCellViewModel) {
        movieImageView.set(imageUrl: viewModel.imageUrl)
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        ratingLabel.text = "IMBD: \(viewModel.rating)"
        categoryLabel.text = viewModel.category
        category = viewModel.category
    }
    
    override func prepareForReuse() {
        movieImageView.image = nil
    }
    
    private func setupViews() {
        
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 176 + 16 + 16).isActive = true
        
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in            
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(CGSize(width: 128, height: 176))
        }
        
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(movieImageView.snp.trailing).offset(32)
            make.trailing.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(labelsStackView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(24 + 18)
        }
        
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(ratingLabel.snp.bottom).offset(24)
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
