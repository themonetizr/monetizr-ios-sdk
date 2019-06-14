//
//  Extensions.swift
//  Monetizr-v3-sample-app
//
//  Created by Armands Avotins on 21/04/2019.
//  Copyright © 2019 Monetizr. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return self.topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }
        return self.leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }
        return self.rightAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return self.bottomAnchor
    }
    
    // Styles
    func checkoutButtonBackgroundViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    func variantOptionsContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hex: 0x231f20)
    }
    
    func imageCarouselContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hex: 0xc1c1c1)
    }
    
    func descriptionContainerViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
    }
    
    func addBlurEffect(style: UIBlurEffect.Style)
    {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}

extension UIButton {
    
    // Styles
    
    func closeProductButtonStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.setTitle("✕", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.light)
        self.setTitleColor(UIColor.black, for: .normal)
    }
    
    func checkoutProductButtonStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hex: 0x007aff)
        self.setTitle(NSLocalizedString("Checkout", comment: "Checkout"), for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.layer.cornerRadius = 5
    }
}

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}

extension UILabel {
    func priceLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = UIColor(hex: 0x007aff)
        self.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        self.numberOfLines = 1
        self.textAlignment = .right
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
    }
    
    func titleLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
    }
    
    func optionsTitleLabelStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .lightGray
        self.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
    }
}

extension UITextView {
    func descriptionTextViewStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .white
        self.isSelectable = false
        self.isEditable = false
    }
}

extension UIStackView {
    
    func removeAllArrangedSubviews() {        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}

extension UIImage {
    
    class func disclosureIndicator() -> UIImage? {
        let disclosureCell = UITableViewCell()
        disclosureCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        for view in disclosureCell.subviews {
            if let button = view as? UIButton {
                if let image = button.backgroundImage(for: UIControl.State.normal) {
                    return image
                }
            }
        }
        return nil
    }
}