//
//  TableItem.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 14.10.2021.
//

import UIKit

class SettingsItemCellView: UITableViewCell {
    static var identifier: String {
        return "SettingsItemCellView"
    }
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarhy()
    }
    
    func setupHierarhy() {
        contentView.addSubview(title)
        contentView.addSubview(iconContainer)
        contentView.addSubview(iconView)
        contentView.clipsToBounds =  true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let iconContainerSize: CGFloat = contentView.frame.size.height - 14
        iconContainer.frame = CGRect(x: 15, y: 7, width: iconContainerSize, height: iconContainerSize)
        
        let iconSize = iconContainerSize / 1.5
        iconView.frame = CGRect(x: (iconContainerSize - iconSize) / 2, y: 0, width: iconSize, height: iconSize)
        iconView.center = iconContainer.center
        
        title.frame = CGRect(x: iconContainerSize + 30,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconView.image = nil
        title.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with item: TableItemSimple) {
        title.text = item.title
        iconView.image = item.icon
        
        iconContainer.backgroundColor = item.iconBg
    }
}
