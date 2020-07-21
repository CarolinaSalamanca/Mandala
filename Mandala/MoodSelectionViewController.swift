//
//  ViewController.swift
//  Mandala
//
//  Created by Carolina Salamanca on 7/14/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit
// test comments
class MoodSelectionViewController: UIViewController {
    
    @IBOutlet var addMoodButton: UIButton!
    @IBOutlet var moodSelector: ImageSelector!
    
    var moods: [Mood] = []{
        didSet {
            currentMood = moods.first
            moodSelector.images = moods.map { $0.image }
            moodSelector.highlightColors = moods.map { $0.color }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moods = [Mood.happy, .sad, .angry, .goofy, .crying, .confused, .sleepy, .meh]
        addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2
    }
    
    var currentMood: Mood? {
        didSet {
            guard let currentMood = currentMood else {
                addMoodButton?.setTitle(nil, for: .normal)
                addMoodButton?.backgroundColor = nil
                return
            }
            
            addMoodButton?.setTitle("Im \(currentMood.name)", for: .normal)
            let selectionAnimator = UIViewPropertyAnimator(duration: 0.3,
                                                           dampingRatio: 0.7) {
                                                            self.addMoodButton?.backgroundColor = currentMood.color
            }
            selectionAnimator.startAnimation()
        }
    }
    
    @IBAction private func moodSelectionChanged(_ sender: ImageSelector) {
        let selectedIndex = sender.selectedIndex
        currentMood = moods[selectedIndex]
    }
    
    // Handling the embed segue
    var moodsConfigurable: MoodsConfigurable!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "embedContainerViewController":
            guard let moodsConfigurable = segue.destination as? MoodsConfigurable else {
                preconditionFailure("View controller expected to conform to MoodsConfigurable")
            }
            self.moodsConfigurable = moodsConfigurable
            segue.destination.additionalSafeAreaInsets =  UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // Adding new mood entries (
    @IBAction func addMoodTapped(_ sender: Any) {
        guard let currentMood = currentMood else {
            return
        }
        
        let newMoodEntry = MoodEntry(mood: currentMood, timestamp: Date())
        moodsConfigurable.add(newMoodEntry)
    }
}

