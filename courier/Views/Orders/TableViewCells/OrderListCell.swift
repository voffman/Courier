//
//  OrderListTVCell.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListCell: UITableViewCell {
    
    static let identifire = "orderListCell"
    
    var statusCode: Int = 0
    var status: String? = "Неизвестно"
    
    let cardView = CustomViews(style: .withShadow)
    let orderIdLabel = CustomLabels(title: "№ 356167", textSize: 14, style: .bold)
    let orderPriceLabel = CustomLabels(title: "• 10 000 ₸", textSize: 14, style: .light)
    let orderSourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderLineImage = UIImageView(image: UIImage(named: "Line"))
    
    let orderTransitionArrowButton = CustomButtons(title: "", style: .transparent)
    
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let orderDownArrowImage = UIImageView(image: UIImage(named: "Arrow_downward"))
    let orderToImage = UIImageView(image: UIImage(named: "Place"))
    
    let orderFromLabel = CustomLabels(title: "Откуда", textSize: 14, style: .light)
    let orderFromAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToAddressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let orderToLabel = CustomLabels(title: "Куда", textSize: 14, style: .light)
    
    let orderTimerView = CustomTimer(style: .timerGray)
    let orderTimerImage = UIImageView(image: UIImage(named: "TimerGray"))
    
    let orderTimerLabel = CustomLabels(title: "--:--", textSize: 20, style: .light)
    
    let orderStateButton = CustomButtons(title: "НЕТ ДАННЫХ", style: .primary)
    
    let dateManager = DateManager()
    
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
//        contentView.addSubview(orderTransitionArrowButtonImage)
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
        
        contentView.addSubview(orderStateButton)
        orderStateButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // для использования в tableView
    public func configure(orderId: Int,
                          orderPrice: Int,
                          orderSource: String?,
                          orderFromAddress: String?,
                          orderToAddress: String?,
                          orderAcceptButtonTitle: String?, orderStatusCode: Int){
        self.orderIdLabel.text = "№ \(String(orderId))"
        self.orderPriceLabel.text = "• \(String(orderPrice.formattedWithSeparator)) ₸"
        self.orderSourceLabel.text = orderSource
        self.orderFromAddressLabel.text = orderFromAddress
        self.orderToAddressLabel.text = orderToAddress
        self.orderStateButton.title = orderAcceptButtonTitle?.uppercased()
        self.orderStateButton.setButton()
        self.statusCode = orderStatusCode
        
//        guard let orderTime = orderTime else {
//            return
//        }
//
//        let orderTimeConverted = dateManager.convert(dateString: orderTime, stringDateFormat: "yyyy-MM-dd HH:mm:ssZ", convertToDateFormat: "dd:HH:mm")
//        self.orderTimerLabel.text = "\(orderTimeConverted)  "

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setupNormalState()
        layoutIfNeeded()
    }
    
    func insertPaddingsBetweenCells(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5,
                                                                     left: 10,
                                                                     bottom: 5,
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
        orderTransitionArrowButton.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 5).isActive = true
        orderTransitionArrowButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
        orderTransitionArrowButton.heightAnchor.constraint(equalToConstant: cardView.frame.height / 5).isActive = true
        orderTransitionArrowButton.widthAnchor.constraint(equalToConstant: cardView.frame.width - 20).isActive = true
        
        orderTransitionArrowButton.setImage(UIImage(named: "Arrow"), for: .normal)
        orderTransitionArrowButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: -UIScreen.main.bounds.width + 67)
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
        orderTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        orderTimerLabel.centerXAnchor.constraint(equalTo: orderTimerView.centerXAnchor, constant: 6).isActive = true // 16
        orderTimerLabel.centerYAnchor.constraint(equalTo: orderTimerView.centerYAnchor, constant: 0).isActive = true
        orderTimerLabel.heightAnchor.constraint(equalToConstant: orderTimerLabel.intrinsicContentSize.width).isActive = true
        orderTimerLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
    }
    
    func setupTimer(){
    
        setupTimerView()
        setupTimerImage()
        setupTimerLabel()
        
    }
    
    func changeTimerToRed(){
        orderTimerView.style = .timerRed
        orderTimerView.setView()
        orderTimerImage.image = UIImage(named: "Timer")
        orderTimerLabel.style = .timerRed
        orderTimerLabel.setLabel()
    }
    
    func setupStateButton(){
        orderStateButton.translatesAutoresizingMaskIntoConstraints = false
        orderStateButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 257).isActive = true
        orderStateButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 134).isActive = true
        orderStateButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        
        orderStateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
       // orderStateButton.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
    }

    func configureStatusState(){
 
        switch statusCode{
            
        case 10...15:
            setupNormalState()
            
        case 20:
            setupArrivedToShopState()

        case 50:
            setupGotOrder()

        case 75:
            setupArrivedToClient()

        case 100:
            break

        default:
            setupNormalState()
        }
    }
    
// @objc func changeButtonState(sender: UIButton){
//     print("cell sender tag \(sender.tag) ")
//
//    }
    
    // MARK: Функции для изменения состояний ячейки, во время работы курьера
    
    func setupArrivedToShopState(){
        
        orderStateButton.setButton()
        orderFromLabel.style = .primary
        orderFromLabel.setLabel()
        
        orderFromImage.image = UIImage(named: "StorefrontOrange")
        
    }
    
    func setupGotOrder(){

        orderStateButton.setButton()
        orderFromLabel.style = .light
        orderFromLabel.setLabel()
        orderFromImage.image = UIImage(named: "StorefrontCompleted")
        orderDownArrowImage.image = UIImage(named: "Arrow_downward_Orange")
        
    }
    
    func setupArrivedToClient(){
        orderFromImage.image = UIImage(named: "StorefrontCompleted")
        orderDownArrowImage.image = UIImage(named: "Arrow_downward_Completed")
        orderToLabel.style = .primary
        orderToLabel.setLabel()
        orderToImage.image = UIImage(named: "Place_orange")
        
//        orderTimerView.isHidden = true
//        orderTimerImage.isHidden = true
//        orderTimerLabel.isHidden = true
//
//        orderAcceptButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
//
//        orderAcceptButton.setButton()
    }
    
    func setupNormalState(){
        
     //   orderAcceptButton.isEnabled = false
        orderStateButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = false
        orderToLabel.style = .light
        orderToLabel.setLabel()
        orderToImage.image = UIImage(named: "Place")

        orderFromImage.image = UIImage(named: "Storefront")
        orderDownArrowImage.image = UIImage(named: "Arrow_downward")
        orderToImage.image = UIImage(named: "Place")
        orderFromLabel.style = .light
        orderFromLabel.setLabel()
        orderToLabel.style = .light
        orderToLabel.setLabel()

        orderStateButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 134).isActive = true
        orderStateButton.setButton()
        
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
        setupStateButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
        configureStatusState()
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

