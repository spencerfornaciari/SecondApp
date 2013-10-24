//
//  SFPost.m
//  PostApp
//
//  Created by Spencer Fornaciari on 10/21/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import "SFPost.h"

@implementation SFPost

-(void)withParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"PostObject"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.parseArray = objects;
            NSLog(@"Successfully retrieved %d posts.", objects.count);
            NSLog(@"Successfully retrieved %@", self.parseArray[1][@"content"]);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
