//
//  ScheduleTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class ScheduleTableView: MVPController {
    
    let tableView = UITableView()
    let waitViewElement = WaitViewElement(titleLabel: "В списке пусто", helpLabel: "Расписание недоступно")
    
    private var presenter: ScheduleTableViewPresenterProtocol?
    
    var data: [ScheduleElement] = []
    
    let refreshControl = UIRefreshControl()
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        presenter?.viewWillAppear(page: "0")
        refreshControl.endRefreshing()
    }
    
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Расписание", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "SOSButton"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = Colors.red
    }
    
    func setupPullToRefresh() {
        tableView.addSubview(refreshControl)
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }


    func setupWaitViewElement(){
        self.tableView.addSubview(waitViewElement)
        waitViewElement.setupView()
        waitViewElement.translatesAutoresizingMaskIntoConstraints = false
        waitViewElement.leftAnchor.constraint(equalTo: self.tableView.leftAnchor, constant: 10).isActive = true
        waitViewElement.rightAnchor.constraint(equalTo: self.tableView.rightAnchor, constant: -10).isActive = true
        waitViewElement.heightAnchor.constraint(equalToConstant: 149).isActive = true
        
        if #available(iOS 11, *) {
            waitViewElement.topAnchor.constraint(equalTo:  tableView.safeAreaLayoutGuide.topAnchor, constant: 7).isActive = true
            
        } else {
        
        if UIScreen.main.bounds.size.height > 750 {
            waitViewElement.topAnchor.constraint(equalTo:  tableView.topAnchor, constant: self.view.frame.height/9).isActive = true
        }
        
        if UIScreen.main.bounds.size.height > 640 {
            waitViewElement.topAnchor.constraint(equalTo:  tableView.topAnchor, constant: self.view.frame.height/9).isActive = true
        }
        
            if UIScreen.main.bounds.size.height <= 640 {
                waitViewElement.topAnchor.constraint(equalTo:  tableView.topAnchor, constant: self.view.frame.height/8).isActive = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = SchedulePresenter(view:  self)
        self.presenter = presenter
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.backgroundColor
        
        setupWaitViewElement()
        setupTableView()
        setupPullToRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear(page: "0")
    }

}

extension ScheduleTableView: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ScheduleCell.self, forCellReuseIdentifier: ScheduleCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCell.identifire, for: indexPath) as! ScheduleCell
        cell.selectionStyle = .none
        cell.backgroundColor = Colors.backgroundColor
        cell.configure(dateStart: post.dateStart, dateEnd: post.dateEnd, accept: post.isConfirmed)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didTap(model: data[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}

protocol ScheduleTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func goToScheduleWeek(scheduleElement: ScheduleElement)
    func checkSchedule(posts: [ScheduleElement])
}

extension ScheduleTableView: ScheduleTableViewProtocol {
    
    func goToScheduleWeek(scheduleElement: ScheduleElement) {
        let scheduleWeekTableView = ScheduleWeekTableView(scheduleElement: scheduleElement)
        scheduleWeekTableView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(scheduleWeekTableView, animated: true)
    }
    
    func checkSchedule(posts: [ScheduleElement]) {
        if !posts.isEmpty{
            print("Кол-во постов \(posts.count)")
            self.waitViewElement.isHidden = true
            self.waitViewElement.setupView()
            self.data = posts
            self.tableView.reloadData()
        }
        else{
            self.data = posts
            self.tableView.reloadData()
        }
    }
}
