
import UIKit

class ViewController: UIViewController {
    @IBAction func sqrt(_ sender: Any) {
    }
    @IBAction func percent(_ sender: Any) {
    }
    @IBAction func castling(_ sender: Any) {
    }
    @IBAction func division(_ sender: Any) {
    }
    @IBAction func clear(_ sender: Any) {
    }
    @IBAction func seven(_ sender: Any) {
        pressDigit(dIgit: 7)
    }
    @IBAction func eight(_ sender: Any) {
        pressDigit(dIgit: 8)
    }
    @IBAction func nine(_ sender: Any) {
        pressDigit(dIgit: 9)
    }
    @IBAction func four(_ sender: Any) {
        pressDigit(dIgit: 4)
    }
    @IBAction func five(_ sender: Any) {
        pressDigit(dIgit: 5)
    }
    @IBAction func six(_ sender: Any) {
        pressDigit(dIgit: 6)
    }
    @IBAction func one(_ sender: Any) {
        pressDigit(dIgit: 1)
    }
    @IBAction func two(_ sender: Any) {
        pressDigit(dIgit: 2)
    }
    @IBAction func three(_ sender: Any) {
        pressDigit(dIgit: 3)
    }
    @IBAction func zero(_ sender: Any) {
        if !zeroFlag{
            pressDigit(dIgit: 0)
        }
    }
    @IBAction func dot(_ sender: Any) {
        pressPoint()
    }
    @IBAction func inverse(_ sender: Any) {
    }
    @IBAction func result(_ sender: Any) {
    }
    @IBAction func cleanMem(_ sender: Any) {
    }
    @IBAction func readMem(_ sender: Any) {
    }
    @IBAction func memPlus(_ sender: Any) {
    }
    @IBAction func memMinus(_ sender: Any) {
    }
    @IBAction func multiplication(_ sender: Any) {
    }
    @IBAction func minus(_ sender: Any) {
    }
    @IBAction func plus(_ sender: Any) {
    }
    @IBOutlet weak var digitOne: Digit!
    @IBOutlet weak var digitTwo: Digit!
    @IBOutlet weak var digitThree: Digit!
    @IBOutlet weak var digitFourth: Digit!
    @IBOutlet weak var digitFive: Digit!
    @IBOutlet weak var digitSix: Digit!
    @IBOutlet weak var digitSeven: Digit!
    @IBOutlet weak var digitEight: Digit!
    @IBOutlet weak var digitNine: Digit!
    
    var registerX: Double = 0
    var registerY: Double = 0
    var xRO: Bool = false
    var numbers: [ModelOfNumber] = []
    var pointFlag: Bool = false
    var zeroFlag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideDigits()
    }
    func hideDigits(){
        var hide = ModelOfNumber(point: false)
        hide.digit = 12
        for digit in [digitOne, digitTwo, digitThree, digitFourth, digitFive, digitSix, digitSeven, digitEight, digitNine]{
            digit?.showDigit(model: hide)
        }
    }
    func showNumber(number: [ModelOfNumber]){
        var erRor = ModelOfNumber(point: false)
        erRor.digit = 11
        if number.count >= 10 {
            digitOne.showDigit(model: erRor)
            print ("error")
        }
        for (index, digit) in [digitOne, digitTwo, digitThree, digitFourth, digitFive, digitSix, digitSeven, digitEight, digitNine].enumerated(){
            digit?.showDigit(model: number[numbers.count - 1 - index])
            if index == numbers.count - 1{
                break
            }
        }
    }
    func pressDigit(dIgit: Int){
        if numbers.count != 9{
            zeroFlag = false
            if !pointFlag{
                for (index, digit) in numbers.enumerated() {
                    var digit = digit
                    digit.point = false
                    numbers[index] = digit
                }
            }
            var digit = ModelOfNumber(point: !pointFlag)
            digit.digit = dIgit
            numbers.append(digit)
            showNumber(number: numbers)
        }
    }
    func pressPoint(){
        pointFlag = true
    }
}

