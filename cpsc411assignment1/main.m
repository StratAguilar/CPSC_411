//
//  main.m
//  cpsc411assignment1
//
//  Created by Stratton Aguilar on 8/25/14.
//  Copyright (c) 2014 Stratton Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        char input[30];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        
        NSLog(@"Please enter your input: ");
        fgets(input, 30, stdin);
        NSString *userInput = [NSString stringWithUTF8String: input];
        NSLog(@"Your string is %@\n", userInput);
        NSDate *now = [[NSDate alloc] init];
        [dateFormat setDateFormat:@"h:mm a"];
        NSString *time = [dateFormat stringFromDate:now];
        [dateFormat setDateFormat:@"EEE, MMM d, y"];
        NSString *date = [dateFormat stringFromDate:now];
        NSLog(@"The time is now %@\nToday's date is %@", time , date);
        
        
    }
    return 0;
}

