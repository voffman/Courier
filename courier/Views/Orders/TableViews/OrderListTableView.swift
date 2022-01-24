//
//  OrderListTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 21.01.2022.
//

import UIKit

class OrderListTableView: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }
}

extension OrderListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderListCell.self, forCellReuseIdentifier: OrderListCell.identifire)
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // не могу инициализировать navigation bar в свойствах класса, т.к. нет view по умолчанию
        let navigationBar = CustomNavigationBars(targetView: self.view, navigationBarStyle: .orderList)
        navigationBar.setupNavigationBar()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: navigationBar.barHeight * 2 - 1).isActive = true // MARK: Поправить
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCell.identifire, for: indexPath) as! OrderListCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 341 // + 20 компенсировать отступы между ячейками
    }
    
}


