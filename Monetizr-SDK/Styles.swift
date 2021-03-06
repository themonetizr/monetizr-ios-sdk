//
//  Styles.swift
//  Monetizr-v3
//
//  Created by Armands Avotins on 15/10/2019.
//  Copyright © 2019 Monetizr. All rights reserved.
//

import Foundation
import UIKit
import PassKit

// Styles
extension UIView {
    func productViewBackgroundStyle() {
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0x121212)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = UIColor.systemBackground
            } else {
                // Fallback on earlier versions
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    func variantSelectorViewBackgroundStyle() {
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor.init(white: 0.15, alpha: 1)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = UIColor.systemBackground
            } else {
                // Fallback on earlier versions
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    func variantOptionsContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = .clear
            self.addBlurEffect(style: .dark)
        }
        else {
            if #available(iOS 13.0, *) {
                if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                    self.backgroundColor = .clear
                    self.addBlurEffect(style: .dark)
                }
                else {
                    self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                    self.addBlurEffect(style: .light)
                }
            } else {
                // Fallback on earlier versions
                self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                self.addBlurEffect(style: .light)
            }
        }
    }
    
    func imageCarouselContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0xc1c1c1)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = UIColor.systemBackground
            } else {
                // Fallback on earlier versions
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    func descriptionContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
    }
    
    func descriptionSeparatorViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
    }
}

extension UIStackView {
    // Styles
    func checkoutButtonBackgroundViewStyle() {
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution = UIStackView.Distribution.fillEqually
        self.alignment = UIStackView.Alignment.leading
        self.spacing = 10.0
        self.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.isLayoutMarginsRelativeArrangement = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    
    // Styles    
    func checkoutProductButtonStyle(title: String? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(NSLocalizedString("Checkout", comment: "Checkout"), for: .normal)
        if title != nil {
            self.setTitle(title, for: .normal)
        }
        self.setTitleColor(.lightGray, for: .highlighted)
        self.height(constant: 50)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
  
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0x121212)
            self.layer.borderColor = UIColor.white.cgColor
            self.setTitleColor(.white, for: .normal)
            self.setTitleColor(.lightGray, for: .highlighted)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = .systemBackground
                self.layer.borderColor = UIColor.label.cgColor
                self.setTitleColor(.label, for: .normal)
                self.setTitleColor(.label, for: .highlighted)
            } else {
                // Fallback on earlier versions
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.globalTint.cgColor
                self.setTitleColor(.globalTint, for: .normal)
                self.setTitleColor(.globalTint, for: .highlighted)
            }
        }
    }
    
    func submitClaimButtonStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(NSLocalizedString("Submit", comment: "Submit"), for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
        self.height(constant: 50)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0x121212)
            self.layer.borderColor = UIColor.white.cgColor
            self.setTitleColor(.white, for: .normal)
            self.setTitleColor(.lightGray, for: .highlighted)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = .systemBackground
                self.layer.borderColor = UIColor.label.cgColor
                self.setTitleColor(.label, for: .normal)
                self.setTitleColor(.label, for: .highlighted)
            } else {
                // Fallback on earlier versions
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.globalTint.cgColor
                self.setTitleColor(.globalTint, for: .normal)
                self.setTitleColor(.globalTint, for: .highlighted)
            }
        }
    }
    
    func submitClaimButtonErrorStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(NSLocalizedString("Submit", comment: "Submit"), for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
        self.height(constant: 50)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0x121212)
            self.layer.borderColor = UIColor.red.cgColor
            self.setTitleColor(.white, for: .normal)
            self.setTitleColor(.lightGray, for: .highlighted)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = .systemBackground
                self.layer.borderColor = UIColor.red.cgColor
                self.setTitleColor(.label, for: .normal)
                self.setTitleColor(.label, for: .highlighted)
            } else {
                // Fallback on earlier versions
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.red.cgColor
                self.setTitleColor(.globalTint, for: .normal)
                self.setTitleColor(.globalTint, for: .highlighted)
            }
        }
    }
    
    func submitClaimButtonValidStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(NSLocalizedString("Submit", comment: "Submit"), for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
        self.height(constant: 50)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        if Monetizr.shared.chosenTheme == .black {
            self.backgroundColor = UIColor(hex: 0x121212)
            self.layer.borderColor = UIColor.green.cgColor
            self.setTitleColor(.white, for: .normal)
            self.setTitleColor(.lightGray, for: .highlighted)
        }
        else {
            if #available(iOS 13.0, *) {
                self.backgroundColor = .systemBackground
                self.layer.borderColor = UIColor.green.cgColor
                self.setTitleColor(.label, for: .normal)
                self.setTitleColor(.label, for: .highlighted)
            } else {
                // Fallback on earlier versions
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.green.cgColor
                self.setTitleColor(.globalTint, for: .normal)
                self.setTitleColor(.globalTint, for: .highlighted)
            }
        }
    }
}

extension PKPaymentButton {
    func buyButtonWithTheme()->PKPaymentButton {
        if Monetizr.shared.chosenTheme == .black {
            return PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .whiteOutline)
        }
        else {
            if #available(iOS 13.0, *) {
                if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                    return PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .whiteOutline)
                }
                else {
                    return PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
                }
            } else {
                // Fallback on earlier versions
                return PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
            }
        }
        
    }
}

extension UILabel {
    func optionNameStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: 14, weight: UIFont.Weight.light)
        self.text = self.text?.uppercased()
        self.numberOfLines = 1
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .lightGray
        }
        else {
            if #available(iOS 13.0, *) {
                if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                    self.textColor = .lightGray
                }
                else {
                    self.textColor = .gray
                }
            }
            else {
                self.textColor = .gray
            }
        }
    }
    
    func optionValueStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
            }
            else {
                self.textColor = .black
            }
        }
    }
    
    func priceLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.medium)
        self.numberOfLines = 1
        self.textAlignment = .right
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = UIColor(hex: 0xE0093B)
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
            } else {
                // Fallback on earlier versions
                self.textColor = .globalTint
            }
        }
    }
    
    func discountPriceLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .lightGray
        self.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.numberOfLines = 1
        self.textAlignment = .right
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
    }
    
    func productTitleLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.medium)
        self.numberOfLines = 0
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
            } else {
                // Fallback on earlier versions
                self.textColor = .black
            }
        }
    }
    
    func claimTitleLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.medium)
        self.numberOfLines = 0
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        
        self.textColor = .black
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
            return
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
            }
        }
    }
    
    func addressInputLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.masksToBounds = true
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
            self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
                self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            } else {
                // Fallback on earlier versions
                self.textColor = .black
                self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            }
        }
    }
}

extension UITextView {
    func descriptionTextViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: 16, weight: UIFont.Weight.light)
        self.isSelectable = false
        self.isEditable = false
        self.isScrollEnabled = false
        
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
            } else {
                // Fallback on earlier versions
                self.textColor = .black
            }
        }
    }
}

extension UITextField {
    func addressInputFieldStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setLeftPaddingPoints(10)
        self.setRightPaddingPoints(10)
        //self.font = .systemFont(ofSize: 16, weight: UIFont.Weight.light)
        self.returnKeyType = .done
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
            self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
                self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            } else {
                // Fallback on earlier versions
                self.textColor = .black
                self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            }
        }
    }
    
    func addressInputFieldErrorStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setLeftPaddingPoints(10)
        self.setRightPaddingPoints(10)
        //self.font = .systemFont(ofSize: 16, weight: UIFont.Weight.light)
        self.returnKeyType = .done
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
        if Monetizr.shared.chosenTheme == .black {
            self.textColor = .white
            self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        }
        else {
            if #available(iOS 13.0, *) {
                self.textColor = .label
                self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            } else {
                // Fallback on earlier versions
                self.textColor = .black
                self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            }
        }
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension String {
    func expandDownImageName()->String {
        if Monetizr.shared.chosenTheme == .black {
            return "expand-down-white"
        }
        else {
            if #available(iOS 13.0, *) {
                if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                    return "expand-down-white"
                }
                else {
                    return "expand-down-black"
                }
            } else {
                // Fallback on earlier versions
                return "expand-down-black"
            }
        }
    }
}

extension UINavigationController {
    func variantSelectionControllerNavigationStyle() {
        if Monetizr.shared.chosenTheme == .black {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.shadowImage = UIImage()
            let backgroundColor = UIColor.init(white: 0.15, alpha: 1)
            self.navigationBar.backgroundColor = backgroundColor
            self.navigationBar.isTranslucent = false
            self.navigationBar.barTintColor = backgroundColor
            self.navigationBar.tintColor = UIColor(hex: 0xE0093B)
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            self.navigationBar.titleTextAttributes = textAttributes
        }
        else {
            if #available(iOS 13.0, *) {
                self.navigationBar.tintColor = .label
            } else {
                // Fallback on earlier versions
                
            }
        }
    }
}

extension UITableViewCell {
    func variantSelectionControllerCellStyle() {        
        if Monetizr.shared.chosenTheme == .black {
            let backgroundColor = UIColor.init(white: 0.15, alpha: 1)
            self.backgroundColor = backgroundColor
            self.textLabel?.textColor = UIColor(hex: 0xE0093B)
            self.detailTextLabel?.textColor = .lightGray
            self.tintColor = UIColor(hex: 0xE0093B)
            if #available(iOS 13, *) {
               overrideUserInterfaceStyle = .dark
            }
        }
        else {
            if #available(iOS 13.0, *) {
                self.tintColor = .label
            } else {
                // Fallback on earlier versions
                
            }
        }
    }
}
