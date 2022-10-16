//
//  BannerCell.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import SnapKit


final class BannerCell: UICollectionViewCell {
        
    private let imageView = UIImageView()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = .clear
    
        imageView.image = UIImage(named: "banner2")
        imageView.contentMode = .center
        imageView.clipsToBounds = true        
        imageView.layer.cornerRadius = 10
        
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
