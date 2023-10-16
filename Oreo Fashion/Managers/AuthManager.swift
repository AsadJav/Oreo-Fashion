//
//  AuthManager.swift
//  Oreo Fashion
//
//  Created by AALA mac on 12/10/2023.
//

import Foundation

final class AuthManager{
    static let shared = AuthManager()
    
    private init(){
        
    }
    
    var isSignedIn: Bool{
        return true
    }
}
