//
//  updateProfile.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 12/04/2024.
//

import SwiftUI
import Firebase

struct updateProfile: View {
    @State private var user = User(firstName: "", lastName: "", email: "", address: "", dateOfBirth: Timestamp(date: Date()))
     @State private var isSubmit = false

     var body: some View {
         VStack {
             TextField("First Name", text: $user.firstName)
             TextField("Last Name", text: $user.lastName)
             TextField("Address", text: $user.address)
             DatePicker(selection: Binding<Date>(
                 get: { self.user.dateOfBirth.dateValue() },
                 set: { self.user.dateOfBirth = Timestamp(date: $0) }
             ), in: ...Date(), displayedComponents: .date) {
                 Text("Select a date")
             }
           
             Button(action: {
                 addUser()
     
                 
             }) {
                 Text("Submit")
             }
         }
         .padding()
     }
    func addUser() {
        
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let email = currentUser.email
        self.user.email = email ?? ""
      let collectionRef = db.collection("users").document(userId)
        do {
            let newDocReference = try collectionRef.setData(from: self.user)
            print("Book stored with new document reference: \(newDocReference)")
          }
          catch {
            print(error)
          }
      
    }
}

#Preview {
    updateProfile()
}
