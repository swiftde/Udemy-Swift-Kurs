//
//  Sortierer.swift
//  SortiererTest
//
//  Created by Udemy on 26.02.15.
//  Copyright (c) 2015 benchr. All rights reserved.
//

import Foundation


public class Sortierer {
    
    // MARK : Bubble Sort
    
    class func bubbleSort(var array: [Int]) -> [Int] {
        for var x = 0; x < array.count; x++ {
            for var y = 0; y < (array.count - 1) - x; y++ {
                if array[y] > array[y + 1] {
                    var temp = array[y]
                    array[y] = array[y + 1]
                    array[y + 1] = temp
                }
            }
        }
        return array
    }
    
    // MARK : Mergesort
    
    class func mergeSort(array: [Int]) -> [Int] {
        
        if array.count <= 1 { return array }
        
        let mitte = (array.count - 1) / 2
        var linkerTeil = Array(array[0...mitte])
        var rechterTeil = Array(array[mitte+1..<array.count])
        
        linkerTeil = mergeSort(linkerTeil)
        rechterTeil = mergeSort(rechterTeil)
        
        func merge(var array1: [Int], var array2: [Int]) -> [Int] {
            var erg = [Int]()
            while array1.count > 0 && array2.count > 0 {
                if array1.first! <= array2.first! {
                    erg.append(array1.first!)
                    array1.removeAtIndex(0)
                }
                else {
                    erg.append(array2.first!)
                    array2.removeAtIndex(0)
                }
            }
            erg += array1
            erg += array2
            
            return erg
        }
        
        return merge(linkerTeil, rechterTeil)
    }
    
    // MARK : Quicksort
    
    func quickSort(array: [Int]) -> [Int] {
        if array.count == 0 { return [Int]() }
        
        let pivot = array.first!
        let kleiner = array.filter { $0 < pivot }
        let gleich = array.filter { $0 == pivot }
        let größer = array.filter { $0 > pivot }
        
        return quickSort(kleiner) + gleich + quickSort(größer)
    }
    
}















