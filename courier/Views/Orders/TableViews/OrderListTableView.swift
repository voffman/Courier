//
//  OrderListTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListTableView: MVPController {
    
    let tableView = UITableView()
    let waitViewElement = WaitViewElement()
    
    private var presenter: OrderListTableViewPresenterProtocol?
    
    let sc = CustomSegmentedControl(segments: .two, firstSegmentTitle: "ТЕКУЩИЕ", secondSegmentTitle: "ВЫПОЛНЕННЫЕ")
    
    let countView = UIView()
    let countLabel = CustomLabels(title: "?", textSize: 14, style: .regular, alignment: .center)
    
    var data: [CourierOrderResponseElement] = []
    var dataArchive: [CourierOrderResponseElement] = []
    
    // для передачи значений для смены статуса заказа
    var orderID: Int = 0
    var orderStatus: Int = 0
    
    var cellRowToTimerMapping: [Int: Timer] = [:]
    let dateManager = DateManager()
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()
        tableView.reloadData()
    }
    
    @objc func cancelAlertButtonAction(){
        pass = false
        dismissAlertView()
    }
    
    var senderValue: Int = 0
    var pass: Bool = false
    
    @objc func sendAlertButtonAction(){

        print("статус меняется...")

        presenter?.changeStatus(orderId: String(orderID), status: String(orderStatus), completion: { post in
            // Из-за ошибки ответа может не выполняться здесь код
            print("статус изменен на: ", post.statusName)
            
            if self.orderStatus == 100 {
                let thanksView = ThanksView(statusResponse: post)
                thanksView.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(thanksView, animated: true)
            }
            
            self.presenter?.getOrders()
        })
        dismissAlertView()
            
    }
    
    
    func setupOrderCount(isHidden: Bool){
        self.view.addSubview(countView)
        countView.backgroundColor = Colors.lightGray
        countView.layer.cornerRadius = countView.frame.size.width / 2
        countView.clipsToBounds = true
        
        countView.translatesAutoresizingMaskIntoConstraints = false
        if UIScreen.main.bounds.size.height > 750 {
            countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 98).isActive = true
            countView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 750, UIScreen.main.bounds.size.height > 640 {
            countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 71.5).isActive = true
            countView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -7).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 640{
            countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 74.5).isActive = true
            countView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
            countView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            countView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
        }

        countView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        countView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.view.addSubview(countLabel)
        countLabel.setLabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor).isActive = true
        countView.widthAnchor.constraint(equalToConstant: countView.frame.width + 30).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: countView.frame.height + 30).isActive = true
        
        countView.isHidden = isHidden
        countLabel.isHidden = isHidden
        
    }

    func setupWaitViewElement(){
        self.view.addSubview(waitViewElement)
        waitViewElement.setupView()
        waitViewElement.frame = CGRect(x: 10, y: 0, width: self.view.frame.width - 20, height: 149)
        
        waitViewElement.translatesAutoresizingMaskIntoConstraints = false
        waitViewElement.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        waitViewElement.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        if #available(iOS 11, *) {
            waitViewElement.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 7).isActive = true
            
        } else {
        
        if UIScreen.main.bounds.size.height > 750 {
            waitViewElement.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9).isActive = true
        }
        
        if UIScreen.main.bounds.size.height > 640 {
            waitViewElement.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9).isActive = true
        }
        
            if UIScreen.main.bounds.size.height <= 640 {
                waitViewElement.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/8).isActive = true
            }
        }
    }
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Заказы", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "SOSButton"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = Colors.red
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers 
        let temp = navigationArray.last
        navigationArray.removeAll()
        navigationArray.append(temp!)
        self.navigationController?.viewControllers = navigationArray
    }
    
    @objc func goToDetailTableView(_ notification: NSNotification) {
        
        let userInfo = notification.userInfo
        
        guard let value = userInfo else {
            return
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: value)
            let item = try JSONDecoder().decode(CourierOrderResponseElement.self, from: jsonData)
            
            let detailVC = DetailOrderTableView(courierOrderResponseElement: item)

            self.tabBarController?.selectedIndex = 0
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        catch {
            print(error)
        }
    }
    
    @objc func openProfileView(_ notification: NSNotification) {
        let profileView = ProfileView()
        self.tabBarController?.selectedIndex = 3
        self.navigationController?.pushViewController(profileView, animated: true)
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers

        if navigationArray.count == 2 {
            navigationArray.removeLast()
        }
        
        if navigationArray.count == 1 {
            let orderList = OrderListTableView()
            navigationArray.append(orderList)
            navigationArray.removeFirst()
        }

        self.navigationController?.viewControllers = navigationArray
    }
    
    var row: Int?
    var item: CourierOrderResponseElement?
    
    @objc func updateTableViewIfPush(_ notification: NSNotification) {
        tableView.reloadData()
        
        let userInfo = notification.userInfo
        
        guard let value = userInfo else {
            return
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: value)
            let item = try JSONDecoder().decode(CourierOrderResponseElement.self, from: jsonData)

            // MARK: получить indexPath по индексу совпадающего id в массиве data
            let row = data.firstIndex(where: { $0.id == item.id })
            
            guard let row = row else {
                return
            }
            
            self.row = row
            self.item = item
            let indexPath = IndexPath(row: row, section: 0)
            
            let visibleCell = self.tableView.cellForRow(at: indexPath) as? OrderListCell
            
            visibleCell?.configure(orderId: item.id, orderPrice: item.sumTotal, orderSource: item.companyName, orderFromAddress: item.addressFrom.address, orderToAddress: "\(item.addressTo.street) \(item.addressTo.house)", orderAcceptButtonTitle: item.transitions.title, orderStatusCode: item.status)
            
            visibleCell?.setNeedsLayout()
        }
        
        catch {
            print(error)
        }
        
        print("updateTableViewIfPush")
    }
    

    
    @objc func stopSession() {
        
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = OrderListPresenter(view: self)
        self.presenter = presenter
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.goToDetailTableView(_:)),
                                               name: NSNotification.Name(rawValue: "updateOrderByTap"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTableViewIfPush(_:)),
                                               name: NSNotification.Name(rawValue: "updateOrder"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.openProfileView(_:)),
                                               name: NSNotification.Name(rawValue: "closeSlotByTap"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopSession),
                                               name: NSNotification.Name(rawValue: "stopSession"), object: nil)
        setupTableView()
        setupWaitViewElement()
        view.addSubview(sc.segmentedControlContainerView)
        sc.setContainerView()
        setupOrderCount(isHidden: true)
        countView.isHidden = true
        sc.segmentedControlContainerView.isHidden = true
        self.view.backgroundColor = Colors.backgroundColor
        self.tableView.backgroundColor = Colors.backgroundColor
        
        sc.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.setupContainerConstraints()

        presenter.getOrders()
        presenter.getArchiveOrders()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getOrders()
        presenter?.checkUserActivity()
        print("дата перезагружена")
    }
    
}

extension OrderListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(OrderListCell.self, forCellReuseIdentifier: OrderListCell.identifire)
        tableView.register(OrderListCompletedOrdersCell.self, forCellReuseIdentifier: OrderListCompletedOrdersCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(tableView)
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
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + 40).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 40).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            countView.backgroundColor = Colors.lightGray
            return data.count
        case 1:
              countView.backgroundColor = Colors.orange
            self.countLabel.title = String(dataArchive.count)
            self.countLabel.setLabel()
            return dataArchive.count

        default:
            return 0
        }
    }
    
    private func setupTimer(for cell: OrderListCell, indexPath: IndexPath) {
        let row = indexPath.row
        if cellRowToTimerMapping[row] == nil {
            var dateTimeStatusFinishSeconds: Int = 0
            let post = data[indexPath.row]
            
          dateTimeStatusFinishSeconds = dateManager.converteDateToSeconds(dateString: post.dateTimeStatusFinish, stringDateFormat: "yyyy-MM-dd HH:mm:ssZ")
            
            var numberOfSecondsPassed = Int(dateTimeStatusFinishSeconds)
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { capturedTimer in
                                
                numberOfSecondsPassed -= 1
                
              //  let hours = Int(numberOfSecondsPassed) / 3600
                let minutes = Int(numberOfSecondsPassed) / 60 // % 60
                let seconds = Int(numberOfSecondsPassed) % 60
                
                let visibleCell = self.tableView.cellForRow(at: indexPath) as? OrderListCell

                if numberOfSecondsPassed < 60 {
                    visibleCell?.changeTimerToRed()
                } else {
                    visibleCell?.changeTimerToGray()
                }
                if numberOfSecondsPassed <= 0 {
                    capturedTimer.invalidate()
                    visibleCell?.orderTimerLabel.text = "00:00"
                }
                else {
                   // visibleCell?.orderTimerLabel.text = "--:--"
                    visibleCell?.orderTimerLabel.text = String(format:"%02i:%03i", minutes, seconds)
                }
               // cell.numberOfSecondsPassed = numberOfSecondsPassed
               // cell.orderTimerLabel.text = String(format:"%01i:%02i:%03i", hours, minutes, seconds)

            }
            cellRowToTimerMapping[row] = timer
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            let post = data[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCell.identifire, for: indexPath) as! OrderListCell
            cell.backgroundColor = Colors.backgroundColor
            cell.orderTransitionArrowButton.tag = indexPath.row
            cell.orderTransitionArrowButton.addTarget(self, action: #selector(orderTransitionArrowButtonWasTapped(sender:)), for: .touchUpInside)
            
            cell.orderStateButton.tag = indexPath.row
            
            cell.configure(orderId: post.id, orderPrice: post.sumTotal, orderSource: post.companyName, orderFromAddress: post.addressFrom.address, orderToAddress: "\(post.addressTo.street) \(post.addressTo.house)", orderAcceptButtonTitle: post.transitions.title, orderStatusCode: post.status)
            
            cell.contentView.isUserInteractionEnabled = true
            
            cell.configureStatusState() // В ячейке OrderListCell
            cell.orderStateButton.addTarget(self, action: #selector(stateButtonWasTapped(sender:)), for: .touchUpInside)
            setupTimer(for: cell, indexPath: indexPath)
            return cell
            
        case 1:
            let archivePost = dataArchive[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCompletedOrdersCell.identifire, for: indexPath) as! OrderListCompletedOrdersCell
            cell.backgroundColor = Colors.backgroundColor
            cell.configure(orderId: archivePost.id, orderPrice: archivePost.sumTotal, orderSource: archivePost.companyName, orderFromAddress: archivePost.addressFrom.address, orderToAddress: "\(archivePost.addressTo.street) \(archivePost.addressTo.house)")
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    @objc func orderTransitionArrowButtonWasTapped(sender:UIButton){
        let rowIndex:Int = sender.tag
        print("row index ", rowIndex)
        // MARK: обработать поведение при уведомлении
        
        if row != nil && rowIndex == row {
            
            guard let item = item  else { return }
            
            presenter?.didTap(model: item)
         }
         else {
            presenter?.didTap(model: data[rowIndex])
         }
         
       // presenter?.didTap(model: data[rowIndex])
    }
    
    @objc func stateButtonWasTapped(sender: UIButton) {
        let rowIndex:Int = sender.tag
        
        presenter?.didStatusTap(model: data[rowIndex])
        self.orderID = data[rowIndex].id
        self.orderStatus = data[rowIndex].transitions.status
        print("статус id: ", self.orderStatus)
        print("заказ id: ", self.orderID)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sc.segmentedControl.selectedSegmentIndex{
        case 0:
            return 331 // + 10 компенсировать отступы между ячейками

        case 1:
            return 267
            
        default:
            return 0
        }
        
    }
    
}

protocol OrderListTableViewProtocol: AnyObject, MVPControllerProtocol  {
    //func checkOrders()
    func isHaveOrders(posts: [CourierOrderResponseElement])
    func isHaveArchiveOrders(posts: [CourierOrderResponseElement])
    func goToDetailOrderTableView(courierOrderResponseElement: CourierOrderResponseElement)
    func showStatusAlert(courierOrderResponseElement: CourierOrderResponseElement)
}

extension OrderListTableView: OrderListTableViewProtocol{
    
    func isHaveOrders(posts: [CourierOrderResponseElement]) {
        self.waitViewElement.isHidden = true
        self.waitViewElement.setupView()
        self.data = posts
        self.sc.segmentedControlContainerView.isHidden = false
        self.setupOrderCount(isHidden: false)

        self.tableView.reloadData()
    }
    
    func isHaveArchiveOrders(posts: [CourierOrderResponseElement]){
        if !posts.isEmpty{
            self.dataArchive = posts
            print("Архивных постов - ", posts.count)
            self.countLabel.title = String(posts.count)
            self.countLabel.setLabel()
        }
        else{
            self.countLabel.title = String(posts.count)
            self.countLabel.setLabel()
            print("Архивных постов нет - ", posts.count)
        }
    }
    
    func goToDetailOrderTableView(courierOrderResponseElement: CourierOrderResponseElement) {
        let detailOrderTableView = DetailOrderTableView(courierOrderResponseElement: courierOrderResponseElement)
        detailOrderTableView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailOrderTableView, animated: true)
    }
    
    func showStatusAlert(courierOrderResponseElement: CourierOrderResponseElement) {
        showAlert(name: courierOrderResponseElement.transitions.alertTitle,
                  message: courierOrderResponseElement.transitions.alertDescription,
                  cancelButtonSelector: #selector(cancelAlertButtonAction),
                  sendButtonSelector: #selector(sendAlertButtonAction),
                  cancelButtonTitle: courierOrderResponseElement.transitions.alertNegative,
                  sendButtonTitle: courierOrderResponseElement.transitions.alertPositive)
    }
    
}

