//
//  IncomeView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.04.2022.
//

import UIKit

class IncomeView: MVPController {
    
    let firstCardView = CustomViews(style: .withShadow)
    let moneyBackgroundView = CustomViews(style: .circle)
    let moneyBorderView = CustomViews(cicrleWidth: 48, circleHeight: 48)
    let moneyImage = UIImageView(image: UIImage(named: "baseline_monetization_on_black")?.withRenderingMode(.alwaysTemplate))
    
    let currentBalanceTitleLabel = CustomLabels(title: "Текущий баланс", textSize: 16, style: .regular)
    let currentBalanceLabel = CustomLabels(title: "9 200 ₸", textSize: 48, style: .regular)
    let currentBalanceHelpLabel = CustomLabels(title: "До вычета налогов", textSize: 14, style: .regular)
    
    let secondCardView = CustomViews(style: .withShadow)
    
    let secondCardViewTitleLabel = CustomLabels(title: "Сводка", textSize: 20, style: .regular)
    
    let segmentedControl = UISegmentedControl(items: ["Сегодня","Неделя","Период"])
    
    let dateLabel = CustomLabels(title: "с 1 апреля по 12 мая 2021", textSize: 14, style: .regular)
    let baselineReportProblemImage = UIImageView(image: UIImage(named: "baseline_report_problem_black")?.withRenderingMode(.alwaysTemplate))
    let baselineScheduleImage = UIImageView(image: UIImage(named: "baseline_schedule_black")?.withRenderingMode(.alwaysTemplate))
    let outlineAccountBalanceWalletImage = UIImageView(image: UIImage(named: "outline_account_balance_wallet_black")?.withRenderingMode(.alwaysTemplate))
    let outlineLocalMallImage = UIImageView(image: UIImage(named: "outline_local_mall_black")?.withRenderingMode(.alwaysTemplate))
    let outlinePaidImage = UIImageView(image: UIImage(named: "outline_paid_black")?.withRenderingMode(.alwaysTemplate))
    let outlineReportImage = UIImageView(image: UIImage(named: "outline_report_black")?.withRenderingMode(.alwaysTemplate))
    
    let thirdCardView = CustomViews(style: .withShadow)
    let thirdCardViewTitleLabel = CustomLabels(title: "Наличные за доставку", textSize: 20, style: .regular)
    let thirdCardViewDateLabel = CustomLabels(title: "с 1 апреля по 12 мая 2021", textSize: 14, style: .regular)
    
    let thirdCardViewSumLabel = CustomLabels(title: "1 500 ₸", textSize: 48, style: .regular)
    
    
    func setupFirstCardView() {
        view.addSubview(firstCardView)
        firstCardView.setView()
        firstCardView.translatesAutoresizingMaskIntoConstraints = false
        firstCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if #available(iOS 11, *) {
            firstCardView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
            
        } else {
            if UIScreen.main.bounds.size.height > 750 {
                firstCardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
            }
            
            if UIScreen.main.bounds.size.height > 640 {
                firstCardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
            }
            
            if UIScreen.main.bounds.size.height <= 640 {
                firstCardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/6.5).isActive = true
            }
        }
        firstCardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        firstCardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        firstCardView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        firstCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupMoneyBorderView(){
        view.addSubview(moneyBorderView)
        moneyBorderView.setView()
        moneyBorderView.translatesAutoresizingMaskIntoConstraints = false
        moneyBorderView.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: -24).isActive = true
        moneyBorderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
        view.addSubview(currentBalanceTitleLabel)
        currentBalanceTitleLabel.setLabel()
        
        currentBalanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceTitleLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 28).isActive = true
        currentBalanceTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupCurrentBalanceLabel() {
        view.addSubview(currentBalanceLabel)
        currentBalanceLabel.setLabel()
        
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 48).isActive = true
        currentBalanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupCurrentBalanceHelpLabel() {
        view.addSubview(currentBalanceHelpLabel)
        currentBalanceHelpLabel.setLabel()
        
        currentBalanceHelpLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceHelpLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 98).isActive = true
        currentBalanceHelpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSecondCardView() {
        view.addSubview(secondCardView)
        secondCardView.setView()
        secondCardView.translatesAutoresizingMaskIntoConstraints = false
        secondCardView.topAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: 15).isActive = true
        secondCardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        secondCardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        secondCardView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        secondCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
    }
    
    func setupSecondCardViewTitleLabel() {
        view.addSubview(secondCardViewTitleLabel)
        secondCardViewTitleLabel.setLabel()
        
        secondCardViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondCardViewTitleLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 16).isActive = true
        secondCardViewTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func setupSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 46).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 16).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -16).isActive = true
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = Colors.white
        segmentedControl.backgroundColor = Colors.lightGray
        
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
    
    func setupDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.setLabel()
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 80).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // MARK: список
    
    func setupThirdCardView() {
        view.addSubview(thirdCardView)
        thirdCardView.setView()
        thirdCardView.translatesAutoresizingMaskIntoConstraints = false
        thirdCardView.topAnchor.constraint(equalTo: secondCardView.bottomAnchor, constant: 15).isActive = true
        thirdCardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        thirdCardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        thirdCardView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        thirdCardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
       // thirdCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupThirdCardViewTitleLabel () {
        view.addSubview(thirdCardViewTitleLabel)
        thirdCardViewTitleLabel.setLabel()
        
        thirdCardViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdCardViewTitleLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 16).isActive = true
        thirdCardViewTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupThirdCardViewDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.setLabel()
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 26).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupThirdCardViewSumLabel() {
        view.addSubview(thirdCardViewSumLabel)
        thirdCardViewSumLabel.setLabel()
        
        thirdCardViewSumLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdCardViewSumLabel.topAnchor.constraint(equalTo: thirdCardView.topAnchor, constant: 48).isActive = true
        thirdCardViewSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        
        setupSecondCardView()
        setupSecondCardViewTitleLabel()
        setupSegmentedControl()
        setupDateLabel()
        // MARK: список
        
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
        setupView()
        createNavigationBar()
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
