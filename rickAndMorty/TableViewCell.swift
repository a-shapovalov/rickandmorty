//
//  TableViewCell.swift
//  rickAndMorty
//
//  Created by Антон Шаповалов on 24.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var lableName: UILabel!
    @IBOutlet weak var labelSpeciasGender: UILabel!
    @IBOutlet weak var lableLocation: UILabel!
    @IBOutlet weak var battonStatus: UIButton!
    
    
    func initCell(chacter: Character) {
        lableName.text = chacter.name
        labelSpeciasGender.text = chacter.species+", "+chacter.gender
        battonStatus.setTitle(chacter.status, for: .normal)
        imageCharacter.image = UIImage(data: try! Data(contentsOf: URL(string: chacter.urlToImage)!))
        
        if chacter.status == "Dead"{
            battonStatus.setTitleColor(.red, for: .normal)
        }
        if chacter.status == "anknown"{
            battonStatus.setTitleColor(.darkGray, for: .normal)
        }
        if chacter.status == "Alive"{
            battonStatus.setTitleColor(.green, for: .normal)
        }
        
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
