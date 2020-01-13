//
//  Editor.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//
import SwiftUI
struct Editor: View {
    @EnvironmentObject var UsedData: usedData
    var editIndex: Int?
    @State private var selectedIndex = 0
    @State private var showphoto = false
    @Environment(\.presentationMode) var presentationMode
    @State private var FlightDate = ""
    @State private var ScheduleDepartureTime = ""
    @State private var FlightNumber = ""
    @State private var AirlineID = ""
    @State private var DepartureAirportID = ""
    @State private var ArrivalAirportID = ""
    @State private var Terminal = ""
    @State private var Gate = ""
    @State private var trueHeart = true
    var roles = ["桃園中正","嘉義","花蓮","高雄","金門","馬祖","屏東","松山","台中","台東","台南"]
    var body: some View {
        Form {
            TextField("班次", text: $FlightNumber)
            Picker(selection: $selectedIndex, label: Text("選擇機場")){
                ForEach(0..<roles.count) { (index) in
                Text(self.roles[index])
                }
            }.pickerStyle(WheelPickerStyle())
            TextField("起飛日期", text: $FlightDate)
            TextField("出發地機場", text: $DepartureAirportID)
            TextField("目的地機場", text: $ArrivalAirportID)
            Toggle("Used", isOn: $trueHeart)
        }
        .navigationBarTitle(editIndex == nil ? "Add new flight" : "Edit flight")
        .navigationBarItems(trailing: Button("Save") {
            let myUsed = usedFlight(FlightDate:self.FlightDate,ScheduleDepartureTime:self.ScheduleDepartureTime,FlightNumber:self.FlightNumber,DepartureAirportID:self.DepartureAirportID,ArrivalAirportID:self.ArrivalAirportID,isUsed :self.trueHeart)
            if let editIndex = self.editIndex {
                self.UsedData.usedflight[editIndex] = myUsed
            } else {
                self.UsedData.usedflight.insert(myUsed, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editIndex = self.editIndex {
                    let editUsed = self.UsedData.usedflight[editIndex]
                    self.FlightDate = editUsed.FlightDate
                    self.ScheduleDepartureTime = editUsed.ScheduleDepartureTime
                    self.FlightNumber = editUsed.FlightNumber
                    self.DepartureAirportID = editUsed.DepartureAirportID
                    self.ArrivalAirportID = editUsed.ArrivalAirportID
                    self.trueHeart = editUsed.isUsed
                }
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        Editor()
    }
}
