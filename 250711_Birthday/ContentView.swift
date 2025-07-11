//
//  ContentView.swift
//  250711_Birthday
//
//  Created by Ivy Sham on 11/7/2025.
//

import SwiftUI


struct ContentView: View {
    
    @State private var friends: [Friend] = [
        Friend(name: "Elton", birthday: .now), // used as a placeholder
        Friend(name: "Jenny", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                
            }
        }
        .navigationTitle("Birthdays")

    }
}

#Preview {
    ContentView()
}
