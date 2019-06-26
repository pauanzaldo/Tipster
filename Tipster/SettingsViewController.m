//
//  SettingsViewController.m
//  Tipster
//
//  Created by panzaldo on 6/25/19.
//  Copyright © 2019 panzaldo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *customTipField;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
  
    }


//Save the UserDefault


    
- (IBAction)onEdit:(id)sender {
    double customTip = [self.customTipField.text doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setDouble:customTip forKey:@"userTip"];
    
    [defaults synchronize];
    
    NSLog(@"I saved the custom tip!");

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
