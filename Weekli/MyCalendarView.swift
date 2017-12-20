//
//  MyCalendarView.swift
//  Weekli
//
//  Created by nyuguest on 11/21/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol myCalendarViewDelegate: class {
    func passAddEventData(controller: MyCalendarView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int)
}

class MyCalendarView: UIViewController, AddEventViewDelegate {
    
    let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var eventsListDisplay: UIScrollView!
    @IBAction func post(_ sender: Any) {
    }
    @IBOutlet weak var barButtonPost: UIBarButtonItem!
    @IBOutlet weak var undoButton: UIBarButtonItem!
    
    weak var delegate: myCalendarViewDelegate? = nil
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    var eventsList = DayDictionary()
    var eventsFromTheServer: [String:String] = [:]
    var buttonList : [MyEventButton] = []
    var previousStatesList : [[MyEventButton]] = []
    var blockSplitsOtherBlocks : [MyEventButton] = []
    var hasBeenEdited = false
    var addBlockView : UIView? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let serverObjects = self.getServerEvents()
            for (date, event) in serverObjects {
                let stringDate = self.formatter.string(from: date)
                self.eventsFromTheServer[stringDate] = event
            }
            DispatchQueue.main.async {
                //self.calendarView.reloadData()
            }
        }
        
        setUpCalendarView()
        calendarView.scrollToDate( Date() )
        calendarView.selectDates([ Date() ])
        
    }
    
    func setUpCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
    }
    
    func passEventData(controller: AddEventView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
        delegate?.passAddEventData(controller: self, name: name, date: date, startHour: startHour, startMinute: startMinute, endHour: endHour, endMinute: endMinute)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addEventView: AddEventView = segue.destination as! AddEventView
        
        addEventView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from:date)
        
        reloadData(day: day, month: month, year: year)
    }
    
    func placeBlock(button: MyEventButton) {
        print("placing block: ", button.title)
        hasBeenEdited = false
        let index = blockSplitsOtherBlocks.index(of: button)
        if ( index != nil ) {
            print("removing from split blocks")
            print(button.id)
            print(blockSplitsOtherBlocks.remove(at: index!).id)
        }
        combineSplitBlocks()
        buttonList.sort { (block1, block2) -> Bool in
            return getTopOfBlock(block: block1) < getTopOfBlock(block: block2)
        }
        for currentButton in buttonList {
            if blocksOverlap(block1: currentButton, block2: button) {
                let indexHere = blockSplitsOtherBlocks.index(of: currentButton)
                if ( indexHere != nil ) {
                    blockSplitsOtherBlocks.remove(at: indexHere!)
                }
            }
        }
        moveTopOfOthersToProperSpot(button: button)
        moveTopToProperSpot(button: button)
        button.updateLabel()
        undoButton.isEnabled = true
        while (hasBeenEdited) {
            hasBeenEdited = false
            buttonList.sort { (block1, block2) -> Bool in
                return getTopOfBlock(block: block1) < getTopOfBlock(block: block2)
            }
            moveTopOfOthersToProperSpot(button: button)
            moveTopToProperSpot(button: button)
            button.updateLabel()
        }
    }
    
    func blocksOverlap(block1: MyEventButton, block2: MyEventButton ) -> Bool {
        let topOfBlock1 = getTopOfBlock(block: block1)
        let topOfBlock2 = getTopOfBlock(block: block2)
        let bottomOfBlock2 = getBottomOfBlock(block: block2)
        return topOfBlock1 >= topOfBlock2 && topOfBlock1 < bottomOfBlock2
    }
    
    func getTopOfBlock(block: MyEventButton) -> CGFloat {
        return block.frame.origin.y
    }
    
    func getBottomOfBlock(block: MyEventButton) -> CGFloat {
        return getTopOfBlock(block: block) + block.bounds.height
    }
    
    func moveTopToProperSpot(button: MyEventButton, top: CGFloat) {
        
    }
    
    func moveTopToProperSpot(button: MyEventButton) {
        for currentButton in buttonList {
            // top of button is inside another button
            if ( currentButton != button && blocksOverlap(block1: button, block2: currentButton) ) {
                hasBeenEdited = true
                // Block that is overlapped is fixed, move the moved button below the fixed block
                if ( currentButton.fixed == 1) {
                    button.frame.origin.y = CGFloat(getBottomOfBlock(block: currentButton))
                    return
                }
                // Block that is overlapped is dynamic, split up the other block to wrap around moved block
                else {
                    split(block: currentButton, fromBlock: button)
                }
            }
        }
    }

    func moveTopOfOthersToProperSpot(button: MyEventButton) {
        print("move top of others ", button.title)
        for comparingButton in buttonList {
            if ( button != comparingButton ) {
                for currentButton in buttonList {
                    // top of button is inside another button
                    if (currentButton != comparingButton && blocksOverlap(block1: comparingButton, block2: currentButton)) {
                        if ( currentButton.fixed == 1 || ((!(currentButton.fixed == 1) && !(comparingButton.fixed == 1)) &&
                            !blockSplitsOtherBlocks.contains(currentButton) && comparingButton != button)) {
                            comparingButton.frame.origin.y = CGFloat(getBottomOfBlock(block: currentButton))
                        }
                        // Block that is overlapped is dynamic, split up the other block to wrap around moved block
                        else {
                            split(block: currentButton, fromBlock: comparingButton)
                        }
                    }
                }
            }
        }
    }
    
    //Button released
    func editTimeOfEvent(view: UIView) {
        var eventEditedForButton = MyEventButton.init()
        for i in 0 ..< buttonList.count {
            if ( view == buttonList[i] ) {
                eventEditedForButton = buttonList[i]
            }
        }
        // If a secondary block was dragged, separate it (now it's primary)
        if (!eventEditedForButton.primary) {
            eventEditedForButton.primary = true
            eventEditedForButton.id = Int(arc4random())
            eventEditedForButton.backgroundColor = getRandomColor()
        }
        placeBlock(button: eventEditedForButton)
    }
    
    // Combine blocks that were split previously
    func combineSplitBlocks() {
        var index = 0
        while ( index < buttonList.count ) {
            let button = buttonList[index]
            if ( button.primary ) {
                var totalDuration = button.bounds.height
                var i = 0
                while ( i < buttonList.count ) {
                    if ( button != buttonList[i] && !buttonList[i].primary && buttonList[i].id == button.id ) {
                        totalDuration = totalDuration + buttonList[i].bounds.height
                        buttonList[i].removeFromSuperview()
                        buttonList.remove(at: i)
                        i -= 1
                        index = index - 1
                    }
                    i = i + 1
                }
                button.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.y, width: 230, height: totalDuration)
            }
            else {
                button.primary = true
                button.id = Int(arc4random())
            }
            index = index + 1
            if ( index < 0 ) {
                index = 0
            }
        }
    }
    

    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            eventsListDisplay.bringSubview(toFront: view)
            if ( view.frame.origin.y + translation.y >= 0 &&
                 view.frame.origin.y + translation.y + view.bounds.height <= eventsListDisplay.contentSize.height) {
                view.center = CGPoint(x:view.center.x,
                                  y:view.center.y + translation.y)
            }
        }
        if ( recognizer.state == .ended ) {
            if let view = recognizer.view {
                editTimeOfEvent(view: view)
            }
        }
        if ( recognizer.state == .began) {
            previousStatesList.append(copyOfList(bList: buttonList))
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func handleTap(recognizer:UITapGestureRecognizer) {
        print("Open menu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureCell(cell: JTAppleCell?, cellState: CellState) {
        //cell configuration here later to shorten code
    }
    
    func getRandomColor() -> UIColor {
        let redVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let greenVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blueVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        return UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
    }
    
    func getPreviousState() -> [MyEventButton]? {
        if ( previousStatesList.count > 0 ) {
            return previousStatesList.removeLast()
        }
        else {
            return nil
        }
    }
    
    
    func reloadData(day: Int, month: Int, year: Int) {
        previousStatesList = []
        undoButton.isEnabled = false
        clearEvents()
        eventsListDisplay.contentSize = CGSize(width: eventsListDisplay.contentSize.width, height: 1440)

        let thisDate = eventsList.get(day: day, month: month, year: year)
        if (thisDate != nil) {
            for j in 0 ..< thisDate!.getNumEvents() {
                let raiseButton = MyEventButton.init();
                raiseButton.backgroundColor = getRandomColor()
                let hourBegin = thisDate!.todaysEventsDateTimes[j].hour
                let minuteBegin = thisDate!.todaysEventsDateTimes[j].minute
                let duration = thisDate!.todaysEventsTimeElapsed[j]
                let eventName = thisDate!.getDescription(i: j)
                // Label displays time and duration of event, later change to show title
                let timeOfEvent = String(format:"%02d:%02d, for %d min", hourBegin!, minuteBegin!, duration)
                raiseButton.setTitle(eventName + timeOfEvent, for: []);
            
                let timeElapsed = thisDate!.todaysEventsTimeElapsed[j]
                let beginAtHeight = hourBegin!*60 + minuteBegin!
                raiseButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                raiseButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                raiseButton.frame = CGRect(x: 0, y: 0, width: 230, height: timeElapsed)
                raiseButton.frame.origin.y = CGFloat(beginAtHeight)
                raiseButton.id = Int(arc4random())
                raiseButton.title = thisDate!.todaysEventsDescriptions[j]
                addPanGestureRecognizer(button: raiseButton)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
                raiseButton.addGestureRecognizer(tapGesture)
                buttonList.append(raiseButton)

                self.eventsListDisplay.addSubview(raiseButton)
            }
        }
    }

    @IBAction func undoAction(_ sender: Any) {
        let undidButtonList = getPreviousState()
        if ( undidButtonList != nil ) {
            buttonList = undidButtonList!
            clearEvents()
            showEventsFromButtons(newButtonList: undidButtonList!)
        }
        if ( previousStatesList.count <= 0 ) {
            undoButton.isEnabled = false
        }
    }
    
    @IBAction func clearEvents() {
        for subview in self.eventsListDisplay.subviews {
            if(!subview.isKind(of: UIImageView.self)) {
                subview.removeFromSuperview()
            }
        }
        addHorizontalHourIndicators()
    }
    
    func showEventsFromButtons(newButtonList: [MyEventButton]) {
        for button in newButtonList {
            self.eventsListDisplay.addSubview(button)
        }
    }
    
    func addHorizontalHourIndicators() {
        for i in 0 ..< 24 {
            let horizontalLine = UIView()
            horizontalLine.backgroundColor = UIColor.black
            horizontalLine.frame = CGRect(x: 0, y: i*60, width: 300, height: 1)
            let hourLabel = UILabel()
            if ( i == 0 ) {
                hourLabel.text = "12am"
            }
            else if ( i < 13 ) {
                hourLabel.text = String.init(format: "%dam", i)
            }
            else {
                hourLabel.text = String.init(format: "%dpm", i-12)
            }
            hourLabel.font = UIFont.init(name: hourLabel.font.fontName, size: 10)
            hourLabel.frame = CGRect(x:260, y:i*60+1, width: 40, height: 15)
            self.eventsListDisplay.addSubview(horizontalLine)
            self.eventsListDisplay.addSubview(hourLabel)
        }
    }
    
    func copyOfList(bList: [MyEventButton]) -> [MyEventButton] {
        var returnList : [MyEventButton] = []
        for button in bList {
            let newButton = button.myCopy()
            addPanGestureRecognizer(button: newButton)
            returnList.append(newButton)
        }
        return returnList
    }
    
    func split(block: MyEventButton, fromBlock: MyEventButton) {
        print("splitting", block.title, "from block:", fromBlock.title)
        let topOfFromBlock = fromBlock.frame.origin.y
        let topOfBlock = block.frame.origin.y
        let bottomOfFromBlock = topOfFromBlock + fromBlock.bounds.height
        let bottomOfBlock = topOfBlock + block.bounds.height

        let newHeight = topOfFromBlock - topOfBlock
        let splitHeight = bottomOfBlock - topOfBlock - newHeight
        block.frame = CGRect(x: block.frame.origin.x, y: block.frame.origin.y,  width: 230, height: newHeight)
        let splitButton = MyEventButton.init()
        block.updateLabel()
        splitButton.frame = CGRect(x: block.frame.origin.x, y:bottomOfFromBlock, width: 230, height: splitHeight)
        splitButton.id = block.id
        splitButton.primary = false
        splitButton.title = block.title
        splitButton.backgroundColor = block.backgroundColor
        splitButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        splitButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
        splitButton.updateLabel()
        splitButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        splitButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
        
        addPanGestureRecognizer(button: splitButton)
        
        self.eventsListDisplay.addSubview(splitButton)
        buttonList.append(splitButton)
        blockSplitsOtherBlocks.append(block)
        print("adding to split blocks,", block.id)
    }
    
    func addPanGestureRecognizer(button: MyEventButton) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        button.addGestureRecognizer(panGesture)
    }
    
    @IBAction func addBlock(_ sender: Any) {
        print("Add block")
        let addBlockView = UIView.init()
        addBlockView.frame = CGRect(x: 30, y: 100, width: 250, height: 250)
        let finishButton = MDCRaisedButton.init()
        finishButton.backgroundColor = UIColor.gray
        finishButton.frame = CGRect(x: 95, y: 220, width: 60, height: 30)
        finishButton.addTarget(self, action: #selector(MyCalendarView.closeAddingBlockView), for: .touchUpInside)
        addBlockView.addSubview(finishButton)
        self.addBlockView = addBlockView
        self.view.addSubview(addBlockView)
    }
    
    func closeAddingBlockView() {
        addBlockView?.removeFromSuperview()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyCalendarView: JTAppleCalendarViewDelegate {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        let parameters = ConfigurationParameters(startDate:startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 1,
                                                 generateInDates: .forFirstMonthOnly,
                                                 generateOutDates: .off,
                                                 hasStrictBoundaries: false)
        return parameters
    }
    
    
}

extension MyCalendarView: JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // This function should have the same code as the cellForItemAt function
        let myCustomCell = cell as! CustomCell
        myCustomCell.dateLabel.text = cellState.text
        
        if cellState.isSelected {
            myCustomCell.selectedView.isHidden = false
        }
        else {
            myCustomCell.selectedView.isHidden = true
        }
        
        let todaysDate = Date()
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            myCustomCell.dateLabel.textColor = UIColor.blue
        } else {
            myCustomCell.dateLabel.textColor = UIColor.white
        }
        
        myCustomCell.eventDotView.isHidden = !eventsFromTheServer.contains {$0.key == formatter.string(from: cellState.date)}
    }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return myCustomCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        validCell.selectedView.isHidden = false
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from:date)
        
        reloadData(day: day, month: month, year: year)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        validCell.selectedView.isHidden = true
    }
}












extension MyCalendarView {
    func getServerEvents() -> [Date:String] {
        formatter.dateFormat = "yyyy MM dd"
        return [
            formatter.date(from: "2017 12 07")!: "Happy Birthday",
            formatter.date(from: "2017 12 09")!: "Suffering",
            formatter.date(from: "2017 12 10")!: "Pain",
            formatter.date(from: "2017 12 05")!: "Where is Abrar",
            formatter.date(from: "2017 12 02")!: "I need him now",
            formatter.date(from: "2017 12 01")!: "Got it",
            
        ]
    }
}
