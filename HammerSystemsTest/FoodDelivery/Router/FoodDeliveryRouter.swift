//
//  FoodDeliveryRouter.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

protocol FoodDeliveryRoutingLogic {
    func presentCitiesViewController()
}


final class FoodDeliveryRouter: NSObject, FoodDeliveryRoutingLogic {

  weak var viewController: FoodDeliveryViewController?
  
    func presentCitiesViewController() {
        let view = CitiesViewController()
        view.callback = { [weak self] value in
            self?.viewController?.cityLabelText = value
        }
        view.router = FoodDeliveryRouter()
        viewController?.presentPanModal(view)
    }
}
