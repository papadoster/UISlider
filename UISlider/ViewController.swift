//
//  ViewController.swift
//  UISlider
//
//  Created by Александр Карпов on 02.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player = AVAudioPlayer()
    var timer = Timer()
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var sliderDuration: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sliderDuration.setValue(Float(player.currentTime), animated: true)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "audio", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.sliderDuration.maximumValue = Float(player.duration)
            }
        } catch {
            print("ERROR")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSliderDuration), userInfo: nil, repeats: true)
        updateSliderDuration()
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        self.player.stop()
//        self.player.currentTime = 0.0
    }

    @IBAction func sliderVolumeChanged(_ sender: UISlider) {
        
        self.player.volume = self.sliderVolume.value
    }
    
    @IBAction func sliderDurationChanged(_ sender: UISlider) {
        self.player.currentTime = TimeInterval(self.sliderDuration.value)
    }
    
    @objc func updateSliderDuration() {
        self.sliderDuration.value = Float(self.player.currentTime)
    }
    
}

