//
//  kinmenList.swift
//  00657131_finalapp
//
//  Created by User19 on 2020/1/13.
//  Copyright © 2020 alice. All rights reserved.
//

import Foundation
import CryptoKit
import SwiftUI

struct kinmenList: View {
    @State private var flights10 = [Flight]()
    func getTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
        dateFormater.locale = Locale(identifier: "en_US")
        dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
        let time = dateFormater.string(from: Date())
        return time
    }

    func fetchData() {
     let appId = "741fef3aad9d4ff89b0c5a006cd7ca0f"
        let appKey = "Ub5sYxa0FAV3L-9C78SG8RCpC9M"
        let xdate = getTimeString()
        let signDate = "x-date: \(xdate)"
        let key = SymmetricKey(data: Data(appKey.utf8))
        let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
        let base64HmacString = Data(hmac).base64EncodedString()
        let authorization = """
        hmac username="\(appId)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
        """
        let url = URL(string: "https://ptx.transportdata.tw/MOTC/v2/Air/FIDS/Airport/Departure/KNH?$top=30&$format=JSON")!
        var request = URLRequest(url: url)
        request.setValue(xdate, forHTTPHeaderField: "x-date")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let data = data, let cResults = try? decoder.decode([Flight].self, from: data) {
              self.flights10.append(contentsOf: cResults)
            }
        }.resume()
    }
    var body: some View {
        NavigationView {
            List(flights10.indices, id: \.self) { (index) in
                NavigationLink(destination: FlightDetail(flight: self.flights10[index])) {
                    FlightRow(flight: self.flights10[index])}
            }.onAppear{
                if self.flights10.count == 0{
                    self.fetchData()
                }
            }
            .navigationBarTitle("金門航空站")
            }
        }
}


struct kinmenList_Previews: PreviewProvider {
    static var previews: some View {
        kinmenList()
    }
}
