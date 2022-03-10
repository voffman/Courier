//
//  OrderListCompletedOrdersCell.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class OrderListCompletedOrdersCell: UITableViewCell {

    static let identifire = "orderListCompletedOrdersCell"
    
    let cardView = CustomViews(style: .withShadow)
    let orderIdLabel = CustomLabels(title: "№ 356167", textSize: 14, style: .bold)
    let orderPriceLabel = CustomLabels(title: "• 20 000 ₸", textSize: 14, style: .light)
    let orderSourcelabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderLineImage = UIImageView(image: UIImage(named: "Line"))
    
    let orderTransitionArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    
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
        contentView.addSubview(orderSourcelabel)
        orderSourcelabel.setLabel()
        contentView.addSubview(orderTransitionArrowButtonImage)
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

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // для использования в tableView
    public func configure(orderId: Int,
                          orderPrice: Int,
                          orderSource: String?,
                          orderFromAddress: String?,
                          orderToAddress: String?){
        
        self.orderIdLabel.text = "№ \(String(orderId))"
        self.orderPriceLabel.text = "• \(String(orderPrice)) ₸"
        self.orderSourcelabel.text = orderSource
        self.orderFromAddressLabel.text = orderFromAddress
        self.orderToAddressLabel.text = orderToAddress
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
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
        orderSourcelabel.frame = CGRect(x: 16,
                                              y: 36,
                                              width: orderSourcelabel.intrinsicContentSize.width,
                                              height: orderSourcelabel.intrinsicContentSize.height)
    }
    
    func setupTransitionArrowButtonImage(){
        orderTransitionArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
        orderTransitionArrowButtonImage.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 26).isActive = true
        orderTransitionArrowButtonImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        orderTransitionArrowButtonImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        orderTransitionArrowButtonImage.widthAnchor.constraint(equalToConstant: 7.4).isActive = true
        
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
    

    func setupCell(){
        insertPaddingsBetweenCells()
        
        setupCardView()
        
        setupIdLabel()
        setupPriceLabel()
        setupSourceLabel()
        setupTransitionArrowButtonImage()
        setupLineImage()
        
        setupOrderFromImage()
        setupOrderFromLabel()
        setupDownArrowImage()
        setupOrderFromAddressLabel()
        setupOrderToLabel()
        setupOrderToImage()
        setupOrderToAddressLabel()

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

    }

}
