//
//  PlaylistApi.swift
//  NetworkingArrow
//
//  Created by Inacio Ferrarini on 02/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import UIKit
import Glasgow

class PlaylistApi: AppBaseApi {
    
    func all(byUser userId: String,
             usingKey googleApiKey: String,
             success: @escaping (([Playlist]?) -> Void),
             failure: @escaping ((Error) -> Void)) {
        
        let targetUrl = "/youtube/v3/playlists?part=snippet&channelId=:channelId&key=:key"
            .replacingOccurrences(of: ":channelId", with: userId)
            .replacingOccurrences(of: ":key", with: googleApiKey)
        let transformer = PlaylistResponseToPlaylistArrayTransformer()
        super.get(targetUrl,
                  responseTransformer: transformer,
                  success: success,
                  failure: failure,
                  retryAttempts: 30)
    }
    
}
