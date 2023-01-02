//
//  ViewController.swift
//  UISlider
//
//  Created by Александр Карпов on 02.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBOutlet weak var sliderDuration: UISlider!
    
    var player = AVAudioPlayer()
    var timer = Timer()
//    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.sliderDuration.setValue(Float(player.currentTime), animated: true)
        
        
        // Slider
//        self.slider.frame = CGRect(x: 0, y: 0, width: 300, height: 23)
//        self.slider.center = self.view.center
//        self.slider.minimumValue = 0.0
//        self.slider.maximumValue = 100.0
//        self.view.addSubview(slider)
        
        // Add Target
//        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "audio", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.sliderDuration.maximumValue = Float(player.duration)
            }
        } catch {
            print("ERROR")
        }
        
        print("\(self.sliderDuration.maximumValue)")
        print("\(self.sliderDuration.value)")
        self.sliderDuration.setValue(Float(player.currentTime), animated: true)
        print("\(self.sliderDuration.value)")
//        self.player.play()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSliderDuration), userInfo: nil, repeats: true)
        
        updateSliderDuration()
    }
    
//    @objc func changeSlider(sender: UISlider) {
//        if sender == slider {
//            self.player.currentTime = TimeInterval(sender.value)
//        }
//    }

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

