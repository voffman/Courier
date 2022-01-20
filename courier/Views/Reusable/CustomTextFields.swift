//
//  CustomTextFields.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit.UITextField

class CustomTextFields: UITextField {
    
    enum CustomTextFieldStyles {
        case normal
        case withPhoneNumberFormatter
        
    }
    
    let pHolder: String?
    let style: CustomTextFieldStyles?
    
    let textField =  UITextField()
    
    init(pHolder: String?, style: CustomTextFieldStyles){
        self.pHolder = pHolder
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextField(){
        
        switch style {
        case .normal:
            textField.layer.cornerRadius = 4
            textField.layer.borderWidth = 0.4
            textField.layer.borderColor = Colors.gray.cgColor
            textField.placeholder = pHolder
            
        case .withPhoneNumberFormatter:
            textField.layer.cornerRadius = 4
            textField.layer.borderWidth = 0.4
            textField.layer.borderColor = Colors.gray.cgColor
            textField.placeholder = "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _"
            // пока без реального форматирования
            
            
            
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
