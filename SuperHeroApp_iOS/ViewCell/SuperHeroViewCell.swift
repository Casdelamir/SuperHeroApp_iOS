//
//  TableSuperHeroViewCell.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 9/9/24.
//

import UIKit

class SuperHeroViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    func render(superHero: SuperHero) {
        heroImage.loadFrom(url: superHero.image.url)
        heroName.text = superHero.name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.roundCorners(radius: 8)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
