//
//  ViewController.m
//  Concurrence
//
//  Created by Yosnier on 03/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction) sincrono:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://img2.ruliweb.daum.net/mypi/gup/120/1772_2.jpg"];
    
    NSData *imgData = [NSData dataWithContentsOfURL:url];
    
    UIImage *img = [UIImage imageWithData:imgData];
    
    self.photo.image = img;
    
}


-(IBAction) asincrono :(id) sender {
    
    // Create a queue
    dispatch_queue_t gemelas = dispatch_queue_create("com.yos.concurrencia.cola1", 0);
    
    // le mando el bloque
    dispatch_async(gemelas, ^ {
        
        
        NSURL *url = [NSURL URLWithString:@"http://img2.ruliweb.daum.net/mypi/gup/120/1772_2.jpg"];
        
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        
        UIImage *img = [UIImage imageWithData:imgData];
        
        
        // Nos vamos al hilo principal a mostrar la gemela en la imageView
        dispatch_async(dispatch_get_main_queue(), ^ {
            self.photo.image = img;
        });
        
    });
}


-(IBAction) asincronoPro :(id) sender {
    
    [self withImage:^(UIImage *image) {
        self.photo.image = image;
        
    }];
    
}


- (void) withImage: (void (^)(UIImage *image)) completionBlock {
    
    //Nos vamos a segundo plano
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^ {
        
        NSURL *url = [NSURL URLWithString:@"http://img2.ruliweb.daum.net/mypi/gup/120/1772_2.jpg"];
        
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        
        UIImage *img = [UIImage imageWithData:imgData];
        
        // Nos vamos a primer plano a ejecutar el bloque de finalizacion
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            completionBlock(img);
        });
        
    });
}



@end
