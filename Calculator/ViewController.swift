
import UIKit

class ViewController: UIViewController {
    @IBAction func sqrt(_ sender: Any) {
        math(mathfunc: "SquareRoot")
    }
    @IBAction func percent(_ sender: Any) {
        pressPercent()
    }
    @IBAction func castling(_ sender: Any) {
    }
    @IBAction func division(_ sender: Any) {
        math(mathfunc: "Division")
    }
    @IBAction func clear(_ sender: Any) {
        registerX = 0
        registerY = 0
        mathFunc = ""
        numbers = []
        hideDigits()
        xRO = false
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
        pointFlag = true
    }
    @IBAction func inverse(_ sender: Any) {
        if minusFlag == true{
            numbers.remove(at: 0)
            showNumber(number: numbers)
            fillingRegX()
            minusFlag = false
        }
        else{
            var minus = ModelOfNumber(point: false)
            minus.digit = 10
            numbers.insert(minus, at: 0)
            showNumber(number: numbers)
            fillingRegX()
            minusFlag = true
        }
    }
    @IBAction func result(_ sender: Any) {
        pressResult()
    }
    @IBAction func cleanMem(_ sender: Any) {
        clearMem()
    }
    @IBAction func readMem(_ sender: Any) {
        readMem()
    }
    @IBAction func memPlus(_ sender: Any) {
        memPlus()
    }
    @IBAction func memMinus(_ sender: Any) {
        memMinus()
    }
    @IBAction func multiplication(_ sender: Any) {
        math(mathfunc: "Multiply")
    }
    @IBAction func minus(_ sender: Any) {
        math(mathfunc: "Minus")
    }
    @IBAction func plus(_ sender: Any) {
        math(mathfunc: "Plus")
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
    var memReg: Double = 0
    var xRO: Bool = false
    var numbers: [ModelOfNumber] = []
    var pointFlag: Bool = false
    var zeroFlag: Bool = true
    var mathFunc: String = ""
    var minusFlag: Bool = false
    
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
        if !xRO{
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
            fillingRegX()
        }
    }
    func fillingRegX(){
        var preRegX = ""
        for digit in numbers{
            if digit.digit == 10{
                preRegX += "-"
                continue
            }
            if digit.point == false{
                preRegX += "\(digit.digit!)"
            }
            else{
                preRegX += ("\(digit.digit!)" + ".")
            }
        }
        registerX = Double(preRegX) ?? 0
    }
    func math(mathfunc: String){
        mathFunc = mathfunc
        if mathFunc == "SquareRoot"{
            registerX = registerX.squareRoot()
            convertToDigit()
            xRO = true
        }
        else{
            registerY = registerX
            registerX = 0
            numbers.removeAll()
            hideDigits()
            xRO = false
        }
    }
    func pressResult(){
        switch mathFunc {
        case "Plus":
            registerX += registerY
        case "Minus":
            registerX = registerY - registerX
        case "Division":
            registerX = registerY / registerX
        case "Multiply":
            registerX = registerX * registerY
        default:
            print("Error")
        }
        convertToDigit()
    }
    func convertToDigit(){
        hideDigits()
        numbers.removeAll()
        if registerX >= 1000000000{
            var error = ModelOfNumber(point: false)
            error.digit = 11
            digitEight.showDigit(model: error)
            xRO = true
        }
        else{
            var number: [String] = []
            var element = ModelOfNumber(point: false)
            registerY = 0
            number = String(registerX).compactMap { str in String(str) }
            for digit in number{
                if digit == "-"{
                    element.digit = 10
                    numbers.append(element)
                }
                else if digit == "."{
                    numbers[numbers.count - 1].point = true
                    if registerX.truncatingRemainder(dividingBy: 1) == 0{
                        break
                    }
                }
                else{
                    element.digit = Int(digit)
                    numbers.append(element)
                    if numbers.count == 9{
                        break
                    }
                }
            }
            showNumber(number: numbers)
        }
    }
    func pressPercent(){
        switch mathFunc {
        case "Plus":
            registerX = registerY + (registerY * registerX / 100)
        case "Minus":
            registerX = registerY - (registerY * registerX / 100)
        case "Division":
            registerX = registerY / (registerY * registerX / 100)
        case "Multiply":
            registerX = registerX * (registerY * registerX / 100)
        default:
            print("Error")
        }
        convertToDigit()
    }
    func readMem(){
        registerX = memReg
        convertToDigit()
    }
    func clearMem(){
        memReg = 0
    }
    func memPlus(){
        memReg += registerX
    }
    func memMinus(){
        memReg -= registerX
    }
}

