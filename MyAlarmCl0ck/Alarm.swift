//
//  Alarm.swift
//  MyAlarmCl0ck
//
//  Created by Collin Cannavo on 7/27/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation


class Alarm: NSObject, NSCoding {
    
    private let fireTimeFromMidnightKey = "fireTimeFromMidnight"
    private let nameKey = "name"
    private let enabledKey = "enabled"
    private let uuidKey = "UUID"
    
    var fireTimeFromMidnight: TimeInterval
    var name: String
    var enabled: Bool
    let uuid: String
    
    init(fireTimeFromMidnight: TimeInterval, name: String, enabled: Bool, uuid: String){
        self.fireTimeFromMidnight = fireTimeFromMidnight
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: nameKey) as? String,
            let uuid = aDecoder.decodeObject(forKey: uuidKey) as? String else { return nil }
        
        self.fireTimeFromMidnight = TimeInterval(aDecoder.decodeDouble(forKey: fireTimeFromMidnightKey))
        self.name = name
        self.enabled = aDecoder.decodeBool(forKey: enabledKey)
        self.uuid = uuid
    
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(fireTimeFromMidnight, forKey: fireTimeFromMidnightKey)
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(enabled, forKey: enabledKey)
        aCoder.encode(uuid, forKey: uuidKey)
    }
    
    
}
