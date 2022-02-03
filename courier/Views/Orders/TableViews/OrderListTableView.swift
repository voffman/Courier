//
//  OrderListTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListTableView: UIViewController {
    
    let tableView = UITableView()
    
    private var presenter: OrderListTableViewPresenterProtocol?
    
    let sc = CustomSegmentedControl(segments: .two, firstSegmentTitle: "ТЕКУЩИЕ", secondSegmentTitle: "ВЫПОЛНЕННЫЕ")
    
    let countView = UIView()
    let countLabel = CustomLabels(title: "3", textSize: 14, style: .regular, alignment: .center)
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()
        tableView.reloadData()
    }
    
    func setupOrderCount(){
        self.view.addSubview(countView)
        countView.backgroundColor = Colors.lightGray
        countView.layer.cornerRadius = 12 // countView.layer.bounds/2
       // countView.clipsToBounds = true
        
        countView.translatesAutoresizingMaskIntoConstraints = false
        if UIScreen.main.bounds.size.height > 750 {
            countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        }
        
        if UIScreen.main.bounds.size.height < 750{
            countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 67).isActive = true
        }

        countView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        countView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        countView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        self.view.addSubview(countLabel)
        countLabel.setLabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor).isActive = true
        countView.widthAnchor.constraint(equalToConstant: countView.frame.width + 30).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: countView.frame.height + 30).isActive = true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = OrderListPresenter(view:  self)
        self.presenter = presenter
        
        setupTableView()
        view.addSubview(sc.segmentedControlContainerView)
        sc.setContainerView()
        self.view.backgroundColor = Colors.backgroundColor
        self.tableView.backgroundColor = Colors.backgroundColor
        
        sc.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.setupContainerConstraints()
        setupOrderCount()
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
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, navigationBarStyle: .withSOSButton)
        navigationBar.setupNavigationBar()
        
        sc.segmentedControlContainerView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            sc.segmentedControlContainerView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + navigationBar.barHeight - 5).isActive = true
        } else {
            sc.segmentedControlContainerView.topAnchor.constraint(equalTo:  view.topAnchor, constant: navigationBar.barHeight).isActive = true
        }
        sc.segmentedControlContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sc.segmentedControlContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sc.segmentedControlContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + navigationBar.barHeight + 35).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: navigationBar.barHeight + 35).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            countView.backgroundColor = Colors.lightGray
            return 5
        case 1:
            //  countLabel.title = "\(3)" // В дальнейшем подставить реальное количество ячеек
              countView.backgroundColor = Colors.orange
            return 3

        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCell.identifire, for: indexPath) as! OrderListCell

            cell.orderTransitionArrowButton.tag = indexPath.row
            cell.orderTransitionArrowButton.addTarget(self, action: #selector(orderTransitionArrowButtonWasTapped(sender:)), for: .touchUpInside)

            cell.orderAcceptButton.addTarget(self, action: #selector(acceptButtonWasTapped(sender:)), for: .touchUpInside)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCompletedOrdersCell.identifire, for: indexPath) as! OrderListCompletedOrdersCell
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
    @objc func orderTransitionArrowButtonWasTapped(sender:UIButton){
        let rowIndex:Int = sender.tag
        print(rowIndex)
        let detailOrderTableView = DetailOrderTableView()
        detailOrderTableView.modalPresentationStyle = .fullScreen
        //dismiss(animated: true, completion: nil)
        self.present(detailOrderTableView, animated: true)

    }
    
    @objc func acceptButtonWasTapped(sender:UIButton){
        if sender.tag == 4{
        let thanksView = ThanksView()
        thanksView.modalPresentationStyle = .fullScreen
        self.present(thanksView, animated: true)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sc.segmentedControl.selectedSegmentIndex{
        case 0:
            return 341 // + 20 компенсировать отступы между ячейками

        case 1:
            return 277
            
        default:
            return 0
        }
        
    }
    
 //   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 //       return true
 //   }
    
}

extension OrderListTableView: OrderListTableViewProtocol{
    
}
