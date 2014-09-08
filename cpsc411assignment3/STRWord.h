//
//  STRWord.h
//  cpsc411assignment3
//
//  Created by Stratton Aguilar on 9/1/14.
//  Copyright (c) 2014 Stratton Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STRWord : NSObject
@property (nonatomic) NSString *word;
@property (nonatomic) unsigned long hashVal;

-(long)getHashValue:(NSString *)StringToHash;
-(id)initWithWord:(NSString *)aWord;

@end
