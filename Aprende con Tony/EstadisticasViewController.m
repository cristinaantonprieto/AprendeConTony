//
//  EstadisticasViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 18/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "EstadisticasViewController.h"

@interface EstadisticasViewController ()

@end

@implementation EstadisticasViewController

@synthesize juegoCasa, juegoCotidianas, juegoModales, juegoEmociones, context, persona;
@synthesize labelCasa, labelCotidianas, labelDni, labelEdad, labelEmociones, labelGeneral, labelModales, labelNombre, labelTipoAutismo;
@synthesize imagenUsuario;
@synthesize viewSkillCasa, viewSkillCotidianas, viewSkillEmociones, viewSkillGeneral, viewSkillModales, scrollView;
@synthesize barChartViewGeneral, barChartViewCasa,barChartViewCotidianas,barChartViewEmociones,barChartViewModales;


- (void)dealloc
{
    self.barChartViewGeneral.delegate=nil;
    self.barChartViewGeneral.dataSource = nil;
}



#pragma mark - View Lifecycle

- (void)loadView
{
    [super loadView];
    
    self.scrollView.scrollEnabled = YES;
    
    self.barChartViewGeneral = [[JBBarChartView alloc] init];
    self.barChartViewGeneral.frame = self.viewSkillGeneral.frame;
 
    self.barChartViewGeneral.delegate = self;
    self.barChartViewGeneral.dataSource = self;
    
    self.barChartViewGeneral.minimumValue = 0.0f;
    self.barChartViewGeneral.inverted = NO;
    self.barChartViewGeneral.backgroundColor = [UIColor redColor];
    
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    
    [self.viewSkillGeneral addSubview:self.barChartViewGeneral];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scrollView.scrollEnabled = YES;
    
    
    [self.barChartViewGeneral setState:JBChartViewStateExpanded];
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
   
  //  [self.barChartViewGeneral setState:JBChartViewStateCollapsed];
}

-(void)viewDidLayoutSubviews
{
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    [self.scrollView setContentOffset:CGPointZero];
    [super viewDidLayoutSubviews];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    

    [super viewDidAppear:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.scrollEnabled = YES;
    
    // Do any additional setup after loading the view.
    self.juegoCasa = self.persona.usuario_juegoCasa;
    self.juegoEmociones = self.persona.usuario_juegoEmociones;
    self.juegoModales = self.persona.usuario_juegoModales;
    self.juegoCotidianas = self.persona.usuario_juegoCotidianas;
    
      
    self.labelNombre.text = self.persona.nombre;
    self.labelDni.text = self.persona.dni;
    self.labelEdad.text = [self.persona.edad stringValue];
    self.labelTipoAutismo.text = self.persona.tipo_autismo;
    
    NSURL *referenceURL = self.persona.imagenUsuario;
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:referenceURL resultBlock:^(ALAsset *asset)
     {
         UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
         
         
         [self.imagenUsuario setImage:copyOfOriginalImage];
         self.imagenUsuario.contentMode = UIViewContentModeScaleAspectFit;
         
     }
            failureBlock:^(NSError *error)
     {
         // error handling
         NSLog(@"Error asignando foto...");
     }];

    self.barChartViewGeneral.tag = 1;
    self.barChartViewCasa.tag =2;
    self.barChartViewCotidianas.tag = 3;
    self.barChartViewModales.tag = 4;
    self.barChartViewEmociones.tag = 5;
    
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 2764)];
    
    [self.barChartViewGeneral reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - JBChartViewDataSource

- (BOOL)shouldExtendSelectionViewIntoHeaderPaddingForChartView:(JBChartView *)chartView
{
    return YES;
}

- (BOOL)shouldExtendSelectionViewIntoFooterPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

#pragma mark - JBBarChartViewDataSource

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    switch (barChartView.tag) {
        case 1://general
            return 10;
            break;
        case 2://casa
            return 3;
            break;
        case 3://cotidianas
            return 3;
            break;
        case 4://modales
            return 3;
            break;
        case 5://emociones
            return 3;
            break;
        default:
            break;
    }
    return 3;
}

- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
    
}

- (void)didDeselectBarChartView:(JBBarChartView *)barChartView
{
    
}

#pragma mark - JBBarChartViewDelegate

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    
#warning OJO HABRA VARIOS SKILLOMETER
    switch (barChartView.tag) {
        case 1://general
            switch (index) {
                case 0:
                    return 7.0f;
                    break;
                case 1:
                    return 5.0f;
                    break;
                case 2:
                    return 3.0f;
                    break;
                case 3:
                    return 9.0f;
                    break;
                case 4:
                    return 9.0f;
                    break;
                case 5:
                    return 9.0f;
                    break;
                case 6:
                    return 9.0f;
                    break;
                case 7:
                    return 9.0f;
                    break;
                case 8:
                    return 9.0f;
                    break;
                case 9:
                    return 9.0f;
                    break;
                default:
                    break;
            }
            break;
        case 2://casa
            switch (index) {
                case 0:
                    return 7.0f;
                    break;
                case 1:
                    return 5.0f;
                    break;
                case 2:
                    return 3.0f;
                    break;
                case 3:
                    return 9.0f;
                    break;
                default:
                    break;
            }
            break;
        case 3://cotidianas
            switch (index) {
                case 0:
                    return 7.0f;
                    break;
                case 1:
                    return 5.0f;
                    break;
                case 2:
                    return 3.0f;
                    break;
                case 3:
                    return 9.0f;
                    break;
                default:
                    break;
            }
            break;
        case 4://modales
            switch (index) {
                case 0:
                    return 7.0f;
                    break;
                case 1:
                    return 5.0f;
                    break;
                case 2:
                    return 3.0f;
                    break;
                case 3:
                    return 9.0f;
                    break;
                default:
                    break;
            }
            break;
        case 5://emociones
            switch (index) {
                case 0:
                    return 7.0f;
                    break;
                case 1:
                    return 5.0f;
                    break;
                case 2:
                    return 3.0f;
                    break;
                case 3:
                    return 9.0f;
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return 3;
    
    
    
    return 20.0f;
}

- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index
{
    
    return [UIColor yellowColor];
    //return (index % 2 == 0) ? kJBColorBarChartBarBlue : kJBColorBarChartBarGreen;
}

- (UIColor *)barSelectionColorForBarChartView:(JBBarChartView *)barChartView
{
    return [UIColor whiteColor];
}
//
//- (CGFloat)barPaddingForBarChartView:(JBBarChartView *)barChartView
//{
//    return kJBBarChartViewControllerBarPadding;
//}

#pragma mark - Buttons

//- (void)chartToggleButtonPressed:(id)sender
//{
//    UIView *buttonImageView = [self.navigationItem.rightBarButtonItem valueForKey:kJBBarChartViewControllerNavButtonViewKey];
//    buttonImageView.userInteractionEnabled = NO;
//
//    CGAffineTransform transform = self.barChartView.state == JBChartViewStateExpanded ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
//    buttonImageView.transform = transform;
//
//    [self.barChartView setState:self.barChartView.state == JBChartViewStateExpanded ? JBChartViewStateCollapsed : JBChartViewStateExpanded animated:YES callback:^{
//        buttonImageView.userInteractionEnabled = YES;
//    }];
//}

#pragma mark - Overrides

- (JBChartView *)chartView
{
    return self.barChartViewGeneral;
}

@end
