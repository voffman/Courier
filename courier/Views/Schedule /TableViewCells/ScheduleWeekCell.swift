//
//  ScheduleWeekCell.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekCell: UITableViewCell {

    static let identifire = "scheduleWeekCell"
    
    let cardView = CustomViews(style: .withShadow)
    
    let dayOfWeekLabel = CustomLabels(title: "Понедельник", textSize: 14, style: .bold)
    let dateLabel = CustomLabels(title: "• 24 фев", textSize: 14, style: .light)
    let timeLabel = CustomLabels(title: "9:00 - 16:00", textSize: 14, style: .regular)
    let sourcePointLabel = CustomLabels(title: "Название отправной точки", textSize: 14, style: .regular)

    let dateConverter = DateConverter()
    
    var confirmButtonIsHidden = true
    
    let submitButton = CustomButtons(title: "Подтвердить расписание", style: .submit)
    
    let tickImage = UIImageView(image: UIImage(named: "Tick"))
    let submitLabel = CustomLabels(title: "ВЫ ПОДТВЕРДИЛИ", textSize: 14, style: .bold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(dayOfWeekLabel)
        dayOfWeekLabel.setLabel()
        contentView.addSubview(dateLabel)
        dateLabel.setLabel()
        contentView.addSubview(timeLabel)
        timeLabel.setLabel()
        contentView.addSubview(sourcePointLabel)
        sourcePointLabel.setLabel()
        
        contentView.addSubview(submitButton)
        submitButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(dayOfWeek: String?,
                          date: String?, timeStart: String?, timeEnd: String?, sourcePoint: String?) {

        guard let timeStart = timeStart else {
            return
        }

        guard let timeEnd = timeEnd else {
            return
        }
        
        guard let dayOfWeek = dayOfWeek else {
            return
        }
        
        guard let date = date else {
            return
        }
        
        self.dayOfWeekLabel.text = dateConverter.convert(dateString: dayOfWeek, dateFormat: "EEEE").capitalized
        self.dateLabel.text = " • " + dateConverter.convert(dateString: date, dateFormat: "dd MMM")
        self.timeLabel.text = timeStart + " - " + timeEnd
        self.sourcePointLabel.text = sourcePoint
 
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
    
    func setupCardView(){
        cardView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: 90)
    }
    
    
    func setupDayOfWeekLabel(){
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dayOfWeekLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dayOfWeekLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: -1).isActive = true
    }
    
    func setupDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dayOfWeekLabel.rightAnchor, constant: 2).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: -1).isActive = true
    }
    
    func setupTimeLabel(){
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupSourcePointLabel(){
        sourcePointLabel.translatesAutoresizingMaskIntoConstraints = false
        sourcePointLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 37).isActive = true
        sourcePointLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        sourcePointLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -1).isActive = true
    }
    
    //MARK: Добавить оранжевую полосу
    func setupSubmitButton(){
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: contentView.frame.size.width).isActive = true
        submitButton.addTarget(self, action: #selector(submitButtonAction(sender:)), for: .touchUpInside)
    }
    
    func setupSubmitInfo(){
        contentView.addSubview(tickImage)
        contentView.addSubview(submitLabel)
        submitLabel.setLabel()
        tickImage.translatesAutoresizingMaskIntoConstraints = false
        submitLabel.translatesAutoresizingMaskIntoConstraints = false
        tickImage.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: submitButton.frame.height/2).isActive = true
        submitLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: submitButton.frame.height/2).isActive = true
        tickImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tickImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        submitLabel.leftAnchor.constraint(equalTo: tickImage.rightAnchor, constant: 4).isActive = true
        tickImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                        constant: contentView.frame.width/2 - tickImage.frame.width/2 - submitLabel.intrinsicContentSize.width/2).isActive = true
        submitLabel.textColor = Colors.lightGreen
    }
    
    @objc func submitButtonAction(sender: UIButton){
        print("Hello World")
        submitButton.isEnabled = false
        submitButton.isHidden = true
        setupSubmitInfo()
    }
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupDayOfWeekLabel()
        setupDateLabel()
        setupTimeLabel()
        setupSourcePointLabel()
        setupSubmitButton()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
        submitButton.isHidden = confirmButtonIsHidden
    }

}
