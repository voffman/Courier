//
//  DetailOrderTableView.swift
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
    let footerTableView = DetailOrderTableViewFooter(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 105))
    
    private var presenter: DetailOrderTableViewPresenterProtocol?
    
    let sc = CustomSegmentedControl(segments: .three, firstSegmentTitle: "ЗАВЕДЕНИЕ", secondSegmentTitle: "КЛИЕНТ", thirdSegmentTitle: "О ЗАКАЗЕ")
    
    let shopSubview = ShopSubview()
    let clientSubview = ClientSubview()
    let stateSubview = StateSubview()
    
    let shadowViewForTableView = CustomViews(style: .withShadow)
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()

        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            scrollView.isScrollEnabled = false
            clientSubview.view.isHidden = true
            shopSubview.view.isHidden = false
            tableView.isHidden = true

            shopSubview.configure(source: dataPosts.companyName, address: dataPosts.addressFrom.address, phoneNumber: dataPosts.addressFrom.phone, latitude: dataPosts.addressFrom.lat, longitude: dataPosts.addressFrom.long)
            shadowViewForTableView.isHidden = true
            
        case 1:
            scrollView.isScrollEnabled = true
            shopSubview.view.isHidden = true
            clientSubview.view.isHidden = false
            tableView.isHidden = true
            
            clientSubview.configure(clientName: dataPosts.customerName, clientPhone: dataPosts.phone, address:
                                                                        "\(dataPosts.addressTo.street) " +
                                                                        "\(dataPosts.addressTo.house) " +
                                                                        "\(dataPosts.addressTo.flat ?? "") " +
                                                                        "\(dataPosts.addressTo.addressMore ?? "") ",
                                                                        comment: dataPosts.comments,
                                                                        latitude: dataPosts.addressTo.lat,
                                                                        longitude: dataPosts.addressTo.long)
            shadowViewForTableView.isHidden = true
            
        case 2:
            scrollView.isScrollEnabled = true
            shopSubview.view.isHidden = true
            clientSubview.view.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
            shadowViewForTableView.isHidden = false
            
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = DetailOrderPresenter(view:  self)
        self.presenter = presenter
        setupScrollView()
        setupTableView()
        scrollView.isScrollEnabled = false
        self.view.backgroundColor = Colors.backgroundColor
        
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
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        tableView.allowsSelection = false
        
        tableView.estimatedRowHeight = 35
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = Colors.backgroundColor.withAlphaComponent(0.00)
        self.contentView.addSubview(tableView)
        footerTableView.addElements()
        footerTableView.createFooterView()
        tableView.tableFooterView = footerTableView
        
        shadowViewForTableView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(shadowViewForTableView)
        shadowViewForTableView.setView()
        
        shadowViewForTableView.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        shadowViewForTableView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        shadowViewForTableView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0).isActive = true
        shadowViewForTableView.bottomAnchor.constraint(equalTo: footerTableView.bottomAnchor, constant: 0).isActive = true
        self.contentView.bringSubviewToFront(tableView)
        shadowViewForTableView.isHidden = true
        tableView.showsVerticalScrollIndicator = false
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
        let navigationBarRightItemLabel = CustomLabels(title: String(dataPosts.sumTotal.formattedWithSeparator) + " ₸", textSize: 20, style: .light)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        navigationBarRightItemLabel.setLabel()
        navigationItem.title = "№ " + String(dataPosts.id)
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

        tableView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: sc.segmentedControlContainerView.frame.height + 15).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        if UIScreen.main.bounds.size.height > 750{
            tableView.bottomAnchor.constraint(equalTo: stateSubview.view.topAnchor, constant: 0).isActive = true
        } else {
            tableView.bottomAnchor.constraint(equalTo: stateSubview.view.topAnchor, constant: 0).isActive = true
        }
        tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        shopSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/6.25, width: self.view.frame.width - 20, height: 255)
        clientSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/18.25, width: self.view.frame.width - 20, height: self.view.frame.height)
        
        stateSubview.view.translatesAutoresizingMaskIntoConstraints = false
        stateSubview.view.heightAnchor.constraint(equalTo: stateSubview.stateButton.heightAnchor).isActive = true
        stateSubview.view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        stateSubview.view.bottomAnchor.constraint(equalTo: stateSubview.stateButton.bottomAnchor, constant: 0).isActive = true
     
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataPosts.orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        
        let post = dataPosts.orderItems[indexPath.row]
        footerTableView.addData(sum: dataPosts.sumTotal, customerAmount: dataPosts.customerAmount ?? "-", paymentType: dataPosts.paymentTypeID)
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailOrderCell.identifire, for: indexPath) as! DetailOrderCell
        
        cell.configure(orderName: post.name + " \(post.orderItemDescription ?? "")", orderCount: String(post.quantity) + " шт", orderPrice: String(post.price.formattedWithSeparator) + " ₸")
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
//                    if indexPath == lastVisibleIndexPath {
//                }
//            }
//        }
    
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


