//
//  StringTableViewCell.swift
//  PlaylistApp
//
//  Created by José Inácio Athayde Ferrarini on 29/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow

class StringTableViewCell: UITableViewCell {

}

extension StringTableViewCell: Configurable {
    
    func setup(with value: String) {
        self.textLabel?.text = value
    }
    
}
