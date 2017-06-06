//
//  ViewController.swift
//  bmiCal
//
//  Created by juicemeart on 2017/5/26.
//  Copyright © 2017年 juicemeart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //男女顯示
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bgGirl: UIImageView!
    @IBOutlet weak var bgBoy: UIImageView!

    //身高體重輸入框
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    //BMI結果
    @IBOutlet weak var result: UILabel!
    
    
    //胖瘦文字
    @IBOutlet weak var ssText: UILabel!
    @IBOutlet weak var sText: UILabel!
    @IBOutlet weak var mText: UILabel!
    @IBOutlet weak var lText: UILabel!
    @IBOutlet weak var lLtext: UILabel!
    //胖瘦指針
    @IBOutlet weak var ssArrow: UIImageView!
    @IBOutlet weak var sArrow: UIImageView!
    @IBOutlet weak var mArrow: UIImageView!
    @IBOutlet weak var lArrow: UIImageView!
    @IBOutlet weak var lLArrow: UIImageView!
    
    //控制男女顯示圖示
    @IBAction func genderSwitch(_ sender: Any) {
        if gender.selectedSegmentIndex == 0{
            bgBoy.isHidden = false
            bgGirl.isHidden = true
        }
        else{
            bgBoy.isHidden = true
            bgGirl.isHidden = false
        }
    }
    
    //計算BMI
    @IBAction func bmiCal(_ sender: Any) {
        sArrow.isHidden = true
        mArrow.isHidden = true
        lArrow.isHidden = true
        lLArrow.isHidden = true
        sText.isHidden = true
        mText.isHidden = true
        lText.isHidden = true
        lLtext.isHidden = true
        
        if height.text == "" || weight.text == ""{
            //沒有輸入數字時跳出的警告訊息
            let alertController = UIAlertController(title: "錯誤", message: "請輸入身高體重", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alertController, animated: true, completion: nil)
        }
        else{
            //算式 BMI = 體重(公斤) / 身高2(公尺2)
            let heightM = Double(height.text!)!/100
            result.text = String(format:"%.1f",Double(weight.text!)!/(heightM * heightM))
            //format:"%.1f",用來控制讓數字只到小數後一位
            
            if Double(result.text!)!<18.5{
                sText.isHidden = false
                sArrow.isHidden = false
            }
            else if Double(result.text!)!>=18.5 && Double(result.text!)!<23.9{
                mText.isHidden = false
                mArrow.isHidden = false
            }
            else if Double(result.text!)!>=23.9 && Double(result.text!)!<27.9{
                lText.isHidden = false
                lArrow.isHidden = false
            }
            else{
                lLtext.isHidden = false
                lLArrow.isHidden = false
            }
        }
        
        height.resignFirstResponder()
        weight.resignFirstResponder()
    }
    
    //按任意處收起鍵盤
    func hideKeyboardWhenTapAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bgBoy.isHidden = false
        self.hideKeyboardWhenTapAround()//按任意處收起鍵盤
        result.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

