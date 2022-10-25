//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 임영빈 on 2022/10/24.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player : AVAudioPlayer!
    var timer : Timer!
    
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    func initializePlayer(){
        guard let soundAsset : NSDataAsset = NSDataAsset(name:"sound") else {
            print("음원 파일을 가져 올 수 없습니다.")
            return
        }
        do{
            try self.player = AVAudioPlayer(data : soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError{
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription) ")
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    func updateTimeLabelText(time : TimeInterval){
        let minute : Int = Int(time/60)
        let second : Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld",minute ,second,milisecond )
        self.timeLabel.text = timeText
    }
    func makAndFireTimer(){
        //self.timer = Timer.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpPlayPauseButton(_ sender: Any) {
        print("touch up")
    }
    
    @IBAction func slideValueChanged(_ sender: Any) {
        print("Change slider")
    }
    
}

