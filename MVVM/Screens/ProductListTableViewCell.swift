//
//  ProductListTableViewCell.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productRateButton: UIButton!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productBuyButton: UIButton!
    
    var product: Product? {
        didSet { // property observer
            productDetailConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 15
        bgView.backgroundColor = .systemGray6
        
        productImageView.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfig() {
        guard let product else { return }
        
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price)"
        productRateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
    }
}
