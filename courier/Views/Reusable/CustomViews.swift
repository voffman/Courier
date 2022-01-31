//
//  CustomCardself.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit.UIView

class CustomViews: UIView {
    
    enum CustomselfStyles {
        case withShadow
    }
    
    let style: CustomselfStyles?
    
    let timerValue: String? = ""
    
    init(style: CustomselfStyles){
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        
        switch style {
        case .withShadow:
            self.backgroundColor = Colors.white
            self.layer.cornerRadius = 8
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 2 // Условно
            self.layer.shadowOpacity = 0.21

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
