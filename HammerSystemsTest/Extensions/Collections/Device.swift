//
//  Device.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

import UIKit


public struct Device {
    
    public static var isSmall: Bool {
         UIView.screenWidth < 375
    }
}
