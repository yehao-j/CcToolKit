//
//  UserDefaults+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

//MARK: - 保存实现了Codable的对象或者对象数组
extension UserDefaults {
    public func setCodable<T>(_ object: T, key: String) where T: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: key)
        } catch {}
    }
    
    public func getCodable<T>(key: String, castTo type: T.Type) -> T? where T: Decodable {
        guard let data = data(forKey: key) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {}
        return nil
    }
    
    public func getCodable<T>(key: String) -> T? where T: Decodable {
        guard let data = data(forKey: key) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {}
        return nil
    }
}
