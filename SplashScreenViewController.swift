//
//  SplashScreenViewController.swift
//  Pulse v0
//
//  Created by Mathew Reiss on 7/10/17.
//  Copyright © 2017 Mathew Reiss. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var destination: UIViewController?
    var logoImageView: UIImageView?
    var pulsingImageView: UIImageView?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedLaunch" {
            destination = segue.destination
            pulsingImageView = destination!.view.subviews[0] as? UIImageView
            logoImageView = destination!.view.subviews[1] as? UIImageView
            perform(#selector(SplashScreenViewController.animateTheLogo), with: nil, afterDelay: 1.0)
        }
    }
    
    func animateTheLogo(){
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [.repeat, .curveEaseOut], animations: {() -> Void in
            //UIView.setAnimationRepeatCount(3)
            self.pulsingImageView?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.pulsingImageView?.alpha = 0.0
        }, completion: {(_ completed: Bool) -> Void in
            if (completed) {
                let myMainApp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootOfStoryboard")
                //UIWindow.mainWindow?.fadeInViewChanges { [weak self] in
                //    self?.navigationController?.setViewControllers([myMainApp], animated: false)
           //         }
            }
 
        })
    }
}
