//
//  StandardInfo.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

public struct StandardInfo: Codable {
    /// Whether the API version is deprecated or not.
    /// Configure your software to notify you if this field is ever true so you aren't caught off-guard if this version
    /// is deprecated then eventually killed.
    public let isDeprecated: Bool
    
    /// A superset of the sets in Standard, ordered from least recent release date (enterDate.exact) to newest.
    /// To get a list of Standard sets you MUST filter this array by comparing your local time to each set's enter and
    /// exit date, as the array by itself will contain sets that have already exited Standard as well as sets that have
    /// not yet entered it.
    public let sets: [StandardSet]
    
    /// Cards that have been banned from Standard, ordered from oldest ban to newest. This array may contain bans from
    /// a previous rotation; you should filter them out based on the provided set setCode and that set's exit date from
    /// Standard.
    public let bans: [BannedCard]
}
