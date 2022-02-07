//
//  ScheduleSubmitCell.swift
//  courier
//
//  Created by Владимир Свиридов on 07.02.2022.
//

import UIKit

class ScheduleSubmitCell: UITableViewCell {

    static let identifire = "scheduleSubmitCell"
    
    let submitButton = CustomButtons(title: "Подтвердить расписание", style: .submit)
    
    let tickImage = UIImageView(image: UIImage(named: "Tick"))
    let submitLabel = CustomLabels(title: "ВЫ ПОДТВЕРДИЛИ", textSize: 14, style: .bold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(submitButton)
        submitButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
 
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
    
    func setupSubmitButton(){
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: contentView.frame.size.width).isActive = true
        submitButton.addTarget(self, action: #selector(submitButtonAction(sender:)), for: .touchUpInside)
    }
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupSubmitButton()

    }
    
    @objc func submitButtonAction(sender: UIButton){
        print("Hello World")
        submitButton.isEnabled = false
        submitButton.isHidden = true
        contentView.addSubview(tickImage)
        contentView.addSubview(submitLabel)
        submitLabel.setLabel()
        tickImage.translatesAutoresizingMaskIntoConstraints = false
        submitLabel.translatesAutoresizingMaskIntoConstraints = false
        tickImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        submitLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tickImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tickImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        submitLabel.leftAnchor.constraint(equalTo: tickImage.rightAnchor, constant: 4).isActive = true
        tickImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                        constant: contentView.frame.width/2 - tickImage.frame.width/2 - submitLabel.intrinsicContentSize.width/2).isActive = true
        submitLabel.textColor = Colors.lightGreen
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

    }
    
}
