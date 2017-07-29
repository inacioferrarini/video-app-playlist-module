//
//  PlaylistApiSpec.swift
//  PlaylistApp
//
//  Created by Inacio Ferrarini on 22/07/17.
//  Copyright © 2017 br.com.inacio. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs
@testable import PlaylistApp

class PlaylistApiSpec: QuickSpec {
    
    override func spec() {
        
        describe("Playlist Api Request") {
            
            it("if request succeeds, must return valid object") {
                
                stub(condition: isHost("www.googleapis.com")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    let error = OHHTTPStubsResponse(error:notConnectedError)
                    guard let fixtureFile = OHPathForFile("PlaylistApi_All_ResponseFixture.json", type(of: self)) else { return error }
                    
                    return OHHTTPStubsResponse(
                        fileAtPath: fixtureFile,
                        statusCode: 200,
                        headers: ["Content-Type" : "application/json"]
                    )
                }
                
                
                var returnedPlaylists: [Playlist]?
                let api = PlaylistApi("https://www.googleapis.com")
                
                waitUntil { done in
                    api.all(byUser: "UCE_M8A5yxnLfW0KghEeajjw",
                            usingKey: "AIzaSyBSfmKD0lbX_QqdTCqu_wbzgBiTWdjgsxU",
                            success: { (playlist) in
                        returnedPlaylists = playlist
                        done()
                    }, failure: { (error) in
                        fail("Mocked response returned error")
                        done()
                    })
                }
                
                expect(returnedPlaylists?.count).to(equal(3))
                
                expect(returnedPlaylists?[0].title).to(equal("Cats"))
                expect(returnedPlaylists?[0].description).to(equal("Description for Cats playlist"))
                
                expect(returnedPlaylists?[1].title).to(equal("Playlist 2"))
                expect(returnedPlaylists?[1].description).to(equal(""))
                
                expect(returnedPlaylists?[2].title).to(equal("Playlist 1"))
                expect(returnedPlaylists?[2].description).to(equal("Description for Playlist 1"))
            }
            
            it("if request fails, must execute failure block") {
                
                stub(condition: isHost("www.googleapis.com")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    return OHHTTPStubsResponse(error: notConnectedError)
                }
                
                var returnedPlaylists: [Playlist]?
                
                let api = PlaylistApi("https://www.googleapis.com")
                waitUntil { done in
                    api.all(byUser: "UCE_M8A5yxnLfW0KghEeajjw",
                            usingKey: "AIzaSyBSfmKD0lbX_QqdTCqu_wbzgBiTWdjgsxU",
                            success: { (playlist) in
                        fail("Mocked response returned success")
                        returnedPlaylists = playlist
                        done()
                    }, failure: { (error) in
                        done()
                    })
                }
                
                expect(returnedPlaylists).to(beNil())
            }
            
        }
        
    }
    
}
