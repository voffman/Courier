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
    let orderSourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderLineImage = UIImageView(image: UIImage(named: "Line"))
    
    let orderTransitionArrowButton = CustomButtons(title: "", style: .cellTransition)
    
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let orderDownArrowImage = UIImageView(image: UIImage(named: "Arrow_downward"))
    let orderToImage = UIImageView(image: UIImage(named: "Place"))
    
    let orderFromLabel = CustomLabels(title: "Откуда", textSize: 14, style: .light)
    let orderFromAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToLabel = CustomLabels(title: "Куда", textSize: 14, style: .light)
    
    let orderTimerView = CustomTimer(style: .timerRed)
    let orderTimerImage = UIImageView(image: UIImage(named: "Timer"))
    
    let orderTimerLabel = CustomLabels(title: "0:15", textSize: 20, style: .timerRed)
    
    let orderAcceptButton = CustomButtons(title: "Принять", style: .primary)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // добавление элементов на экран
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(orderIdLabel)
        orderIdLabel.setLabel()
        contentView.addSubview(orderPriceLabel)
        orderPriceLabel.setLabel()
        contentView.addSubview(orderSourceLabel)
        orderSourceLabel.setLabel()
        contentView.addSubview(orderTransitionArrowButton)
        orderTransitionArrowButton.setButton()
        contentView.addSubview(orderLineImage)
        contentView.addSubview(orderFromImage)
        contentView.addSubview(orderFromLabel)
        orderFromLabel.setLabel()
        contentView.addSubview(orderFromAddressLabel)
        orderFromAddressLabel.setLabel()
        contentView.addSubview(orderToLabel)
        orderToLabel.setLabel()
        contentView.addSubview(orderToAddressLabel)
        orderToAddressLabel.setLabel()
        contentView.addSubview(orderDownArrowImage)
        contentView.addSubview(orderToImage)
        contentView.addSubview(orderTimerView)
        orderTimerView.setView()
        contentView.addSubview(orderTimerImage)
        contentView.addSubview(orderTimerLabel)
        orderTimerLabel.setLabel()
        
        contentView.addSubview(orderAcceptButton)
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
        self.orderIdLabel.text = orderId
        self.orderPriceLabel.text = orderPrice
        self.orderSourceLabel.text = orderSource
        self.orderFromAddressLabel.text = orderFromAddress
        self.orderToAddressLabel.text = orderToAddress
        self.orderTimerLabel.text = orderTime
        
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
        cardView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: contentView.frame.size.height)
    }
    
    func setupIdLabel(){
        orderIdLabel.frame = CGRect(x: 16,
                                          y: 16,
                                          width: orderIdLabel.intrinsicContentSize.width,
                                          height: orderIdLabel.intrinsicContentSize.height)
    }
    
    func setupPriceLabel(){
        orderPriceLabel.frame = CGRect(x: orderIdLabel.intrinsicContentSize.width + orderIdLabel.textSize * 2,
                                             y: 16,
                                             width: orderPriceLabel.intrinsicContentSize.width,
                                             height: orderPriceLabel.intrinsicContentSize.height)
    }
    
    func setupSourceLabel(){
        orderSourceLabel.frame = CGRect(x: 16,
                                              y: 36,
                                              width: orderSourceLabel.intrinsicContentSize.width,
                                              height: orderSourceLabel.intrinsicContentSize.height)
    }
    
    func setupTransitionArrowButton(){
        orderTransitionArrowButton.translatesAutoresizingMaskIntoConstraints = false
        orderTransitionArrowButton.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 26).isActive = true
        orderTransitionArrowButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        orderTransitionArrowButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTransitionArrowButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    func setupLineImage(){
        orderLineImage.translatesAutoresizingMaskIntoConstraints = false
        orderLineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        orderLineImage.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 71).isActive = true
        orderLineImage.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 15).isActive = true
        orderLineImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -15).isActive = true
        
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
        orderFromLabel.frame = CGRect(x: 64,
                                            y: 88,
                                            width: orderFromLabel.intrinsicContentSize.width,
                                            height: orderFromLabel.intrinsicContentSize.height)
    }
    
    func setupOrderFromAddressLabel(){
        orderFromAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        orderFromAddressLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        orderFromAddressLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 108).isActive = true
        orderFromAddressLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupOrderToLabel(){
        orderToLabel.frame = CGRect(x: 64,
                                          y: 184,
                                          width: orderToLabel.intrinsicContentSize.width,
                                          height: orderToLabel.intrinsicContentSize.height)
    }
    
    func setupOrderToAddressLabel(){
        orderToAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        orderToAddressLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        orderToAddressLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 204).isActive = true
        
        orderToAddressLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupTimerView(){
        orderTimerView.frame = CGRect(x: 16,
                                           y: 257,
                                           width: 110,
                                           height: 48)
    }
    
    func setupTimerImage(){
        orderTimerImage.translatesAutoresizingMaskIntoConstraints = false
        orderTimerImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        orderTimerImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
  
        orderTimerImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 269).isActive = true
        orderTimerImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 24).isActive = true
    }
    
    func setupTimerLabel(){
        orderTimerLabel.frame = CGRect(x: 62,
                                      y: 262,
                                      width: orderTimerLabel.intrinsicContentSize.width,
                                      height: orderTimerLabel.intrinsicContentSize.width)
        
        
    }
    
    func setupTimer(){
    
        setupTimerView()
        setupTimerImage()
        setupTimerLabel()
        
    }
    
    func setupAcceptButton(){
        orderAcceptButton.translatesAutoresizingMaskIntoConstraints = false
        orderAcceptButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 257).isActive = true
        orderAcceptButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 134).isActive = true
        orderAcceptButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        
        orderAcceptButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        orderAcceptButton.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
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
        
        orderTimerView.isHidden = true
        orderTimerImage.isHidden = true
        orderTimerLabel.isHidden = true
        
        orderAcceptButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        
        orderAcceptButton.setButton()
    }
    
    func setupNormalState(){
        
        orderAcceptButton.title = "ПРИНЯТЬ"
        orderAcceptButton.isEnabled = false
        
        orderAcceptButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 134).isActive = true
        
        orderAcceptButton.setButton()
        
        orderToLabel.style = .light
        orderToLabel.setLabel()
        orderToImage.image = UIImage(named: "Place")
 
        
        orderTimerView.isHidden = false
        orderTimerImage.isHidden = false
        orderTimerLabel.isHidden = false
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

