//
//  NSDate+PIXCategory.m
//  PIXDate
//
//  Created by Dolphin Su on 7/24/14.
//  Copyright (c) 2014 dolphin su. All rights reserved.
//
typedef NS_ENUM(NSInteger, PIXTimeIntervalType) {
    PIXTimeIntervalTypeUnderHalfAnHour,
    PIXTimeIntervalTypeUnderOneHour,
    PIXTimeIntervalTypeUnderOneDay,
    PIXTimeIntervalTypeUnderOneWeek,
    PIXTimeIntervalTypeUnderOneMonth,
    PIXTimeIntervalTypeUnderOneYear,
    PIXTimeIntervalTypeOverOneYear
};
static const NSTimeInterval kHour1 = 60*60;
static const NSTimeInterval kDay1 = kHour1*24;
static const NSTimeInterval kWeek1 = kDay1*7;
static const NSTimeInterval kMonth1 = kDay1*30;
static const NSTimeInterval kYear1 = kDay1*365;

#import "NSDate+PIXCategory.h"

@implementation NSDate (PIXCategory)
#pragma mark PIXTimeIntervalStringDistanceNowFromTimeInterval1970:
+ (NSString *)PIXTimeIntervalStringDistanceNowFromTimeInterval1970:(NSTimeInterval)earlierTimeInterval {
    NSString *intervalString;
    NSDate *nowDate = [NSDate date];
    NSTimeInterval nowIntervalInt = [nowDate timeIntervalSince1970];
    NSTimeInterval distance = nowIntervalInt - earlierTimeInterval;
    if (distance<0) {
        return intervalString;
    }
    PIXTimeIntervalType type = [NSDate timeIntervalTypeByDistance:distance];
    NSString *unitString = [NSDate unitStringWithTimeIntervalType:type];
    NSString *unitValue = [NSDate unitValueWithDistance:distance];
    intervalString = [NSString stringWithFormat:@"%@%@", unitValue, unitString];
    return intervalString;
}
+(NSString *)unitValueWithDistance:(NSTimeInterval)distance{
    NSString * value = nil;
    PIXTimeIntervalType type = [NSDate timeIntervalTypeByDistance:distance];
    switch (type) {
        case PIXTimeIntervalTypeUnderHalfAnHour:{
            value = [NSString stringWithFormat:@"%i", (int)(distance / 60.0)];
            break;
        }
        case PIXTimeIntervalTypeUnderOneHour:{
            value = @"半";
            break;
        }
        case PIXTimeIntervalTypeUnderOneDay:{
            value = [NSString stringWithFormat:@"%i", (int)(distance / kHour1)];
            break;
        }
        case PIXTimeIntervalTypeUnderOneWeek:{
            value = [NSString stringWithFormat:@"%i", (int)(distance / kDay1)];
            break;
        }
        case PIXTimeIntervalTypeUnderOneMonth:{
            value = [NSString stringWithFormat:@"%i", (int)(distance / kWeek1)];
            break;
        }
        case PIXTimeIntervalTypeUnderOneYear:{
            value = [NSString stringWithFormat:@"%i", (int)(distance / kMonth1)];
            break;
        }
        case PIXTimeIntervalTypeOverOneYear:
            value = [NSString stringWithFormat:@"%i", (int)(distance / kYear1)];
            break;

        default: {
            break;
        }
    }
    return value;
}
+(NSString *)unitStringWithTimeIntervalType:(PIXTimeIntervalType)type{
    NSString *unit = nil;
    switch (type) {
        case PIXTimeIntervalTypeUnderHalfAnHour:{
            unit = @"分鐘前";
            break;
        }
        case PIXTimeIntervalTypeUnderOneHour:
        case PIXTimeIntervalTypeUnderOneDay:{
            unit = @"小時前";
            break;
        }
        case PIXTimeIntervalTypeUnderOneWeek:{
            unit = @"天前";
            break;
        }
        case PIXTimeIntervalTypeUnderOneMonth:{
            unit = @"個禮拜前";
            break;
        }
        case PIXTimeIntervalTypeUnderOneYear:{
            unit = @"個月前";
            break;
        }
        case PIXTimeIntervalTypeOverOneYear:{
            unit = @"年前";
            break;
        }
        default: {
            break;
        }
    }
    return unit;
}
+(PIXTimeIntervalType)timeIntervalTypeByDistance:(NSTimeInterval)distance{
    PIXTimeIntervalType type = 0;
    NSArray *types = @[@(kHour1/2),@(kHour1), @(kDay1), @(kWeek1), @(kMonth1), @(kYear1)];
    for (NSNumber *typeNumber in types) {
        NSTimeInterval typeValue = [typeNumber doubleValue];
        if (distance > typeValue) {
            type++;
        }
    }
    return type;
}

@end
