//
//  LogAide.h
//  HCLogDemo
//
//  Created by ycb on 2018/1/23.
//  Copyright © 2018年 hc094. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogAide : NSObject
@property (nonatomic, copy) NSString *projectName;  // default HCLog.log
@property (nonatomic, copy) NSString *logOfDirPath; // default ~/Library/Logs/
@property (nonatomic, copy) NSString *logOfPath;    // default ~/Library/Logs/HCLog.log
+ (instancetype)shareInstance;
- (void)writeLog:(NSString *)format;
@end
