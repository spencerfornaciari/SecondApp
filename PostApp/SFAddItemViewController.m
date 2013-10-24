//
//  SFAddItemViewController.m
//  PostApp
//
//  Created by Spencer Fornaciari on 10/23/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import "SFAddItemViewController.h"
#import "SFPostController.h"

@interface SFAddItemViewController ()

@end

@implementation SFAddItemViewController
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveContent:(id)sender {
    
    PFObject *addPost = [PFObject objectWithClassName:@"PostObject"];
    addPost[@"userName"] = self.submitUsername.text;
    addPost[@"title"] = self.submitTitle.text;
    addPost[@"content"] = self.submitContent.text;
    [addPost saveInBackground];
    
    SFPost *newPost = [[SFPost alloc] init];
    newPost.userName = self.submitUsername.text;
    newPost.title = self.submitTitle.text;
    newPost.content = self.submitContent.text;
    newPost.timeStamp = [NSDate date];
    
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"h:mm a 'on' MM/dd/yyyy"];
    //NSString *postDate = [dateFormatter stringFromDate:newPost.timeStamp];
    
    //PFObject *newSFPost = [PFObject objectWithClassName:@"PostObject"];
    //newSFPost[@"userName"] = addSFPost.userName;
    //newSFPost[@"title"] = addSFPost.title;
    //newSFPost[@"content"] = addSFPost.content;
    //newSFPost.createdAt = postDate;
    
    //[self.posts addObject:addPost];
    
    NSLog(@"2nd view: %@", newPost);
    //NSLog(@"2nd view count: %d", self.postArray.count);
    
    [self.delegate addPostToList:newPost];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
