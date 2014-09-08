//
//  main.m
//  cpsc411assignment3
//
//  Created by Stratton Aguilar on 9/1/14.
//  Copyright (c) 2014 Stratton Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STRWord.h"

long GetLongestRepeatedValue(NSArray* sortedArray);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *arrayOfWords = [[NSMutableArray alloc]init];
        NSMutableArray *longestAnagramList = [[NSMutableArray alloc]init];
        
        char input[512];
        //NSString *file2 = @"/Users/rabbitofalice/Documents/CSUF/CSUF_Fall_2014/CPSC_411/projects/cpsc411assignment3/cpsc411assignment3/words.txt"; // absolute path to file
        NSLog(@" Please enter the file path: ");
        fgets(input, sizeof(input), stdin);
        NSString *file = [[NSString stringWithCString:(input) encoding:(NSUTF8StringEncoding)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        NSError *error;
        NSString *contentsOfFile = [NSString stringWithContentsOfFile:file
                                                             encoding:NSUTF8StringEncoding
                                                                error:&error];
        if(error) // error for opening file
        {
            NSLog(@"Error %@", error.localizedDescription);
        }
        else
        {
            NSDate *start = [NSDate date]; // starting value for timer
            contentsOfFile = [contentsOfFile lowercaseString]; // format words to array in lowercase
            NSArray *words = [contentsOfFile componentsSeparatedByString:@"\n"];
        
            for(NSString *word in words) // create the array of class items from array of words
            {
                STRWord *newWord = [[STRWord alloc]initWithWord:word];
                [arrayOfWords addObject:newWord];
            }
        
            // sort words according to hashed long value
            NSSortDescriptor *hashValDescriptor = [[NSSortDescriptor alloc] initWithKey:@"hashVal" ascending:YES];
            NSArray *sortedArray = [NSArray arrayWithObjects:hashValDescriptor, nil];
            [arrayOfWords sortUsingDescriptors:sortedArray];
        
            //function call to retrieve hashvalue that repeats the most
            long longestValue = GetLongestRepeatedValue(arrayOfWords);
        
            //fill array with words matching hashvalue
            for(STRWord *word in arrayOfWords)
            {
                if(word.hashVal == longestValue)
                {
                    [longestAnagramList addObject:word.word];
                }
            }
        
            //print array with words matching hash value
            NSLog(@"The words with the longest anagram for the dictionary are:");
            for(NSString* word in longestAnagramList)
            {
                NSLog(@"%@", word);
            }
        
            NSTimeInterval timeInterval = -[start timeIntervalSinceNow];
            NSLog(@"This algorithm ran in %g seconds", timeInterval);
            NSLog(@"The processor that I am using is a 2.4 GHz Intel Core 2 Duo");
        }

    }
    return 0;
} // end main

//----GetLongestRepeatedValue--------------------------------------------------
//
// Input: a sorted NSArray of long Values
//
// Output: long value that repeats the most in array
//
// Description: The function loops through a sorted array finds a long value
//              that is repeat the most in the array
//-----------------------------------------------------------------------------
long GetLongestRepeatedValue(NSArray* sortedArray)
{
    int maxCount = 0;
    int count = 0;
    long lastValue = 0;
    long returnValue = 0;
    
    for(STRWord *word in sortedArray)
    {
        if(count == 0)
        {
            lastValue = word.hashVal;
        }
        
        
        if(word.hashVal == lastValue)
        {
            count += 1;
        }
        else
        {
            count = 1;
        }
        
        if(count > maxCount)
        {
            maxCount = count;
            returnValue = word.hashVal;
        }
        lastValue = word.hashVal;
    }

    return returnValue;
} // end GetLongestRepeatedValue
