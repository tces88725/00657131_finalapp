//
//  UsedDetail.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI

struct UsedDetail: View {
    @EnvironmentObject var Used: usedData
    @State private var scale:CGFloat = 1
    var editIndex: Int
    var body: some View {
        let UsedFlight = Used.usedflight[editIndex]
        return List{
            Image("12")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipped()
                .gesture(MagnificationGesture().onChanged{ value in
                    self.scale=value.magnitude})
            Text("起飛日期"+UsedFlight.FlightDate)
            Text("班次"+UsedFlight.FlightNumber)
            Text("出發地機場"+UsedFlight.DepartureAirportID)
            Text("目的地機場"+UsedFlight.ArrivalAirportID)
            Text("預定起飛時間"+UsedFlight.ScheduleDepartureTime)
        }
    }
}
