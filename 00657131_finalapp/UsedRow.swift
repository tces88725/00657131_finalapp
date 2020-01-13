//
//  LoveRow.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI

struct UsedRow: View {
    var Used: usedFlight
    var body: some View {
        VStack{
            Text("起飛日期"+Used.FlightDate)
            Text("班次"+Used.FlightNumber)
            
        }
    }
}
