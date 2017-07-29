//
//  Playlist.swift
//  NetworkingArrow
//
//  Created by Inacio Ferrarini on 02/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import Foundation
import Arrow

struct Playlist {
    var title: String?
    var description: String?
}

extension Playlist : ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        title <-- json["snippet.title"]
        description <-- json["snippet.description"]
    }
    
}
