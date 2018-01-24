//
//  HCLog.h
//  HCLogDemo
//
//  Created by ycb on 2018/1/23.
//  Copyright © 2018年 hc094. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogTool : NSObject

void YCBLog(NSString *format, ...) NS_FORMAT_FUNCTION(1, 2);

@end
