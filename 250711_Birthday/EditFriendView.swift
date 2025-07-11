//
//  EditFriendView.swift
//  250711_Birthday
//
//  Created by Ivy Sham on 11/7/2025.
//

import SwiftUI

struct EditFriendView: View {
    var friend: Friend
    @State private var newName: String
    @State private var newBirthday: Date
    @Environment(\.dismiss) private var dismiss
    
    init(friend: Friend) {
        self.friend = friend
        _newName = State(initialValue: friend.name)
        _newBirthday = State(initialValue: friend.birthday)
    }
    
    
    
    
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Name", text: $newName)
                    
                    if newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text("Name is required")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                DatePicker("Birthday", selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)
            }
            .disabled(newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .navigationTitle("Edit friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        friend.name = newName
                        friend.birthday = newBirthday
                        dismiss()
                    }
                }
            }


        }
    }
}

#Preview {
    NavigationStack {
        EditFriendView(friend: Friend(name: "Test", birthday: Date.now))
    }
}
