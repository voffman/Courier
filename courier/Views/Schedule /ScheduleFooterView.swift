//
//  ScheduleFooterView.swift
//  courier
//
//  Created by Владимир Свиридов on 09.03.2022.
//

import UIKit

class ScheduleFooterView: UIView {
    
    let submitButton = CustomButtons(title: "Подтвердить расписание", style: .submit)
    
    let tickImage = UIImageView(image: UIImage(named: "Tick"))
    let submitLabel = CustomLabels(title: "ВЫ ПОДТВЕРДИЛИ", textSize: 14, style: .bold)
    
    
    func createFooterView(isHidden: Bool){
        self.addSubview(submitButton)
        submitButton.setButton()
        self.addSubview(tickImage)
        self.addSubview(submitLabel)
        submitLabel.setLabel()
        tickImage.isHidden = true
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: self.frame.size.width - 20).isActive = true
        submitButton.addTarget(self, action: #selector(submitButtonAction(sender:)), for: .touchUpInside)
        
        submitButton.isHidden = isHidden
        submitButton.setButton()
        
    }
    
    func setupSubmitInfo(){
        self.addSubview(tickImage)
        self.addSubview(submitLabel)
        tickImage.isHidden = false
        submitLabel.setLabel()
        tickImage.translatesAutoresizingMaskIntoConstraints = false
        submitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tickImage.topAnchor.constraint(equalTo: submitButton.centerYAnchor, constant: -self.frame.height/8 - 2).isActive = true
        submitLabel.topAnchor.constraint(equalTo: submitButton.centerYAnchor, constant: -self.frame.height/8).isActive = true
        
        tickImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tickImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        submitLabel.leftAnchor.constraint(equalTo: tickImage.rightAnchor, constant: 4).isActive = true
        tickImage.leftAnchor.constraint(equalTo: self.leftAnchor,
                                        constant: self.frame.width/2 - tickImage.frame.width/2 - submitLabel.intrinsicContentSize.width/2).isActive = true
        submitLabel.textColor = Colors.lightGreen
    }
    
    @objc func submitButtonAction(sender: UIButton){
        submitButton.isEnabled = false
        submitButton.isHidden = true
        setupSubmitInfo()
    }
    

}
