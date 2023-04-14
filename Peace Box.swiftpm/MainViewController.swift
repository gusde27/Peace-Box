//
//  File.swift
//  Peace Box
//
//  Created by I Gede Bagus Wirawan on 19/04/22.
//

import UIKit
import AVFoundation


//mainController class
class MainViewController: UIViewController {
    
    //audio variable
    var audio: AVPlayer!
    var yey: AVPlayer!
    
    //logic variable
    var timeTotal: Int = 5
    var time_loop: Int = 0
    var breath_total: Int = 0
    var timer: Timer!
    var paused:Bool = false
    var running:Bool = false
    
    //labelBox
    var labelBox: UILabel = {
        let label = UILabel()
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 200, height: 200)
        
        label.text = "Peace Box"
        
        return label
    }()
    
    //labelDec
    var labelDec: UILabel = {
        let label = UILabel()
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 500, height: 100)
        
        label.text = "Box Breathing Technique"
        
        return label
    }()
    
    //imgview BOX
    var imgBox: UIImageView = {
        
        let box = UIImageView()
        
        box.frame.origin = CGPoint(x: 0, y: 0)
        box.frame.size = CGSize(width: 300, height: 300)
        box.image = UIImage(named: "BoxWhite")
        box.contentMode = .scaleToFill
        
        return box
    }()
    
    //imgview gif
    var imgGif: UIImageView = {
        
        let gif = UIImageView()
        
        gif.frame.origin = CGPoint(x: 0, y: 0)
        gif.frame.size = CGSize(width: 275, height: 275)
        
        gif.image = UIImage.gifImageWithName("inhale")
        gif.contentMode = .scaleToFill
        
        return gif
    }()
    
    //label Timer
    var labelTimer: UILabel = {
        let label = UILabel()
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 500, height: 100)
        
        label.text = ""
        
        return label
    }()
    
    //label for Title
    var labelTitle: UILabel = {
        let label = UILabel()
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 500, height: 100)
        
        label.text = "Keep Calm"
        
        return label
    }()
    
    //button Start
    var buttonStart: UIButton = {
        let btnStart = UIButton()
        
        btnStart.frame.origin = CGPoint(x: 0, y: 0)
        btnStart.frame.size = CGSize(width: 100, height: 40)
        btnStart.setTitle("Start", for: .normal)
        btnStart.backgroundColor = .systemBlue
        btnStart.layer.cornerRadius = 10
        
        return btnStart
    }()
    
    //button Pause
    var buttonPause: UIButton = {
        let btnPause = UIButton()
        
        btnPause.frame.origin = CGPoint(x: 0, y: 0)
        btnPause.frame.size = CGSize(width: 100, height: 40)
        btnPause.setTitle("Pause", for: .normal)
        btnPause.backgroundColor = .systemOrange
        btnPause.layer.cornerRadius = 10
        
        return btnPause
    }()
    
    //button Reset
    var buttonReset: UIButton = {
        let btnReset = UIButton()
        
        btnReset.frame.origin = CGPoint(x: 0, y: 0)
        btnReset.frame.size = CGSize(width: 100, height: 40)
        btnReset.setTitle("Reset", for: .normal)
        btnReset.backgroundColor = .systemRed
        btnReset.layer.cornerRadius = 10
        
        return btnReset
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        //image for Box
        imgBox.center = view.center
        imgBox.frame.origin.y -= 125
        view.addSubview(imgBox)
        
        //For Label Box
        labelBox.center = view.center
        labelBox.textAlignment = .center
        labelBox.font = labelBox.font.withSize(40)
        labelBox.frame.origin.y -= 350
        view.addSubview(labelBox)
        
        //For Label Dec
        labelDec.center = view.center
        labelDec.textAlignment = .center
        //labelDec.textColor = .blue //color
        labelDec.frame.origin.y -= 310
        view.addSubview(labelDec)
        
        //Gif
        imgGif.center = view.center
        imgGif.frame.origin.y -= 125
        view.addSubview(imgGif)
        
        //For Label Title
        labelTitle.center = view.center
        labelTitle.textAlignment = .center
        labelTitle.frame.origin.y += 130
        labelTitle.font = labelTitle.font.withSize(30)
        view.addSubview(labelTitle)
        
        //For Label Timer
        labelTimer.center = view.center
        labelTimer.textAlignment = .center
        labelTimer.frame.origin.y += 75
        labelTimer.font = labelTimer.font.withSize(60)
        view.addSubview(labelTimer)
        
        //For Button Start
        buttonStart.center = view.center
        buttonStart.frame.origin.y += 200
        buttonStart.frame.origin.x -= 55
        
        view.addSubview(buttonStart)
        //Adding action to button start
        buttonStart.addTarget(self, action: #selector(actionClickMe(_:)), for: .touchUpInside)
        
        //For Button Pause
        buttonPause.center = view.center
        buttonPause.frame.origin.y += 200
        buttonPause.frame.origin.x += 55
        
        view.addSubview(buttonPause)
        //Adding action to button Pause
        buttonPause.addTarget(self, action: #selector(actionPauseMe(_:)), for: .touchUpInside)
        
        //For Button Reset
        buttonReset.center = view.center
        buttonReset.frame.origin.y += 250
        
        view.addSubview(buttonReset)
        //Adding action to button button Reset
        buttonReset.addTarget(self, action: #selector(actionResetMe(_:)), for: .touchUpInside)
        
    }
    
    //function at handle Start
    @objc func actionClickMe(_ sender: UIButton) {
        print("clicked!")
        
        if !running && !paused{
            running = true
            let alert = UIAlertController(title: "Step", message: "Inhale counting to four, Hold your breath for 4 seconds, Slowly exhale throught yout mouth for 4, Then pause for 4 seconds. Repeat until 5 times ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Go", comment: "Default action"), style: .default, handler: { _ in
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.step), userInfo: nil, repeats: true)
                
            }))

            self.present(alert, animated: true, completion: nil)
        }
        else if !running && paused {
            running = true
            paused = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        }
        
    }
    
    //function at handle Pause
    @objc func actionPauseMe(_ sender: UIButton) {
        print("Paused")
        if timer != nil {
            timer.invalidate()
            running = false
            paused = true
        }
    }
    
    //function at handle Reset
    @objc func actionResetMe(_ sender: UIButton) {
        print("Reset")
        
        if timer != nil { //check for
            timer.invalidate()
            timeTotal = 5
            time_loop = 0
            breath_total = 0
            running = false
            paused = false
            
            labelDec.text = "Box Breathing Technique"
            labelTitle.text = "Keep Calm"
            labelTimer.text = ""
        }
    }
    
     
    
    //func for step when start clicked it
    @objc func step() {
        
        //array for title
        let title = ["Inhale", "Hold your breath", "Exhale from your mouth", "Pause"]
        //array for GIF
        let urutanGif = ["inhale", "hold", "exhale", "pause"]
        //array for dec
        let textDec = ["Nice🔥🔥", "4 More Times👏👏", "3 More Times, Great👍👍", "2 More, Go Go Go💥☄️", "Last Guys, You're Cool🎉🎉"]
        
        
        //Logic for countdown timer
        if timeTotal > 0 {
            timeTotal -= 1
        }
        else {
            time_loop += 1
            timeTotal = 4
            
            if time_loop >= 4 {
                
                time_loop = 0
                breath_total += 1
                
                if breath_total >= 5 {
                    
                    //audio
                    print("audio")
                    let congrats = Bundle.main.url(forResource: "Clap Sound", withExtension: "mp3")
                        yey = AVPlayer.init(url: congrats!)
                        yey.play()
                    
                    //alert variable
                    let alert = UIAlertController(title: "Congratulations🎉🎉", message: "You've Done Box Breathing Technique, Stay Health and Calm", preferredStyle: .alert)
                    
                    //alert action for success the challange
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Yay👏👏", comment: "Default action"), style: .default, handler: { _ in
                        
                        //Reset Label Dec, Title, and Timer
                        self.labelDec.text = "Box Breathing Technique"
                        self.labelTitle.text = "Keep Calm"
                        self.labelTimer.text = ""

                    }))
                    
                    //present
                    self.present(alert, animated: true, completion: nil)
                    
                    timer.invalidate()
             
                    //reset to back normal
                    timeTotal = 5
                    time_loop = 0
                    breath_total = 0
                    running = false
                    paused = false
                    
                }
                
            }
            
            //running Gif
            imgGif.image = UIImage.gifImageWithName(urutanGif[time_loop])
            

        }
        
        //audio for coundown
        let url = Bundle.main.url(forResource: "Countdown Sound", withExtension: "mp3")
            audio = AVPlayer.init(url: url!)
            audio.play()
        
        
        //Label Dec, Title, and Timer Gonna Change follow the Logic
        labelDec.text = "\(textDec[breath_total])"
        labelTitle.text = "\(title[time_loop])"
        labelTimer.text = "\(timeTotal)"
        
    }
    
    
    //Check Dark Mode or Light Mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            // Trait collection has already changed
        super.traitCollectionDidChange(previousTraitCollection)
            
            //condition for user whitebox or blackbox border
            if traitCollection.userInterfaceStyle == .dark{
                imgBox.image = UIImage(named:"BoxWhite");
                print("Dark Mode")
            }
            else{
                imgBox.image = UIImage(named:"BoxBlack");
                print("Light Mode")
            }
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
            // Trait collection will change. Use this one so you know what the state is changing to.
    }
    //end Check DarkMode or Light Mode
    
    
}

