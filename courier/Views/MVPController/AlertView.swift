//
//  AlertView.swift
//  courier
//
//  Created by Владимир Свиридов on 16.02.2022.
//

import UIKit

class AlertView: UIViewController {

    let cardView = CustomViews(style: .withShadow)

    let nameLabel = CustomLabels(title: "Предупреждение", textSize: 20, style: .bold, alignment: .left)
    let messageLabel = CustomLabels(title: "Здесь отображается сообщение", textSize: 16, style: .light, alignment: .justified)
    
    let cancelButton = CustomButtons(title: "Отмена", style: .normal)
    let sendButton = CustomButtons(title: "Подтвердить", style: .primary)
    
    
    func configureData(name: String?, message: String?, cancelButton: String? = "Отмена", sendButton: String? = "Подтвердить"){
    
        nameLabel.title = name
        messageLabel.title = message
        
        self.cancelButton.setTitle(cancelButton, for: .normal)
        self.sendButton.setTitle(sendButton, for: .normal)
        
        nameLabel.setLabel()
        messageLabel.setLabel()
        
        self.cancelButton.setButton()
        self.sendButton.setButton()
    }

    func showAlertView(){
        
        let onVC = UIApplication.shared.keyWindow!
        
        let backgroundView = UIView.init(frame: onVC.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
      //  UIApplication.shared.keyWindow!.addSubview(backgroundView)
        
        onVC.addSubview(backgroundView)
        backgroundView.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: onVC.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: onVC.centerYAnchor).isActive = true

        cardView.leftAnchor.constraint(equalTo:  onVC.leftAnchor, constant: 20).isActive = true
        cardView.rightAnchor.constraint(equalTo:  onVC.rightAnchor, constant: -20).isActive = true
        cardView.addSubview(nameLabel)
        
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
 
        cardView.addSubview(cancelButton)
        cancelButton.setButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: cardView.centerXAnchor, constant: -5).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
      
        cardView.addSubview(sendButton)
        sendButton.setButton()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20).isActive = true
        sendButton.leftAnchor.constraint(equalTo: cardView.centerXAnchor, constant: 5).isActive = true
        sendButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
        
        self.view = backgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
