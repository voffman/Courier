//
//  HistoryCell.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    static let identifire = "historyCell"
    
    let cardView = CustomViews(style: .withShadow)
    let orderIdLabel = CustomLabels(title: "№ 356167", textSize: 14, style: .bold)
    let orderDateLabel = CustomLabels(title: "", textSize: 14, style: .light)
    let orderPriceLabel = CustomLabels(title: "10 000 ₸", textSize: 14, style: .light)
    let orderStatusLabel = CustomLabels(title: "Доставлен", textSize: 14, style: .regular)
    let orderSourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    
    let dateManager = DateManager()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(orderIdLabel)
        orderIdLabel.setLabel()
        contentView.addSubview(orderDateLabel)
        orderDateLabel.setLabel()
        contentView.addSubview(orderPriceLabel)
        orderPriceLabel.setLabel()
        contentView.addSubview(orderStatusLabel)
        orderStatusLabel.setLabel()
        contentView.addSubview(orderSourceLabel)
        orderSourceLabel.setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // для использования в tableView
    public func configure(orderId: Int,
                          orderDate: String?,
                          orderPrice: Int,
                          orderStatus: String?,
                          orderSource: String?) {
        
        guard let orderDate = orderDate else {
            return
        }
        
        self.orderIdLabel.text = "№ \(String(orderId))"
        // или обрезать строку даты до 10 символов или изменить параметр dateFormat
        self.orderDateLabel.text = dateManager.convert(dateString: orderDate, stringDateFormat: "yyyy-MM-dd HH:mm:ssZ", convertToDateFormat: "dd MMM")
        self.orderPriceLabel.text = "\(String(orderPrice)) ₸"
        self.orderStatusLabel.text = orderStatus
        self.orderSourceLabel.text = orderSource
        
        if self.orderStatusLabel.text == "Выполнен"{
            self.orderStatusLabel.textColor = Colors.lightGreen
        }
        else if self.orderStatusLabel.text == "Отменен"{
            self.orderStatusLabel.textColor = Colors.red
        }
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
    
    func setupCardView(){
        cardView.frame = CGRect(x: 0,
                                y: 0,
                                width: contentView.frame.size.width,
                                height: contentView.frame.size.height)
    }
    
    
    
    func setupOrderIdLabel(){
        orderIdLabel.translatesAutoresizingMaskIntoConstraints = false
        orderIdLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        orderIdLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
    }
    
    func setupOrderDateLabel(){
        orderDateLabel.translatesAutoresizingMaskIntoConstraints = false
        orderDateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        orderDateLabel.leftAnchor.constraint(equalTo: orderIdLabel.rightAnchor, constant: 5).isActive = true
    }
    
    func setupOrderPriceLabel(){
        orderPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        orderPriceLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        orderPriceLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -20).isActive = true
    }
    
    func setupOrderStatusLabel(){
        orderStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        orderStatusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 38).isActive = true
        orderStatusLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
    }
    
    func setupOrderSourceLabel(){
        orderSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        orderSourceLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 58).isActive = true
        orderSourceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        orderSourceLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupOrderIdLabel()
        setupOrderDateLabel()
        setupOrderPriceLabel()
        setupOrderStatusLabel()
        setupOrderSourceLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
        
    }
}
