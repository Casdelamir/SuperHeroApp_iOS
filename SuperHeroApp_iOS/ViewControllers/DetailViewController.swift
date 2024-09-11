//
//  DetailViewController.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 10/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var superHero: SuperHero? = nil
    
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var alignment: UILabel!
    @IBOutlet weak var alterEgos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.roundCorners(radius: 8)

        // Do any additional setup after loading the view.
        if let superHero = superHero {
            self.navigationItem.title = superHero.name
            avatarImageView.loadFrom(url: superHero.image.url)
            
            realNameLabel.text = superHero.biography.fullName
            publisherLabel.text = superHero.biography.publisher
            publisherLabel.roundCorners(radius: 8)
            placeOfBirthLabel.text = superHero.biography.placeOfBirth
            alterEgos.text = superHero.biography.alterEgos
            alignment.text = superHero.biography.alignment.uppercased()
            if (superHero.biography.alignment == "good") {
                alignment.textColor = UIColor.systemGreen
            } else {
                alignment.textColor = UIColor.systemRed
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showAbilities") {
            let viewController = segue.destination as! ViewControllerAbilities
            
            viewController.superHero = superHero
        }
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
