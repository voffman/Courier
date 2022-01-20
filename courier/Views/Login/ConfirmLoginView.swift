//
//  CofirmLoginView.swift
//  courier
//
//  Created by Владимир Свиридов on 19.01.2022.
//

import UIKit

class ConfirmLoginView: UIViewController {
    
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Вход для курьеров", textSize: 24, style: .bold)
    let smsLabel = CustomLabels(title: "Мы отправили СМС с кодом подтверждения на номер +7 (000) 000-00-00", textSize: 14, style: .regular)
    let sendAgainLabel = CustomLabels(title: "Отправить еще раз через 0:50 сек", textSize: 14, style: .light)
    let sendAgainButton = CustomButtons(title: "ОТПРАВИТЬ ЕЩЕ РАЗ", style: .primary)
    let codeConfirmLabel = CustomLabels(title: "Код подтверждения", textSize: 12, style: .light)
    let confirmTextView = CustomTextFields(pHolder: "", style: .normal)
    let confirmButton = CustomButtons(title: "ПОДТВЕРДИТЬ", style: .primary)
    
    
    func setupCardView(){
        view.addSubview(cardView.view)
        cardView.setView()
        
        cardView.view.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cardView.view.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.view.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.view.heightAnchor.constraint(equalToConstant: 394).isActive = true
        cardView.view.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        cardView.view.addSubview(titleLabel.label)
        titleLabel.setLabel()
        titleLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.label.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 39).isActive = true
        titleLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func setupSMSLabel(){
        cardView.view.addSubview(smsLabel.label)
        smsLabel.setLabel()
        smsLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        smsLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        smsLabel.label.topAnchor.constraint(equalTo:  titleLabel.label.bottomAnchor, constant: 25).isActive = true
        smsLabel.label.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        
    }
    
    func setupSendAgainLabel(){
        cardView.view.addSubview(sendAgainLabel.label)
        sendAgainLabel.setLabel()
        sendAgainLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        sendAgainLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendAgainLabel.label.topAnchor.constraint(equalTo:  smsLabel.label.bottomAnchor, constant: 45).isActive = true
        sendAgainLabel.label.text = "Отправить еще раз через 0:50 сек"
    }
    
    
    func setupSendAgainButton(){
        cardView.view.addSubview(sendAgainButton.button)
        sendAgainButton.setButton()
        sendAgainButton.button.translatesAutoresizingMaskIntoConstraints = false
        
        sendAgainButton.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendAgainButton.button.topAnchor.constraint(equalTo:  smsLabel.label.bottomAnchor, constant: 30).isActive = true
        sendAgainButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        sendAgainButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        sendAgainButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendAgainButton.button.widthAnchor.constraint(equalToConstant: 320).isActive = true
        sendAgainButton.button.setTitle("ОТПРАВИТЬ ЕЩЕ РАЗ", for: .normal)
        sendAgainButton.button.addTarget(self, action: #selector(sendAgainButtonAction), for: .touchUpInside)
        
    }
    
    
    func setupCodeConfirmLabel(){
        cardView.view.addSubview(codeConfirmLabel.label)
        codeConfirmLabel.setLabel()
        
        codeConfirmLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        codeConfirmLabel.label.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        codeConfirmLabel.label.topAnchor.constraint(equalTo:  smsLabel.label.bottomAnchor, constant: 100).isActive = true
        codeConfirmLabel.label.text = "Код подтверждения"
        
    }
    
    func setupConfirmTextField(){
        cardView.view.addSubview(confirmTextView.textField)
        confirmTextView.setTextField()
        
        confirmTextView.textField.translatesAutoresizingMaskIntoConstraints = false
        confirmTextView.textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmTextView.textField.topAnchor.constraint(equalTo:  codeConfirmLabel.label.bottomAnchor, constant: 10).isActive = true
        confirmTextView.textField.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        confirmTextView.textField.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        
        confirmTextView.textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmTextView.textField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
    }
    
    func setupConfirmButton(){
        cardView.view.addSubview(confirmButton.button)
        confirmButton.setButton()
        
        confirmButton.button.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.button.topAnchor.constraint(equalTo:  confirmTextView.textField.bottomAnchor, constant: 10).isActive = true
        confirmButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
        confirmButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        confirmButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        confirmButton.button.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        confirmButton.button.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        
        confirmButton.button.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
    }
    
    
    @objc func confirmButtonAction(sender: UIButton!){
        let confirmLoginView2 = ConfirmLoginView()
        confirmLoginView2.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        self.present(confirmLoginView2, animated: true)
    }
    
    @objc func sendAgainButtonAction(sender: UIButton!){
        // Заглушка
        setupSendAgainLabel()
        sendAgainButton.button.isHidden = true
        confirmButton.style = .secondary
        confirmButton.setButton()
    }
    
    
    func setupView(){
        view.backgroundColor = Colors.lightGray
        
        setupCardView()
        setupTitleLabel()
        setupSMSLabel()
        // setupLightLabel()
        setupSendAgainButton()
        setupCodeConfirmLabel()
        setupConfirmTextField()
        setupConfirmButton()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

