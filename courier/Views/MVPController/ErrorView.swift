//
//  ErrorView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class ErrorView: UIView {

    let nameLabel = CustomLabels(title: "Имя: Not Found", textSize: 20, style: .bold, alignment: .center)
    let messageLabel = CustomLabels(title: "Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует Сообщение: Пользователя не существует ", textSize: 14, style: .regular, alignment: .natural)
    let codeLabel = CustomLabels(title: "Код ошибки: 0", textSize: 14, style: .regular, alignment: .justified)
    let statusLabel = CustomLabels(title: "Статус: 404", textSize: 14, style: .regular, alignment: .justified)
    let typeLabel = CustomLabels(title: "Тип: yii\\web\\NotFoundHttpException", textSize: 14, style: .regular, alignment: .justified)
    
    let cardView = CustomViews(style: .withShadow)
    
   // let sendButton = CustomButtons(title: "Выполнить", style: .normal)

    func showErrorView(onView : UIView){
        let backgroundView = UIView.init(frame: onView.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        onView.addSubview(backgroundView)
        backgroundView.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true
        
       // cardView.topAnchor.constraint(equalTo: onView.topAnchor, constant: 100).isActive = true
      //  cardView.bottomAnchor.constraint(equalTo: onView.bottomAnchor, constant: -150).isActive = true
        cardView.leftAnchor.constraint(equalTo:  onView.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  onView.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 400).isActive = true

        
        cardView.addSubview(nameLabel)
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25).isActive = true
      //  nameLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, constant: cardView.frame.size.width).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 50).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: 200).isActive = true
        
        cardView.addSubview(codeLabel)
        codeLabel.setLabel()
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        codeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 225).isActive = true
        
        cardView.addSubview(statusLabel)
        statusLabel.setLabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 250).isActive = true
    
        cardView.addSubview(typeLabel)
        typeLabel.setLabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 275).isActive = true
    
   /*     cardView.addSubview(sendButton)
        sendButton.setButton()
        //sendButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        sendButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: -10).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        sendButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
*/
    }
}
