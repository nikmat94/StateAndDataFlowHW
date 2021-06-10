//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManger
    @AppStorage("userIsRegister") var userIsRegister = true
    var body: some View {
        Group {
            if loadData() {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
    private func loadData () -> Bool {
        if user.firstTransition {
            userIsRegister = user.isRegister
            return userIsRegister
        }
        return userIsRegister
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManger())
    }
}
