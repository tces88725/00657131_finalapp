//
//  LoveList.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import SwiftUI

struct UsedList: View {
    @EnvironmentObject var Used: usedData
    @State private var showEdit = false
    var body: some View {
        NavigationView {
            List {
                ForEach(Used.usedflight.indices, id:\.self) { (index) in
                    NavigationLink(destination: UsedDetail(editIndex: index)) {
                        UsedRow(Used: self.Used.usedflight[index])
                    }
                }.onDelete { (indexSet) in
                    self.Used.usedflight.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("我的收藏")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEdit = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEdit) {
                    NavigationView {
                        Editor().environmentObject(self.Used)
                    }
                   
            }
        }
    }
}

struct UsedList_Previews: PreviewProvider {
    static var previews: some View {
        UsedList().environmentObject(usedData())
    }
}
