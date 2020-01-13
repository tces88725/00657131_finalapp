//
//  ContentView.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var flights = [Flight]()
    @State private var kaishek = false
    @State private var chiayi = false
    @State private var hualien = false
    @State private var kaohsiung = false
    @State private var kinmen = false
    @State private var matsu = false
    @State private var pingtung = false
    @State private var sungshan = false
    @State private var taichung = false
    @State private var taitung = false
    @State private var tainan = false
    @State private var likeApp = false
    
    var body: some View {
        VStack{
                Button(action: {
                    self.kaishek = true
                }){
                    Image("1").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$kaishek){
                    FlightList()
                }
                List{
                Button(action: {
                    self.chiayi = true
                }){
                    Image("2").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$chiayi){
                    chiayiList()
                }
                
                Button(action: {
                    self.hualien = true
                }){
                    Image("3").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$hualien){
                    hualienList()
                }
                
                Button(action: {
                    self.kaohsiung = true
                }){
                    Image("11").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$kaohsiung){
                    kaohsiungList()
                }
                
                Button(action: {
                    self.kinmen = true
                }){
                    Image("10").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$kinmen){
                    kinmenList()
                }
                
                Button(action: {
                    self.matsu = true
                }){
                    Image("4").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$matsu){
                    matsuList()
                }
                
                Button(action: {
                    self.pingtung = true
                }){
                    Image("9").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$pingtung){
                    pingtungList()
                }
                Button(action: {
                    self.sungshan = true
                }){
                    Image("8").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$sungshan){
                    sungshanList()
                }
                
                Button(action: {
                    self.taichung = true
                }){
                    Image("7").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$taichung){
                    taichungList()
                }
                
                Button(action: {
                    self.taitung = true
                }){
                    Image("5").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$taitung){
                    taitungList()
                }
                
                Button(action: {
                    self.tainan = true
                }){
                    Image("6").renderingMode(.original).resizable().frame(width: CGFloat(400), height: CGFloat(230))
                }.sheet(isPresented: self.$tainan){
                    tainanList()
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
