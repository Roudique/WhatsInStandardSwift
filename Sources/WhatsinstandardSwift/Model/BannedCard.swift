//
//  BannedCard.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

/// A card currently banned from Standard.
public struct BannedCard: Codable {
    /// The official English name of the banned card.
    public let name: String
    
    /// The official English name of the banned card.
    public let imageURL: URL
    
    /// The set the banned card was printed into, specified by its code property.
    public let setCode: String
    
    /// Human-readable description for why the card was banned.
    public let reason: String
    
    /// A URL to the page where Wizards of the Coast officially announced the card would be banned.
    public let announcementURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "cardName"
        case imageURL = "cardImageURL"
        case setCode, reason
        case announcementURL = "announcementUrl"
    }
}
