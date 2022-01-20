//
//  CustomCardView.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit.UIView

class CustomViews: UIView {
    
    enum CustomViewStyles {
        case withShadow
        
    }
    
    let style: CustomViewStyles?
    
    let view = UIView()
    
    init(style: CustomViewStyles){
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        
        switch style {
        case .withShadow:
            view.backgroundColor = Colors.white
            view.layer.cornerRadius = 8
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowRadius = 2 // Условно
            view.layer.shadowOpacity = 0.21
            
        case .none:
            print("None")
        }
        
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
