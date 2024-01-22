//
//  CcTranslateController.swift
//  Translate
//
//  Created by niko on 2023/12/28.
//

import Cocoa

open class CcViewController: NSViewController {
    
    public var window: NSWindow! { view.window }
    
    open var viewSize: CGSize {
        return CGSize.zero
    }
    
    open override func loadView() {
        view = NSView()
        view.setFrameSize(viewSize)
        
        DistributedNotificationCenter.default().addObserver(self, selector: #selector(updateDarkMode), name: NSNotification.Name("AppleInterfaceThemeChangedNotification"), object: nil)
    }
    
    @objc fileprivate func updateDarkMode() {
        let dict = UserDefaults.standard.persistentDomain(forName: UserDefaults.globalDomain)
        if let type = dict?["AppleInterfaceStyle"] as? String, type.caseInsensitiveCompare("dark") == .orderedSame {
            darkMode(isDark: true)
        } else {
            darkMode(isDark: false)
        }
    }
    
    @objc open func darkMode(isDark: Bool) {}
}
