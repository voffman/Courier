//
//  CustomTimer.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import UIKit.UIView

class CustomTimer: UIView {
    
    enum CustomTimerStyles {
        case timerRed
        case timerGray
    }
    
    var style: CustomTimerStyles?
    
    let timerValue: String? = ""
    
    init(style: CustomTimerStyles){
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        
        switch style {

        case .timerRed:
            self.backgroundColor = Colors.lightRed
            self.layer.cornerRadius = 4
            self.layer.borderWidth = 1
            self.layer.borderColor = Colors.scarletRed.cgColor
            
        case .timerGray:
            self.backgroundColor = Colors.white
            self.layer.cornerRadius = 4
            self.layer.borderWidth = 1
            self.layer.borderColor = Colors.lightGray.cgColor
            
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
