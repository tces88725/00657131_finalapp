//
//  Data.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Flight: Decodable {
    
    var FlightDate:String
    var ScheduleDepartureTime:String
    var FlightNumber: String
    var AirlineID: String
    var DepartureAirportID :String
    var ArrivalAirportID:String
    var Terminal :String
    var Gate:String
}
struct CResults: Identifiable, Decodable {
    var id = UUID()
    var resultCount: Int
    var results: [Flight]
}
struct usedFlight: Decodable {
    
    var FlightDate:String
    var ScheduleDepartureTime:String
    var FlightNumber: String
    var DepartureAirportID :String
    var ArrivalAirportID:String
    var isUsed: Bool
}



