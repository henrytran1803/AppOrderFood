//
//  updateProfile.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 12/04/2024.
//

import SwiftUI
import Firebase

struct updateProfile: View {
     @State private var isSubmit = false
    @ObservedObject var infoU  = InfoUser()
     var body: some View {
         VStack {
             TextField("First Name", text: $infoU.user.firstName)
                 .padding()
                 .background(Color(.white))
                 .cornerRadius(8)
                 .font(.system(size: 14))
                 .multilineTextAlignment(.leading)
                 .overlay{
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(lineWidth: 0.1)
                         .foregroundStyle(.black)
                 }
             TextField("Last Name", text:$infoU.user.lastName)
                 .padding()
                 .background(Color(.white))
                 .cornerRadius(8)
                 .font(.system(size: 14))
                 .multilineTextAlignment(.leading)
                 .overlay{
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(lineWidth: 0.1)
                         .foregroundStyle(.black)
                 }
             TextField("Address", text: $infoU.user.address)
                 .padding()
                 .background(Color(.white))
                 .cornerRadius(8)
                 .font(.system(size: 14))
                 .multilineTextAlignment(.leading)
                 .overlay{
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(lineWidth: 0.1)
                         .foregroundStyle(.black)
                 }
             DatePicker(selection: Binding<Date>(
                get: { self.infoU.user.dateOfBirth.dateValue() },
                set: { self.infoU.user.dateOfBirth = Timestamp(date: $0) }
             ), in: ...Date(), displayedComponents: .date) {
                 Text("Select a date")
             }
             .padding()
             .background(Color(.white))
             .cornerRadius(8)
             .font(.system(size: 14))
             .multilineTextAlignment(.leading)
             .overlay{
                 RoundedRectangle(cornerRadius: 10)
                     .stroke(lineWidth: 0.1)
                     .foregroundStyle(.black)
             }
             ButtonStyleWelcome(icon: "", title: "Cập nhật"){
                 updateUser()
             }.padding()
             
         }
         .padding()
         .onAppear {
             infoU.fetchUser()
         }
     }
    func updateUser() {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let email = currentUser.email
        self.infoU.user.email = email ?? ""
        
        let collectionRef = db.collection("users").document(userId)
        
        do {
            try collectionRef.setData(from: self.infoU.user, merge: true)
            print("User information updated successfully")
        } catch {
            print("Error updating user information: \(error)")
        }
    }

}

#Preview {
    updateProfile()
}
