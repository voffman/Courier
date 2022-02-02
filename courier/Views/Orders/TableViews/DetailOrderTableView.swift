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
    
    weak private var detailOrderTableViewPresenter: DetailOrderTableViewPresenterProtocol!
    
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
    
    @objc func backButtonAction(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.view.backgroundColor = Colors.backgroundColor
        self.tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(sc.segmentedControlContainerView)
        sc.setContainerView()
        
        sc.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.setupContainerConstraints()
        self.view.addSubview(shopSubview.view)

        self.view.addSubview(clientSubview.view)
        self.view.addSubview(stateSubview.view)
        stateSubview.targetView = self.view
        clientSubview.view.isHidden = true
        tableView.isHidden = true
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, navigationBarStyle: .withBackButton)
        navigationBar.setupNavigationBar()
        navigationBar.barButton.action = #selector(backButtonAction)
        
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
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + navigationBar.barHeight + 45).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: navigationBar.barHeight + 45).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        shopSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/6.25, width: self.view.frame.width - 20, height: 255)
        clientSubview.view.frame = CGRect(x: 10, y: self.view.frame.height/6.25, width: self.view.frame.width - 20, height: 234)
       // stateSubview.view.translatesAutoresizingMaskIntoConstraints = false
        stateSubview.view.frame = CGRect(x: 0, y: shopSubview.view.frame.height * 1.75, width: self.view.frame.width, height: self.view.frame.height/2)
        stateSubview.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 70).isActive = true
        
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
