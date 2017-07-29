//
//  PlaylistResponseToPlaylistArrayTransformerSpec.swift
//  PlaylistApp
//
//  Created by Inacio Ferrarini on 22/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlaylistApp

class PlaylistResponseToPlaylistArrayTransformerSpec: QuickSpec {
    
    override func spec() {
        
        describe("Playlist Array Transformer") {
            
            let transformer = PlaylistResponseToPlaylistArrayTransformer()
            
            it("must parse Playlists data") {
                guard let fixtureData = FixtureHelper().objectFixture(using: "PlaylistApi_All_ResponseFixture") else { fail("null fixture data"); return }
                guard let parsedPlaylistArray = transformer.transform(fixtureData) else { fail("returned nil object"); return }
                expect(parsedPlaylistArray).toNot(beNil())
                
                expect(parsedPlaylistArray.count).to(equal(3))
                
                expect(parsedPlaylistArray[0].title).to(equal("Cats"))
                expect(parsedPlaylistArray[0].description).to(equal("Description for Cats playlist"))
                
                expect(parsedPlaylistArray[1].title).to(equal("Playlist 2"))
                expect(parsedPlaylistArray[1].description).to(equal(""))
                
                expect(parsedPlaylistArray[2].title).to(equal("Playlist 1"))
                expect(parsedPlaylistArray[2].description).to(equal("Description for Playlist 1"))
            }
            
            it("must return nil when uncapable o parse") {
                let nilParsedPlaylistArray = transformer.transform(nil)
                expect(nilParsedPlaylistArray).to(beNil())
            }
            
        }
        
    }
    
}
