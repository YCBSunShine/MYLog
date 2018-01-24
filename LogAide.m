//
//  LogAide.m
//  HCLogDemo
//
//  Created by ycb on 2018/1/23.
//  Copyright © 2018年 hc094. All rights reserved.
//

#import "LogAide.h"


@implementation LogAide
static LogAide *_la = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _la = [super allocWithZone:zone];
    });
    return _la;
}

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _la = [[self alloc] init];
    });
    return _la;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _la;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.projectName = @"HCLog.log";
        self.logOfDirPath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Logs/"];
        self.logOfPath = [self.logOfDirPath stringByAppendingPathComponent:self.projectName];
    }
    return self;
}

- (void)writeLog:(NSString *)format
{
    dispatch_queue_t queue = dispatch_queue_create("com.writeFile.thread", DISPATCH_QUEUE_SERIAL);
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:self.logOfPath]) {
        [fm createFileAtPath:self.logOfPath contents:nil attributes:nil];
    }
    NSData * data = [format dataUsingEncoding:NSUTF8StringEncoding];
    dispatch_async(queue, ^{
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:self.logOfPath];
        [fileHandle synchronizeFile];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:data];
        [fileHandle closeFile];
    });
}
@end
