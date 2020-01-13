//
//  FlightRow.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI

struct FlightRow: View {
    var flight :Flight
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("日期："+flight.FlightDate)
                Text("目的地機場："+flight.ArrivalAirportID)
                Text("預定起飛時間："+flight.ScheduleDepartureTime)
            }
            Spacer()
        }
    }
}
