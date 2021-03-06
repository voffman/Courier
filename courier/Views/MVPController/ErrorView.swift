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
    
    let dividerView = CustomViews(style: .divider)
    
    let codeLabel = CustomLabels(title: "Код ошибки: ", textSize: 14, style: .regular, alignment: .justified)
    let statusLabel = CustomLabels(title: "Статус: ", textSize: 14, style: .regular, alignment: .justified)
    let typeLabel = CustomLabels(title: "Тип: ", textSize: 14, style: .regular, alignment: .justified)
    
    let sendButton = CustomButtons(title: "ОК", style: .primary)
    
    //MARK: выбрать что-то одно
    func configureData(errorResponseData: ErrorResponse){
        nameLabel.title = "\(errorResponseData.name ?? "Ошибка")"
        messageLabel.title = " \(errorResponseData.message ?? "Неизвестная ошибка")"
        codeLabel.title = "Код ошибки: \(String(errorResponseData.code ?? 0))"
        statusLabel.title = "Статус: \(String(errorResponseData.status ?? 0))"
        typeLabel.title = "Тип ошибки: \(String(describing:errorResponseData.type ?? "Неизвестно"))"
        
        nameLabel.setLabel()
        messageLabel.setLabel()
        codeLabel.setLabel()
        statusLabel.setLabel()
        typeLabel.setLabel()
    }

    func showErrorView(){
       
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

        cardView.leftAnchor.constraint(equalTo: onVC.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  onVC.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 322).isActive = true

        
        cardView.addSubview(nameLabel)
        nameLabel.setLabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: onVC.frame.size.width - 20).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.setLabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 50).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: onVC.frame.size.width - 20).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: 175).isActive = true
        
        cardView.addSubview(dividerView)
        dividerView.setView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        dividerView.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 180).isActive = true
        dividerView.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 15).isActive = true
        dividerView.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -15).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
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
      
        self.view = backgroundView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
