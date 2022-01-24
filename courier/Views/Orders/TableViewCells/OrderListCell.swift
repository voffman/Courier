//
//  OrderListTVCell.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListCell: UITableViewCell {
    
    static let identifire = "orderListCell"
    
    let cardView = CustomViews(style: .withShadow)
    let orderIdLabel = CustomLabels(title: "№ 356167", textSize: 14, style: .bold)
    let orderPriceLabel = CustomLabels(title: "• 10 000 ₸", textSize: 14, style: .light)
    let orderSourcelabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderLineImage = UIImageView(image: UIImage(named: "Line"))
    // MARK: Поменять на кнопку UIButton
    let orderTransitionArrowButton = UIImageView(image: UIImage(named: "Arrow"))
    
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let orderDownArrowImage = UIImageView(image: UIImage(named: "Arrow_downward"))
    let orderToImage = UIImageView(image: UIImage(named: "Place"))
    
    let orderFromLabel = CustomLabels(title: "Откуда", textSize: 14, style: .light)
    let orderFromAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToLabel = CustomLabels(title: "Куда", textSize: 14, style: .light)
    
    let orderTimerView = CustomViews(style: .timerRed)
    let orderTimerImage = UIImageView(image: UIImage(named: "Timer"))
    
    let orderTimerLabel = CustomLabels(title: "0:15", textSize: 20, style: .timerRed)
    
    let orderAcceptButton = CustomButtons(title: "Принять", style: .primary)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // contentView.backgroundColor = Colors.lightGray
        contentView.addSubview(cardView.view)
        cardView.setView()
        contentView.addSubview(orderIdLabel.label)
        orderIdLabel.setLabel()
        contentView.addSubview(orderPriceLabel.label)
        orderPriceLabel.setLabel()
        contentView.addSubview(orderSourcelabel.label)
        orderSourcelabel.setLabel()
        // orderTransitionArrowButton.setButton()
        contentView.addSubview(orderLineImage)
        contentView.addSubview(orderFromImage)
        contentView.addSubview(orderFromLabel.label)
        orderFromLabel.setLabel()
        contentView.addSubview(orderFromAddressLabel.label)
        orderFromAddressLabel.setLabel()
        contentView.addSubview(orderToLabel.label)
        orderToLabel.setLabel()
        contentView.addSubview(orderToAddressLabel.label)
        orderToAddressLabel.setLabel()
        contentView.addSubview(orderTransitionArrowButton)
        contentView.addSubview(orderDownArrowImage)
        contentView.addSubview(orderToImage)
        contentView.addSubview(orderTimerView.view)
        orderTimerView.setView()
        contentView.addSubview(orderTimerImage)
        contentView.addSubview(orderTimerLabel.label)
        orderTimerLabel.setLabel()
        
        contentView.addSubview(orderAcceptButton.button)
        orderAcceptButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 10,
                                                                     bottom: 10,
                                                                     right: 10))
        
        cardView.view.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: contentView.frame.size.height)
        
        orderIdLabel.label.frame = CGRect(x: 16,
                                          y: 16,
                                          width: orderIdLabel.label.intrinsicContentSize.width,
                                          height: orderIdLabel.label.intrinsicContentSize.height)
        orderPriceLabel.label.frame = CGRect(x: orderIdLabel.label.intrinsicContentSize.width + orderIdLabel.textSize * 2,
                                             y: 16,
                                             width: orderPriceLabel.label.intrinsicContentSize.width,
                                             height: orderPriceLabel.label.intrinsicContentSize.height)
        orderSourcelabel.label.frame = CGRect(x: 16,
                                              y: 36,
                                              width: orderSourcelabel.label.intrinsicContentSize.width,
                                              height: orderSourcelabel.label.intrinsicContentSize.height)
        
        orderTransitionArrowButton.translatesAutoresizingMaskIntoConstraints = false
        orderTransitionArrowButton.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 26).isActive = true
        orderTransitionArrowButton.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        
        
        orderLineImage.translatesAutoresizingMaskIntoConstraints = false
        orderLineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        orderLineImage.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 71).isActive = true
        orderLineImage.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 15).isActive = true
        orderLineImage.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -15).isActive = true
        
        orderFromImage.frame = CGRect(x: 16,
                                      y: 88,
                                      width: 40,
                                      height: 40)
        
        orderDownArrowImage.frame = CGRect(x: 16,
                                           y: 144,
                                           width: 40,
                                           height: 40)
        
        orderToImage.frame = CGRect(x: 16,
                                    y: 194,
                                    width: 40,
                                    height: 40)
        
        orderFromLabel.label.frame = CGRect(x: 64,
                                            y: 88,
                                            width: orderFromLabel.label.intrinsicContentSize.width,
                                            height: orderFromLabel.label.intrinsicContentSize.height)
        
        orderFromAddressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        orderFromAddressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        orderFromAddressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 108).isActive = true
        orderFromAddressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
        
        orderToLabel.label.frame = CGRect(x: 64,
                                          y: 184,
                                          width: orderToLabel.label.intrinsicContentSize.width,
                                          height: orderToLabel.label.intrinsicContentSize.height)
        
        orderToAddressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        orderToAddressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        orderToAddressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 204).isActive = true
        
        orderToAddressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
        
        orderTimerView.view.frame = CGRect(x: 16,
                                           y: 257,
                                           width: 110,
                                           height: 48)
        
        orderTimerImage.translatesAutoresizingMaskIntoConstraints = false
        orderTimerImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTimerImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
  
        orderTimerImage.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 269).isActive = true
        orderTimerImage.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 24).isActive = true
        
        orderTimerLabel.label.frame = CGRect(x: 62,
                                      y: 262,
                                      width: orderTimerLabel.label.intrinsicContentSize.width,
                                      height: orderTimerLabel.label.intrinsicContentSize.width)
        
        
        orderAcceptButton.button.translatesAutoresizingMaskIntoConstraints = false
        orderAcceptButton.button.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 257).isActive = true
        orderAcceptButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 134).isActive = true
        orderAcceptButton.button.rightAnchor.constraint(equalTo: cardView.view.rightAnchor, constant: -10).isActive = true
        
        orderAcceptButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
        
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

