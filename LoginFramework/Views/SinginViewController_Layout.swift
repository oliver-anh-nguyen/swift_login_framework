//
//  SinginViewController_Layout.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//

import UIKit

extension SigninViewController {
    
    func applyLayout() {
        if let layout = layout {
            switch layout {
            case .Simple(let layout):
                applySimpleLayout(layout: layout)
            case .Advanced(let layout):
                applyAdvancedLayout(layout: layout)
            }
        }
    }
    
    func applySimpleLayout(layout: SimpleLayout) {
        if let img = layout.backgroundImage {
            bgImage.image = img
            bgImage.alpha = 1
        }
        if let bgColor = layout.bgColor {
            self.view.backgroundColor = bgColor
        }
        if let img = layout.logoImage {
            imgLogo.image = img
        }
        if let color = layout.primaryColor {
            lblTextSignin.textColor = color
            btnSignin.backgroundColor = color
            tfUsername.textColor = color
            tfPassword.textColor = color
            tfPassword.setColorClearButton(color: color)
            tfUsername.setColorClearButton(color: color)
        }
    }
    
    func applyAdvancedLayout(layout: AdvancedLayout) {
        
    }
    
}
