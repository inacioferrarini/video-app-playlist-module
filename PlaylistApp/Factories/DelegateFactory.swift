//
//  DelegateFactory.swift
//  PlaylistApp
//
//  Created by José Inácio Athayde Ferrarini on 28/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow

class DelegateFactory {

    class func playlistDelegate(dataSource: TableViewArrayDataSource<StringTableViewCell, String>) -> UITableViewDelegate {
        let onSelected: ((String) -> ()) = { (selectedValue) in
            print("Selected value: \(selectedValue)")
        }
        let shouldLoadNextPage: (() -> Bool) = {
            return true
        }
        let loadNextPage: (() -> ()) = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                var array = [String]()
                for i in 0..<10 {
                    array.append("Visible Item No ::\(i)")
                }
                dataSource.objects.append(contentsOf: array)
                dataSource.refresh()
            }
        }
        
        return PageLoaderTableViewDelegate<StringTableViewCell, String>(
            with: dataSource,
            onSelected: onSelected,
            shouldLoadNextPage: shouldLoadNextPage,
            loadNextPage: loadNextPage)
    }

}
