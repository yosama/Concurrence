//
//  ViewController.h
//  Concurrence
//
//  Created by Yosnier on 03/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *photo;



-(IBAction) sincrono:(id)sender;
-(IBAction) asincrono :(id) sender;
-(IBAction) asincronoPro :(id) sender;

@end

