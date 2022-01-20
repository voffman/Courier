//
//  CustomLabels.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit.UILabel

class CustomLabels: UILabel {
    
    enum CustomLabelStyles {
        case bold
        case regular
        case light
        
    }
    
    var title: String?
    let textSize: CGFloat
    let style: CustomLabelStyles?
    
    let label = UILabel()
    
    init(title: String, textSize: CGFloat, style: CustomLabelStyles){
        self.title = title
        self.textSize = textSize
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(){
        
        switch style {
        case .bold:
            label.text = title
            label.font = UIFont.boldSystemFont(ofSize: textSize)
            label.textColor = Colors.black
            
        case .regular:
            label.text = title
            label.font = UIFont.systemFont(ofSize: textSize)
            label.textColor = Colors.black
            label.textAlignment = .natural
            label.numberOfLines = 0
            
        case .light:
            label.text = title
            label.font = UIFont.systemFont(ofSize: textSize)
            label.textColor = Colors.gray
            
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
