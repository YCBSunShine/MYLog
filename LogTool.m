//
//  HCLog.m
//  HCLogDemo
//
//  Created by ycb on 2018/1/23.
//  Copyright © 2018年 hc094. All rights reserved.
//

#import "LogTool.h"
#import "LogAide.h"

@implementation LogTool
void YCBLog(NSString *format, ...)
{
    va_list argp ;
    va_start(argp, format);
    NSString *contentStr = [[NSString alloc] initWithFormat:format arguments:argp];
    writeLocal(contentStr);
    va_end(argp);
}

void writeLocal(NSString *format)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    format = [nowtimeStr stringByAppendingString:[NSString stringWithFormat:@"%@\n", format]];
#if DEBUG
    printf("%s", [format UTF8String]);
#endif
    LogAide *la = [LogAide shareInstance];
    [la writeLog:format];
}
@end
