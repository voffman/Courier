//
//  ThanksView.swift
//  courier
//
//  Created by Владимир Свиридов on 02.02.2022.
//

import UIKit

class ThanksView: UIViewController {
    
    let cardView = CustomViews(style: .withShadow)
    let smileImage = UIImageView(image: UIImage(named: "Satisfied"))
    
    
    let resultLabel = CustomLabels(title: "Заказ доставлен вовремя.", textSize: 16, style: .regular, alignment: .center)
    let timerImage = UIImageView(image: UIImage(named: "TimerOrange"))
    let timeTitleLabel = CustomLabels(title: "Время выполнения заказа", textSize: 16, style: .light, alignment: .center)
    let timeLabel = CustomLabels(title: "1 ч : 35 мин", textSize: 20, style: .regular, alignment: .center)
    let helpLabel = CustomLabels(title: "Возвращайтесь       в отправную точку", textSize: 24, style: .regular, alignment: .center)
    
    let returnButton = CustomButtons(title: "ВЕРНУТЬСЯ В СПИСОК ЗАКАЗОВ", style: .primary)
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     
   // MARK: Поправить
        if #available(iOS 11.0, *) {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9.25).isActive = true
        } else {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9.25).isActive = true
        }
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 313).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true

    }
    
    func setupSmileImage(){
        view.addSubview(smileImage)
        smileImage.translatesAutoresizingMaskIntoConstraints = false
        smileImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24).isActive = true
        smileImage.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor).isActive = true
        smileImage.heightAnchor.constraint(equalToConstant: 48).isActive = true
        smileImage.widthAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    func setupResultLabel(){
        view.addSubview(resultLabel)
        resultLabel.setLabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 88).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor).isActive = true
    }

    
    func setupTimeTitleLabel(){
        view.addSubview(timeTitleLabel)
        timeTitleLabel.setLabel()
        timeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        timeTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 147).isActive = true
        timeTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 64).isActive = true
        timeTitleLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true

        
    }
    
    func setupTimerImage(){
        view.addSubview(timerImage)
        timerImage.translatesAutoresizingMaskIntoConstraints = false
        timerImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 149).isActive = true
        timerImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        timerImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        timerImage.widthAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setupTimeLabel(){
        view.addSubview(timeLabel)
        timeLabel.setLabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 165).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 64).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        
    }
    
    func setupHelpLabel(){
        view.addSubview(helpLabel)
        helpLabel.setLabel()
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 226).isActive = true
        helpLabel.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor).isActive = true
        helpLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        helpLabel.widthAnchor.constraint(equalToConstant:  214).isActive = true
    }
    
    func setupReturnButton(){
        view.addSubview(returnButton)
        returnButton.setButton()
        returnButton.addTarget(self, action: #selector(returnButtonAction), for: .touchUpInside)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height > 750 {
            returnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95).isActive = true
        }
        
        
        if UIScreen.main.bounds.size.height < 750{
            returnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        }
        returnButton.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        returnButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        returnButton.widthAnchor.constraint(equalToConstant: 308).isActive = true
    }
    
    
    @objc func returnButtonAction(){
        self.navigationController?.popViewController(animated: true)
    }

    func setupView(){
        view.backgroundColor = Colors.backgroundColor

        setupCardView()
        setupSmileImage()
        setupResultLabel()
        setupTimeTitleLabel()
        setupTimeLabel()
        setupTimerImage()
        setupHelpLabel()
        setupReturnButton()
 
    }
    
    func createNavigationBar(title: String){
        let navigationBarLeftItemLabel = CustomLabels(title: title, textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createNavigationBar(title: "Заказ № 356167")
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
