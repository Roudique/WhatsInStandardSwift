//
//  SetSymbol.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

/// A set of URLs to access this set's symbol.
public struct SetSymbol: Codable {
    /// A URL to a set symbol in common coloring.
    public let common: URL
    
    /// A URL to a set symbol in uncommon coloring.
    public let uncommon: URL
    
    /// A URL to a set symbol in rare coloring.
    public let rare: URL
    
    /// A URL to a set symbol in mythic rare coloring.
    public let mythic: URL
    
    private enum CodingKeys: String, CodingKey {
        case common, uncommon, rare
        case mythic = "mythicRare"
    }
}
