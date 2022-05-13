//
//  WaitOrdersSubview.swift
//  courier
//
//  Created by Владимир Свиридов on 11.02.2022.
//

import UIKit

class WaitViewElement: UIView {

    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Заголовок", textSize: 24, style: .bold, alignment: .center)
    let helpLabel = CustomLabels(title: "Подсказка", textSize: 16, style: .regular, alignment: .center)

    init(titleLabel: String, helpLabel: String){
        self.titleLabel.title = titleLabel
        self.helpLabel.title = helpLabel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNonActiveOrdersCardView(){
       self.addSubview(cardView)
        cardView.setView()
        cardView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 149)
        
    }
    
    func setupTitleLabel(){
        
        cardView.addSubview(titleLabel)
        titleLabel.setLabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 39).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        
    }
    
    func setupHelpLabel(){
        
        cardView.addSubview(helpLabel)
        helpLabel.setLabel()
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.textAlignment = .center
        
        helpLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        helpLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 25).isActive = true
        
        helpLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
    }
    
    
    
    func setupView(){

        setupNonActiveOrdersCardView()
        setupTitleLabel()
        setupHelpLabel()
    }

}
