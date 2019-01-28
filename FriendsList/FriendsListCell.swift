//
//  FriendsListCell.swift
//  FriendsList
//
//  Created by Nuri Chun on 1/28/19.
//  Copyright © 2019 tetra. All rights reserved.
//

import Foundation
import UIKit

class FriendsListCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .blue
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topPad: 2, leftPad: 2, bottomPad: 2, rightPad: 0, width: 0, height: 0)
    }
}
