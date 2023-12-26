//
//  String+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension String {
    public var notEmpty: Bool {
        self.count > 0
    }
    
    public var isEmpty: Bool {
        self.count == 0
    }
    
    public var trim: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var url: URL? {
        URL(string: self)
    }
    
    public var fileUrl: URL {
        if #available(macOS 13.0, *) {
            return URL(filePath: self)
        } else {
            return URL(fileURLWithPath: self)
        }
    }
    
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    ///处理特殊字符 /Users/niko/Desktop/(abc)转成/Users/niko/Desktop/\(abc\)
    public func replaceSpecialChar(_ count: Int = 1) -> String {
        let escapeChar = String(repeating: "\\", count: count)
        var result = ""
        let set: [Character] = [" ", "(", ")", "&", "|", ";",
                                "\"", "'", "<", ">", "`"]
        for char in self {
            if set.contains(char) {
                result += escapeChar
            }
            result.append(char)
        }
        return result
    }
    
    ///str[1]
    public subscript(i: Int) -> String? {
        guard i >= 0 && i < count else { return nil }
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    ///str.substring(from: 2)
    public func substring(from i: Int) -> String? {
        guard i >= 0, i <= count else { return nil }
        return self[i..<count]
    }
    
    ///str.substring(to: 2)
    public func substring(to i: Int) -> String? {
        guard i >= 0, i <= count else { return nil }
        return self[0..<i]
    }
    
    ///str[0..<3]
    public subscript(range: CountableRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    ///str[1...3]
    public subscript(range: ClosedRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    ///str.substring(from:0, length:3)
    public func substring(from i: Int, length: Int) -> String? {
        guard length >= 0, i >= 0, i < count  else { return nil }
        guard i.advanced(by: length) <= count else { return substring(from: i) }
        guard length > 0 else { return "" }
        return self[i..<i.advanced(by: length)]
    }
    
    ///str.substring(range: NSMakeRange(0, 4))
    public func substring(range: NSRange) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: range.location, limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.length, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    ///str.substring(from:0, to:5)
    public func substring(from start: Int, to end: Int) -> String? {
        guard end >= start else { return nil }
        return self[start..<end]
    }
    
    ///Downie 4 转成 Downie\ 4
    public func nameSpaceEscaped(_ count: Int = 1) -> String {
        let escapeChar = String(repeating: "\\", count: count)
        let escapeSpace = escapeChar + " "
        let replaced = self.replacingOccurrences(of: " ", with: escapeSpace)
        return replaced
    }
}

//MARK: - image
extension String {
    public var image: NSImage {
        return NSImage(named: self)!
    }
}
