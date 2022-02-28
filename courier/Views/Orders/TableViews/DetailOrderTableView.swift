//
//  AboutOrderTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class DetailOrderTableView: UIViewController {
    
    let tableView = UITableView()
    let numberRows = 5
    
    private var presenter: DetailOrderTableViewPresenterProtocol?
    
    let sc = CustomSegmentedControl(segments: .three, firstSegmentTitle: "ЗАВЕДЕНИЕ", secondSegmentTitle: "КЛИЕНТ", thirdSegmentTitle: "О ЗАКАЗЕ")
    
    let shopSubview = ShopSubview()
    let clientSubview = ClientSubview()
    let stateSubview = StateSubview()
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()
       // tableView.reloadData()

        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            clientSubview.view.isHidden = true
            shopSubview.view.isHidden = false
            stateSubview.view.isHidden = false
            tableView.isHidden = true
            stateSubview.view.frame = CGRect(x: 0,
                                             y: shopSubview.view.frame.height * 1.75,
                                             width: self.view.frame.width,
                                             height: self.view.frame.height/2)

            
        case 1:
            shopSubview.view.isHidden = true
            clientSubview.view.isHidden = false
            stateSubview.view.isHidden = false
            tableView.isHidden = true
            stateSubview.view.frame = CGRect(x: 0,
                                             y: clientSubview.view.frame.height * 1.75,
                                             width: self.view.frame.width,
                                             height: self.view.frame.height/2)
            
        case 2:
            shopSubview.view.isHidden = true
            clientSubview.view.isHidden = true
            stateSubview.view.isHidden = false
            tableView.isHidden = false
            tableView.reloadData()
            
        default:

            break
        }
        
    }
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
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
    
    @objc func backButtonAction(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func stateButtonAction(sender: UIButton){
        print("State button action")
        sender.tag += 1
        
        switch sender.tag{
            
        case 0:
            print("Default state")
        
        case 1:
            stateSubview.setupAcceptedOrderState()
            
        case 2:
            stateSubview.setupArrivedToShopState()
        
        case 3:
            stateSubview.setupGotOrder()
        
        case 4:
            stateSubview.setupArrivedToClient()

            
        case 5:
            stateSubview.stateButton.isEnabled = false
            let thanksView = ThanksView()
            
            thanksView.modalPresentationStyle = .fullScreen
            
            // MARK:
            self.navigationController?.pushViewController(thanksView, animated: true)

            sender.tag = 0

        default:
            sender.tag = 0
        }
   //print("знач \(timerIsHidden)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = DetailOrderPresenter(view:  self)
        self.presenter = presenter
        setupScrollView()
        setupTableView()
        self.view.backgroundColor = Colors.backgroundColor
        self.tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(sc.segmentedControlContainerView)
        sc.setContainerView()
        
        sc.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.setupContainerConstraints()
        
        self.view.addSubview(shopSubview.view)
        self.contentView.addSubview(clientSubview.view)
        
        self.view.addSubview(stateSubview.view)
        stateSubview.targetView = self.view
        clientSubview.view.isHidden = true
        tableView.isHidden = true
        stateSubview.stateButton.addTarget(self, action: #selector(stateButtonAction(sender:)), for: .touchUpInside)
    }
}

extension DetailOrderTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailOrderCell.self, forCellReuseIdentifier: DetailOrderCell.identifire)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        view.addSubview(tableView)
    }
    
    func createNavigationBar(){
        let navigationBarRightItemLabel = CustomLabels(title: "4000 ₸", textSize: 20, style: .light)
        
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        navigationBarRightItemLabel.setLabel()
        navigationItem.title = "№ 356167"
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "BackArrow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationBarRightItemLabel)
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar()
        
        sc.segmentedControlContainerView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            sc.segmentedControlContainerView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        } else {
            sc.segmentedControlContainerView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        }
        sc.segmentedControlContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sc.segmentedControlContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sc.segmentedControlContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + 50).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant:  50).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        shopSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/6.25, width: self.view.frame.width - 20, height: 255)
        clientSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/18.25, width: self.view.frame.width - 20, height: self.view.frame.height)
        
        stateSubview.view.frame = CGRect(x: 0, y: shopSubview.view.frame.height * 1.75, width: self.view.frame.width, height: self.view.frame.height/2)
     
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return numberRows /*checkModel.count */ + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailOrderCell.identifire, for: indexPath) as! DetailOrderCell
        
        cell.configure(orderName: "а", orderCount: "б", orderPrice: "в")
        
        let totalSumIndex = numberRows + 1

        let changeIndex = numberRows + 2
        let paymentIndex = numberRows + 3

        if indexPath.row == totalSumIndex{
            cell.configure(orderName: "Итого", orderCount: "", orderPrice: "4 000" + " тг")
        }
        if indexPath.row == changeIndex{
            cell.configure(orderName: "Сдача с", orderCount: "", orderPrice: "5 000" + " тг")
        }
        if indexPath.row == paymentIndex{
            cell.configure(orderName: "Наличными", orderCount: "", orderPrice: "Неоплачен")
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 29
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

extension DetailOrderTableView: DetailOrderTableViewProtocol{
    
}
