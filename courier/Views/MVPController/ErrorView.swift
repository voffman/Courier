//
//  ErrorView.swift
//  courier
//
//  Created by Владимир Свиридов on 15.02.2022.
//

import UIKit

class ErrorView: UIViewController {
    
    let cardView = CustomViews(style: .withShadow)

    let nameLabel = CustomLabels(title: "Имя ошибки", textSize: 20, style: .bold, alignment: .center)
    let messageLabel = CustomLabels(title: "Сообщение", textSize: 16, style: .regular, alignment: .justified)
    
    let orderLineImage = UIImageView(image: UIImage(named: "Line"))
    
    let codeLabel = CustomLabels(title: "Код ошибки: ", textSize: 14, style: .regular, alignment: .justified)
    let statusLabel = CustomLabels(title: "Статус: ", textSize: 14, style: .regular, alignment: .justified)
    let typeLabel = CustomLabels(title: "Тип: ", textSize: 14, style: .regular, alignment: .justified)
    
    let sendButton = CustomButtons(title: "Попробовать снова", style: .primary)

    var errorView : UIView?
    
    //MARK: выбрать что-то одно
    func configureData(errorResponseData: ErrorResponse){
        nameLabel.title = errorResponseData.name
        messageLabel.title = errorResponseData.message
        codeLabel.title = "Код ошибки: \(String(errorResponseData.code))"
        statusLabel.title = "Статус: \(String(errorResponseData.status))"
        typeLabel.title = "Статус: \(String(describing:errorResponseData.type))"
        
        nameLabel.setLabel()
        messageLabel.setLabel()
        codeLabel.setLabel()
        statusLabel.setLabel()
        typeLabel.setLabel()
    }

    func showErrorView(){
        let backgroundView = UIView.init(frame: self.view.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        cardView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  self.view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 322).isActive = true

        
        cardView.addSubview(nameLabel)
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.size.width - 20).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 50).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.size.width - 20).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: 175).isActive = true
        
        cardView.addSubview(orderLineImage)
        orderLineImage.translatesAutoresizingMaskIntoConstraints = false
        orderLineImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        orderLineImage.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 180).isActive = true
        orderLineImage.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 15).isActive = true
        orderLineImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -15).isActive = true
        
        cardView.addSubview(codeLabel)
        codeLabel.setLabel()
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        codeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 190).isActive = true
        
        cardView.addSubview(statusLabel)
        statusLabel.setLabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 210).isActive = true
        statusLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.size.width - 20).isActive = true
        
        cardView.addSubview(typeLabel)
        typeLabel.setLabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 230).isActive = true
        typeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.view.frame.size.width - 20).isActive = true
    
        
        cardView.addSubview(sendButton)
        sendButton.setButton()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        sendButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
      
        errorView = backgroundView
    }
   // Удаляет только View
    func removeErrorView(){
        self.errorView?.removeFromSuperview()
        self.errorView = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
