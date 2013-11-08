//
//  ViewController.m
//  reactivecocoaplay
//
//  Created by Jason on 11/6/13.
//
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* array = @[@1,@2, @3,@4];
    
    NSLog(@"%@",[[[array rac_sequence] map:^id(id value){ return [value stringValue];
    }]foldLeftWithStart:@"" reduce:^id(id accumulator,id value){ return [accumulator stringByAppendingString:value];
    }]);
    
    self.textField.delegate = self;
    
    [self.textField.rac_textSignal subscribeNext: ^(id x) { NSLog(@"%@", x); } error: ^(NSError *error){
        NSLog(@"%@ error", error);
    } completed: ^() {
        NSLog(@"complete");
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
