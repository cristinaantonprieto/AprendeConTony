//
//  JuegoEmparejarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoEmparejarViewController.h"

@interface JuegoEmparejarViewController ()

@end

@implementation JuegoEmparejarViewController

@synthesize juegoCasa, nombreJuego, nombreNivel;
@synthesize context, usuarioSeleccionado, numDificultad;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"juego emparejar view did load....");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
