//
//  PIXDateTests.m
//  PIXDateTests
//
//  Created by dolphin su on 07/24/2014.
//  Copyright (c) 2014 dolphin su. All rights reserved.
//
#import "NSDate+PIXCategory.h"

SpecBegin(InitialSpecs)
/*
(@"these will fail", ^{

    it(@"can do maths", ^{
        expect(1).to.equal(2);
    });

    it(@"can read", ^{
        expect(@"number").to.equal(@"string");
    });
    
    it(@"will wait and fail", ^AsyncBlock {
        
    });
});
*/
/*
describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
    
    it(@"will wait and succeed", ^AsyncBlock {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            done();
        });
    });
});
        */
        describe(@"these should pass", ^{
            NSNumber *oneMinute = [NSNumber numberWithDouble:60];
            NSNumber *thirtyMinutes = [NSNumber numberWithDouble:[oneMinute doubleValue]*30];
            NSNumber *oneHour = [NSNumber numberWithDouble:60*60];
            NSNumber *oneDay = [NSNumber numberWithDouble:60*60*24];
            NSNumber *oneWeek = [NSNumber numberWithDouble:60*60*24*7];
            NSNumber *oneMonth = [NSNumber numberWithDouble:60*60*24*30];
            NSNumber *oneYear = [NSNumber numberWithDouble:60*60*24*365];
            NSNumber *twoYear = [NSNumber numberWithDouble:60*60*24*365*2];

            NSArray *types = @[oneMinute, thirtyMinutes, oneHour, oneDay, oneWeek, oneMonth, oneYear, twoYear];
            for(NSNumber *number in types) {
                NSDate *earlierDate = [NSDate dateWithTimeIntervalSinceNow:(-[number doubleValue])];
                NSString *intervalString = [NSDate PIXTimeIntervalStringDistanceNowFromTimeInterval1970:[earlierDate timeIntervalSince1970]];
                expect(intervalString).notTo.beNil();
                NSLog(@"time interval %@ seconds", number);
                NSLog(@"intervalString: %@", intervalString);
            }
        });
        describe(@"these should not pass", ^{
            NSDate *futureDate = [NSDate dateWithTimeIntervalSinceNow:600];
            NSTimeInterval futureInterval = [futureDate timeIntervalSince1970];
            NSString *intervalString = [NSDate PIXTimeIntervalStringDistanceNowFromTimeInterval1970:futureInterval];
            expect(intervalString).to.beNil();
//            NSLog(@"future interval: %@", intervalString);
        });
SpecEnd
