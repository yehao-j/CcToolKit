//
//  HandyJSON+Cc.swift
//  Translate
//
//  Created by yehao on 2023/7/7.
//

import HandyJSON

extension HandyJSON {
    static func deserialize(from data: Data?, designatedPath: String? = nil) -> Self? {
        return JSONDeserializer<Self>.deserializeFrom(data: data, designatedPath: designatedPath)
    }
}

extension JSONDeserializer {
    static func deserializeFrom(data: Data?, designatedPath: String? = nil) -> T? {
        guard let _data = data else {
            return nil
        }
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: _data, options: .allowFragments)
            if let jsonDict = jsonObject as? NSDictionary {
                return JSONDeserializer<T>.deserializeFrom(dict: jsonDict, designatedPath: designatedPath)
            }
        } catch {}
        
        return nil
    }
}
