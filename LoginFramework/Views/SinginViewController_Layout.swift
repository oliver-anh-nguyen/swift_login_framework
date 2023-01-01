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
    
    private func applySimpleLayout(layout: SimpleLayout) {
        if let img = layout.backgroundImage {
            bgImage.image = img
            bgImage.alpha = 1
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
            tfPassword.setColorPlaceholder(color: color.withAlphaComponent(0.5))
            tfUsername.setColorPlaceholder(color: color.withAlphaComponent(0.5))
            btnForgotPassword.setTitleColor(color, for: .normal)
            self.view.backgroundColor = .white
        }
        if let bgColor = layout.backgroundColor {
            self.view.backgroundColor = bgColor
        }
    }
    
    private func applyAdvancedLayout(layout: AdvancedLayout) {
        changeMainLayout(main: layout.mainView)
        changeLogoLayout(logo: layout.imgLogo)
        changeTextLayout(text: layout.textSignin)
        changeIconLayout(icon: layout.iconUsername, imgView: imgIconUsername)
        changeIconLayout(icon: layout.iconPassword, imgView: imgIconPassword)
        changeLineLayout(line: layout.lineUsername, view: lineUsername)
        changeLineLayout(line: layout.linePassword, view: linePassword)
        changeTextFieldLayout(config: layout.tfUsername, tf: tfUsername)
        changeTextFieldLayout(config: layout.tfPassword, tf: tfPassword)
        changeButtonLayout(config: layout.buttonSignin, button: btnSignin)
        changeButtonLayout(config: layout.buttonForgot, button: btnForgotPassword)
    }
    
    private func changeButtonLayout(config: ButtonConfig, button: UIButton) {
        if let font = config.font {
            button.titleLabel?.font = font
        }
        if let fontColor = config.fontColor {
            button.setTitleColor(fontColor, for: .normal)
        }
        if let bgColor = config.backgroundColor {
            button.backgroundColor = bgColor
        }
        if let alpha = config.alpha {
            button.alpha = CGFloat(alpha)
        }
        if let radius = config.cornerRadius {
            button.layer.cornerRadius = CGFloat(radius)
        }
    }
    
    private func changeTextFieldLayout(config: TextfieldConfig, tf: UITextField) {
        if let font = config.font {
            tf.font = font
        }
        if let color = config.textColor {
            tf.textColor = color
        }
    }
    
    private func changeLineLayout(line: LineConfig, view: UIView) {
        if let color = line.color {
            view.backgroundColor = color
        }
        if let alpha = line.alpha {
            view.alpha = CGFloat(alpha)
        }
    }
    
    private func changeIconLayout(icon: IconConfig, imgView: UIImageView) {
        if let icon = icon.image {
            imgView.image = icon
        }
    }
    
    
    private func changeMainLayout(main: MainConfig) {
        if let bgImg = main.image {
            bgImage.image = bgImg
        }
        if let bgColor = main.backgroundColor {
            self.view.backgroundColor = bgColor
            bgImage.backgroundColor = bgColor
        }
        if let alpha = main.alpha {
            bgImage.alpha = CGFloat(alpha)
        }
    }
    
    private func changeLogoLayout(logo: LogoConfig) {
        if let img = logo.image {
            imgLogo.image = img
        }
        if let bgColor = logo.backgroundColor {
            imgLogo.backgroundColor = bgColor
        }
        if let alpha = logo.alpha {
            imgLogo.alpha = CGFloat(alpha)
        }
    }
    
    private func changeTextLayout(text: TextConfig) {
        if let size = text.textSize {
            lblTextSignin.font.withSize(CGFloat(size))
        }
        if let color = text.fontColor {
            lblTextSignin.textColor = color
        }
        if let font = text.font {
            lblTextSignin.font = font
        }
    }
    
    
}
