//
//  ViewController.swift
//  TableView
//
//  Created by Lalaiya Sahil on 16/01/23.
//

import UIKit

struct FoodItem{
    var id: Int
    var name: String
    var price: Double
    var quantity: Int = 0
    
}

struct Mobile{
    var id: Int
    var name: String
    var price: Double
    var color: String
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrFoodItem: [FoodItem] = []
    var arrMobile: [Mobile] = []
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup(){
        configureTableVie()
        loadFoodItems()
        loadMobile()
        
    }
    
    private func configureTableVie(){
        tableView.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodItemTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func loadFoodItems(){
        let pizza: FoodItem = FoodItem(id: 1, name: "Pizza", price: 1234)
        let burger: FoodItem = FoodItem(id: 2, name: "Burgew", price: 234)
        let dosha: FoodItem = FoodItem(id: 3, name: "Dosha", price: 124)
        let dabeli: FoodItem = FoodItem(id: 4, name: "Dabeli", price: 4534)
        let vadapav: FoodItem = FoodItem(id: 5, name: "Vadapav", price: 634)
        let sendwich: FoodItem = FoodItem(id: 6, name: "PSendwichizza", price: 1434)
        let feanky: FoodItem = FoodItem(id: 7, name: "Feanky", price: 128)
        let alupuri: FoodItem = FoodItem(id: 8, name: "Alupuri", price: 174)
        let masalapav: FoodItem = FoodItem(id: 9, name: "Masalapav", price: 934)
        let manchyuriyn: FoodItem = FoodItem(id: 10, name: "Manchyuriyn", price: 434)
        let samosa: FoodItem = FoodItem(id: 11, name: "Samosa", price: 156)
        let bheal: FoodItem = FoodItem(id: 12, name: "Bheal", price: 190)
        
        arrFoodItem = [pizza,burger,dosha,dabeli,vadapav,sendwich,feanky,alupuri,masalapav,manchyuriyn,samosa,bheal]
    }
    
    private func loadMobile() {
        let vivo: Mobile = Mobile(id: 1, name: "Vivo", price: 5373, color: "white")
        let opoo: Mobile = Mobile(id: 2, name: "Opoo", price: 6789, color: "Yellow")
        let mi: Mobile = Mobile(id: 3, name: "Mi", price: 4566, color: "Blue")
        let redmi: Mobile = Mobile(id: 4, name: "Redmi", price: 687889, color: "Black")
        arrMobile = [vivo,opoo,mi,redmi]
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFoodItem.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0{
            let cell: FoodItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableViewCell") as! FoodItemTableViewCell
            let foodItem: FoodItem = arrFoodItem[indexPath.row]
            cell.nameLable.text = foodItem.name
            cell.priceLable.text = "$\(foodItem.price)"
            cell.quantityLable.text = String(foodItem.quantity)
            cell.plusButton.tag = indexPath.row
            cell.minusButton.tag = indexPath.row
            cell.plusButton.addTarget(self, action: #selector(plusButtonClicked(_:)), for: .touchUpInside)
            cell.minusButton.addTarget(self, action: #selector(minusButtonClicked(_:)), for: .touchUpInside)
            return cell
//        }
//        else{
//            let cell: UITableViewCell = UITableViewCell()
//            cell.textLabel?.numberOfLines = 0
//            cell.textLabel?.text = "gggvvvvfty"
//            return cell
//        }
    }
    
    @objc
    func plusButtonClicked(_ addButton: UIButton){
        print("Plus Button Click")
        arrFoodItem[addButton.tag].quantity = arrFoodItem[addButton.tag].quantity + 1
        tableView.reloadData()
    }
    @objc
    func minusButtonClicked(_ sender: UIButton){
        print("Minus Button Click")
        if arrFoodItem[sender.tag].quantity > 0{
            arrFoodItem[sender.tag].quantity = arrFoodItem[sender.tag].quantity - 1
            tableView.reloadData()
        }
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "Food Items Header" : "Mobile Items Header"
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return section == 0 ? "Food Items Header" : "Mobile Items Header"
//    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

