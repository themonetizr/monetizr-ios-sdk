//  Monetizr-v3-sample-app
//
//  Created by Armands Avotins on 11/09/2019.
//  Copyright © 2019 Monetizr. All rights reserved.

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let checkout = try? newJSONDecoder().decode(CheckoutResponse.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCheckout { response in
//     if let CheckoutResponse = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - CheckoutResponse
public struct CheckoutResponse: Codable {
    let data: DataClass?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDataClass { response in
//     if let dataClass = response.result.value {
//       ...
//     }
//   }

// MARK: - DataClass
public struct DataClass: Codable {
    let checkoutCreate, first, second, third, updateShippingAddress, updateShippingLine: CheckoutData?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCheckoutCreate { response in
//     if let checkoutCreate = response.result.value {
//       ...
//     }
//   }

// MARK: - CheckoutCreate
public struct CheckoutData: Codable {
    let checkoutUserErrors: [CheckoutUserError]?
    let payment: Payment?
    let checkout: CheckoutClass?
}

// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCheckoutUserError { response in
//     if let checkoutUserError = response.result.value {
//       ...
//     }
//   }

// MARK: - CheckoutUserError
struct CheckoutUserError: Codable {
    let field: [String]?
    let message: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCheckoutClass { response in
//     if let checkoutClass = response.result.value {
//       ...
//     }
//   }

// MARK: - CheckoutClass
public struct CheckoutClass: Codable {
    let id: String?
    let webURL: String?
    let taxExempt, taxesIncluded: Bool?
    let subtotalPriceV2, totalPriceV2, totalTaxV2: V2?
    let requiresShipping: Bool?
    let availableShippingRates: AvailableShippingRates?
    let shippingLine: Shipping?
    let lineItems: LineItems?
    
    enum CodingKeys: String, CodingKey {
        case id
        case webURL = "webUrl"
        case subtotalPriceV2, taxExempt, taxesIncluded, totalPriceV2, totalTaxV2, requiresShipping, availableShippingRates, shippingLine, lineItems
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAvailableShippingRates { response in
//     if let availableShippingRates = response.result.value {
//       ...
//     }
//   }

// MARK: - AvailableShippingRates
public struct AvailableShippingRates: Codable {
    let ready: Bool?
    let shippingRates: [Shipping]?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseShipping { response in
//     if let shipping = response.result.value {
//       ...
//     }
//   }

// MARK: - Shipping
public struct Shipping: Codable {
    let handle: String?
    let title: String?
    let priceV2: V2?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseV2 { response in
//     if let v2 = response.result.value {
//       ...
//     }
//   }

// MARK: - V2
public struct V2: Codable {
    let amount: String?
    let currencyCode: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLineItems { response in
//     if let lineItems = response.result.value {
//       ...
//     }
//   }

// MARK: - LineItems
public struct LineItems: Codable {
    let edges: [Edge]?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEdge { response in
//     if let edge = response.result.value {
//       ...
//     }
//   }

// MARK: - Edge
public struct Edge: Codable {
    let node: Node?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseNode { response in
//     if let node = response.result.value {
//       ...
//     }
//   }

// MARK: - Node
public struct Node: Codable {
    let title: String?
    let quantity: Int?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePayment { response in
//     if let payment = response.result.value {
//       ...
//     }
//   }

// MARK: - Payment
public struct Payment: Codable {
    let id: String?
    let errorMessage: String?
}

// MARK: - Helper functions for creating encoders and decoders

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

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseCheckout(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<CheckoutResponse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        // No-op
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
