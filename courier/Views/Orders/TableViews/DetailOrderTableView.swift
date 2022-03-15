//
//  AboutOrderTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class DetailOrderTableView: MVPController {
    
    var dataPosts: CourierOrderResponseElement
    
    init(courierOrderResponseElement: CourierOrderResponseElement){
        self.dataPosts = courierOrderResponseElement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView()
    
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
            shopSubview.configure(source: dataPosts.companyName, address: dataPosts.addressFrom.address, phoneNumber: dataPosts.addressFrom.phone, latitude: dataPosts.addressFrom.lat, longitude: dataPosts.addressFrom.long)
            
        case 1:
            shopSubview.view.isHidden = true
            clientSubview.view.isHidden = false
            stateSubview.view.isHidden = false
            tableView.isHidden = true
            stateSubview.view.frame = CGRect(x: 0,
                                             y: clientSubview.view.frame.height * 1.75,
                                             width: self.view.frame.width,
                                             height: self.view.frame.height/2)
            
            clientSubview.configure(clientName: dataPosts.customerName, clientPhone: dataPosts.phone, address:
                                                                        "\(dataPosts.addressTo.street) " +
                                                                        "\(dataPosts.addressTo.house) " +
                                                                        "\(dataPosts.addressTo.flat ?? "") " +
                                                                        "\(dataPosts.addressTo.addressMore ?? "") ",
                                                                        comment: dataPosts.comments,
                                                                        latitude: dataPosts.addressTo.lat,
                                                                        longitude: dataPosts.addressTo.long)
            
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
    
    @objc func cancelAlertButtonAction(){
        print("Отмена")
        dismissAlertView()
    }
    
    
    
    
    // MARK: Прописать здесь действия с api
    @objc func sendAlertButtonAction(){
        // stateSubview.stateButton.tag = api.getStatus
        switch stateSubview.stateButton.tag {
            
        case 0:
            break
        case 1:
            stateSubview.setupArrivedToShopState()
            stateSubview.stateButton.tag += 1
          //  navigationController?.popViewController(animated: true)
        case 2:
            stateSubview.setupGotOrder()
            stateSubview.stateButton.tag += 1
        case 3:
            stateSubview.setupArrivedToClient()
            stateSubview.stateButton.tag += 1
        case 4:
            stateSubview.stateButton.tag = 0
            
        default:
            stateSubview.stateButton.tag = 0
        }
        
        dismissAlertView()
    }
    
    @objc func stateButtonAction(sender: UIButton){

        
        switch sender.tag{
            
        case 0:
            print("Default state")
            stateSubview.setupAcceptedOrderState()
            sender.tag = 1
        
        case 1:
            showAlert(name: "Находитесь в заведении?", message: "За преждевременную смену статуса предусмотрен штраф.", cancelButtonSelector: #selector(cancelAlertButtonAction), sendButtonSelector: #selector(sendAlertButtonAction), cancelButtonTitle: "НЕТ, ЕЩЕ В ПУТИ", sendButtonTitle: "ДА, УЖЕ ЗДЕСЬ")
            
        case 2:
            showAlert(name: "Получили заказ?", message: "За преждевременную смену статуса предусмотрен штраф.", cancelButtonSelector: #selector(cancelAlertButtonAction), sendButtonSelector: #selector(sendAlertButtonAction), cancelButtonTitle: "НЕ ПОЛУЧИЛ", sendButtonTitle: "ДА, ПОЛУЧИЛ")
        
        case 3:
            showAlert(name: "Вы прибыли по адресу клиента?", message: "За преждевременную смену статуса предусмотрен штраф.", cancelButtonSelector: #selector(cancelAlertButtonAction), sendButtonSelector: #selector(sendAlertButtonAction), cancelButtonTitle: "НЕТ, ЕЩЕ В ПУТИ", sendButtonTitle: "ДА, ПРИБЫЛ")
        
        case 4:
            stateSubview.stateButton.isEnabled = false
            let thanksView = ThanksView()
            
            thanksView.modalPresentationStyle = .fullScreen
            
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
        
        shopSubview.configure(source: dataPosts.companyName, address: dataPosts.addressFrom.address, phoneNumber: dataPosts.addressFrom.phone, latitude: dataPosts.addressFrom.lat, longitude: dataPosts.addressFrom.long)
    }
}

extension DetailOrderTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailOrderCell.self, forCellReuseIdentifier: DetailOrderCell.identifire)
        tableView.separatorStyle = .singleLine // MARK: правый отступ
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.allowsSelection = false
        
        tableView.estimatedRowHeight = 35
        tableView.rowHeight = UITableView.automaticDimension
        appendTotalCells()
        view.addSubview(tableView)

    }
    
    func appendTotalCells(){
        dataPosts.orderItems.append(OrderItem(name: "", orderItemDescription: "", quantity: 1, price: 1))
        dataPosts.orderItems.append(OrderItem(name: "", orderItemDescription: "", quantity: 1, price: 1))
        dataPosts.orderItems.append(OrderItem(name: "", orderItemDescription: "", quantity: 1, price: 1))
    }
    
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "BackArrow")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func createNavigationBar(){
        let navigationBarRightItemLabel = CustomLabels(title: String(dataPosts.sumTotal) + " ₸", textSize: 20, style: .light)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        navigationBarRightItemLabel.setLabel()
        navigationItem.title = "№ " + String(dataPosts.id)
        //self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "BackArrow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationBarRightItemLabel)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
        
        if UIScreen.main.bounds.size.height > 750{
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        } else {
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110).isActive = true
        }
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        shopSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/6.25, width: self.view.frame.width - 20, height: 255)
        clientSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/18.25, width: self.view.frame.width - 20, height: self.view.frame.height)
        
        stateSubview.view.frame = CGRect(x: 0, y: shopSubview.view.frame.height * 1.75, width: self.view.frame.width, height: self.view.frame.height/2)
     
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataPosts.orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        
        let post = dataPosts.orderItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailOrderCell.identifire, for: indexPath) as! DetailOrderCell
        
        cell.configure(orderName: post.name + " \(post.orderItemDescription ?? "")", orderCount: String(post.quantity) + " шт", orderPrice: String(post.price) + " ₸")
        
        let totalSumIndex = dataPosts.orderItems.count - 3
        let changeIndex = dataPosts.orderItems.count - 2
        let paymentIndex = dataPosts.orderItems.count - 1
        
        if indexPath.row > dataPosts.orderItems.count - 4 {
        if indexPath.row == totalSumIndex{
            cell.configure(orderName: "Итого", orderCount: "", orderPrice: String(dataPosts.sumTotal) + " ₸")
          //  cell.orderPriceLabel.style = .bold
          //  cell.orderPriceLabel.setLabel()
        }
        if indexPath.row == changeIndex{
            cell.configure(orderName: "Сдача с", orderCount: "", orderPrice: "\(dataPosts.customerAmount ?? "-") ₸")
          //  cell.orderPriceLabel.style = .regular
          //  cell.orderPriceLabel.setLabel()
        }
        if indexPath.row == paymentIndex{
            var paymentType = ""
            var payment = "Неоплачен"
            
            switch dataPosts.paymentTypeID{
                
            case 1:
                paymentType = "Наличными"
            //    cell.orderPriceLabel.style = .timerRed
            //    cell.orderPriceLabel.setLabel()
            case 2:
                paymentType = "POS терминал"
             //   cell.orderPriceLabel.style = .timerRed
             //   cell.orderPriceLabel.setLabel()
            case 3:
                paymentType = "Оплаченный заказ"
                payment = ""
            default:
                paymentType = "Нет данных"
            }
            
            cell.configure(orderName: paymentType, orderCount: "", orderPrice: payment)
        }
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
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
