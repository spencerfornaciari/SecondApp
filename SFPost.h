//
//  SFPost.h
//  PostApp
//
//  Created by Spencer Fornaciari on 10/21/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SFPost : NSObject

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;

@property (nonatomic) NSDate *timeStamp;

@property (nonatomic) NSArray *parseArray;

-(void)withParse;

@end
