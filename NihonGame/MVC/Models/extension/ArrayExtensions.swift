//
//  ArrayExtension.swift
//  NihonGame
//
//  Created by Nicolas on 28/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation


extension Array where Element == GameData {
    func dataAt(id: Int) -> GameData? {
        for element in self {
            if element.id == id {
                return element
            }
        }
        return nil
    }
}

extension Array where Element == Answer {
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
    func flatenArray() -> [String]{
        var flattenedArray = [String]()
        for array in self {
            for element in array {
                flattenedArray.append(element)
            }
        }
        return flattenedArray
    }

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

