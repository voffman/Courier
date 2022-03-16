//
//  DetailOrderTableViewFooter.swift
//  courier
//
//  Created by Владимир Свиридов on 16.03.2022.
//


import UIKit

class DetailOrderTableViewFooter: UIView {
    
    let firstLineImage = UIImageView(image: UIImage(named: "Line"))
    let secondLineImage = UIImageView(image: UIImage(named: "Line"))
    
    let sumTitleLabel = CustomLabels(title: "Итого", textSize: 14, style: .bold, alignment: .left)
    let sumLabel = CustomLabels(title: "4 000 000 ₸", textSize: 14, style: .bold, alignment: .right)
    let customerAmountTitleLabel = CustomLabels(title: "Сдача с", textSize: 14, style: .regular, alignment: .left)
    let customerAmountLabel = CustomLabels(title: "5 000 000 ₸", textSize: 14, style: .regular, alignment: .right)
    let paymentTypeLabel = CustomLabels(title: "Наличными", textSize: 14, style: .regular, alignment: .left)
    let paymentLabel = CustomLabels(title: "Неоплачен", textSize: 14, style: .timerRed, alignment: .right)
    
    func addElements(){
        self.addSubview(firstLineImage)
        self.addSubview(secondLineImage)
        self.addSubview(sumTitleLabel)
        sumTitleLabel.setLabel()
        self.addSubview(sumLabel)
        sumLabel.setLabel()
        self.addSubview(customerAmountTitleLabel)
        customerAmountTitleLabel.setLabel()
        self.addSubview(customerAmountLabel)
        customerAmountLabel.setLabel()
        self.addSubview(paymentTypeLabel)
        paymentTypeLabel.setLabel()
        self.addSubview(paymentLabel)
        paymentLabel.textColor = Colors.red
        paymentLabel.setLabel()
    }
    
    func addData(sum: Int, customerAmount: String, paymentType: Int){
        sumLabel.text = String(sum.formattedWithSeparator) + " ₸"
        customerAmountLabel.text = (Int(customerAmount)?.formattedWithSeparator ?? "-") + " ₸"
        paymentTypeLabel.text = String(paymentType)
        
        switch paymentTypeLabel.text{
            
        case "1":
            paymentTypeLabel.text = "Наличными"
            //    cell.orderPriceLabel.style = .timerRed
            //    cell.orderPriceLabel.setLabel()
        case "2":
            paymentTypeLabel.text = "POS терминал"
            //   cell.orderPriceLabel.style = .timerRed
            //   cell.orderPriceLabel.setLabel()
        case "3":
            paymentTypeLabel.text = "Оплаченный заказ"
            paymentLabel.text = ""
        default:
            paymentTypeLabel.text = "Нет данных"
        }
    }
    
    func createFooterView(){
        self.backgroundColor = .white
      //  let contentView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
      //  self.addSubview(contentView)
      //  contentView.backgroundColor = .red
      //  contentView.translatesAutoresizingMaskIntoConstraints = false
        
       // self.translatesAutoresizingMaskIntoConstraints = false
       // submitButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
       // self.heightAnchor.constraint(equalToConstant: 105).isActive = true
      //  self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true

        firstLineImage.translatesAutoresizingMaskIntoConstraints = false
        secondLineImage.translatesAutoresizingMaskIntoConstraints = false
        sumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        customerAmountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        customerAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstLineImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
        firstLineImage.widthAnchor.constraint(equalToConstant: self.frame.size.width - 32).isActive = true
        firstLineImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        sumTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
        sumTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        sumLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
        sumLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        secondLineImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        secondLineImage.widthAnchor.constraint(equalToConstant: self.frame.size.width - 32).isActive = true
        secondLineImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        customerAmountTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 45).isActive = true
        customerAmountTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        customerAmountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 45).isActive = true
        customerAmountLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        paymentTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 78).isActive = true
        paymentTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        paymentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 78).isActive = true
        paymentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
    }
    
    
}
