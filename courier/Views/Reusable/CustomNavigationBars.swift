//
//  NavigationBar.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit

class CustomNavigationBars: UINavigationBar {
    
    enum NavigationBarStyles {
        case withSOSButton
        case withBackButton
    }
    
    var navigationBar = UINavigationBar(frame: CGRect())
    let navigationBarStyle: NavigationBarStyles?
    let targetView: UIView
    
    let barButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

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
            
        case .withSOSButton:
            let title: String = "Заказы"
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            label.textColor = Colors.black
            
            let barButtonImage = UIImage(named: "SOSButton")
            navigationBar.backgroundColor = .white
            barButton.image = barButtonImage
            barButton.tintColor = .red
            navigationItem.rightBarButtonItem = barButton
            navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
            navigationBar.setItems([navigationItem], animated: false)

        case .withBackButton:
            let price: String = "4 000 ₸"
            let orderId: String = "№ 356167"
            let label = UILabel()
            label.text = price
            label.textColor = Colors.gray
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            // начать отсюда
            
            let barButtonImage = UIImage(named: "BackArrow")
            barButton.image = barButtonImage
            navigationBar.backgroundColor = .white
            

            barButton.tintColor = .black
            navigationItem.leftBarButtonItem = barButton
            navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: label)
            navigationItem.title = orderId
            navigationBar.setItems([navigationItem], animated: false)
            
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

