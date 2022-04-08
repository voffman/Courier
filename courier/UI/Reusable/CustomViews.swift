//
//  CustomViews.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit.UIView

class CustomViews: UIView {
    
    var circleWidth: CGFloat = 40
    var circleHeight: CGFloat = 40
    
    enum CustomViewStyles {
        case withShadow
        case circle
        case divider
    }
    
    let style: CustomViewStyles?

    init(style: CustomViewStyles){
        self.style = style
        super.init(frame: .zero)
    }
    
    init (cicrleWidth: CGFloat, circleHeight: CGFloat) {
        self.circleHeight = circleHeight
        self.circleWidth = cicrleWidth
        self.style = .circle
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
            self.layer.shadowRadius = 4 // Условно
            self.layer.shadowOpacity = 0.21

        case .circle:
            self.backgroundColor = Colors.orange
            self.frame.size.width = circleWidth
            self.heightAnchor.constraint(equalToConstant: circleHeight).isActive = true
            self.widthAnchor.constraint(equalToConstant: circleWidth).isActive = true
            self.layer.cornerRadius = self.frame.size.width / 2
            self.clipsToBounds = true
        
        case .divider:
            self.backgroundColor = Colors.lightGray
            self.translatesAutoresizingMaskIntoConstraints = false
            self.heightAnchor.constraint(equalToConstant: 1).isActive = true
            self.widthAnchor.constraint(equalToConstant: 308).isActive = true
            
            
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

