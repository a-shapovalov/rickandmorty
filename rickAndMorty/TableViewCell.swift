//
//  TableViewCell.swift
//  rickAndMorty
//
//  Created by Антон Шаповалов on 24.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
  @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelSpeciasGender: UILabel!
    
    @IBOutlet weak var labelLocation: UILabel!
    
    @IBOutlet weak var labelStatus: UILabel!
    
    func initCell(character: Character) {
        labelName.text = character.name
        labelSpeciasGender.text = character.species+", "+character.gender
        
        
        labelStatus.text = character.status
        labelStatus.layer.masksToBounds = true
        labelStatus.layer.cornerRadius = 11
        
        
            if self.labelStatus.text == "Alive"{
                self.labelStatus.layer.backgroundColor = UIColor(red: 0.78, green: 1, blue: 0.725, alpha: 1).cgColor
                self.labelStatus.textColor = UIColor(red: 0.194, green: 0.625, blue: 0.086, alpha: 1)
                self.labelStatus.font = UIFont(name: "SFUIText-Medium", size: 14)
        }
            if  self.labelStatus.text == "Dead"{
                self.labelStatus.layer.backgroundColor = UIColor(red: 1, green: 0.908, blue: 0.879, alpha: 1).cgColor
                self.labelStatus.textColor = UIColor(red: 0.913, green: 0.219, blue: 0, alpha: 1)
                self.labelStatus.font = UIFont(name: "SFUIText-Medium", size: 14)
        }
            if  self.labelStatus.text == "unknown"{
                self.labelStatus.layer.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
                self.labelStatus.textColor = UIColor(red: 0.629, green: 0.629, blue: 0.629, alpha: 1)
                self.labelStatus.font = UIFont(name: "SFUIText-Medium", size: 14)
        }
            DispatchQueue.main.async {
            if let url = URL(string: character.urlToImage) {
                if let data = try? Data(contentsOf:url){
                    self.imageCharacter.image = UIImage(data: data)
                }
        }
        }
        
        imageCharacter.layer.cornerRadius = 40
        imageCharacter.clipsToBounds = true
        
        labelLocation.text = "▼" + character.locationName
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
