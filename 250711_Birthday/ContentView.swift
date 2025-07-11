//
//  ContentView.swift
//  250711_Birthday
//
//  Created by Ivy Sham on 11/7/2025.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Query private var friends: [Friend] = []
    // reads data + tells swiftUI about any changes to the model so that view can update
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    // must give a value + must initialise
    
    var body: some View {
        NavigationStack {
            List(friends) {friend in
                // no longer need id: \.name bc model saves data --> also allows ppl with same name to be added
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
//                        friends.append(newFriend)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    
                    
                }
                .padding()
                
            }
            
            // allows popup from bottom

        }

    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
