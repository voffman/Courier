//
//  ContentView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class ContentView: UIView {
    
    var contentView: UIView?

    func showContentView(onView: UIView, isHidden: Bool){
        let backgroundView = UIView.init(frame: onView.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        UIApplication.shared.keyWindow!.addSubview(backgroundView)
       // onView.addSubview(backgroundView)
        contentView = backgroundView
        contentView?.isHidden = isHidden
    }
}
