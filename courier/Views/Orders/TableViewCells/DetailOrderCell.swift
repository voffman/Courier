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
    var orderPriceLabel = CustomLabels(title: "4 000 ₸", textSize: 14, style: .regular)
    
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
        orderNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        orderNameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.65).isActive = true
        orderNameLabel.rightAnchor.constraint(greaterThanOrEqualTo: orderCountLabel.leftAnchor, constant: -10).isActive = true
    }
    
    func setupCountLabel(){
        orderCountLabel.translatesAutoresizingMaskIntoConstraints = false
        orderPriceLabel.numberOfLines = 1
        orderCountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    func setupPriceLabel(){
        orderPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        orderPriceLabel.numberOfLines = 1
        orderPriceLabel.leftAnchor.constraint(lessThanOrEqualTo: orderCountLabel.rightAnchor, constant: 16).isActive = true
        orderPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
      //  orderPriceLabel.widthAnchor.constraint(equalToConstant: self.indentationWidth).isActive = true
        orderPriceLabel.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -16).isActive = true
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
