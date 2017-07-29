//
//  DataSourceFactory.swift
//  PlaylistApp
//
//  Created by José Inácio Athayde Ferrarini on 28/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow

class DataSourceFactory {

    class func playlistDataSource(with tableView: UITableView, objects: [String]) -> UITableViewDataSource {
        return TableViewArrayDataSource<StringTableViewCell, String>(
            for: tableView,
            objects: objects)
    }
    
}
