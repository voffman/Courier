//
//  StateSubview.swift
//  courier
//
//  Created by Владимир Свиридов on 01.02.2022.
//

import UIKit

class StateSubview: UIViewController {
    
    var targetView = UIView()

    let stateButton = CustomButtons(title: "Неизвестно", style: .primary)
    
    let orderTimerView = CustomTimer(style: .timerGray)
    let orderTimerImage = UIImageView(image: UIImage(named: "TimerGray"))
    
    let orderTimerLabel = CustomLabels(title: "15:45", textSize: 20, style: .light)
    
    var status: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        hideTimer(isHidden: true)
    }
    
    func addSubviews(){
        self.view.addSubview(stateButton)
        stateButton.setButton()
        self.view.addSubview(orderTimerView)
        orderTimerView.setView()
        self.view.addSubview(orderTimerImage)
        self.view.addSubview(orderTimerLabel)
        orderTimerLabel.setLabel()
    }
    
    
    func setupTimer(){
        orderTimerView.translatesAutoresizingMaskIntoConstraints = false
        orderTimerView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        orderTimerView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        orderTimerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        if UIScreen.main.bounds.size.height > 750 {
            if #available(iOS 11.0, *) {
                orderTimerView.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -90).isActive = true
            }
        }
        
        
        if UIScreen.main.bounds.size.height < 750{
            orderTimerView.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -60).isActive = true
        }
        
        orderTimerImage.translatesAutoresizingMaskIntoConstraints = false
        orderTimerImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTimerImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
  
        orderTimerImage.topAnchor.constraint(equalTo: orderTimerView.topAnchor, constant: 12).isActive = true
        orderTimerImage.leftAnchor.constraint(equalTo: orderTimerView.leftAnchor, constant: 8).isActive = true
    
        orderTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        orderTimerLabel.heightAnchor.constraint(equalToConstant: orderTimerLabel.intrinsicContentSize.height).isActive = true
        orderTimerLabel.widthAnchor.constraint(equalToConstant: orderTimerLabel.intrinsicContentSize.width).isActive = true
  
        orderTimerLabel.topAnchor.constraint(equalTo: orderTimerView.topAnchor, constant: 12).isActive = true
        orderTimerLabel.leftAnchor.constraint(equalTo: orderTimerView.leftAnchor, constant: 46).isActive = true
        
    }
    
    func hideTimer(isHidden: Bool){
        if isHidden{
            orderTimerView.isHidden = true
            orderTimerImage.isHidden = true
            orderTimerLabel.isHidden = true
        }
        else{
            orderTimerView.isHidden = false
            orderTimerImage.isHidden = false
            orderTimerLabel.isHidden = false
        }
    }

    func setupStateButton(){
        stateButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height > 750 {
            if #available(iOS 11.0, *) {
                stateButton.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -90).isActive = true
            }
        }
        
        
        if UIScreen.main.bounds.size.height < 750{
            stateButton.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: -60).isActive = true
        }
        stateButton.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        stateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        stateButton.widthAnchor.constraint(equalToConstant: 308).isActive = true
    }
    

    
    //MARK: Состояния ячейки

    func setupAcceptedOrderState(){
      //  stateButton.title = "ПРИБЫЛ В ЗАВЕДЕНИЕ"
        stateButton.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 130).isActive = true
        //stateButton.leftAnchor.constraint(equalTo:  orderTimerView.rightAnchor, constant: -10).isActive = true
        stateButton.setButton()
        hideTimer(isHidden: false)

    }
    
    func setupArrivedToClient(){
     //   stateButton.title = "ДОСТАВИЛ ЗАКАЗ"
        stateButton.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        stateButton.setButton()
        hideTimer(isHidden: true)
       // stateButton.isEnabled = false
    }
    
    func setupCell(){
        setupStateButton()
        setupTimer()

    }
    
    func checkStateSubviewStatus(status: Int){
        switch status{
            
        case 0...13:
            print("Default state")
           // stateSubview.setupAcceptedOrderState() // статус 15 принят, значит тут алерт
            
        case 15...50:
            setupAcceptedOrderState()

        case 75:
            setupAcceptedOrderState()
          // setupArrivedToClient()
        
        case 100:
            stateButton.isEnabled = false
            let thanksView = ThanksView()
            
            thanksView.modalPresentationStyle = .fullScreen
            
            self.navigationController?.pushViewController(thanksView, animated: true)

           // sender.tag = 0
            
        default:
            break
           // sender.tag = 0
        }
    }
    
    func configure(buttonTitle: String, status: Int) {
        self.stateButton.title = buttonTitle.uppercased()
        self.status = status
        stateButton.setButton()
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         setupCell()
        checkStateSubviewStatus(status: status)
     }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
