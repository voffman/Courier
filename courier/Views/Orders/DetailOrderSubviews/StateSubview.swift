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
    
    let orderTimerLabel = CustomLabels(title: "--:--", textSize: 20, style: .light)
    
    var status: Int = 0
    
    let dateManager = DateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        hideTimer(isHidden: true)
        launchTimer()

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
        orderTimerLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
  
        orderTimerLabel.topAnchor.constraint(equalTo: orderTimerView.topAnchor, constant: 12).isActive = true
        orderTimerLabel.leftAnchor.constraint(equalTo: orderTimerView.leftAnchor, constant: 40).isActive = true
        
    }
    
    func changeTimerToRed(){
        orderTimerView.style = .timerRed
        orderTimerView.setView()
        orderTimerImage.image = UIImage(named: "Timer")
        orderTimerLabel.style = .timerRed
        orderTimerLabel.setLabel()
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
            
        case 15...50:
            setupAcceptedOrderState()

        case 75:
            setupAcceptedOrderState()
        
        case 100:
            stateButton.isEnabled = false
            
        default:
            break
        }
    }
    
    
    var timer = Timer()
    var numberOfSecondsPassed: Int = 0
    var timerValue = ""
    
    func launchTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { capturedTimer in
            self.timer.tolerance = 0.5
        
            self.numberOfSecondsPassed -= 1
            let minutes = Int(self.numberOfSecondsPassed) / 60
            let seconds = Int(self.numberOfSecondsPassed) % 60
            
            let min = String(minutes)
            var sec = String(seconds)
            
            if sec.count < 2 {
                sec = "0" + sec
                self.timerValue = String("\(min):\(sec)")

            }
            
            if sec.count > 2 {
                sec.remove(at: sec.startIndex)
                self.timerValue = String("\(min):\(sec)")
            }

            self.timerValue = String("\(min):\(sec)")
            self.orderTimerLabel.text = "\(self.timerValue)"
            
            print("стэйттайм: \(self.timerValue)")
            if self.numberOfSecondsPassed <= 0 {
                self.timer.invalidate()
                self.orderTimerLabel.text = "00:00"
            }

        RunLoop.current.add(self.timer, forMode: RunLoop.Mode.common)
        
        }
    }
    
    func configureTimerValue() {
        
        let minutes = Int(numberOfSecondsPassed) / 60 // % 60
        let seconds = Int(numberOfSecondsPassed) % 60
        
        let min = String(minutes)
        var sec = String(seconds)
        
        if numberOfSecondsPassed < 60 {
            changeTimerToRed()
        }
        print("каунт: \(numberOfSecondsPassed)")
        if numberOfSecondsPassed <= 0 {
            self.orderTimerLabel.text = "00:00"
        }
        else {
            if sec.count < 2 {
                sec = "0" + sec
                self.timerValue = String("\(min):\(sec)")

            }
            
            if sec.count > 2 {
                sec.remove(at: sec.startIndex)
                self.timerValue = String("\(min):\(sec)")
            }
            
            self.orderTimerLabel.text = "\(self.timerValue)"
        }
    }
    
    func configure(buttonTitle: String, status: Int, timerValue: String) {
        self.stateButton.title = buttonTitle.uppercased()
        self.status = status
        self.timerValue = timerValue
        self.numberOfSecondsPassed = dateManager.converteDateToSeconds(dateString: timerValue, stringDateFormat: "yyyy-MM-dd HH:mm:ssZ")

        stateButton.setButton()
        configureTimerValue()
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
