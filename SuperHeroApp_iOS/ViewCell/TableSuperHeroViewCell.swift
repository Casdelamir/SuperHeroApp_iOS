//
//  TableSuperHeroViewCell.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 9/9/24.
//

import UIKit

class TableSuperHeroViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    func render(superHero: SuperHero) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
