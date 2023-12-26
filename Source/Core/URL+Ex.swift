//
//  URL+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/12.
//

import Cocoa

extension URL {
    ///是否是文件夹
    public var isDirectory: Bool {
        var isDirectory: ObjCBool = false
        FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return isDirectory.boolValue
    }
    
    ///是否是文件
    public var isFile: Bool {
        return !isDirectory
    }
    
    ///是否是图片
    public var isImage: Bool {
        guard let typeIdentifier = try? NSWorkspace.shared.type(ofFile: path) else {
            return false
        }
        
        return NSWorkspace.shared.type(typeIdentifier, conformsToType: kUTTypeImage as String)
    }
    
    /// 两个url之间是否是父子关系
    public func isParent(child: URL) -> Bool {
        let superComponents = self.pathComponents
        let childComponents = child.pathComponents
        
        if childComponents.count < superComponents.count {
            return false
        }
        
        var result = true
        superComponents.enumerated().forEach {
            if $0.element != childComponents[$0.offset] {
                result = false
            }
        }
        return result
    }
    
    public func append(path: String) -> URL {
        if #available(macOS 13.0, *) {
            return self.appending(path: path)
        } else {
            return self.appendingPathComponent(path)
        }
    }
    
    public var localPath: String {
        ///原本路径/Users/niko/Desktop/ab c
        ///参数为true，之后返回的路径/Users/niko/Desktop/ab%20c
        ///参数为true的时候，使用写入的方式创建文件会失败
        if #available(macOS 13.0, *) {
            return self.path(percentEncoded: false)
        } else {
            return self.path
        }
    }
}
