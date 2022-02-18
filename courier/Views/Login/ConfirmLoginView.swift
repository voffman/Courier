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
    let smsLabel = CustomLabels(title: "Мы отправили СМС с кодом подтверждения на номер ", textSize: 14, style: .regular)
    let sendAgainLabel = CustomLabels(title: "Отправить еще раз через 0:50 сек", textSize: 14, style: .light)
    let sendAgainButton = CustomButtons(title: "ОТПРАВИТЬ ЕЩЕ РАЗ", style: .primary)
    let codeConfirmLabel = CustomLabels(title: "Код подтверждения", textSize: 12, style: .light)
    let confirmTextField = CustomTextFields(pHolder: "", style: .normal)
    let confirmButton = CustomButtons(title: "ПОДТВЕРДИТЬ", style: .secondary)

    private var presenter: ConfirmLoginViewPresenterProtocol?
    
    var timer = Timer()
    var count = 5
    var timerValue = ""
    
    func launchTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(incrementCountLabel), userInfo: nil, repeats: true)
        timer.tolerance = 0.5
        // Задается время по истечению которого таймер будет остановлен
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.timer.invalidate()
            self.sendAgainButton.isHidden = false
            self.sendAgainButton.setButton()
            self.confirmButton.style = .primary
            self.confirmButton.setButton()
          //  self.sendAgainLabel.isHidden = true
            
        }
    }
    
    @objc func incrementCountLabel(){
        count -= 1
      //  let hours = Int(count) / 3600
        let minutes = Int(count) / 60 % 60
        let seconds = Int(count) % 60
        timerValue = String(format:"%01i:%02i", minutes, seconds)
        sendAgainLabel.title = "Отправить еще раз через \(timerValue) сек"
        sendAgainLabel.setLabel()
    }
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 394).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        cardView.addSubview(titleLabel)
        titleLabel.setLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 39).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func setupSMSLabel(){
        cardView.addSubview(smsLabel)
        smsLabel.setLabel()
        smsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        smsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        smsLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 25).isActive = true
        smsLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        guard let presenter = presenter else {
            return
        }
        smsLabel.text = "Мы отправили СМС с кодом подтверждения на номер \(String(describing: presenter.returnPhoneNumber()))"
    }
    
    func setupSendAgainLabel(){
        cardView.addSubview(sendAgainLabel)
        sendAgainLabel.setLabel()
        sendAgainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sendAgainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendAgainLabel.topAnchor.constraint(equalTo:  smsLabel.bottomAnchor, constant: 45).isActive = true
        sendAgainLabel.text = "Отправить еще раз через 0:50 сек"
    }
    
    
    func setupSendAgainButton(){
        cardView.addSubview(sendAgainButton)
        sendAgainButton.setButton()
        sendAgainButton.translatesAutoresizingMaskIntoConstraints = false
        
        sendAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendAgainButton.topAnchor.constraint(equalTo:  smsLabel.bottomAnchor, constant: 30).isActive = true
        sendAgainButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        sendAgainButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        sendAgainButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        sendAgainButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        sendAgainButton.setTitle("ОТПРАВИТЬ ЕЩЕ РАЗ", for: .normal)
        sendAgainButton.addTarget(self, action: #selector(sendAgainButtonAction), for: .touchUpInside)
        
    }
    
    
    func setupCodeConfirmLabel(){
        cardView.addSubview(codeConfirmLabel)
        codeConfirmLabel.setLabel()
        
        codeConfirmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        codeConfirmLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        codeConfirmLabel.topAnchor.constraint(equalTo:  smsLabel.bottomAnchor, constant: 100).isActive = true
        codeConfirmLabel.text = "Код подтверждения"
        
    }
    
    func setupConfirmTextField(){
        cardView.addSubview(confirmTextField)
        confirmTextField.setTextField()
        
        confirmTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmTextField.topAnchor.constraint(equalTo:  codeConfirmLabel.bottomAnchor, constant: 10).isActive = true
        confirmTextField.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        confirmTextField.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        
        confirmTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmTextField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
    }
    
    func setupConfirmButton(){
        cardView.addSubview(confirmButton)
        confirmButton.setButton()
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo:  confirmTextField.bottomAnchor, constant: 10).isActive = true
        confirmButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        confirmButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        confirmButton.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        
        confirmButton.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
    }
    
    
    @objc func confirmButtonAction(sender: UIButton!){
        UserDefaults.standard.set(confirmTextField.text, forKey: UserDefaultsKeys.smsCode)
        presenter?.setSMSCode(code: confirmTextField.text ?? "Нет данных")
        presenter?.requestAuthKey()
        print("Кнопка подтвердить")
    }
    
    @objc func sendAgainButtonAction(sender: UIButton!){
        self.sendAgainButton.isHidden = true
        self.sendAgainButton.setButton()
        self.confirmButton.style = .secondary
        self.confirmButton.setButton()
        
        presenter?.sendSMSAgain()
        count = 5
        launchTimer()
    }
    
    
    func setupView(){
        view.backgroundColor = Colors.backgroundColor
        
        setupCardView()
        setupTitleLabel()
        setupSMSLabel()
        setupSendAgainLabel()
        // setupLightLabel()
        setupSendAgainButton()
        sendAgainButton.isHidden = true
        setupCodeConfirmLabel()
        setupConfirmTextField()
        setupConfirmButton()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ConfirmLoginPresenter(view:  self)
        self.presenter = presenter
        setupView()


        launchTimer()
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

extension ConfirmLoginView: ConfirmLoginViewProtocol{
    func openOrdersView() {
        let customTabBar = TabBarController()
        customTabBar.modalPresentationStyle = .fullScreen
        self.present(customTabBar, animated: true, completion: nil)
    }
}

