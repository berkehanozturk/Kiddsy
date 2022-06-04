//
//  HomeCell.swift
//  UIComponents
//
//  Created by Berkehan on 16.02.2022.
//

import UIKit

public class HomeCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height * 0.12
        
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(homeItem: HomeModal, selectedLanguageKey: String) {
        containerView.backgroundColor = homeItem.color
        titleLabel.text = homeItem.title.rawValue.addLocalizableString(str: selectedLanguageKey)
        leftImageView.image = UIImage(named: homeItem.imageName)
    }
    
}
