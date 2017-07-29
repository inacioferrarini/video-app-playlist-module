//
//  PlaylistResponseToPlaylistArrayTransformer.swift
//  PlaylistApp
//
//  Created by Inacio Ferrarini on 22/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow

class PlaylistResponseToPlaylistArrayTransformer: Transformer {
    
    func transform(_ input: AnyObject?) -> [Playlist]? {
        return ArrowArrayTransformer<Playlist>().transform(input, keyPath: "items")
    }
    
}
