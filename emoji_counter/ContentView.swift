//
//  ContentView.swift
//  emoji_counter
//
//  Created by Joseph Smith on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    // Simple integer variables for each emoji's count
    @State private var emojiCounters = [
        (emoji: "😀", count: 0),
        (emoji: "😂", count: 0),
        (emoji: "😍", count: 0),
        (emoji: "🥳", count: 0),
        (emoji: "😎", count: 0)
    ]
    
    var body: some View {
        NavigationView {
            List {
                // Using ForEach to iterate through emojiCounters array
                ForEach(0..<emojiCounters.count, id: \.self) { index in
                    HStack {
                        Text(emojiCounters[index].emoji)
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Text("Count: \(emojiCounters[index].count)")
                            .foregroundColor(emojiCounters[index].count >= 0 ? .red : .black)
                        
                        Spacer()
                        
                        // Increment button
                        Button(action: {
                            emojiCounters[index].count += 1
                        }) {
                            Text("+")
                                .font(.title)
                                .frame(width: 40, height: 30)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .buttonStyle(BorderlessButtonStyle()) // Prevents the button from taking over the row tap gesture
                        
                        // Decrement button
                        Button(action: {
                            emojiCounters[index].count -= 1
                        }) {
                            Text("-")
                                .font(.title)
                                .frame(width: 40, height: 30)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .buttonStyle(BorderlessButtonStyle()) // Prevents the button from taking over the row tap gesture
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Emoji Counter")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
