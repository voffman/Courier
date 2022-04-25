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
        case submit
        case transparent
        // case phone
    }
    
    var title: String?
    var style: CustomButtonStyles?

    
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
            self.backgroundColor = Colors.orange
            self.layer.cornerRadius = 4
            self.setTitle(title?.uppercased(), for: .normal)
            self.setTitleColor(Colors.black, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            
        case .secondary:
            self.backgroundColor = Colors.lightGray
            self.layer.cornerRadius = 4
            self.setTitle(title, for: .normal)
            self.setTitleColor(Colors.darkGray, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            
        case .normal:
            self.backgroundColor = Colors.white
            self.layer.cornerRadius = 4
            self.setTitle(title?.uppercased(), for: .normal)
            self.setTitleColor(Colors.black, for: .normal)
            self.layer.borderWidth = 1
            self.layer.borderColor = Colors.gray.cgColor
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            
        case .submit:
            self.backgroundColor = Colors.lightGreen
            self.layer.cornerRadius = 4
            self.setTitle(title, for: .normal)
            self.setTitleColor(Colors.white, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            
        case .transparent:
            self.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

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
