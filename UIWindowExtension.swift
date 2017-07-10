//
//  UIWindowExtension.swift
//  Pulse v0
//
//  Created by Mathew Reiss on 7/10/17.
//  Copyright © 2017 Mathew Reiss. All rights reserved.
//

import UIKit

extension UIWindow {
    
    static var mainWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    func fadeInViewChanges(viewChanges:(Void) -> (Void)) {
        let snapshot = self.snapshotView(afterScreenUpdates: false)
        self.addSubview(snapshot!)
        
        viewChanges()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: { snapshot!.alpha = 0.0; }, completion: { finished in snapshot!.removeFromSuperview() })
    }
    
}
