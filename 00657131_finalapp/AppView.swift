//
//  AppView.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View{
        let Used = usedData()
        return TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("首頁")
                }
            UsedList()
                .tabItem{
                Image(systemName: "music.house")
                Text("詳細介紹")
            }
           
        }.environmentObject(Used)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
