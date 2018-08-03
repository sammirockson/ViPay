//
//  DeviceUtils.swift
//  cryptowallet
//
//  Created by andy on 2018/7/17.
//  Copyright © 2018年 Cybermiles. All rights reserved.
//

import UIKit

struct DeviceUtils {
    
    
    
    static let shareInstance = DeviceUtils()
    
    
    func getUserAgent() -> String {
        let ua =  "app_version:\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? ""),os:\(UIDevice.current.systemName),device:\(UIDevice.current.model),os_version:\(UIDevice.current.systemVersion),Accept-Language:\(Bundle.main.preferredLocalizations.first ?? ""),device:\(UserDefaults.standard.string(forKey: "deviceToken") ?? "")"
        
        return ua
    }
    
}
