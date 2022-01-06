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
                    Text("Welcome Summiteers").font(.custom("OpenSans-Bold", size: 20))
                }

                VStack{
                    HStack{
                        Spacer()
                    GeometryReader { geometry in
                    Image("balance").resizable().scaledToFit().aspectRatio(contentMode:.fit).frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    }.frame(height: 200)
                        Spacer()
                    }

                    HStack{
                        Spacer()
                    GeometryReader { geometry in
                    Image("creditwise").resizable().scaledToFit().aspectRatio(contentMode:.fit).frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    }.frame(height: 200)
                        Spacer()
                    }
                }.padding(.all)
                
                VStack{
                    Text("Branch/ATM").font(.largeTitle).frame(alignment: .topLeading).padding(20).frame(alignment: .topLeading).font(.custom("OpenSans-Bold", size: 20)).offset(x: -67)
                
                VStack {
                    NavigationLink(destination: MapView()) {
                        Text("Rewards").foregroundColor(Color.black).font(.largeTitle).padding(20).frame(alignment: .topLeading).font(.custom("OpenSans-Bold", size: 20)).offset(x: -90)
                        }
                    }
                }.padding(.all)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
