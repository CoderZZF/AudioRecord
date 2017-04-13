//
//  ViewController.swift
//  录音功能实现
//
//  Created by zhangzhifu on 2017/4/13.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var record : AVAudioRecorder? = {
        // url: 录音文件的路径
        let url = NSURL(string: "/Users/zhangzhifu/Desktop/audio/test.caf")
        
        // setting: 设置项
        let configDic: [String: AnyObject] = [
            // 编码格式
            AVFormatIDKey: NSNumber(int: Int32(kAudioFormatLinearPCM)),
            // 采样率
            AVSampleRateKey: NSNumber(float: 11025.0),
            // 通道数
            AVNumberOfChannelsKey: NSNumber(int: 2),
            // 录音质量
            AVEncoderAudioQualityKey: NSNumber(int: Int32(AVAudioQuality.Min.rawValue))
        ]
        
        // 创建record对象
        do {
            let record = try AVAudioRecorder(URL: url!, settings: configDic)
            // 准备录音(系统会为我们分配一些资源)
            record.prepareToRecord()
            
            return record
        } catch {
            print(error)
            return nil
        }
    }()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 开始录音
        print("开始录音")
//        record?.record()
        
        //            record.record() // 直接开始录音
        //            record.recordAtTime(record.deviceCurrentTime + 3) // 从未来的某个时间点开始录音
//                    record?.recordForDuration(3) // 从现在开始录音,录多久
                    record?.recordAtTime((record?.deviceCurrentTime)! + 2, forDuration: 3) // 从某个时间点开始录音,录多久
    }

    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 如果录音的时长不超过两秒,则删除录音
//        if record?.currentTime < 2 {
//            // 如果想要删除录音文件,必须先让录音停止
//            record?.stop()
//            
//            print("录音时间太短,删除录音文件")
//            record?.deleteRecording()
//        } else {
//            record?.stop()
//        }
        record?.stop()
    }
}

