//
//  CategoriesView.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import UIKit

protocol ScrollToCategoryViewDelegate: AnyObject {
    func scrollToRow(with category: String)
}


final class CategoriesView: UITableViewHeaderFooterView {
    
    private var categories: [String]
    
    weak var delegate: ScrollToCategoryViewDelegate?
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self)
        collectionView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        return collectionView
    }()
        
    init(categories: [String]) {
        self.categories = categories
        super.init(reuseIdentifier: "")
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(section: createButtonsView())
    }
    
    private func createButtonsView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let rowHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let rowSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.26),
                                             heightDimension: rowHeight)
        let row = NSCollectionLayoutGroup.horizontal(layoutSize: rowSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: row)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
}


extension CategoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.text = categories[indexPath.row]
        return cell
    }
}


extension CategoriesView: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CategoryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.isSelected = true
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        delegate?.scrollToRow(with: categories[indexPath.row])
    }
}
