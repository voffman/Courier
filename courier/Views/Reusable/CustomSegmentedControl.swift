//
//  CustomSegmentedControl.swift
//  courier
//
//  Created by Владимир Свиридов on 26.01.2022.
//

import UIKit.UISegmentedControl

class CustomSegmentedControl: UISegmentedControl {
    
    enum Segments {
        case two
        case three
    }
    
    let firstSegmentTitle: String?
    let secondSegmentTitle: String?
    var thirdSegmentTitle: String? = ""
    
    var segments: Segments?

    init(segments: Segments, firstSegmentTitle: String?, secondSegmentTitle: String?, thirdSegmentTitle: String?){
        self.segments = segments
        self.firstSegmentTitle = firstSegmentTitle
        self.secondSegmentTitle = secondSegmentTitle
        self.thirdSegmentTitle = thirdSegmentTitle
        super.init(frame: .zero)
    }
    
    
    init(segments: Segments, firstSegmentTitle: String?, secondSegmentTitle: String?){
        self.segments = segments
        self.firstSegmentTitle = firstSegmentTitle
        self.secondSegmentTitle = secondSegmentTitle
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     enum Constants {
        static let segmentedControlHeight: CGFloat = 40
         static let underlineViewColor: UIColor = Colors.orange
        static let underlineViewHeight: CGFloat = 2
    }

    // Container view of the segmented control
     lazy var segmentedControlContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    // Customised segmented control
     lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()

        // Remove background and divider colors
         segmentedControl.layer.cornerRadius = 0
         if #available(iOS 13.0, *) {
             segmentedControl.selectedSegmentTintColor = .clear
             fixBackgroundSegmentControl(segmentedControl)
             
         } else {
             // Fallback on earlier versions
             segmentedControl.tintColor = .clear
             segmentedControl.backgroundColor = Colors.white
         }

         // Append segments
         
         switch segments{
             
         case .two:
             segmentedControl.insertSegment(withTitle: firstSegmentTitle, at: 0, animated: true)
             segmentedControl.insertSegment(withTitle: secondSegmentTitle, at: 1, animated: true)
         case .three:
             segmentedControl.insertSegment(withTitle: firstSegmentTitle, at: 0, animated: true)
             segmentedControl.insertSegment(withTitle: secondSegmentTitle, at: 1, animated: true)
             segmentedControl.insertSegment(withTitle: thirdSegmentTitle, at: 2, animated: true)
             
             
         case .none:
             print("none")
         }

        // Select first segment by default
        segmentedControl.selectedSegmentIndex = 0

        // Change text color and the font of the NOT selected (normal) segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Colors.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)], for: .normal)

        // Change text color and the font of the selected segment
        segmentedControl.setTitleTextAttributes([
           NSAttributedString.Key.foregroundColor: Colors.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)], for: .selected)

        // Set up event handler to get notified when the selected segment changes

        // Return false because we will set the constraints with Auto Layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    // The underline view below the segmented control
     lazy var bottomUnderlineView: UIView = {
        let underlineView = UIView()
        underlineView.backgroundColor = Constants.underlineViewColor
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        return underlineView
    }()

     lazy var leadingDistanceConstraint: NSLayoutConstraint = {
        return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
    }()

    func setContainerView(){
        segmentedControlContainerView.addSubview(segmentedControl)
        segmentedControlContainerView.addSubview(bottomUnderlineView)
    }
    func setupContainerConstraints(){
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
            ])

        // Constrain the underline view relative to the segmented control
        NSLayoutConstraint.activate([
            bottomUnderlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            bottomUnderlineView.heightAnchor.constraint(equalToConstant: CustomSegmentedControl.Constants.underlineViewHeight),
            leadingDistanceConstraint,
            bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
            ])
    }
    
    // Change position of the underline
     func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.leadingDistanceConstraint.constant = leadingDistance
            self?.layoutIfNeeded()
        })
    }
    
    func fixBackgroundSegmentControl( _ segmentControl: UISegmentedControl){
        if #available(iOS 13.0, *) {
            //just to be sure it is full loaded
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                for i in 0...(segmentControl.numberOfSegments-1)  {
                    let backgroundSegmentView = segmentControl.subviews[i]
                    //it is not enogh changing the background color. It has some kind of shadow layer
                    backgroundSegmentView.isHidden = true
                }
            }
        }
    }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


