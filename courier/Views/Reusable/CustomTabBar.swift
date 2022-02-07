//
//  CustomTabBar.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item1 = OrderListTableView()
        let item2 = HistoryTableView()
        let item3 = ScheduleTableView()
        let item4 = ProfileView()
        let icon1 = UITabBarItem(title: "Заказы", image: UIImage(named: "TabBarItem1"), selectedImage: UIImage(named: ""))
        let icon2 = UITabBarItem(title: "История", image: UIImage(named: "TabBarItem2"), selectedImage: UIImage(named: ""))
        let icon3 = UITabBarItem(title: "Расписание", image: UIImage(named: "TabBarItem3"), selectedImage: UIImage(named: ""))
        let icon4 = UITabBarItem(title: "Профиль", image: UIImage(named: "TabBarItem4"), selectedImage: UIImage(named: ""))
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        
        self.tabBar.tintColor = Colors.orange
        
        let controllers = [item1,item2,item3,item4]
        self.viewControllers = controllers
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
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
