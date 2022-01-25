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
    
    let orderTransitionArrowButton = CustomButtons(title: "", style: .cellTransition)
    
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
        // добавление элементов на экран
        contentView.addSubview(cardView.view)
        cardView.setView()
        contentView.addSubview(orderIdLabel.label)
        orderIdLabel.setLabel()
        contentView.addSubview(orderPriceLabel.label)
        orderPriceLabel.setLabel()
        contentView.addSubview(orderSourcelabel.label)
        orderSourcelabel.setLabel()
        contentView.addSubview(orderTransitionArrowButton.button)
        orderTransitionArrowButton.setButton()
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
    
    // для использования в tableView
    public func configure(orderId: String?,
                          orderPrice: String?,
                          orderSource: String?,
                          orderFromAddress: String?,
                          orderToAddress: String?,
                          orderTime: String?){
        self.orderIdLabel.label.text = orderId
        self.orderPriceLabel.label.text = orderPrice
        self.orderSourcelabel.label.text = orderSource
        self.orderFromAddressLabel.label.text = orderFromAddress
        self.orderToAddressLabel.label.text = orderToAddress
        self.orderTimerLabel.label.text = orderTime
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func insertPaddingsBetweenCells(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 10,
                                                                     bottom: 10,
                                                                     right: 10))
    }
    // MARK: Функции для расстановки элементов на экране
    func setupCardView(){
        cardView.view.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: contentView.frame.size.height)
    }
    
    func setupIdLabel(){
        orderIdLabel.label.frame = CGRect(x: 16,
                                          y: 16,
                                          width: orderIdLabel.label.intrinsicContentSize.width,
                                          height: orderIdLabel.label.intrinsicContentSize.height)
    }
    
    func setupPriceLabel(){
        orderPriceLabel.label.frame = CGRect(x: orderIdLabel.label.intrinsicContentSize.width + orderIdLabel.textSize * 2,
                                             y: 16,
                                             width: orderPriceLabel.label.intrinsicContentSize.width,
                                             height: orderPriceLabel.label.intrinsicContentSize.height)
    }
    
    func setupSourceLabel(){
        orderSourcelabel.label.frame = CGRect(x: 16,
                                              y: 36,
                                              width: orderSourcelabel.label.intrinsicContentSize.width,
                                              height: orderSourcelabel.label.intrinsicContentSize.height)
    }
    
    func setupTransitionArrowButton(){
        orderTransitionArrowButton.button.translatesAutoresizingMaskIntoConstraints = false
        orderTransitionArrowButton.button.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 26).isActive = true
        orderTransitionArrowButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -20).isActive = true
        orderTransitionArrowButton.button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTransitionArrowButton.button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    func setupLineImage(){
        orderLineImage.translatesAutoresizingMaskIntoConstraints = false
        orderLineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        orderLineImage.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 71).isActive = true
        orderLineImage.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 15).isActive = true
        orderLineImage.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -15).isActive = true
        
    }
    
    func setupOrderFromImage(){
        orderFromImage.frame = CGRect(x: 16,
                                      y: 88,
                                      width: 40,
                                      height: 40)
    }
    
    func setupDownArrowImage(){
        orderDownArrowImage.frame = CGRect(x: 16,
                                           y: 144,
                                           width: 40,
                                           height: 40)
        
    }
    
    func setupOrderToImage(){
        orderToImage.frame = CGRect(x: 16,
                                    y: 194,
                                    width: 40,
                                    height: 40)
    }
    func setupOrderFromLabel(){
        orderFromLabel.label.frame = CGRect(x: 64,
                                            y: 88,
                                            width: orderFromLabel.label.intrinsicContentSize.width,
                                            height: orderFromLabel.label.intrinsicContentSize.height)
    }
    
    func setupOrderFromAddressLabel(){
        orderFromAddressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        orderFromAddressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        orderFromAddressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 108).isActive = true
        orderFromAddressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
    }
    
    func setupOrderToLabel(){
        orderToLabel.label.frame = CGRect(x: 64,
                                          y: 184,
                                          width: orderToLabel.label.intrinsicContentSize.width,
                                          height: orderToLabel.label.intrinsicContentSize.height)
    }
    
    func setupOrderToAddressLabel(){
        orderToAddressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        orderToAddressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        orderToAddressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 204).isActive = true
        
        orderToAddressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
    }
    
    func setupTimerView(){
        orderTimerView.view.frame = CGRect(x: 16,
                                           y: 257,
                                           width: 110,
                                           height: 48)
    }
    
    func setupTimerImage(){
        orderTimerImage.translatesAutoresizingMaskIntoConstraints = false
        orderTimerImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTimerImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
  
        orderTimerImage.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 269).isActive = true
        orderTimerImage.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 24).isActive = true
    }
    
    func setupTimerLabel(){
        orderTimerLabel.label.frame = CGRect(x: 62,
                                      y: 262,
                                      width: orderTimerLabel.label.intrinsicContentSize.width,
                                      height: orderTimerLabel.label.intrinsicContentSize.width)
        
        
    }
    
    func setupTimer(){
    
        setupTimerView()
        setupTimerImage()
        setupTimerLabel()
        
    }
    
    func setupAcceptButton(){
        orderAcceptButton.button.translatesAutoresizingMaskIntoConstraints = false
        orderAcceptButton.button.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 257).isActive = true
        orderAcceptButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 134).isActive = true
        orderAcceptButton.button.rightAnchor.constraint(equalTo: cardView.view.rightAnchor, constant: -10).isActive = true
        
        orderAcceptButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        orderAcceptButton.button.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
    }
    
 @objc func changeButtonState(sender: UIButton){
     sender.tag += 1
     
     switch sender.tag{
         
     case 0:
         print("Default state")
     
     case 1:
         setupAcceptedOrderState()
         
     case 2:
         setupArrivedToShopState()
     
     case 3:
         setupGotOrder()
     
     case 4:
         setupArrivedToClient()

     
     case 5:
         setupNormalState()
         sender.tag = 0
         
         
     default:
         sender.tag = 0
     }
        
    }
    
    // MARK: Функции для изменения состояний ячейки, во время работы курьера
    func setupAcceptedOrderState(){
        orderAcceptButton.title = "ПРИБЫЛ В ЗАВЕДЕНИЕ"
        orderAcceptButton.setButton()
    }
    
    func setupArrivedToShopState(){
        
        orderAcceptButton.title = "ПОЛУЧИЛ ЗАКАЗ"
        orderAcceptButton.setButton()
        orderFromLabel.style = .primary
        orderFromLabel.setLabel()
        
        orderFromImage.image = UIImage(named: "StorefrontOrange")
        
    }
    
    func setupGotOrder(){
        orderAcceptButton.title = "ПРИБЫЛ К КЛИЕНТУ"
        orderAcceptButton.setButton()
        orderFromLabel.style = .light
        orderFromLabel.setLabel()
        orderFromImage.image = UIImage(named: "Storefront")
        orderDownArrowImage.image = UIImage(named: "Arrow_downward_Orange")
        
    }
    
    func setupArrivedToClient(){
        orderAcceptButton.title = "ДОСТАВИЛ ЗАКАЗ"
        orderAcceptButton.setButton()
        orderDownArrowImage.image = UIImage(named: "Arrow_downward")
        orderToLabel.style = .primary
        orderToLabel.setLabel()
        orderToImage.image = UIImage(named: "Place_orange")
        
        orderTimerView.view.isHidden = true
        orderTimerImage.isHidden = true
        orderTimerLabel.label.isHidden = true
        
        orderAcceptButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 10).isActive = true
        
        orderAcceptButton.setButton()
    }
    
    func setupNormalState(){
        
        orderAcceptButton.title = "ПРИНЯТЬ"
        orderAcceptButton.button.isEnabled = false
        
        orderAcceptButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 134).isActive = true
        
        orderAcceptButton.setButton()
        
        orderToLabel.style = .light
        orderToLabel.setLabel()
        orderToImage.image = UIImage(named: "Place")
 
        
        orderTimerView.view.isHidden = false
        orderTimerImage.isHidden = false
        orderTimerLabel.label.isHidden = false
    }
    
    
    func setupCell(){
        insertPaddingsBetweenCells()
        
        setupCardView()
        
        setupIdLabel()
        setupPriceLabel()
        setupSourceLabel()
        setupTransitionArrowButton()
        setupLineImage()
        
        setupOrderFromImage()
        setupOrderFromLabel()
        setupDownArrowImage()
        setupOrderFromAddressLabel()
        setupOrderToLabel()
        setupOrderToImage()
        setupOrderToAddressLabel()
        
        setupTimer()
        setupAcceptButton()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

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

