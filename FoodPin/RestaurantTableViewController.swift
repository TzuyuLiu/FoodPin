//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 劉子瑜 on 2019/4/28.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        //作業2
        cell.heartImageView.isHidden = restaurantIsVisited[indexPath.row] ? false : true
        
        
        //檢查是否為打勾的欄位
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark:.none
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //建立一個選單作為動作清單
        let optionMenu = UIAlertController(title: nil , message: "What do you want to do?", preferredStyle: .actionSheet )
        
        
        //設定ipad的cell
        if let  popoverController = optionMenu.popoverPresentationController{
            
            if let cell = tableView.cellForRow(at: indexPath){
                
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }

        //加入動作至選單畫面
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //加入打電話的動作
        let callActionHandler = { (action:UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavilable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage,animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call"+"123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)


        let checkActionTitle = restaurantIsVisited[indexPath.row] ? "Undo Checkin" : "Check in"
        
        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default) { (UIAlertAction) in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            
            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
            
            //作業1
            //加入打勾的動作與消打勾的動作
            // cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .checkmark : .none
            
            //作業2
            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
        }
        
        optionMenu.addAction(checkInAction)

        
        
        //呈現選單
        present(optionMenu, animated: true, completion: nil)
        
        //取消列的選擇
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
 

}
