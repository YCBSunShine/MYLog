//
//  HCLog.h
//  HCLogDemo
//
//  Created by ycb on 2018/1/23.
//  Copyright © 2018年 hc094. All rights reserved.
//

#ifndef MYLog_h
#define MYLog_h

#import "LogTool.h"

#define MYLOG(format, ...) YCBLog((@" -- %s -- [Line %d]:\n" format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif /* MYLog_h */
