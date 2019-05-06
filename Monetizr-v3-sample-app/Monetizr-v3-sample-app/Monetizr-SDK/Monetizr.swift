//
//  Monetizr.swift
//  Monetizr-v3-sample-app
//
//  Created by Armands Avotins on 20/04/2019.
//  Copyright © 2019 Monetizr. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Monetizr {
    
    static let shared = Monetizr(token: "")
    
    var token: String
    var language: String?
    let apiUrl = "https://api3.themonetizr.com/api/"
    
    // Initialization
    
    private init(token: String) {
        self.token = token
    }
    
    func setLanguage(language: String) {
        self.language = language
    }
    
    // Load product data
    func openProductForTag(tag: String, completionHandler: @escaping (Bool, Error?) -> Void){
        let size = screenWidthPixelsInPortraitOrientation().description
        var urlString = apiUrl+"products/tag/"+tag+"?size="+size
        if language != nil {
            urlString = urlString+"?language="+language!
        }
        let url = URL(string: urlString)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer "+token
        ]
        
        Alamofire.request(url!, headers: headers).responseProduct { response in
            if let retrievedProduct = response.result.value {
                //var product: Product?
                if retrievedProduct.data != nil {
                    let product = retrievedProduct
                    self.openProductViewForProduct(product: product)
                    completionHandler(true, nil)
                }
                else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "API error, contact Monetizr for details"])
                    completionHandler(false, error)
                }
            }
            else if let error = response.result.error as? URLError {
                print("URLError occurred: \(error)")
                completionHandler(false, error)
            }
            else {
                print("Unknown error: \(String(describing: response.result.error))")
                completionHandler(false, response.result.error!)
            }
        }
    }
    
    // Open product View
    func openProductViewForProduct(product: Product) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            let productViewController = ProductViewController()
            productViewController.modalPresentationStyle = .overCurrentContext
            productViewController.product = product
            topController.present(productViewController, animated: true, completion: nil)
        }
    }
}
