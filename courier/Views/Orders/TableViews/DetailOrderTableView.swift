//
//  AboutOrderTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class DetailOrderTableView: UIViewController {
    
    let tableView = UITableView()
    
    let sc = CustomSegmentedControl(segments: .three, firstSegmentTitle: "ЗАВЕДЕНИЕ", secondSegmentTitle: "КЛИЕНТ", thirdSegmentTitle: "О ЗАКАЗЕ")
    
    var scValue: Int8 = 0
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        sc.changeSegmentedControlLinePosition()
        // MARK: Вынести потом в презентер
        if scValue == 0 || scValue == 1 {
            scValue += 1
        }
        else{
            scValue -= 1
        }
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

extension DetailOrderTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ShopCell.self, forCellReuseIdentifier: ShopCell.identifire)
        tableView.register(ClientCell.self, forCellReuseIdentifier: ClientCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, navigationBarStyle: .detailOrder)
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
        switch scValue {
        case 0:
            return 1
            
        case 1:
            return 1
            
        case 2:
            return 1
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch scValue {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.identifire, for: indexPath) as! ShopCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ClientCell.identifire, for: indexPath) as! ClientCell
            return cell
        case 2:
            print("Добавить третью ячейку")
            
            return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch scValue{
        case 0:
            return 275 // + 20 компенсировать отступы между ячейками
            
        case 1:
            return 254
            
        default:
            return 0
        }
        
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
