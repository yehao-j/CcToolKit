//
//  Int64+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/12.
//

import Cocoa

extension Int64 {
    ///文件大小单位是KB，MB，GB
    public var fileSize: String {
        let byteCountFormatter = ByteCountFormatter()
        byteCountFormatter.allowedUnits = [.useAll]
        byteCountFormatter.countStyle = .file
        return byteCountFormatter.string(fromByteCount: self)
    }
}
