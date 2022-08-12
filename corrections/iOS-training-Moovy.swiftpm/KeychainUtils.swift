//
//  File.swift
//  Moovy
//
//  Created by yassine benabbas on 12/08/2022.
//

import KeychainAccess
import Foundation

struct KeychainUtils {
    static func saveUserResponse(userResponse: UserResponse){
        let keychain = Keychain(service: "com.example.moovy-token")
        do {
            let data = try JSONEncoder().encode(userResponse)
            if let jsonString = String(data: data, encoding: .utf8) {
                keychain["userResponse"] = jsonString
            }
        } catch {
            print("Failed to encode JSON")
        }
    }
    
    static func loadUserResponse() -> UserResponse? {
        let keychain = Keychain(service: "com.example.moovy-token")
        guard let data = keychain["userResponse"]?.data(using: .utf8) else {
            return nil
        }
        do {
            let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
            print(decodedData)
            return decodedData
        }
        catch {
            print("Failed to decode JSON")
        }
        return nil
    }
    
    static func removeUserResponse(){
        let keychain = Keychain(service: "com.example.moovy-token")
        keychain["userResponse"] = nil
    }
}
