//
//  ContentView.swift
//  CCounter
//
//  Created by Miguel Rodriguez on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    @State var statsPerHour: CGFloat = 0
    @State var statsString: String = "0"
    @State var statsBtn: Bool = false
    @State var hiddenText: String = ""
    
    var body: some View {
        VStack {
            Text("CCounter")
                .font(.system(size: 30))
                .fontWeight(.bold)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
            Text(String(count))
                .font(.system(size: 80))
                .padding(.vertical, 10)
            HStack {
                Button("Count") {
                    count += 1
                    
                    statsString = calcStats(cInt: count)
                }
                Button("Reset") {
                    count = 0
                }
            }
            Button("Show/Hide Stats") {
                if statsBtn {
                    hiddenText = ""
                    
                    statsBtn = false
                } else if !statsBtn {
                    hiddenText = "Stats: Average of \(statsString) coughs per hour."
                    
                    statsBtn = true
                }
            }
            Text(hiddenText)
                .animation(.easeInOut)
                .padding(20)
            // add elements above this
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func calcStats(cInt: Int) -> String {
    let statsPh = CGFloat(cInt) / 7.5
    
    return String(format: "%.2f", statsPh)
}
