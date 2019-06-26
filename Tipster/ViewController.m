//
//  ViewController.m
//  Tipster
//
//  Created by panzaldo on 6/25/19.
//  Copyright © 2019 panzaldo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    // read the saved value for tip percent from Settings
    
    [self recalculateTip];
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    
    [self recalculateTip];
}

- (void)recalculateTip {
    
    double tipPercentage = 0.0;
    
    
    if(self.tipControl.selectedSegmentIndex < 3) {
        NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
        
        tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
        
        
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        tipPercentage = [defaults doubleForKey:@"userTip"] / 100;
        
    }
    
    double bill = [self.billField.text doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
    self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
     [UIView animateWithDuration:1 animations:^{
         self.tipLabel.alpha = 0;
     }];
    

    
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
    
}


@end
