//
//  CateItem.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 25/04/2024.
//

import SwiftUI
struct CateItem: View {
    @State var isEdit = false
    @Binding var name :String
    @State var change = false
    @State private var originalName: String
    @Binding var category : Categories
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var progress: CGFloat = 0
    init(name: Binding<String>, category: Binding<Categories>) {
        self._name = name
        self._category = category
        self._originalName = State(initialValue: name.wrappedValue) // Lưu giá trị ban đầu của name
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 350, height: 60)
            .foregroundColor(isEdit ? .white : Color("bgproduct"))
            .border(isEdit ? !change ? progress < 15 ? .white : .black : .black : .white)
            .overlay{
                HStack{
                    AsyncImageCustom(url: category.image, framew: 60, corner: 25)
                    
                    TextField("", text: $name)
                        .foregroundColor(isEdit ? .gray : .white)
                        .bold()
                        .disabled(!isEdit)
                    Button(action: {isEdit.toggle()
                        if !isEdit {
                            updateCate()
                        }
                    }, label: {
                        Image(isEdit ? change ? progress < 15 ? "editdone": "editdone.fill" : "editdone" : "edit")
                    })
                }.padding(.horizontal)
            }
        
            .onReceive(timer) { _ in
                withAnimation {
                    if self.progress < 30 {
                        self.progress += 1
                    } else {
                        self.progress = 0
                    }
                }
            }
            .onChange(of: name) { newName in
                if newName != originalName {
                    change = true
                }
            }
    }
    func updateCate(){
        CategoriesMV().updateCategoryName(oldName: originalName, newName: name, value: category)
    }
}


#Preview {
    CateItem(name: .constant("name") ,category: .constant( Categories(detail: "", image: "")))
}
