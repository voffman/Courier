//
//  AlertView.swift
//  courier
//
//  Created by Владимир Свиридов on 16.02.2022.
//

import UIKit

class AlertView: UIView {

    let cardView = CustomViews(style: .withShadow)

    let nameLabel = CustomLabels(title: "Геолокация неактивна", textSize: 20, style: .bold, alignment: .left)
    let messageLabel = CustomLabels(title: "Чтобы начать, включите геолокацию в настройках", textSize: 16, style: .light, alignment: .justified)
    
    let cancelButton = CustomButtons(title: "Отмена", style: .normal)
    let sendButton = CustomButtons(title: "Включить", style: .primary)

    var alertView: UIView?
    
    func showAlertView(onView : UIView){
        let backgroundView = UIView.init(frame: onView.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        onView.addSubview(backgroundView)
        backgroundView.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true

        cardView.leftAnchor.constraint(equalTo:  onView.leftAnchor, constant: 20).isActive = true
        cardView.rightAnchor.constraint(equalTo:  onView.rightAnchor, constant: -20).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 293).isActive = true

        
        cardView.addSubview(nameLabel)
        
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: onView.frame.size.width - 30).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 57).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        messageLabel.bottomAnchor.constraint(lessThanOrEqualTo: cardView.topAnchor, constant: 175).isActive = true
 
        cardView.addSubview(cancelButton)
        cancelButton.setButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        cancelButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: cardView.centerXAnchor, constant: -5).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
      
        cardView.addSubview(sendButton)
        sendButton.setButton()
        sendButton.translatesAutoresizingMaskIntoConstraints = false

        sendButton.leftAnchor.constraint(equalTo: cardView.centerXAnchor, constant: 5).isActive = true
        sendButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
        
        alertView = backgroundView
    }
    
    func removeAlertView(){
        self.alertView?.removeFromSuperview()
        self.alertView = nil
    }
    
}
