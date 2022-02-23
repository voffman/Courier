//
//  LoadingView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class LoadingView: UIView {

    var loadingView : UIView?
    
    func showLoadingView(onView: UIView, isHidden: Bool) {
        let backgroundView = UIView.init(frame: onView.bounds) // backgroundView
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = backgroundView.center
        
        DispatchQueue.main.async {
            backgroundView.addSubview(ai)
            onView.addSubview(backgroundView)
        }
        
        loadingView = backgroundView
        loadingView?.isHidden = isHidden
    }
}
