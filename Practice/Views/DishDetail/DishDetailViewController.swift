//
//  DishDetailViewController.swift
//  Practice
//
//  Created by $HahMa on 04/05/25.
//

import UIKit
import ProgressHUD


class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var dishCaloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }
    
    private func populate() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLbl.text = dish.name
        dishCaloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.error("Please enter your name")
            return
        }
        
        ProgressHUD.animate("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case.success(_):
                ProgressHUD.success("Your order has been recieved.🧑🏻‍🍳")
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }

}
