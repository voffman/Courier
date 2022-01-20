//
//  Buttons.swift
//  courier
//
//  Created by Владимир Свиридов on 19.01.2022.
//

import UIKit.UIButton

class CustomButtons: UIButton {
    
    enum CustomButtonStyles {
        case primary
        case secondary
        case normal
        // case phone
    }
    
    let title: String?
    var style: CustomButtonStyles?
    
    let button = UIButton()
    
    init(title: String, style: CustomButtonStyles){
        self.title = title
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton(){
        
        switch style {
        case .primary:
            button.backgroundColor = Colors.orange
            button.layer.cornerRadius = 4
            button.setTitle(title, for: .normal)
            button.setTitleColor(Colors.black, for: .normal)
            
        case .secondary:
            button.backgroundColor = Colors.lightGray
            button.layer.cornerRadius = 4
            button.setTitle(title, for: .normal)
            button.setTitleColor(Colors.darkGray, for: .normal)
            
        case .normal:
            button.backgroundColor = Colors.white
            button.layer.cornerRadius = 4
            button.setTitle(title, for: .normal)
            button.setTitleColor(Colors.black, for: .normal)
            
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