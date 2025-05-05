//
//  DishLandscapeCollectionViewCell.swift
//  Practice
//
//  Created by $HahMa on 04/05/25.
//

import UIKit
import Kingfisher

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }

}
