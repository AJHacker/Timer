//
//  ViewController.m
//  TIMER
//
//  Created by Arihant Jain on 8/6/12.
//  Copyright (c) 2012 DMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(NSString*) dataFilePath{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:FileName];
}
-(void) saveFile{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSNumber *stepperValue = [[NSNumber alloc] initWithInt: secondStep.value];
    [array addObject:stepperValue];
    [array writeToFile:[self dataFilePath] atomically:YES];
    //[array dealloc];
}
  -(IBAction)button:(id)sender{
    mytimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(secondspassed) userInfo:nil repeats:YES];
}
-(IBAction)updatevalue:(id)sender{
    int value = secondStep.value;
    NSString *secondstring = [[NSString alloc] initWithFormat:@"%d",value];
    [secondLabel setText:secondstring];

}
-(void)secondspassed{
    if (secondStep.value <=0) {
       [mytimer invalidate];
        myview.backgroundColor= [UIColor yellowColor];
               
    }
        
    else{
        secondStep.value= secondStep.value -1;
        [progressbar setProgress:secondStep.value/100 animated:YES];
    }
    
    [self updatevalue:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [self dataFilePath];
    if( [[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        
       NSMutableArray *array = [[NSMutableArray alloc]
                                initWithContentsOfFile:filePath];
      
    
        NSNumber *stepperValue = [[NSNumber alloc] init];
      
    stepperValue = [array objectAtIndex:0];
        [secondStep setValue:[stepperValue intValue]];
     [self updatevalue:nil];
   }
    } 
         
        

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
