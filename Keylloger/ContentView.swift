//
//  ContentView.swift
//  Keylloger
//
//  Created by Vitor Silva on 11/03/20.
//  Copyright © 2020 Vitor Silva. All rights reserved.
//

import SwiftUI
import Combine
import AppKit

struct ContentView: View {
    @State var buttonText: String = "Record"
    @State var isRecording: Bool = false
    let logger: Logger
    
    init(_ logger: Logger) {
        self.logger = logger
    }
    
    var body: some View {
        VStack{
            Button(action: {
                self.keylogger()
            }) {
                Text(buttonText)
            }
        }
    }
    
    func keylogger() {
        if isRecording {
            buttonText = "Record"
            isRecording = false
            logger.record = false
        } else {
            buttonText = "Recording"
            isRecording = true
            logger.record = true
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Logger())
    }
}
