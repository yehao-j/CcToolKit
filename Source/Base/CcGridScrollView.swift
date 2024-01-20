//
//  CcGridScrollView.swift
//  CcToolKit
//
//  Created by niko on 2024/1/2.
//

import Cocoa

/// scrollView中间添加了一个documentView，然后在添加gridView，其实scrollView可以直接设置gridView为documentView
/// 主要是因为这样能够让gridView的size就为内容填充的size，并且居中显示，不用自己再去设置
open class CcGridScrollView: CcView {
    private var rows: [[NSView]]!
    
    /// 主要是设置top和bottom，left和right目前不生效
    public var contentInsets: NSEdgeInsets = NSEdgeInsetsZero {
        didSet {
            documentView.constraints.forEach { documentView.removeConstraint($0) }
            gridView.constraints.forEach { gridView.removeConstraint($0) }
            
            gridView.topAnchor.constraint(equalTo: documentView.topAnchor, constant: contentInsets.top).isActive = true
            gridView.heightAnchor.constraint(equalToConstant: gridView.height).isActive = true
            gridView.centerXAnchor.constraint(equalTo: documentView.centerXAnchor).isActive = true
            
            documentView.heightAnchor.constraint(equalToConstant: gridView.height + contentInsets.top + contentInsets.bottom).isActive = true
            documentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }
    }
    
    public init(frame frameRect: NSRect = NSRect.zero, views rows: [[NSView]], gridUI: ((NSGridView) -> Void)?) {
        super.init(frame: frameRect)
        self.rows = rows
        
        addSubview(scrollView)
        documentView.addSubview(gridView)
        gridUI?(gridView)
        layoutGridView()
        
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        contentInsets = NSEdgeInsetsZero
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func layoutGridView() {
        gridView.layoutSubtreeIfNeeded()
    }
    
    //MARK: - getter or setter
    public lazy var scrollView: NSScrollView = {
        let view = NSScrollView()
        view.hasVerticalScroller = true
        view.drawsBackground = false
        view.documentView = self.documentView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var documentView: CcView = {
        let view = CcView(isFlipped: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var gridView: NSGridView = {
        let view = NSGridView(views: rows)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


fileprivate extension NSScrollView {
    /// 滚动到最上面
    func _scrollToTop() {
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
