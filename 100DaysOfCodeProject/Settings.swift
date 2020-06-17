//
//  Settings.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 6/17/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct Settings: View {
    var body: some View {
        
        Button(action: {
            self.signOut()
        }) {
            Text("Sign Out")
            .font(.system(size: 15, weight:.bold))
            .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 50)
            .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
            .foregroundColor(Color.white)
            .cornerRadius(6)
        }.padding(.horizontal)
        
    } // Ending body
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("user signed out successfully")
            goToWelcomePage()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
} // Ending view

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
