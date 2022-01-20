//
//  ViewController.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit

class LoginView: UIViewController {
    
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Вход для курьеров", textSize: 24, style: .bold)
    let phoneNumberLabel = CustomLabels(title: "Номер телефона", textSize: 12, style: .light)
    let phoneNumberTextField = CustomTextFields(pHolder: "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _", style: .withPhoneNumberFormatter)
    let loginButton = CustomButtons(title: "Вход", style: .primary)
    
    func setupCardView(){
        view.addSubview(cardView.view)
        cardView.setView()
        
        cardView.view.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cardView.view.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.view.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.view.heightAnchor.constraint(equalToConstant: 254).isActive = true
        cardView.view.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        
        cardView.view.addSubview(titleLabel.label)
        titleLabel.setLabel()
        
        titleLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.label.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 39).isActive = true
        titleLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupPhoneNumberLabel(){
        cardView.view.addSubview(phoneNumberLabel.label)
        phoneNumberLabel.setLabel()
        
        phoneNumberLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.label.topAnchor.constraint(equalTo:  titleLabel.label.bottomAnchor, constant: 25).isActive = true
        phoneNumberLabel.label.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        
    }
    
    func setupPhoneNumberTextField(){
        cardView.view.addSubview(phoneNumberTextField.textField)
        phoneNumberTextField.setTextField()
        
        phoneNumberTextField.textField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumberTextField.textField.topAnchor.constraint(equalTo:  phoneNumberLabel.label.bottomAnchor, constant: 10).isActive = true
        phoneNumberTextField.textField.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        phoneNumberTextField.textField.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        
        phoneNumberTextField.textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        phoneNumberTextField.textField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        phoneNumberTextField.textField.placeholder =  "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _"
        
        
    }
    
    func setupLoginButton(){
        
        loginButton.setButton()
        
        cardView.view.addSubview(loginButton.button)
        
        loginButton.button.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.button.topAnchor.constraint(equalTo:  phoneNumberTextField.textField.bottomAnchor, constant: 10).isActive = true
        loginButton.button.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 20).isActive = true
        loginButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        loginButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.button.widthAnchor.constraint(equalToConstant: 320).isActive = true
        loginButton.button.addTarget(self, action: #selector(orangeButtonAction), for: .touchUpInside)
        
    }
    
    func setupView(){
        view.backgroundColor = Colors.lightGray // условно
        
        setupCardView()
        setupTitleLabel()
        setupPhoneNumberLabel()
        setupPhoneNumberTextField()
        setupLoginButton()
    }
    
    @objc func orangeButtonAction(sender: UIButton!){
        let cofirmLoginView = ConfirmLoginView()
        cofirmLoginView.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        self.present(cofirmLoginView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
        
    }
}
