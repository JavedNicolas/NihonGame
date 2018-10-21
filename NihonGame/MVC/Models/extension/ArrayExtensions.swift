//
//  ArrayExtension.swift
//  NihonGame
//
//  Created by Nicolas on 28/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation


extension Array where Element == GameData {
    /**
     Return the element with the argument id
     - Parameters:
        - id: the ID to look for
     - returns: return the found element or nil
     */
    func dataAt(id: Int) -> GameData? {
        for element in self {
            if element.id == id {
                return element
            }
        }
        return nil
    }
}

extension Array where Element == [DataComponents] {
    /**
     Return the element with the argument id
     - Parameters:
     - id: the ID to look for
     - returns: return the found element or nil
     */
    func dataAt(name: String) -> DataComponents? {
        for element in self {
            for data in element {
                if data.name == name {
                    return data
                }
            }
        }
        return nil
    }
}

extension Array where Element == Answer {
    /**
     Return the random element
     - Parameters:
        - id: the ID to look for
     - returns: return the found element or nil
     */
    func randomDataFor(id: Int) -> Answer? {
        var answers = [Answer]()
        for element in self {
            if element.gameDataID == id {
                answers.append(element)
            }
        }
        if answers.count == 0 {
            return nil
        }
        let randomAnswersIndex = Int.random(in: answers.startIndex..<answers.endIndex)
        return answers[randomAnswersIndex]

    }
}

extension Array where Element == [String] {
    /**
     Change an Array of Array of string, into an Array of string
     - returns: return Array
     */
    func flatenArray() -> [String]{
        var flattenedArray = [String]()
        for array in self {
            for element in array {
                flattenedArray.append(element)
            }
        }
        return flattenedArray
    }

    /**
     Return the index
     - Parameters:
     - string: name of the element
     - returns: return the found index or nil
     */
    func getIndexFor(string: String) -> Int? {
        for (index, array) in self.enumerated()  {
            for element in array {
                if element == string {
                    return index
                }
            }
        }
        return nil
    }
}

extension Array where Element == Substring {
    /**
     Change an substring into a string
     - returns: return String
     */
    func flatenArray(separator: String) -> String{
        var flattenedArray = ""
        for (index, element) in self.enumerated() {
            flattenedArray += String(element)
            if index != self.count - 1 {
                flattenedArray += "\(separator) "
            }
        }
        return flattenedArray
    }
}



