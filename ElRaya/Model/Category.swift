//
//  Category.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 31/01/2026.
//


enum Category: String, CaseIterable, Identifiable {
    case handlesKnobs
    case locksSecurity
    case hingesHardware
    case furnitureScrews

    var id: Self { self }

    var title: String {
        switch self {
        case .handlesKnobs:     return "Handles &\nKnobs"
        case .locksSecurity:    return "Locks &\nSecurity"
        case .hingesHardware:   return "Hinges &\nHardware"
        case .furnitureScrews:  return "Furniture &\nScrews"
        }
    }

    var systemImage: String {
        switch self {
        case .handlesKnobs:     return "door.left.hand.open"
        case .locksSecurity:    return "lock"
        case .hingesHardware:   return "wrench.and.screwdriver"
        case .furnitureScrews:  return "screwdriver"
        }
    }
}