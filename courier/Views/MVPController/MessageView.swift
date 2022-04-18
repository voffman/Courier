//
//  MessageView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.04.2022.
//

import UIKit

class MessageView: UIViewController {

    let cardView = CustomViews(style: .withShadow)

    let nameLabel = CustomLabels(title: "Предупреждение", textSize: 20, style: .bold, alignment: .left)
    let messageLabel = CustomLabels(title: "Здесь отображается сообщение", textSize: 16, style: .light, alignment: .justified)
    
    let okButton = CustomButtons(title: "ОК", style: .primary)


    
    
    func configureData(name: String?, message: String?, okButton: String? = "Подтвердить"){
    
        nameLabel.title = name
        messageLabel.title = message
        
        self.okButton.setTitle(okButton, for: .normal)
        
        nameLabel.setLabel()
        messageLabel.setLabel()
        
        self.okButton.setButton()
    }

    func showMessageView(onVC: UIViewController){
        let backgroundView = UIView.init(frame: onVC.view.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
      //  UIApplication.shared.keyWindow!.addSubview(backgroundView)
        onVC.view.addSubview(backgroundView)
        backgroundView.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: onVC.view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: onVC.view.centerYAnchor).isActive = true

        cardView.leftAnchor.constraint(equalTo:  onVC.view.leftAnchor, constant: 20).isActive = true
        cardView.rightAnchor.constraint(equalTo:  onVC.view.rightAnchor, constant: -20).isActive = true
        cardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 180).isActive = true

        
        cardView.addSubview(nameLabel)
        
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.size.width - 30).isActive = true
        
        
        cardView.addSubview(okButton)
        okButton.setButton()
        okButton.translatesAutoresizingMaskIntoConstraints = false

        okButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        okButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        okButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
        
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -25).isActive = true

        self.view = backgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
