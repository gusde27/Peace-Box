//
//  File.swift
//  Peace Box
//
//  Created by I Gede Bagus Wirawan on 24/04/22.
//

import UIKit

class StoryViewController: UIViewController {
    
    //label for wellcome
    var labelWellcome: UILabel = {
        let label = UILabel()
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 500, height: 100)
        
        label.text = "Welcome to"
        
        return label
    }()
    
    //imgview Icon
    var imgIcon: UIImageView = {
        
        let icon = UIImageView()
        
        icon.frame.origin = CGPoint(x: 0, y: 0)
        icon.frame.size = CGSize(width: 150, height: 150)
        icon.image = UIImage(named: "icon")
        icon.contentMode = .scaleToFill
        
        return icon
    }()
    
    //label for story 1
    var labelStory1: UILabel = {
        let label = UILabel(frame: CGRect(x: 10.0, y: 40.0, width: 300, height: 200))
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 350, height: 200)
        
        label.text = "   Back when I was still an informatics engineering student, I experienced what everybody in the IT field experience, what is it? stressful nights and lack of sleep. Coding capabilities appear only at night, am I correct or am I correct? The problem is, that habit went on for too long and it evolved into insomnia. I was battling with insomnia for awhile until I found the Box Breathing Technique on social media, I did a mini research and found that it can help us relax, reduce stress, and help us to sleep, etc. I tried to practice this method every night and it worked. I slowly started to be able to control my emotion, reduce my stress, and I could finally sleep. Insomnia hasn't been an issue since then."
        
        return label
    }()
    
    //label for story 2
    var labelStory2: UILabel = {
        let label = UILabel(frame: CGRect(x: 10.0, y: 40.0, width: 300, height: 200))
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 350, height: 200)
        
        label.text = "   Inspired from my own experience, I want to translate this box breathing technique into a game called Peace Box that I hope can help people who are stressed and may have trouble sleeping like me. Peace Box's main feature is to help people to do the box breathing technique which includes animation, countdown time, and instructions. the animation is a Gif which is used as an example of box breathing simulation, countdown is used to determine the time of box breathing, and instructions to find out what we should do. There are also additional features such as pause  if we want to stop for a moment and a reset feature when it goes wrong and we want to repeat the box breathing."
        
        return label
    }()
    
    //label for story 3
    var labelStory3: UILabel = {
        let label = UILabel(frame: CGRect(x: 10.0, y: 40.0, width: 300, height: 200))
        
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.frame.size = CGSize(width: 350, height: 200)
        
        label.text = "   How do we play this game? First tap the start button and read the instructions, then follow the first instruction by breathing in for 4 seconds, holding your breath for 4 seconds, exhaling for 4 seconds, and don't breathe for 4 seconds. repeat 5 times (based on the box breathing technique)."
        
        return label
    }()
    
    //button Start
    var buttonPlay: UIButton = {
        let buttonPlay = UIButton()
        
        buttonPlay.frame.origin = CGPoint(x: 0, y: 0)
        buttonPlay.frame.size = CGSize(width: 150, height: 50)
        buttonPlay.setTitle("🧘‍♀️Play Now!🧘", for: .normal)
        buttonPlay.backgroundColor = .systemBlue
        buttonPlay.layer.cornerRadius = 10
        
        return buttonPlay
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //background black
        //view.backgroundColor = .black

        //image for Icon
        imgIcon.center = view.center
        imgIcon.frame.origin.y -= 250
        view.addSubview(imgIcon)
    
        //For Label Wellcome
        labelWellcome.center = view.center
        labelWellcome.textAlignment = .center
        labelWellcome.font = labelWellcome.font.withSize(35)
        labelWellcome.frame.origin.y -= 360
        view.addSubview(labelWellcome)
        
        //Label for story 1
        labelStory1.center = view.center
        labelStory1.textAlignment = .justified
        labelStory1.frame.origin.y -= 75
        labelStory1.font = labelStory1.font.withSize(11.5)
        labelStory1.numberOfLines = 100
        view.addSubview(labelStory1)
        
        //Label for story 2
        labelStory2.center = view.center
        labelStory2.textAlignment = .justified
        labelStory2.frame.origin.y += 90
        labelStory2.font = labelStory2.font.withSize(11.5)
        labelStory2.numberOfLines = 100
        view.addSubview(labelStory2)
        
        //Label for story 3
        labelStory3.center = view.center
        labelStory3.textAlignment = .justified
        labelStory3.frame.origin.y += 210
        labelStory3.font = labelStory3.font.withSize(11.5)
        labelStory3.numberOfLines = 100
        view.addSubview(labelStory3)
        
        //button Play
        buttonPlay.center = view.center
        buttonPlay.frame.origin.y += 300
        
        view.addSubview(buttonPlay)
        //Adding action to button start
        buttonPlay.addTarget(self, action: #selector(actionPlay(_:)), for: .touchUpInside)
    }
    
    @objc func actionPlay(_ sender: UIButton) {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
}
