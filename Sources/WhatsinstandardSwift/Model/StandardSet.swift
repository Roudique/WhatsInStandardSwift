//
//  StandardSet.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

/// A Magic: The Gathering set.
public struct StandardSet: Codable {
    /// The human-friendly name of the set, if known.
    public let name: String?
    
    /// Pre-launch development codename given to the set.
    public let codename: String?
    
    /// Wizards of the Coasts's official code for the set.
    public let code: String?
    
    /// A set of URLs to access this set's symbol.
    public let symbol: SetSymbol
    
    /// The date this set enters or entered Standard.
    public let enterDate: EstimatedDate
    
    /// The date this set exits or exited Standard.
    public let exitDate: EstimatedDate
}
