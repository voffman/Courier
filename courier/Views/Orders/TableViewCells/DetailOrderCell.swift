//
//  DetailOrderCell.swift
//  courier
//
//  Created by Владимир Свиридов on 02.02.2022.
//

import UIKit

class DetailOrderCell: UITableViewCell {

    static let identifire = "detailOrderCell"
    
    
    let orderNameLabel = CustomLabels(title: "Пицца «Капореджими»", textSize: 14, style: .regular)
    let orderCountLabel = CustomLabels(title: "1 шт", textSize: 14, style: .light)
    var orderPriceLabel = CustomLabels(title: "4 000 ₸", textSize: 14, style: .light)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(orderNameLabel)
        orderNameLabel.setLabel()
        contentView.addSubview(orderCountLabel)
        orderCountLabel.setLabel()
        contentView.addSubview(orderPriceLabel)
        orderPriceLabel.setLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // для использования в tableView
    public func configure(orderName: String?,
                          orderCount: String?,
                          orderPrice: String?){
        self.orderNameLabel.text = orderName
        self.orderCountLabel.text = orderCount
        self.orderPriceLabel.text = orderPrice
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    // MARK: Поправить
    func setupNameLabel(){
        orderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        orderNameLabel.leftAnchor.constraint(equalTo:  contentView.leftAnchor, constant: 16).isActive = true
        orderNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        orderNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        orderNameLabel.rightAnchor.constraint(lessThanOrEqualTo: orderCountLabel.leftAnchor, constant: -16).isActive = true
    }
    
    func setupCountLabel(){
        orderCountLabel.translatesAutoresizingMaskIntoConstraints = false
        orderCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        orderCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        orderCountLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
       
        orderCountLabel.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -76).isActive = true
    }
    
    func setupPriceLabel(){
        orderPriceLabel.translatesAutoresizingMaskIntoConstraints = false
       // orderPriceLabel.leftAnchor.constraint(greaterThanOrEqualTo: orderCountLabel.rightAnchor, constant: 16).isActive = true
        orderPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        orderPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        orderPriceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orderPriceLabel.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -16).isActive = true
        orderPriceLabel.textAlignment = .right
    }
    
    func setupCell(){
        setupNameLabel()
        setupCountLabel()
        setupPriceLabel()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
}
