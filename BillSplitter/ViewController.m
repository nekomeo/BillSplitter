//
//  ViewController.m
//  BillSplitter
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *totalAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *eachPaysLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.eachPaysLabel.text = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(id)sender
{
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc] initWithString:self.totalAmountTextField.text];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:self.numberOfPeopleSlider.value];
    NSDecimalNumber *eachPays = [billAmount decimalNumberByDividingBy:numberOfPeople];
    
    NSNumberFormatter *formatEachPays = [[NSNumberFormatter alloc] init];
    formatEachPays.numberStyle = NSNumberFormatterCurrencyStyle;
    
    self.eachPaysLabel.text = [NSString stringWithFormat:@"Each pays: %@", [formatEachPays stringFromNumber:eachPays]];
    
    NSLog(@"%@", eachPays);
}

- (IBAction)totalAmountTextField:(id)sender
{
}

- (IBAction)numberOfPeopleSlider:(id)sender
{
    
}

@end
