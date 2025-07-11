//
//  ContentView.swift
//  Birthdays3
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var newName = ""
    @State private var newBirthday = Date.now
    @State private var friends: [Friend] = [
        Friend(name: "Aziza", birthday: .now),
        Friend(name: "Mahathi", birthday: Date(timeIntervalSince1970: 0))
    ]
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}
        


#Preview {
    ContentView()
}
