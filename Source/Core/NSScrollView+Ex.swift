//
//  NSScrollView+Ex.swift
//  CcToolKit
//
//  Created by niko on 2024/1/2.
//

import Cocoa

extension NSScrollView {
    /// 滚动到最上面
    public func scrollToTop() {
        if let documentView = self.documentView {
            if documentView.isFlipped {
                documentView.scroll(.zero)
            } else {
                let maxHeight = max(bounds.height, documentView.bounds.height)
                documentView.scroll(NSPoint(x: 0, y: maxHeight))
            }
        }
    }
}
