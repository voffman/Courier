//
//  ScheduleWeekTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekTableView: MVPController {
    
    
    let id: Int, dateStart: String, dateEnd: String, isConfirmed: Bool
    
    init(id: Int, dateStart: String, dateEnd: String, isConfirmed: Bool){
        self.id = id
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.isConfirmed = isConfirmed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView()
    private var presenter: ScheduleWeekTableViewPresenterProtocol?
    
    var data: [ScheduleByIDElement] = []
    
    let dateConverter = DateConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ScheduleWeekPresenter(view:  self)
        self.presenter = presenter
        
        self.view.backgroundColor = Colors.backgroundColor
        setupTableView()
        
        checkOrders(id: String(id))

    }
    
    @objc func backButtonAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submitScheduleAction(){
        presenter?.applyStatusById(id: String(id))
    }
}



extension ScheduleWeekTableView: UITableViewDelegate, UITableViewDataSource{
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ScheduleWeekCell.self, forCellReuseIdentifier: ScheduleWeekCell.identifire)
        tableView.register(ScheduleDayOffCell.self, forCellReuseIdentifier: ScheduleDayOffCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
    }
    
    func createNavigationBar(title: String){
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.title = title
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar(title: dateConverter.convert(dateString: dateStart, dateFormat: "dd MMM") + " - " + dateConverter.convert(dateString: dateEnd, dateFormat: "dd MMM"))
        
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

        if post.timeStart == nil && post.timeEnd == nil{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: ScheduleDayOffCell.identifire, for: indexPath) as! ScheduleDayOffCell
            cell2.configure(dayOfWeek: post.dateItem, date: post.dateItem)
           
            if indexPath.row == 6 {
                if isConfirmed{
                    cell2.confirmButtonIsHidden = true
                }
                else{
                    cell2.confirmButtonIsHidden = false
                }

                cell2.submitButton.addTarget(self, action: #selector(submitScheduleAction), for: .touchUpInside)
                return cell2
           
            }
            return cell2
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleWeekCell.identifire, for: indexPath) as! ScheduleWeekCell
            cell.configure(dayOfWeek: post.dateItem, date: post.dateItem, timeStart: post.timeStart, timeEnd: post.timeEnd, sourcePoint: post.point?.name)
            if indexPath.row == 6 {
                if isConfirmed{
                    cell.confirmButtonIsHidden = true
                }
                else{
                    cell.confirmButtonIsHidden = false
                }
                
                cell.submitButton.addTarget(self, action: #selector(submitScheduleAction), for: .touchUpInside)
                return cell
           
            }
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 6 {
            return 168
        }
        return 90
    }    
}

protocol ScheduleWeekTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func checkOrders(id: String)
}

extension ScheduleWeekTableView: ScheduleWeekTableViewProtocol{
    func checkOrders(id: String) {
        presenter?.getScheduleWeek(id: id, completion: { posts in
            if posts.count != 0{
                print("Кол-во постов по айди \(posts.count)")
                self.data = posts
                self.tableView.reloadData()
            }
        })
    }
}
