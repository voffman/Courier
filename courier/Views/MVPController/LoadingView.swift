//
//  LoadingView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class LoadingView: UIView {

    var viewSpinner : UIView?
    
    func showSpinner(onView: UIView) {
        let backgroundView = UIView.init(frame: onView.bounds) // backgroundView
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = backgroundView.center
        
        DispatchQueue.main.async {
            backgroundView.addSubview(ai)
            onView.addSubview(backgroundView)
        }
        
        viewSpinner = backgroundView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.viewSpinner?.removeFromSuperview()
            self.viewSpinner = nil
        }
    }
}
