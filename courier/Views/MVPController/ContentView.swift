//
//  ContentView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class ContentView: UIView {
    
    var contentView: UIView?

    func showContentView(onView: UIView){
        let backgroundView = UIView.init(frame: onView.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        onView.addSubview(backgroundView)
    }
    
    func removeContentView(){
        self.contentView?.removeFromSuperview()
        self.contentView = nil
    }
    
}
