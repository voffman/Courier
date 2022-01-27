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
        case detailOrder
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
    
    @objc func backButtonAction(){
        //
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
            let title: String = "Заказы"
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            label.textColor = Colors.black
            
            navigationBar.setItems([navigationItem], animated: false)
            
            let barButtonImage = UIImage(named: "SOSButton")
            navigationBar.backgroundColor = .white
            
            let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: nil, action: #selector(orderListAction))
            barButtonItem.tintColor = .red
            navigationItem.rightBarButtonItem = barButtonItem
            navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

        case .detailOrder:
            print("Detail order")
            let price: String = "4 000 ₸"
            let orderId: String = "№ 356167"
            let label = UILabel()
            label.text = price
            label.textColor = Colors.gray
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            // начать отсюда
            navigationBar.setItems([navigationItem], animated: false)
            
            let barButtonImage = UIImage(named: "BackArrow")
            navigationBar.backgroundColor = .white
            
            let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: nil, action: #selector(backButtonAction))
            barButtonItem.tintColor = .black
            navigationItem.leftBarButtonItem = barButtonItem
            navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: label)
            navigationItem.title = orderId
            
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

