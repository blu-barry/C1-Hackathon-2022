//
//  MainView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 70, alignment: .center)
                    Text("Welcome Summiteers")
                }

                VStack{
                    Image("balance").resizable().scaledToFit().aspectRatio(contentMode:.fit).padding(.horizontal, 30)
                        
                    Image("creditwise").resizable().scaledToFit().aspectRatio(contentMode:.fit).padding(.horizontal, 30)
                }
                
                ZStack{
                    Text("Branch/ATM")
                }.padding(30)
                
                VStack {
                    NavigationLink(destination: MapView()) {
                        Text("Rewards").foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
