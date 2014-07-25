//
//  NSDate+PIXCategory.h
//  PIXDate
//
//  Created by Dolphin Su on 7/24/14.
//  Copyright (c) 2014 dolphin su. All rights reserved.
//



@interface NSDate (PIXCategory)
/**
 *  從 1970 開始的 time stamp 產生一個"多久以前"的字串
 *
 *  @param earlierTimeInterval 1970 開始的 time stamp
 *
 *  @return "多久之前"的字串
 */
+(NSString *)PIXTimeIntervalStringDistanceNowFromTimeInterval1970:(NSTimeInterval)earlierTimeInterval;
@end
