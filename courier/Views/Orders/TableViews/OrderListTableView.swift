//
//  OrderListTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListTableView: UIViewController {
    
    let tableView = UITableView()
    
    let sc = CustomSegmentedControl(segments: .two, firstSegmentTitle: "ТЕКУЩИЕ", secondSegmentTitle: "ВЫПОЛНЕННЫЕ")
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()
        tableView.reloadData()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.addSubview(sc.segmentedControlContainerView)
        sc.setContainerView()
        view.backgroundColor = Colors.lightGray
        
        sc.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.setupContainerConstraints()
        
        
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

            return 5
        case 1:

            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        switch sc.segmentedControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCell.identifire, for: indexPath) as! OrderListCell

            cell.orderTransitionArrowButton.button.tag = indexPath.row
            cell.orderTransitionArrowButton.button.addTarget(self, action: #selector(orderTransitionArrowButtonWasTapped(sender:)), for: .touchUpInside)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCompletedOrdersCell.identifire, for: indexPath) as! OrderListCompletedOrdersCell
            
            cell.orderTransitionArrowButton.button.tag = indexPath.row
            cell.orderTransitionArrowButton.button.addTarget(self, action: #selector(orderTransitionArrowButtonWasTapped(sender:)), for: .touchUpInside)

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
      //  dismiss(animated: true, completion: nil)
        self.present(detailOrderTableView, animated: true)

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


