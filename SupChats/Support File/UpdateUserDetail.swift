//
//  UpdateUserDetail.swift
//  SupChats
//
//  Created by QJY on 2019/3/17.
//  Copyright © 2019 QJY. All rights reserved.
//

import Foundation
import LeanCloud
import AVOSCloud

struct UpdateUserDetail {
    //  Update User Nickneme in the server
//    static func UpdateNickname(with NewNickname:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
//        let UpdateObject = LCObject(className: "UserLoginDetail", objectId: CloudObjectID)
//        try UpdateObject.set("Username", value: NewNickname)
//        let _ = UpdateObject.save { (result) in
//            switch result {
//            case .success:
//                completion(result as? String)
//                // handle success
//                break
//            case .failure(error: let error):
//                // handle error
//                print("Update Nickname error    \(error)")
//                break
//            }
//        }
//    }
    
    static func UpdateNicknameWithCQL(with NewNickname:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
        LCCQLClient.execute("update UserLoginDetail set Username='\(NewNickname)' where objectId='\(CloudObjectID)'") { result in
            switch result {
            case .success:
                completion(result as? String)
            break // 更新成功
            case .failure(let error):
                print("Update Nickname error    \(error)")
            }
        }
    }
    
    
    //  Update User Gender in the server
//    static func UpdateGender(with Gender:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
//        let UpdateObject = LCObject(className: "UserLoginDetail", objectId: CloudObjectID)
//        try UpdateObject.set("Gender", value: Gender)
//        let _ = UpdateObject.save { (result) in
//            switch result {
//            case .success:
//                completion(result as? String)
//                // handle success
//                break
//            case .failure(error: let error):
//                // handle error
//                print("Update Gender error    \(error)")
//                break
//            }
//        }
//    }
    
    static func UpdateGenderWithCQL(with Gender:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
        LCCQLClient.execute("update UserLoginDetail set Username='\(Gender)' where objectId='\(CloudObjectID)'") { result in
            switch result {
            case .success:
                completion(result as? String)
            break // 更新成功
            case .failure(let error):
                print("Update Gender error    \(error)")
            }
        }
    }

    
    //  Update User Region in the server
//    static func UpdateRegion(with Region:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
//        let UpdateObject = LCObject(className: "UserLoginDetail", objectId: CloudObjectID)
//        try UpdateObject.set("Region", value: Region)
//        let _ = UpdateObject.save { (result) in
//            switch result {
//            case .success:
//                completion(result as? String)
//                // handle success
//                break
//            case .failure(error: let error):
//                // handle error
//                print("Update Region error    \(error)")
//                break
//            }
//        }
//    }
    static func UpdateRegionWithCQL(with Region:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
        LCCQLClient.execute("update UserLoginDetail set Username='\(Region)' where objectId='\(CloudObjectID)'") { result in
            switch result {
            case .success:
                completion(result as? String)
            break // 更新成功
            case .failure(let error):
                print("Update Region error    \(error)")
            }
        }
    }
    
    //  Update User Signature
    static func UpdateSignatureWithCQL(with Signature:String,CloudObjectID:String,completion: @escaping(String?) -> Void){
        LCCQLClient.execute("update UserLoginDetail set Username='\(Signature)' where objectId='\(CloudObjectID)'") { result in
            switch result {
            case .success:
                completion(result as? String)
            break // 更新成功
            case .failure(let error):
                print("Update Nickname error    \(error)")
            }
        }
    }
    
}
