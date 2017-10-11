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
#import "sys/utsname.h"



@interface ViewController () <NFCNDEFReaderSessionDelegate>

@end

@implementation ViewController
- (IBAction)BeginNFCScan:(id)sender {
    
    [self BeginNFCReader];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark custom Function

- (NSString *)getDeviceName
{
    // 需要
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"国行(A1863)、日行(A1906)iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"美版(Global/A1905)iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"美版(Global/A1897)iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"国行(A1865)、日行(A1902)iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"美版(Global/A1901)iPhone X";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,11"])    return @"iPad 5 (WiFi)";
    if ([deviceString isEqualToString:@"iPad6,12"])    return @"iPad 5 (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,1"])     return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,2"])     return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,3"])     return @"iPad Pro 10.5 inch (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,4"])     return @"iPad Pro 10.5 inch (Cellular)";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}


// CPU总数目
//- (NSUInteger)getCPUCount {
//    return [NSProcessInfo processInfo].activeProcessorCount;
//}
//
//// 已使用的CPU比例
//- (float)getCPUUsage {
//    float cpu = 0;
//    NSArray *cpus = [self getPerCPUUsage];
//    if (cpus.count == 0) return -1;
//    for (NSNumber *n in cpus) {
//        cpu += n.floatValue;
//    }
//    return cpu;
//}
//
//// 获取每个cpu的使用比例
//- (NSArray *)getPerCPUUsage {
//    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
//    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
//    unsigned _numCPUs;
//    NSLock *_cpuUsageLock;
//
//    int _mib[2U] = { CTL_HW, HW_NCPU };
//    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
//    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
//    if (_status)
//        _numCPUs = 1;
//
//    _cpuUsageLock = [[NSLock alloc] init];
//
//    natural_t _numCPUsU = 0U;
//    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
//    if (err == KERN_SUCCESS) {
//        [_cpuUsageLock lock];
//
//        NSMutableArray *cpus = [NSMutableArray new];
//        for (unsigned i = 0U; i < _numCPUs; ++i) {
//            Float32 _inUse, _total;
//            if (_prevCPUInfo) {
//                _inUse = (
//                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
//                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
//                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
//                          );
//                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
//            } else {
//                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
//                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
//            }
//            [cpus addObject:@(_inUse / _total)];
//        }
//
//        [_cpuUsageLock unlock];
//        if (_prevCPUInfo) {
//            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
//            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
//        }
//        return cpus;
//    } else {
//        return nil;
//    }
//}


//
//// 系统总内存空间
//- (int64_t)getTotalMemory {
//    int64_t totalMemory = [[NSProcessInfo processInfo] physicalMemory];
//    if (totalMemory < -1) totalMemory = -1;
//    return totalMemory;
//}
//
//// 活跃的内存,正在使用或者很短时间内被使用过
//- (int64_t)getActiveMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return vm_stat.active_count * page_size;
//}
//
//// 最近使用过,但是目前处于不活跃状态的内存
//- (int64_t)getInActiveMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return vm_stat.inactive_count * page_size;
//}
//
//// 空闲的内存空间
//- (int64_t)getFreeMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return vm_stat.free_count * page_size;
//}
//
//// 已使用的内存空间
//- (int64_t)getUsedMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return page_size * (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count);
//}
//
//// 用来存放内核和数据结构的内存,framework、用户级别的应用无法分配
//- (int64_t)getWiredMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return vm_stat.wire_count * page_size;
//}
//
//// 可释放的内存空间：内存吃紧自动释放，针对大对象存放所需的大块内存空间
//- (int64_t)getPurgableMemory {
//    mach_port_t host_port = mach_host_self();
//    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t page_size;
//    vm_statistics_data_t vm_stat;
//    kern_return_t kern;
//
//    kern = host_page_size(host_port, &page_size);
//    if (kern != KERN_SUCCESS) return -1;
//    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
//    if (kern != KERN_SUCCESS) return -1;
//    return vm_stat.purgeable_count * page_size;
//}


- (BOOL)isiPhone7oriPhone7Plus
{
    
    return YES;
}


- (void)BeginNFCReader
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
