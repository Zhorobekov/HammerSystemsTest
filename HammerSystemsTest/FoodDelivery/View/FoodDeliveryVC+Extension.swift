//
//  FoodDeliveryVC + Extension.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import UIKit

extension FoodDeliveryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CategoriesView(categories: categories)
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }
}


extension FoodDeliveryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = movieViewModel.cells[indexPath.row]
        let cell: MovieCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: cellViewModel)
        return cell
    }
}

extension FoodDeliveryViewController: UIScrollViewDelegate {
 
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard 
            let visibleCells = tableView.visibleCells as? [MovieCell],
            let index = categories.firstIndex(of: visibleCells[1].category ?? ""), 
            let categoriesView = tableView.headerView(forSection: 0) as? CategoriesView
        else { return }
        categoriesView.collectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .left)
    }
}

