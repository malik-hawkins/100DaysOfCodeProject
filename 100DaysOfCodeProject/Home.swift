//
//  Home.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/28/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Home: View {
    
    @State var profileClicked: Bool = false
    @State var historyClicked: Bool = false
    @State var settingsClicked: Bool = false
    @State private var rentalDate = Date()
    
    var body: some View {
        GeometryReader { geo in
            VStack(){
                Image("homeScreenPic")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .scaledToFit()
                Button(action: {
                    // This should take user to a calendar to select receive/return dates
                    print("Implement select your dates button")
                }) {
                    Text("Select your dates to fly!")  .font(.system(size: 15, weight:.bold))
                        .frame(minWidth: 0, maxWidth: 250, minHeight: 40)
                        .background(Color.white)
                        .foregroundColor(Color.gray)
                        .cornerRadius(6)
                        .padding(.top, -30)
                }
                Spacer()
                HStack(){
                    Button(action: {
                        print("Implement profile button")
                        self.profileClicked.toggle()
                    }) {
                        VStack(){
                            Image(systemName: "person")
                                .font(.system(size: 50))
                                .foregroundColor(Color.black)
                            Text("Profile")
                            .font(.system(size: 15, weight:.bold))
                            .foregroundColor(Color.black)
                        }.sheet(isPresented: self.$profileClicked){
                            Profile()
                        }
                    }
                    Spacer()
                    Button(action: {
                        print("Implement history button")
                        self.historyClicked.toggle()
                    }) {
                        VStack(){
                            Image(systemName: "arrowshape.turn.up.left")
                            .font(.system(size: 50))
                            .foregroundColor(Color.black)
                            Text("History")
                            .font(.system(size: 15, weight:.bold))
                            .foregroundColor(Color.black)
                        }.sheet(isPresented: self.$historyClicked){
                            History()
                        }
                        
                    }
                    Spacer()
                    Button(action: {
                        print("Implement settings button")
                        self.settingsClicked.toggle()
                    }) {
                        VStack(){
                            Image(systemName: "gear")
                            .font(.system(size: 50))
                            .foregroundColor(Color.black)
                            Text("Settings")
                            .font(.system(size: 15, weight:.bold))
                            .foregroundColor(Color.black)
                        }.sheet(isPresented: self.$settingsClicked){
                            Settings()
                        }
                        
                    }
                }.padding()
                
                Spacer()
                HStack(){
                    Text("Popular Drones")
                    .font(.system(size: 15, weight:.bold))
                    Spacer()
                    Button(action: {
                        print("Implement view all")
                    }) {
                        Text("View All")
                        .font(.system(size: 15, weight:.bold))
                        .foregroundColor(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                    }
                }.padding()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(0..<3) {_ in
                            PopularDronesCard()
                        }
                    }
                }.padding(.horizontal)
                                
                Spacer()
                
            }.background(Color.init(white: 0.95)).edgesIgnoringSafeArea(.bottom)
        }
        
    } // Ending body
    
} // Ending view

func goToWelcomePage(){
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Welcome())
        window.makeKeyAndVisible()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
