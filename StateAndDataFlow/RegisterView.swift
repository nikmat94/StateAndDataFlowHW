//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManger
    @State private var colorTextCount = Color.red
    @State private var isDisabled = true
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name, perform: { value in
                        changeColor()
                    })
                    .offset(x: 10.0, y: 0)
                Text("\(name.count)")
                    .offset(x: -40, y: 0)
                    .foregroundColor(colorTextCount)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(isDisabled)
                
            }
        }
    }
    private func registerUser() {
        if !name.isEmpty, !isDisabled {
            user.name = name
            user.firstTransition = true
            user.isRegister.toggle()
        }
    }
    private func changeColor() {
        if name.count >= 3 {
            colorTextCount = .green
            isDisabled = false
        }
        else
        {
            colorTextCount = .red
            isDisabled = true
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
