//
//  STRWord.m
//  cpsc411assignment3
//
//  Created by Stratton Aguilar on 9/1/14.
//  Copyright (c) 2014 Stratton Aguilar. All rights reserved.
//

#import "STRWord.h"

@implementation STRWord

-(id)initWithWord:(NSString *)aWord {
    self = [super init];
    if (self) {
        _word = [aWord copy]; // use retain while not using arc
        _hashVal = [self getHashValue:aWord];
    }
    return self;
}

-(long)getHashValue:(NSString *)StringToHash{
    long num1 = 0;
    long num2 = 0;
    long num3 = 0;

    for(int i = 0; i < [StringToHash length]; i++)
    {
        int ascii = [StringToHash characterAtIndex:i];
        
        if(ascii > 96 && ascii < 106)
        {
            num1 += pow(10, (ascii - 96));
        }
        else if(ascii > 105 && ascii < 115)
        {
            num2 += pow(10, (ascii - 106));
        }
        else if(ascii > 114 && ascii < 123)
        {
            num3 += pow(10, (ascii - 115));
        }
        else
        {
            
        }
    }
    num1 *= 193;
    num2 *= 769;
    num3 *= 3079;
    
    return  num1 + num2 + num3;
}
@end
