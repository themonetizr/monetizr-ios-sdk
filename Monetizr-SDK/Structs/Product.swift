//
//  Product.swift
//  Monetizr-v3
//
//  Created by Armands Avotins on 24/04/2019.
//  Copyright © 2019 Monetizr. All rights reserved.

import Foundation
import Alamofire

public struct Product: Codable {
    let data: ProductDataClass?
}

public struct ProductDataClass: Codable {
    let productByHandle: ProductByHandle?
}

public struct ProductByHandle: Codable {
    let id, title, description, description_ios, descriptionHTML, button_title : String?
    let availableForSale, claimable: Bool?
    let onlineStoreURL: String?
    let images: Images?
    let variants: Variants?
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, description_ios, button_title 
        case descriptionHTML = "descriptionHtml"
        case availableForSale, claimable
        case onlineStoreURL = "onlineStoreUrl"
        case images, variants
    }
}

public struct Images: Codable {
    let edges: [ImagesEdge]?
}

public struct ImagesEdge: Codable {
    let node: ImageClass?
}

public struct ImageClass: Codable {
    let transformedSrc: String?
}

public struct Variants: Codable {
    let edges: [VariantsEdge]?
}

public struct VariantsEdge: Codable {
    let node: PurpleNode?
}

public struct PurpleNode: Codable {
    let id: String?
    let product: ProductClass?
    let title: String?
    let selectedOptions: [SelectedOption]?
    let priceV2, compareAtPriceV2: PriceV2?
    let image: ImageClass?
}

public struct PriceV2: Codable {
    let currencyCode, currency, amount: String?
}

public struct ProductClass: Codable {
    let title, description, description_ios, descriptionHTML: String?
    
    enum CodingKeys: String, CodingKey {
        case title, description, description_ios
        case descriptionHTML = "descriptionHtml"
    }
}

public struct SelectedOption: Codable {
    let name, value: String?
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
