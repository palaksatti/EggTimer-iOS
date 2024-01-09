import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimes = ["Soft":3, "Medium":5, "Hard":8]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
       
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if secondsPassed < totalTime {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                //print(Float(secondsPassed) / Float(totalTime))
                

            } else {
                Timer.invalidate()
                titleLable.text = "DONE!"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                            player = try! AVAudioPlayer(contentsOf: url!)
                            player.play()
            }
        }
        
        
    }
}
