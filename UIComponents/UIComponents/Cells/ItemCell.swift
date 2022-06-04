//
//  ItemCell.swift
//  UIComponents
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit
import Service
import Kingfisher
public class ItemCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height * 0.12
        leftImageView.layer.cornerRadius = leftImageView.frame.height * 0.12
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(item: ItemModal) {
        
        descriptionLabel.text = item.description
        containerView.backgroundColor = .paleWhite
        durationLabel.text = "Duration: \(item.duration)"
        leftImageView.setImage(with: item.imageUrl)
    }
}
