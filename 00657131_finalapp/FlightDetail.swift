//
//  FlightDetail.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI
struct FlightDetail: View {
    @State private var flights = [Flight]()
    var flight:Flight
    var body: some View {
        List{
            Text("航班："+flight.FlightNumber)
            Text("日期："+flight.FlightDate)
            Text("出發地機場："+flight.DepartureAirportID)
            Text("目的地機場："+flight.ArrivalAirportID)
            Text("預定起飛時間："+flight.ScheduleDepartureTime)
            Text("航廈："+flight.Terminal)
            Text("登機口："+flight.Gate)
            Text("航空公司："+flight.AirlineID)
        }
    }
}
