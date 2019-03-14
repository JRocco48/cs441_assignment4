//
//  ViewController.m
//  Sudoku Solver
//
//  Created by John Rocco on 3/11/19.
//  Copyright © 2019 John Rocco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *solveButton;
@property (weak, nonatomic) IBOutlet UITextField *cell0;
@property (weak, nonatomic) IBOutlet UITextField *cell1;
@property (weak, nonatomic) IBOutlet UITextField *cell2;
@property (weak, nonatomic) IBOutlet UITextField *cell3;
@property (weak, nonatomic) IBOutlet UITextField *cell4;
@property (weak, nonatomic) IBOutlet UITextField *cell5;
@property (weak, nonatomic) IBOutlet UITextField *cell6;
@property (weak, nonatomic) IBOutlet UITextField *cell7;
@property (weak, nonatomic) IBOutlet UITextField *cell8;

@property (weak, nonatomic) IBOutlet UITextField *cell9;
@property (weak, nonatomic) IBOutlet UITextField *cell10;
@property (weak, nonatomic) IBOutlet UITextField *cell11;
@property (weak, nonatomic) IBOutlet UITextField *cell12;
@property (weak, nonatomic) IBOutlet UITextField *cell13;
@property (weak, nonatomic) IBOutlet UITextField *cell14;
@property (weak, nonatomic) IBOutlet UITextField *cell15;
@property (weak, nonatomic) IBOutlet UITextField *cell16;
@property (weak, nonatomic) IBOutlet UITextField *cell17;

@property (weak, nonatomic) IBOutlet UITextField *cell18;
@property (weak, nonatomic) IBOutlet UITextField *cell19;
@property (weak, nonatomic) IBOutlet UITextField *cell20;
@property (weak, nonatomic) IBOutlet UITextField *cell21;
@property (weak, nonatomic) IBOutlet UITextField *cell22;
@property (weak, nonatomic) IBOutlet UITextField *cell23;
@property (weak, nonatomic) IBOutlet UITextField *cell24;
@property (weak, nonatomic) IBOutlet UITextField *cell25;
@property (weak, nonatomic) IBOutlet UITextField *cell26;

@property (weak, nonatomic) IBOutlet UITextField *cell27;
@property (weak, nonatomic) IBOutlet UITextField *cell28;
@property (weak, nonatomic) IBOutlet UITextField *cell29;
@property (weak, nonatomic) IBOutlet UITextField *cell30;
@property (weak, nonatomic) IBOutlet UITextField *cell31;
@property (weak, nonatomic) IBOutlet UITextField *cell32;
@property (weak, nonatomic) IBOutlet UITextField *cell33;
@property (weak, nonatomic) IBOutlet UITextField *cell34;
@property (weak, nonatomic) IBOutlet UITextField *cell35;

@property (weak, nonatomic) IBOutlet UITextField *cell36;
@property (weak, nonatomic) IBOutlet UITextField *cell37;
@property (weak, nonatomic) IBOutlet UITextField *cell38;
@property (weak, nonatomic) IBOutlet UITextField *cell39;
@property (weak, nonatomic) IBOutlet UITextField *cell40;
@property (weak, nonatomic) IBOutlet UITextField *cell41;
@property (weak, nonatomic) IBOutlet UITextField *cell42;
@property (weak, nonatomic) IBOutlet UITextField *cell43;
@property (weak, nonatomic) IBOutlet UITextField *cell44;

@property (weak, nonatomic) IBOutlet UITextField *cell45;
@property (weak, nonatomic) IBOutlet UITextField *cell46;
@property (weak, nonatomic) IBOutlet UITextField *cell47;
@property (weak, nonatomic) IBOutlet UITextField *cell48;
@property (weak, nonatomic) IBOutlet UITextField *cell49;
@property (weak, nonatomic) IBOutlet UITextField *cell50;
@property (weak, nonatomic) IBOutlet UITextField *cell51;
@property (weak, nonatomic) IBOutlet UITextField *cell52;
@property (weak, nonatomic) IBOutlet UITextField *cell53;

@property (weak, nonatomic) IBOutlet UITextField *cell54;
@property (weak, nonatomic) IBOutlet UITextField *cell55;
@property (weak, nonatomic) IBOutlet UITextField *cell56;
@property (weak, nonatomic) IBOutlet UITextField *cell57;
@property (weak, nonatomic) IBOutlet UITextField *cell58;
@property (weak, nonatomic) IBOutlet UITextField *cell59;
@property (weak, nonatomic) IBOutlet UITextField *cell60;
@property (weak, nonatomic) IBOutlet UITextField *cell61;
@property (weak, nonatomic) IBOutlet UITextField *cell62;

@property (weak, nonatomic) IBOutlet UITextField *cell63;
@property (weak, nonatomic) IBOutlet UITextField *cell64;
@property (weak, nonatomic) IBOutlet UITextField *cell65;
@property (weak, nonatomic) IBOutlet UITextField *cell66;
@property (weak, nonatomic) IBOutlet UITextField *cell67;
@property (weak, nonatomic) IBOutlet UITextField *cell68;
@property (weak, nonatomic) IBOutlet UITextField *cell69;
@property (weak, nonatomic) IBOutlet UITextField *cell70;
@property (weak, nonatomic) IBOutlet UITextField *cell71;

@property (weak, nonatomic) IBOutlet UITextField *cell72;
@property (weak, nonatomic) IBOutlet UITextField *cell73;
@property (weak, nonatomic) IBOutlet UITextField *cell74;
@property (weak, nonatomic) IBOutlet UITextField *cell75;
@property (weak, nonatomic) IBOutlet UITextField *cell76;
@property (weak, nonatomic) IBOutlet UITextField *cell77;
@property (weak, nonatomic) IBOutlet UITextField *cell78;
@property (weak, nonatomic) IBOutlet UITextField *cell79;
@property (weak, nonatomic) IBOutlet UITextField *cell80;

@end

int sudoku[81];
NSArray * textFieldArray;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textFieldArray = [_cell0, _cell1, _cell2, _cell3, _cell4, _cell5];
}

- (bool)isValid:(int) value ind:(int) index {
    
    //check if value exists in index's row
    int rowBegin = floor(index / 9)*9;
    for(int i = rowBegin; i < rowBegin + 9; i++) {
        if(sudoku[i] == value) return false;
    }
    
    //check if value exists in index's column
    int colBegin = index % 9;
    for(int i = colBegin; i < colBegin + 72; i+=9) {
        if(sudoku[i] == value) return false;
    }
    
    //check if value exists in index's 3x3 box
    int row = (rowBegin/9) - ((rowBegin/9)%3);
    int col = colBegin - (colBegin%3);
    for(int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (sudoku[(row+i)*9 + (col+j)] == value) return false;
        }
    }
    return true;
}

- (int)findEmpty {
    for(int i = 0; i < 81; i++) {
        if(sudoku[i] == 0) return i;
    }
    return -1;
}

- (bool)isComplete {
    for(int i = 0; i < 81; i++) {
        if(sudoku[i] == 0) return false;
    }
    return true;
}

- (bool)solve {
    if([self isComplete]) return true;
    int index = [self findEmpty];
    for(int i = 1; i < 10; i++) {
        if([self isValid:i ind:index]) {
            sudoku[index] = i;
            if([self solve]) {
                return true;
            }
            sudoku[index] = 0;
        }
    }
    return false;
}

- (IBAction)solveButton:(id)sender {
    int i = 0;
    for(UITextField * x in textFieldArray) {
        if([x.text isEqual: @""]) {
            sudoku[i] = 0;
        } else {
            sudoku[i] = x.text.intValue;
        }
        i++;
    }
    [self solve];
    i = 0;
    for(UITextField * x in textFieldArray) {
        x.text = @"hi";
        i++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
