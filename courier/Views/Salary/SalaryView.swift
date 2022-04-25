//
//  SalaryView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.04.2022.
//

import UIKit

class SalaryView: MVPController {
    
    let firstCardView = CustomViews(style: .withShadow)
    let moneyBackgroundView = CustomViews(style: .circle)
    let moneyBorderView = CustomViews(cicrleWidth: 48, circleHeight: 48)
    let moneyImage = UIImageView(image: UIImage(named: "baseline_monetization_on_black")?.withRenderingMode(.alwaysTemplate))
    
    let currentBalanceTitleLabel = CustomLabels(title: "Текущий баланс", textSize: 16, style: .regular)
    let currentBalanceLabel = CustomLabels(title: "9 200 ₸", textSize: 48, style: .regularGreen)
    let currentBalanceHelpLabel = CustomLabels(title: "До вычета налогов", textSize: 14, style: .regular)
    
    let secondCardView = CustomViews(style: .withShadow)
    
    let secondCardViewTitleLabel = CustomLabels(title: "Сводка", textSize: 20, style: .regular)
    
    let segmentedControl = UISegmentedControl(items: ["Сегодня","Неделя","Период"])
    
    let dateLabel = CustomLabels(title: "с 1 апреля по 12 мая 2021", textSize: 14, style: .regular)
    
    
    let clockImage = UIImageView(image: UIImage(named: "baseline_schedule_black")?.withRenderingMode(.alwaysTemplate))
    let clockTitleLabel = CustomLabels(title: "Часы", textSize: 14, style: .regular)
    let clockLabel = CustomLabels(title: "5 000 ₸", textSize: 14, style: .regular)
    
    let orderImage = UIImageView(image: UIImage(named: "outline_local_mall_black")?.withRenderingMode(.alwaysTemplate))
    let orderTitleLabel = CustomLabels(title: "Заказы", textSize: 14, style: .regular)
    let orderLabel = CustomLabels(title: "3 000 ₸", textSize: 14, style: .regular)
    
    let bonusImage = UIImageView(image: UIImage(named: "outline_paid_black")?.withRenderingMode(.alwaysTemplate))
    let bonusTitleLabel = CustomLabels(title: "Бонус", textSize: 14, style: .regular)
    let bonusLabel = CustomLabels(title: "1 200 ₸", textSize: 14, style: .regular)
    
    
    let fineImage = UIImageView(image: UIImage(named: "outline_report_black")?.withRenderingMode(.alwaysTemplate))
    let fineTitleLabel = CustomLabels(title: "Штраф", textSize: 14, style: .regular)
    let fineLabel = CustomLabels(title: "0 ₸", textSize: 14, style: .regular)
    
    let cashBonusImage = UIImageView(image: UIImage(named: "outline_paid_black")?.withRenderingMode(.alwaysTemplate))
    let cashBonusTitleLabel = CustomLabels(title: "Премия", textSize: 14, style: .regular)
    let cashBonusLabel = CustomLabels(title: "0 ₸", textSize: 14, style: .regular)
    
    
    let retentionImage = UIImageView(image: UIImage(named: "baseline_report_problem_black")?.withRenderingMode(.alwaysTemplate))
    let retentionTitleLabel = CustomLabels(title: "Удержания", textSize: 14, style: .regular)
    let retentionLabel = CustomLabels(title: "0 ₸", textSize: 14, style: .regular)
    
    let totalImage = UIImageView(image: UIImage(named: "outline_account_balance_wallet_black")?.withRenderingMode(.alwaysTemplate))
    let totalTitleLabel = CustomLabels(title: "Итого", textSize: 14, style: .regular)
    let totalLabel = CustomLabels(title: "0 ₸", textSize: 14, style: .regular)
    
    
    let thirdCardView = CustomViews(style: .withShadow)
    let thirdCardViewTitleLabel = CustomLabels(title: "Наличные за доставку", textSize: 20, style: .regular)
    let thirdCardViewDateLabel = CustomLabels(title: "с 1 апреля по 12 мая 2021", textSize: 14, style: .regular)
    
    let thirdCardViewSumLabel = CustomLabels(title: "1 500 ₸", textSize: 48, style: .regular)
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let dateManager = DateManager()
    
    var startDate: String = "С"
    var endDate: String = "По"
    
    private var presenter: IncomeViewPresenterProtocol?
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    
    func setupFirstCardView() {
        contentView.addSubview(firstCardView)
        firstCardView.setView()
        firstCardView.translatesAutoresizingMaskIntoConstraints = false
        firstCardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        if #available(iOS 11, *) {
            firstCardView.topAnchor.constraint(equalTo:  contentView.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
            
        } else {
            if UIScreen.main.bounds.size.height > 750 {
                firstCardView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: self.view.frame.height/7.5).isActive = true
            }
            
            if UIScreen.main.bounds.size.height > 640 {
                firstCardView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: self.view.frame.height/7.5).isActive = true
            }
            
            if UIScreen.main.bounds.size.height <= 640 {
                firstCardView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: self.view.frame.height/6.5).isActive = true
            }
        }
        firstCardView.leftAnchor.constraint(equalTo:  contentView.leftAnchor, constant: 10).isActive = true
        firstCardView.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -10).isActive = true
        firstCardView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        firstCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupMoneyBorderView(){
        firstCardView.addSubview(moneyBorderView)
        moneyBorderView.setView()
        moneyBorderView.translatesAutoresizingMaskIntoConstraints = false
        moneyBorderView.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: -24).isActive = true
        moneyBorderView.centerXAnchor.constraint(equalTo: firstCardView.centerXAnchor).isActive = true
        moneyBorderView.backgroundColor = Colors.backgroundColor
    }
    
    func setupMoneyBackgroundView(){
        moneyBorderView.addSubview(moneyBackgroundView)
        moneyBackgroundView.setView()
        moneyBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        moneyBackgroundView.centerXAnchor.constraint(equalTo: moneyBorderView.centerXAnchor).isActive = true
        moneyBackgroundView.centerYAnchor.constraint(equalTo: moneyBorderView.centerYAnchor).isActive = true
        moneyBackgroundView.backgroundColor = Colors.white
    }
    
    func setupMoneyImage() {
        moneyBackgroundView.addSubview(moneyImage)
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.centerXAnchor.constraint(equalTo: moneyBackgroundView.centerXAnchor).isActive = true
        moneyImage.centerYAnchor.constraint(equalTo: moneyBackgroundView.centerYAnchor).isActive = true
        moneyImage.tintColor = Colors.green
    }
    
    func setupCurrentBalanceTitleLabel() {
        firstCardView.addSubview(currentBalanceTitleLabel)
        currentBalanceTitleLabel.setLabel()
        
        currentBalanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceTitleLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 28).isActive = true
        currentBalanceTitleLabel.centerXAnchor.constraint(equalTo: firstCardView.centerXAnchor).isActive = true
    }
    
    func setupCurrentBalanceLabel() {
        firstCardView.addSubview(currentBalanceLabel)
        currentBalanceLabel.setLabel()
        
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 48).isActive = true
        currentBalanceLabel.centerXAnchor.constraint(equalTo: firstCardView.centerXAnchor).isActive = true
    }
    
    func setupCurrentBalanceHelpLabel() {
        firstCardView.addSubview(currentBalanceHelpLabel)
        currentBalanceHelpLabel.setLabel()
        
        currentBalanceHelpLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceHelpLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 98).isActive = true
        currentBalanceHelpLabel.centerXAnchor.constraint(equalTo: firstCardView.centerXAnchor).isActive = true
    }
    
    func setupSecondCardView() {
        contentView.addSubview(secondCardView)
        secondCardView.setView()
        secondCardView.translatesAutoresizingMaskIntoConstraints = false
        secondCardView.topAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: 15).isActive = true
        secondCardView.leftAnchor.constraint(equalTo:  contentView.leftAnchor, constant: 10).isActive = true
        secondCardView.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -10).isActive = true
        secondCardView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        secondCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
    }
    
    func setupSecondCardViewTitleLabel() {
        secondCardView.addSubview(secondCardViewTitleLabel)
        secondCardViewTitleLabel.setLabel()
        
        secondCardViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondCardViewTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 16).isActive = true
        secondCardViewTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    
    func setupSegmentedControl() {
        secondCardView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 46).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 16).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -16).isActive = true
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = Colors.white
        segmentedControl.backgroundColor = Colors.lightGray
        
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
    }
    

    
    @objc func popUpPicker(sender: UISegmentedControl) {
        
        let dateStartPickerController = UIDatePicker()
        let dateEndPickerController = UIDatePicker()
        
        let startDateTitleLabel = CustomLabels(title: "Дата начала", textSize: 14, style: .regular)
        let endDateTitleLabel = CustomLabels(title: "Дата окончания", textSize: 14, style: .regular)
        
        let vc = UIViewController()
        vc.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        dateStartPickerController.addTarget(self, action: #selector(dateStartPickerValueChanged(_:)), for: .valueChanged)
        dateEndPickerController.addTarget(self, action: #selector(dateEndPickerValueChanged(_:)), for: .valueChanged)
        
        dateStartPickerController.datePickerMode = .date
        dateEndPickerController.datePickerMode = .date
        
        vc.view.addSubview(startDateTitleLabel)
        vc.view.addSubview(endDateTitleLabel)
        
        vc.view.addSubview(dateStartPickerController)
        vc.view.addSubview(dateEndPickerController)
        
        startDateTitleLabel.setLabel()
        endDateTitleLabel.setLabel()
        
        startDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateTitleLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor, constant: -75).isActive = true
        
        endDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateTitleLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor, constant: 75).isActive = true
        
        dateStartPickerController.translatesAutoresizingMaskIntoConstraints = false
        dateStartPickerController.topAnchor.constraint(equalTo: vc.view.topAnchor, constant: 50).isActive = true
        dateStartPickerController.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor, constant: -75).isActive = true
        
        dateEndPickerController.translatesAutoresizingMaskIntoConstraints = false
        dateEndPickerController.topAnchor.constraint(equalTo: vc.view.topAnchor, constant: 50).isActive = true
        dateEndPickerController.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor, constant: 75).isActive = true
        
        let alert = UIAlertController(title: "Выберите период", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = vc.view
        alert.popoverPresentationController?.sourceRect = vc.view.bounds
        
        
        var heightMultipler = 0.5
        
        switch UIScreen.main.bounds.size.height {
            
        case let x where x > 812:
            heightMultipler = 0.325
            break
            
        case let x where x > 750:
            heightMultipler = 0.335 // mini
            break
            
        case let x where x > 640:
            heightMultipler = 0.425
            break
            
        case let x where x <= 640:
            heightMultipler = 0.5
            break
            
        default:
            break
        }
        
        
        let alertHeight:NSLayoutConstraint = NSLayoutConstraint(item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * heightMultipler)
        
            alert.view.addConstraint(alertHeight)
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (UIAlertAction) in
        }))
        
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (UIAlertAction) in
            self.dateLabel.text = " \(self.startDate) - \(self.endDate)"
            // MARK: get days between two dates
            // подставляю в запрос dateStart и dateEnd. Если надо переформатирую
            let dateStartConverted = self.dateManager.convert(dateString: self.startDate, stringDateFormat: "d MMMM Y", convertToDateFormat: "yyyy-MM-dd")
            let dateEndConverted = self.dateManager.convert(dateString: self.endDate, stringDateFormat: "d MMMM Y", convertToDateFormat: "yyyy-MM-dd")
            self.presenter?.getInfo(dateStart: dateStartConverted, dateEnd: dateEndConverted)
            print("дададададдададдд: \(self.startDate)")
            print("дататататтата: \(dateStartConverted)")
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    
    @objc func dateStartPickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "d MMMM Y"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        sender.maximumDate = Date()
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        startDate = selectedDate
        print("Selected start value \(selectedDate)")
    }
    
    
    @objc func dateEndPickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "d MMMM Y"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        sender.maximumDate = Date()
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        endDate = selectedDate
        print("Selected end value \(selectedDate)")
    }
    
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        if segmentedControl.selectedSegmentIndex == 0 {
            presenter?.getInfo(dateStart: dateManager.getStringDateFor(days: 0), dateEnd: dateManager.getStringDateFor(days: 0))
            startDate = dateManager.getStringDateFor(days: 0, stringDateFormat: "dd MMMM")
            endDate = dateManager.getStringDateFor(days: 0, stringDateFormat: "dd MMMM Y")
            
            dateLabel.text = " \(startDate) - \(endDate)"
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            presenter?.getInfo(dateStart: dateManager.getStringDateFor(days: -7), dateEnd: dateManager.getStringDateFor(days: 0))
            startDate = dateManager.getStringDateFor(days: 0, stringDateFormat: "dd MMMM")
            endDate = dateManager.getStringDateFor(days: -7, stringDateFormat: "dd MMMM Y")
            
            dateLabel.text = " \(startDate) - \(endDate)"
        }
        
        if segmentedControl.selectedSegmentIndex == 2 {
            popUpPicker(sender: segmentedControl)

        }
    }
    
    func setupDateLabel() {
        secondCardView.addSubview(dateLabel)
        dateLabel.setLabel()
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 80).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        startDate = dateManager.getStringDateFor(days: 0, stringDateFormat: "dd MMMM")
        endDate = dateManager.getStringDateFor(days: 0, stringDateFormat: "dd MMMM Y")
        
        dateLabel.text = " \(startDate) - \(endDate)"
    }
    
    // MARK: список
    
    func setupList() {
        
        secondCardView.addSubview(clockImage)
        secondCardView.addSubview(clockTitleLabel)
        clockTitleLabel.setLabel()
        secondCardView.addSubview(clockLabel)
        clockLabel.setLabel()
        
        clockImage.translatesAutoresizingMaskIntoConstraints = false
        clockImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 95).isActive = true
        clockImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        clockImage.tintColor = Colors.black
        
        clockTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        clockTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 100).isActive = true
        clockTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 100).isActive = true
        clockLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        
        secondCardView.addSubview(orderImage)
        secondCardView.addSubview(orderTitleLabel)
        orderTitleLabel.setLabel()
        secondCardView.addSubview(orderLabel)
        orderLabel.setLabel()
        
        orderImage.translatesAutoresizingMaskIntoConstraints = false
        orderImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 125).isActive = true
        orderImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        orderImage.tintColor = Colors.black
        
        orderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        orderTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 130).isActive = true
        orderTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 130).isActive = true
        orderLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        
        secondCardView.addSubview(bonusImage)
        secondCardView.addSubview(bonusTitleLabel)
        bonusTitleLabel.setLabel()
        secondCardView.addSubview(bonusLabel)
        bonusLabel.setLabel()
        
        bonusImage.translatesAutoresizingMaskIntoConstraints = false
        bonusImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 155).isActive = true
        bonusImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        bonusImage.tintColor = Colors.black
        
        bonusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bonusTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 160).isActive = true
        bonusTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        bonusLabel.translatesAutoresizingMaskIntoConstraints = false
        bonusLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 160).isActive = true
        bonusLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        secondCardView.addSubview(fineImage)
        secondCardView.addSubview(fineTitleLabel)
        fineTitleLabel.setLabel()
        secondCardView.addSubview(fineLabel)
        fineLabel.setLabel()
        
        fineImage.translatesAutoresizingMaskIntoConstraints = false
        fineImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 185).isActive = true
        fineImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        fineImage.tintColor = Colors.black
        
        fineTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fineTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 190).isActive = true
        fineTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        fineLabel.translatesAutoresizingMaskIntoConstraints = false
        fineLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 190).isActive = true
        fineLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        secondCardView.addSubview(cashBonusImage)
        secondCardView.addSubview(cashBonusTitleLabel)
        cashBonusTitleLabel.setLabel()
        secondCardView.addSubview(cashBonusLabel)
        cashBonusLabel.setLabel()
        
        cashBonusImage.translatesAutoresizingMaskIntoConstraints = false
        cashBonusImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 215).isActive = true
        cashBonusImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        cashBonusImage.tintColor = Colors.black
        
        cashBonusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cashBonusTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 220).isActive = true
        cashBonusTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        cashBonusLabel.translatesAutoresizingMaskIntoConstraints = false
        cashBonusLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 220).isActive = true
        cashBonusLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        
        secondCardView.addSubview(retentionImage)
        secondCardView.addSubview(retentionTitleLabel)
        retentionTitleLabel.setLabel()
        secondCardView.addSubview(retentionLabel)
        retentionLabel.setLabel()
        
        retentionImage.translatesAutoresizingMaskIntoConstraints = false
        retentionImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 245).isActive = true
        retentionImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        retentionImage.tintColor = Colors.black
        
        retentionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        retentionTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 250).isActive = true
        retentionTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        retentionLabel.translatesAutoresizingMaskIntoConstraints = false
        retentionLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 250).isActive = true
        retentionLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
        
        secondCardView.addSubview(totalImage)
        secondCardView.addSubview(totalTitleLabel)
        totalTitleLabel.setLabel()
        secondCardView.addSubview(totalLabel)
        totalLabel.setLabel()
        
        totalImage.translatesAutoresizingMaskIntoConstraints = false
        totalImage.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 275).isActive = true
        totalImage.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 30).isActive = true
        totalImage.tintColor = Colors.black
        
        totalTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        totalTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 280).isActive = true
        totalTitleLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 60).isActive = true
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 280).isActive = true
        totalLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -30).isActive = true
        
    }
    
    
    func setupThirdCardView() {
        contentView.addSubview(thirdCardView)
        thirdCardView.setView()
        thirdCardView.translatesAutoresizingMaskIntoConstraints = false
        thirdCardView.topAnchor.constraint(equalTo: secondCardView.bottomAnchor, constant: 15).isActive = true
        thirdCardView.leftAnchor.constraint(equalTo:  contentView.leftAnchor, constant: 10).isActive = true
        thirdCardView.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant: -10).isActive = true
        thirdCardView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        thirdCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
       // thirdCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupThirdCardViewTitleLabel () {
        thirdCardView.addSubview(thirdCardViewTitleLabel)
        thirdCardViewTitleLabel.setLabel()
        
        thirdCardViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdCardViewTitleLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 16).isActive = true
        thirdCardViewTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupThirdCardViewDateLabel() {
        thirdCardView.addSubview(dateLabel)
        dateLabel.setLabel()
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 26).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupThirdCardViewSumLabel() {
        thirdCardView.addSubview(thirdCardViewSumLabel)
        thirdCardViewSumLabel.setLabel()
        
        thirdCardViewSumLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdCardViewSumLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 48).isActive = true
        thirdCardViewSumLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    
    func setupView() {
        self.view.backgroundColor = Colors.backgroundColor
        setupFirstCardView()
        setupMoneyBorderView()
        setupMoneyBackgroundView()
        setupMoneyImage()
        setupCurrentBalanceTitleLabel()
        setupCurrentBalanceLabel()
        setupCurrentBalanceHelpLabel()
//
        setupSecondCardView()
        setupSecondCardViewTitleLabel()
        setupSegmentedControl()
        setupDateLabel()
        setupList()
        setupThirdCardView()
        setupThirdCardViewTitleLabel()
        setupThirdCardViewSumLabel()
    }

    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Мой доход", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = SalaryPresenter(view:  self)
        self.presenter = presenter
        setupView()
        setupScrollView()
        createNavigationBar()
        presenter.getInfo(dateStart: dateManager.getStringDateFor(days: 0), dateEnd: dateManager.getStringDateFor(days: 0))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol IncomeViewProtocol: AnyObject, MVPControllerProtocol  {
    func configureData(salary: Salary)
}

extension SalaryView: IncomeViewProtocol{
    
    func configureData(salary: Salary) {
        currentBalanceLabel.text = String(salary.balance)
        
        clockLabel.text = String(salary.workHours)
        orderLabel.text = String(salary.orderAmount)
        bonusLabel.text = String(salary.bonusAmount)
        fineLabel.text = String(salary.penaltyAmount)
        cashBonusLabel.text = String(salary.countSuccessOrders)
        retentionLabel.text = String(salary.holdingAmount)
        totalLabel.text = String(salary.totalAmount)
        
        thirdCardViewSumLabel.text = String(salary.cashDeliveryAmount)
    }
    
}
