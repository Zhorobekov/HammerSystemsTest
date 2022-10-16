//
//  MainTabBarController.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

import UIKit


final class MainTabBarController: UITabBarController {
   
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .white
        
        let foodDeliveryViewController = FoodDeliveryViewController()
                
        viewControllers = [
            generateViewController(viewController: foodDeliveryViewController, title: "Меню", image: UIImage(named: "menu")!),
            generateViewController(viewController: UIViewController(), title: "Контакты", image: UIImage(named: "contacts")!),
            generateViewController(viewController: UIViewController(), title: "Профиль", image: UIImage(named: "union")!),
            generateViewController(viewController: UIViewController(), title: "Корзина", image: UIImage(named: "basket")!)
        ]
    }
    
    
    
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
