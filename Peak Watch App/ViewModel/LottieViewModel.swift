//
//  LottieViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import SwiftUI
import SDWebImageLottieCoder

class LottieViewModel: ObservableObject {
    
    @Published private(set) var image: UIImage = UIImage(named: "defaultIcon")!
    
    var onAnimationFinish: (() -> Void)?
    
    // MARK: - Animation
    
    private var coder: SDImageLottieCoder?
    private var animationTimer: Timer?
    private var currentFrame: UInt = 0
    private var playing: Bool = false
    private var speed: Double = 1.5
    
    /// Loads animation data from local file
    /// - Parameter filename: name of the local Lottie file
    func loadAnimationFromFile(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Animation file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.setupAnimation(with: data)
            }
        } catch {
            print("Error loading animation data:", error.localizedDescription)
        }
    }
    
    /// Decodify animation with given data
    /// - Parameter data: data of animation
    private func setupAnimation(with data: Data) {
        coder = SDImageLottieCoder(animatedImageData: data, options: [SDImageCoderOption.decodeLottieResourcePath: Bundle.main.resourcePath!])
        
        // resets to first frame
        currentFrame = 0
        setImage(frame: currentFrame)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.play()
        }
    }
    
    /// Set current animation
    /// - Parameter frame: Set image for given frame
    private func setImage(frame: UInt) {
        guard let coder = coder,
              let uiImage = coder.animatedImageFrame(at: frame) else { return }
        self.image = uiImage
    }
    
    /// Replace current frame with next one
    private func nextFrame() {
        guard let coder = coder else { return }

        currentFrame += 1
        
        // Check if current frame is the last frame of the animation
        if currentFrame >= coder.animatedImageFrameCount {
            // Pause the animation when it reaches the end
            pause()
            
            onAnimationFinish?()
            
            return
        }
        
        setImage(frame: currentFrame)
    }
    
    /// Start playing animation
    private func play() {
        playing = true

        animationTimer?.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.05/speed, repeats: true, block: { (timer) in
            guard self.playing else {
                timer.invalidate()
                return
            }
            self.nextFrame()
        })
    }
    
    /// Pauses animation
    private func pause() {
        playing = false
        animationTimer?.invalidate()
    }
}
