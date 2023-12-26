//
//  CcConstant.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/12.
//

import Cocoa

public struct User {
    public static var name: String {
        let home = NSHomeDirectory()
        let paths = (home as NSString).pathComponents
        guard paths.count > 3 else {
            return ""
        }
        if paths[0] == "/" {
            return paths[2]
        }
        return paths[1]
    }
}

public struct App {
    public static var info: [String: Any]? {
        return Bundle.main.infoDictionary
    }
    
    public static var name: String {
        return (info?["CFBundleDisplayName"] as? String) ?? ""
    }
    
    public static var version: String {
        return (info?["CFBundleShortVersionString"] as? String) ?? "1.0.0"
    }
}
