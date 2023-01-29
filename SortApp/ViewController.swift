//
//  ViewController.swift
//  SortApp
//
//  Created by AKHILA SIRIKONDA on 9/8/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = types[row]
    }
    

    @IBOutlet var sortBtn: UIView!
    @IBOutlet weak var output: UITextView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var input: UITextField!
    var selectedType = "Integer"
    
    var types=[
        "Integer",
        "Date",
        "String"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.typePicker.delegate = self
        self.typePicker.dataSource = self
    }
    
    func sortDate(){
        let inputText=input.text!
        var arr:Array<String>=inputText.components(separatedBy: ",")
        print(arr.count);
        for i in 0...arr.count-2{
            for j in i+1...arr.count-1 {
                var dateArr=arr[i].split(separator: "/")
                let month1=dateArr[0]
                let day1=dateArr[1]
                let year1=dateArr[2]
                dateArr=arr[j].split(separator: "/")
                let month2=dateArr[0]
                let day2=dateArr[1]
                let year2=dateArr[2]
                if(year1<year2) { continue }
                else if(year1>year2) {
                    let temp=arr[i]
                    arr[i]=arr[j]
                    arr[j]=temp
                }
                else if(month1<month2){
                    continue;
                }else if(month1>month2){
                    let temp=arr[i]
                    arr[i]=arr[j]
                    arr[j]=temp
                }else if(day1<day2){
                    continue
                }else{
                    let temp=arr[i]
                    arr[i]=arr[j]
                    arr[j]=temp
                }
            }
        }
        print(arr)
        output.text="\(arr)"
    }
    
    func sortInt(){
        let inputText=input.text!
        let arr:Array<String>=inputText.components(separatedBy:",")
        print(arr)
        var numArr:Array<Int>=[]
        for i in arr {
            numArr.append((Int(i))!)
        }
        print(numArr)
        numArr.sort()
    
        output.text="\(numArr)"
    }
    
    func sortString(){
        let inputText=input.text!
        var arr:Array<String>=inputText.components(separatedBy:",")
        arr.sort()
        output.text="\(arr)"
    }

    
    @IBAction func sortActn(_ sender: Any) {
        print(selectedType);
        switch selectedType {
            case "Integer":
                sortInt();
            case "String":
                sortString();
            case "Date":
                sortDate();
            default:
                print("Invalid Data");
            
        }
    }
    
}

