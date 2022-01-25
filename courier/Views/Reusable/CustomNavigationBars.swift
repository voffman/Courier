//
//  NavigationBar.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit

class CustomNavigationBars: UINavigationBar {
    
    enum NavigationBarStyles {
        case orderList
        case aboutOrder
    }
    
    var navigationBar = UINavigationBar(frame: CGRect())
    let navigationBarStyle: NavigationBarStyles?
    let targetView: UIView
    

    let navigationItem = UINavigationItem()
    
    let barHeight: CGFloat = 44
    
    init (targetView: UIView, navigationBarStyle: NavigationBarStyles){
        self.targetView = targetView
        self.navigationBarStyle = navigationBarStyle
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   @objc func orderListAction(){
        print("open phone view")
    }
    
    func setupNavigationBar(){
        
        if UIScreen.main.bounds.size.height > 750 {
            if #available(iOS 11.0, *) {
                navigationBar  = UINavigationBar(frame: CGRect(x: 0, y: 43, width: targetView.frame.size.width, height: targetView.safeAreaInsets.top))
            }
        }
        
        
        if UIScreen.main.bounds.size.height < 750{
            navigationBar  = UINavigationBar(frame: CGRect(x: 0, y: 20, width: targetView.frame.size.width, height: barHeight))
        }
        
        targetView.addSubview(navigationBar)
        
        
        switch navigationBarStyle{
            
        case .orderList:
            
            navigationItem.title = "Заказы"
            navigationBar.setItems([navigationItem], animated: false)
            
            let barButtonImage = UIImage(named: "SOSButton")
            
            let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: nil, action: #selector(orderListAction))
            barButtonItem.tintColor = .red
            navigationItem.rightBarButtonItem = barButtonItem

        case .aboutOrder:
            print("About order")
            
        case .none:
            print("None")
        }
        
    }

}

/*
 // Only override draw() if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 override func draw(_ rect: CGRect) {
 // Drawing code
 }
 */

