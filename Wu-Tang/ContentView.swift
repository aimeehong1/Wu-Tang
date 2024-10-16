//
//  ContentView.swift
//  Wu-Tang
//
//  Created by Aimee Hong on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var textFieldIsFocused: Bool
    @State private var enteredName = ""
    @State private var wuTangName = ""
    @State private var staticCoderNameIs = ""
    @State private var imageName = "wu-tang"
    private let firstColumn = ["Algorithmic",
                               "Byte",
                               "Cache",
                               "Debug",
                               "Echo",
                               "Function",
                               "Git",
                               "Hex",
                               "Infinite",
                               "Java",
                               "Kernel",
                               "Logic",
                               "Module",
                               "Node",
                               "Object",
                               "Pixel",
                               "Query",
                               "Runtime",
                               "Script",
                               "Token",
                               "Undefined",
                               "Virtual",
                               "Web",
                               "Xcode",
                               "Yota",
                               "Zero"]
    private let secondColumn = ["$tack",
                                "Processor",
                                "Cipher",
                                "Daemon",
                                "EndPoint",
                                "Framework",
                                "Gateway",
                                "Hub",
                                "Interrupt",
                                "Crash",
                                "Loop",
                                "Module",
                                "Nexus",
                                "Optimizer",
                                "Protocol",
                                "Queue",
                                "Router",
                                "Stack",
                                "Thread",
                                "Update",
                                "Variable",
                                "Widget",
                                "Terminal",
                                "Yield",
                                "Zen",
                                "Ace",
                                "Breakpoint",
                                "Root",
                                "Instance",
                                "Access",
                                "Archive",
                                "Control",
                                "Justice"]
    var body: some View {
        VStack {
            Text("Wu-Tang\nCoder Name Generator")
                .font(.title)
                .fontWeight(.black)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .background(.black)
            
            Spacer()
            
            TextField("Enter name here", text: $enteredName)
                .textFieldStyle(.roundedBorder)
                .font(.title2)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .focused($textFieldIsFocused)
                .keyboardType(.asciiCapable)
                .padding()
                .onChange(of: textFieldIsFocused) {
                    if textFieldIsFocused == true {
                        imageName = ""
                        enteredName = ""
                        wuTangName = ""
                        staticCoderNameIs = ""
                    }
                }
            
            Button {
                staticCoderNameIs = "Your Wu-Tang coder name is: "
                wuTangName = getWuTangName(name: enteredName)
                textFieldIsFocused = false
                imageName = "wu-tang"
            } label: {
                Image("wu-tang-button")
                Text("Get It!")
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .foregroundStyle(.yellow)
            .font(.title2)
            .fontWeight(.bold)
            .disabled(enteredName.isEmpty)
            
            VStack {
                Text(staticCoderNameIs)
                Text(wuTangName)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            }
            .font(.largeTitle)
            .frame(height: 130)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
    }
    
    func getWuTangName(name: String) -> String {
        var localName = name
        let firstLetter = localName.removeFirst()
        if firstLetter.uppercased() == "A" {
            return "\(firstColumn.last!) \(secondColumn.randomElement()!)"
        }
        for i in 1...(firstColumn.count - 1) {
            if firstColumn[i].hasPrefix(firstLetter.uppercased()) {
                return "\(firstColumn[i - 1]) \(secondColumn.randomElement()!)"
            }
        }
        // should not reach here
        return ""
    }
}

#Preview {
    ContentView()
}
