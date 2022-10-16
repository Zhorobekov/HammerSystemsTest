//
//  CategoryCell.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import SnapKit


final class CategoryCell: UICollectionViewCell {    
            
    let titleLabel: UILabel = {
       let label = UILabel(font: .regular13, numberOfLines: 1, alignment: .center)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
                titleLabel.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
            } else { 
                contentView.backgroundColor = .clear
                titleLabel.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
            }
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .clear

        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        contentView.layer.cornerRadius = contentView.frame.height / 2 
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        }
    }
}
