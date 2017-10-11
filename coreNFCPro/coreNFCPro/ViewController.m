//
//  ViewController.m
//  coreNFCPro
//
//  Created by zuoyongyong on 2017/10/11.
//  Copyright © 2017年 zuoyongyong. All rights reserved.
//

#import "ViewController.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import <CoreNFC/CoreNFC.h>

@interface ViewController () <NFCNDEFReaderSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self InitNFCReader];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark custom Function


- (BOOL)isiPhone7oriPhone7Plus
{
    
    return YES;
}


- (void)InitNFCReader
{
    if ([self isiPhone7oriPhone7Plus] && [UIDevice currentDevice].systemVersion.floatValue >= 11.0) {
        // ReadingAvailable is YES if device supports NFC tag reading.
        if ([NFCNDEFReaderSession readingAvailable]) {
            // beginScanning
            // invalidateAfterFirstRead 属性表示是否需要识别多个NFC标签，如果是YES，则会话会在第一次识别成功后终止。否则会话会持续
            // 不过有一种例外情况，就是如果响应了-readerSession:didInvalidateWithError:方法，则是否为YES，会话都会被终止
            NFCNDEFReaderSession *session = [[NFCNDEFReaderSession alloc] initWithDelegate:self queue:nil invalidateAfterFirstRead:YES];
            
            [session beginSession];
        }
    }
}

#pragma mark NFCDEFReaderSessionDelegate

/*!
 * @method readerSession:didInvalidateWithError:
 *
 * @param session   The session object that is invalidated.
 * @param error     The error indicates the invalidation reason.
 *
 * @discussion      Gets called when a session becomes invalid.  At this point the client is expected to discard
 *                  the returned session object.
 */
- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error
{
    
}

/*!
 * @method readerSession:didDetectNDEFs:
 *
 * @param session   The session object used for tag detection.
 * @param messages  Array of @link NFCNDEFMessage @link/ objects. The order of the discovery on the tag is maintained.
 *
 * @discussion      Gets called when the reader detects NFC tag(s) with NDEF messages in the polling sequence.  Polling
 *                  is automatically restarted once the detected tag is removed from the reader's read range.
 */
- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages
{
    // 数组messages中是NFCNDEFMessage对象
    // NFCNDEFMessage对象中有一个records数组，这个数组中是NFCNDEFPayload对象
    // 参考NFCNDEFMessage、NFCNDEFPayload类
    // 解析数据
    for (NFCNDEFMessage *message in messages) {
        for (NFCNDEFPayload *playLoad in message.records) {
            NSLog(@"typeNameFormat : %d", playLoad.typeNameFormat);
            NSLog(@"type : %@", playLoad.type);
            NSLog(@"identifier : %@", playLoad.identifier);
            NSLog(@"playload : %@", playLoad.payload);
        }
    }
}


@end
