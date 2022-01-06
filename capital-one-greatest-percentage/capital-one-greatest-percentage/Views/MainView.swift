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

        ScrollView{
                        
            VStack {
                
            Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 70, alignment: .center)
 
            Text("Welcome Summiteers")
            }
            
            VStack{
                Image("balance").resizable().scaledToFit().aspectRatio(contentMode:.fit).padding(.horizontal, 30)
                    
                Image("creditwise").resizable().scaledToFit().aspectRatio(contentMode:.fit).padding(.horizontal, 30)
            }
            
            ZStack{
                Rectangle().frame(width: 270, height: 50).padding(.horizontal, 30).background(Color(red: 45/255, green: 72/255, blue: 98/255))
                Text("Branch/ATM")
                }
            
            ZStack{
                Rectangle().foregroundColor(Color(red: 0.965, green: 0.965, blue: 0.965)).opacity(0.66).frame(width: 170, height: 50).padding(.horizontal, 30).background(Color(red: 0.965, green: 0.965, blue: 0.965).opacity(0.66)).cornerRadius(15).padding(.trailing, 20)
                
                NavigationLink(destination: MapView()) {
                    Text("Rewards").foregroundColor(.black).font(.title3).fontWeight(.bold).multilineTextAlignment(.leading).padding(.leading, -110)
                
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
