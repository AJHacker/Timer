//
//  ViewController.h
//  TIMER
//
//  Created by Arihant Jain on 8/6/12.
//  Copyright (c) 2012 DMA. All rights reserved.
//

#import <UIKit/UIKit.h>
#define FileName @"data.plist"
@interface ViewController : UIViewController{
IBOutlet UILabel *secondLabel;
IBOutlet UIStepper *secondStep;
    IBOutlet UIView *myview;
IBOutlet   UIProgressView *progressbar;
NSTimer *mytimer;
}

-(IBAction)button:(id)sender;
-(IBAction)updatevalue:(id)sender;
-(void) secondspassed;
-(NSString*)dataFilePath;
-(void)saveFile;
@end
