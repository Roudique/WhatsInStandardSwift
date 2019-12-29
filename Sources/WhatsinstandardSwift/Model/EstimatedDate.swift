//
//  EstimatedDate.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

/// Date wraps both a rough date and an optional exact date.
public struct EstimatedDate: Codable {
    /// Date formatter to use during coding/decoding. Format is RFC3339.
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH.mm.ss.SSS"
        return formatter
    }()
    
    /// A day-precise date formatted as RFC3339.
    public let exact: Date?
    
    /// A quarter- or month-precise date.
    public let rough: String
}
