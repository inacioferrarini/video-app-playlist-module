//
//  PlaylistTableViewController.swift
//  PlaylistApp
//
//  Created by Inacio Ferrarini on 23/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow
import SharedModule

class PlaylistTableViewController: BaseTableViewController, AppContextAware {
    
    
    // MARK: - Properties
    
    var appContext: AppContext?
    
    
    // MARK: - TableView setup
    
    override open func createDataSource() -> UITableViewDataSource? {
        guard let tableView = self.tableView else { return nil }
        return DataSourceFactory.playlistDataSource(with: tableView, objects: ["A", "B", "C"])
    }
    
    override open func createDelegate() -> UITableViewDelegate? {
        guard let dataSource = self.dataSource as? TableViewArrayDataSource<StringTableViewCell, String> else { return nil }
        return DelegateFactory.playlistDelegate(dataSource: dataSource)
    }
    
    override open func createRefreshControl() -> UIRefreshControl? {
        return nil
    }

    
}
