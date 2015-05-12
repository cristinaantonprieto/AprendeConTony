//
//  ConfiguracionCaracteristicasJuegosViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 11/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "ConfiguracionCaracteristicasJuegosViewController.h"

@interface ConfiguracionCaracteristicasJuegosViewController ()

@end

@implementation ConfiguracionCaracteristicasJuegosViewController

@synthesize nuevoUsuario, nombreJuego, context, usuarioSeleccionado, labelnombrejuego;
@synthesize voztextfield, pictostextfield, num_dificultadtextfield, num_niveltextfield, numfallos_emparejar, numfallos_ordenar, numfallos_seleccionar, tiempototaltextfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** FIJAR BOTON GUARDAR USUARIO **/
    UIButton *buttonSave =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSave setImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    [buttonSave addTarget:self action:@selector(goToGuardarUsuarioViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonSave setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithCustomView:buttonSave];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    
    [self.navigationItem.backBarButtonItem setAction:@selector(backActionButton)];
    
    //cargar label
    self.labelnombrejuego.text = self.nombreJuego;
    
    //cargar segun nuevo usuario o no
    //cargar juego correspondiente
    if ([self.nombreJuego isEqualToString:@"En casa"]) {
        
        JuegoCasa *juegocasa = self.usuarioSeleccionado.usuario_juegoCasa;
        
        if (juegocasa.voz.intValue == 0) {
            self.voztextfield.text = @"NO";
        }else
        {
            self.voztextfield.text = @"SI";
        }
     
        if (juegocasa.guionPictos.intValue ==0) {
            self.pictostextfield.text = @"NO";
        }else
        {
            self.pictostextfield.text=@"SI";
        }
        
    
        self.num_niveltextfield.text = [juegocasa.num_nivel stringValue];
        self.numfallos_ordenar.text = [juegocasa.num_fallos_ordenar stringValue];
        self.numfallos_seleccionar.text = [juegocasa.num_fallos_seleccionar stringValue];
        self.numfallos_emparejar.text = [juegocasa.num_fallos_emparejar stringValue];
        if (juegocasa.num_dificultad.intValue == 3) {
            self.num_dificultadtextfield.text = @"mayor";
        }else if(juegocasa.num_dificultad.intValue==2)
        {
            self.num_dificultadtextfield.text = @"media";
        }else
        {
            self.num_dificultadtextfield.text = @"menor";
        }
        
        self.tiempototaltextfield.text = [juegocasa.tiempoTotal stringValue];
    }
    else if ([self.nombreJuego isEqualToString:@"Situaciones cotidianas"]) {
        JuegoCotidianas *juegocotidianas = self.usuarioSeleccionado.usuario_juegoCotidianas;
        
        if (juegocotidianas.voz.intValue == 0) {
            self.voztextfield.text = @"NO";
        }else
        {
            self.voztextfield.text = @"SI";
        }
        
        if (juegocotidianas.guionPictos.intValue ==0) {
            self.pictostextfield.text = @"NO";
        }else
        {
            self.pictostextfield.text=@"SI";
        }

        
        self.num_niveltextfield.text = [juegocotidianas.num_nivel stringValue];
        self.numfallos_ordenar.text = [juegocotidianas.num_fallos_ordenar stringValue];
        self.numfallos_seleccionar.text = [juegocotidianas.num_fallos_seleccionar stringValue];
        self.numfallos_emparejar.text = [juegocotidianas.num_fallos_emparejar stringValue];
        if (juegocotidianas.num_dificultad.intValue == 3) {
            self.num_dificultadtextfield.text = @"mayor";
        }else if(juegocotidianas.num_dificultad.intValue==2)
        {
            self.num_dificultadtextfield.text = @"media";
        }else
        {
            self.num_dificultadtextfield.text = @"menor";
        }
        self.tiempototaltextfield.text = [juegocotidianas.tiempoTotal stringValue];
    }
    else if ([self.nombreJuego isEqualToString:@"Buenos modales"]) {
        
        JuegoModales *juegomodales = self.usuarioSeleccionado.usuario_juegoModales;
        
        if (juegomodales.voz.intValue == 0) {
            self.voztextfield.text = @"NO";
        }else
        {
            self.voztextfield.text = @"SI";
        }
        
        if (juegomodales.guionPictos.intValue ==0) {
            self.pictostextfield.text = @"NO";
        }else
        {
            self.pictostextfield.text=@"SI";
        }

       
        self.num_niveltextfield.text = [juegomodales.num_nivel stringValue];
        self.numfallos_ordenar.text = [juegomodales.num_fallos_ordenar stringValue];
        self.numfallos_seleccionar.text = [juegomodales.num_fallos_seleccionar stringValue];
        self.numfallos_emparejar.text = [juegomodales.num_fallos_emparejar stringValue];
        if (juegomodales.num_dificultad.intValue == 3) {
            self.num_dificultadtextfield.text = @"mayor";
        }else if(juegomodales.num_dificultad.intValue==2)
        {
            self.num_dificultadtextfield.text = @"media";
        }else
        {
            self.num_dificultadtextfield.text = @"menor";
        }
        self.tiempototaltextfield.text = [juegomodales.tiempoTotal stringValue];
    }
    else if ([self.nombreJuego isEqualToString:@"Emociones"]) {
        
        JuegoEmociones *juegoemociones = self.usuarioSeleccionado.usuario_juegoEmociones;
        
        if (juegoemociones.voz.intValue == 0) {
            self.voztextfield.text = @"NO";
        }else
        {
            self.voztextfield.text = @"SI";
        }
        
        if (juegoemociones.guionPictos.intValue ==0) {
            self.pictostextfield.text = @"NO";
        }else
        {
            self.pictostextfield.text=@"SI";
        }

        self.num_niveltextfield.text = [juegoemociones.num_nivel stringValue];
        self.numfallos_ordenar.text = [juegoemociones.num_fallos_ordenar stringValue];
        self.numfallos_seleccionar.text = [juegoemociones.num_fallos_seleccionar stringValue];
        self.numfallos_emparejar.text = [juegoemociones.num_fallos_emparejar stringValue];
        if (juegoemociones.num_dificultad.intValue == 3) {
            self.num_dificultadtextfield.text = @"mayor";
        }else if(juegoemociones.num_dificultad.intValue==2)
        {
            self.num_dificultadtextfield.text = @"media";
        }else
        {
            self.num_dificultadtextfield.text = @"menor";
        }
        self.tiempototaltextfield.text = [juegoemociones.tiempoTotal stringValue];
    }
    
    
}

-(void)backActionButton
{
    
    //Persistimos el objeto
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    configurarUsuarioViewController.context = self.context;
    configurarUsuarioViewController.nuevoUsuario = self.nuevoUsuario;
    configurarUsuarioViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuarioViewController animated:YES];
}

-(IBAction)goToGuardarUsuarioViewController:(id)sender
{

    if ([self.nombreJuego isEqualToString:@"En casa"]) {
        
        //Cumplimentamos los atributos del mismo
        JuegoCasa *juegoCasa = self.usuarioSeleccionado.usuario_juegoCasa;
        
        if ([self.voztextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoCasa setVoz: [NSNumber numberWithInt:0]];
        }else{
            [juegoCasa setVoz:[NSNumber numberWithInt:1]];
        }
        
        
        
        if ([self.pictostextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoCasa setGuionPictos: [NSNumber numberWithInt:0]];
        }else{
            [juegoCasa setGuionPictos:[NSNumber numberWithInt:1]];
        }
        
        
        NSNumberFormatter *fnivel = [[NSNumberFormatter alloc] init];
        fnivel.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mynivel = [fnivel numberFromString:self.num_niveltextfield.text];
        [juegoCasa setNum_nivel:mynivel];
        
        NSNumberFormatter *ffalloss = [[NSNumberFormatter alloc] init];
        ffalloss.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallossel = [ffalloss numberFromString:self.numfallos_seleccionar.text];
        [juegoCasa setNum_fallos_seleccionar:myfallossel];
        
        NSNumberFormatter *ffallose = [[NSNumberFormatter alloc] init];
        ffallose.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallosem = [ffallose numberFromString:self.numfallos_emparejar.text];
        [juegoCasa setNum_fallos_emparejar:myfallosem];
        
        NSNumberFormatter *ffalloso = [[NSNumberFormatter alloc] init];
        ffalloso.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfalloso = [ffalloso numberFromString:self.numfallos_ordenar.text];
        [juegoCasa setNum_fallos_ordenar:myfalloso];
        
        NSLog(@"self.numdif.text = %@", self.num_dificultadtextfield.text);
        if ([self.num_dificultadtextfield.text isEqualToString:@"mayor"]||[self.num_dificultadtextfield.text isEqualToString:@"MAYOR"]) {
            
            [juegoCasa setNum_dificultad:[NSNumber numberWithInt:3]];
        }else if([self.num_dificultadtextfield.text isEqualToString:@"media"]||[self.num_dificultadtextfield.text isEqualToString:@"MEDIA"]) {
            [juegoCasa setNum_dificultad:[NSNumber numberWithInt:2]];
        }else{
            [juegoCasa setNum_dificultad:[NSNumber numberWithInt:1]];
        }
        
        NSNumberFormatter *ftiempo = [[NSNumberFormatter alloc] init];
        ftiempo.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mytiempo = [ftiempo numberFromString:self.tiempototaltextfield.text];
        [juegoCasa setTiempoTotal:mytiempo];
       
        
        NSError *error = nil;
        if (![self.usuarioSeleccionado.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"Situaciones cotidianas"]) {
        
        //Cumplimentamos los atributos del mismo
        JuegoCotidianas *juegoCotidianas = self.usuarioSeleccionado.usuario_juegoCotidianas;
      
        if ([self.voztextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
              [juegoCotidianas setVoz: [NSNumber numberWithInt:0]];
        }else{
              [juegoCotidianas setVoz:[NSNumber numberWithInt:1]];
        }
      
        
        
        if ([self.pictostextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoCotidianas setGuionPictos: [NSNumber numberWithInt:0]];
        }else{
            [juegoCotidianas setGuionPictos:[NSNumber numberWithInt:1]];
        }
        
        
        NSNumberFormatter *fnivel = [[NSNumberFormatter alloc] init];
        fnivel.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mynivel = [fnivel numberFromString:self.num_niveltextfield.text];
        [juegoCotidianas setNum_nivel:mynivel];
        
        NSNumberFormatter *ffalloss = [[NSNumberFormatter alloc] init];
        ffalloss.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallossel = [ffalloss numberFromString:self.numfallos_seleccionar.text];
        [juegoCotidianas setNum_fallos_seleccionar:myfallossel];
        
        NSNumberFormatter *ffallose = [[NSNumberFormatter alloc] init];
        ffallose.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallosem = [ffallose numberFromString:self.numfallos_emparejar.text];
        [juegoCotidianas setNum_fallos_emparejar:myfallosem];
        
        NSNumberFormatter *ffalloso = [[NSNumberFormatter alloc] init];
        ffalloso.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfalloso = [ffalloso numberFromString:self.numfallos_ordenar.text];
        [juegoCotidianas setNum_fallos_ordenar:myfalloso];
        
        
        if ([self.num_dificultadtextfield.text isEqualToString:@"mayor"]||[self.num_dificultadtextfield.text isEqualToString:@"MAYOR"]) {
            
            [juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:3]];
        }else if([self.num_dificultadtextfield.text isEqualToString:@"media"]||[self.num_dificultadtextfield.text isEqualToString:@"MEDIA"]) {
            [juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:2]];
        }else{
            [juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:1]];
        }
        
        
        NSNumberFormatter *ftiempo = [[NSNumberFormatter alloc] init];
        ftiempo.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mytiempo = [ftiempo numberFromString:self.tiempototaltextfield.text];
        [juegoCotidianas setTiempoTotal:mytiempo];
        
        
        NSError *error = nil;
        if (![self.usuarioSeleccionado.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"Buenos modales"]) {
        
        //Cumplimentamos los atributos del mismo
        JuegoModales *juegoModales = self.usuarioSeleccionado.usuario_juegoModales;
        
        if ([self.voztextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoModales setVoz: [NSNumber numberWithInt:0]];
        }else{
            [juegoModales setVoz:[NSNumber numberWithInt:1]];
        }
        
        
        
        if ([self.pictostextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoModales setGuionPictos: [NSNumber numberWithInt:0]];
        }else{
            [juegoModales setGuionPictos:[NSNumber numberWithInt:1]];
        }
        
        
        NSNumberFormatter *fnivel = [[NSNumberFormatter alloc] init];
        fnivel.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mynivel = [fnivel numberFromString:self.num_niveltextfield.text];
        [juegoModales setNum_nivel:mynivel];
        
        NSNumberFormatter *ffalloss = [[NSNumberFormatter alloc] init];
        ffalloss.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallossel = [ffalloss numberFromString:self.numfallos_seleccionar.text];
        [juegoModales setNum_fallos_seleccionar:myfallossel];
        
        NSNumberFormatter *ffallose = [[NSNumberFormatter alloc] init];
        ffallose.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallosem = [ffallose numberFromString:self.numfallos_emparejar.text];
        [juegoModales setNum_fallos_emparejar:myfallosem];
        
        NSNumberFormatter *ffalloso = [[NSNumberFormatter alloc] init];
        ffalloso.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfalloso = [ffalloso numberFromString:self.numfallos_ordenar.text];
        [juegoModales setNum_fallos_ordenar:myfalloso];
        
        if ([self.num_dificultadtextfield.text isEqualToString:@"mayor"]||[self.num_dificultadtextfield.text isEqualToString:@"MAYOR"]) {
            
            [juegoModales setNum_dificultad:[NSNumber numberWithInt:3]];
        }else if([self.num_dificultadtextfield.text isEqualToString:@"media"]||[self.num_dificultadtextfield.text isEqualToString:@"MEDIA"]) {
            [juegoModales setNum_dificultad:[NSNumber numberWithInt:2]];
        }else{
            [juegoModales setNum_dificultad:[NSNumber numberWithInt:1]];
        }
        
        NSNumberFormatter *ftiempo = [[NSNumberFormatter alloc] init];
        ftiempo.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mytiempo = [ftiempo numberFromString:self.tiempototaltextfield.text];
        [juegoModales setTiempoTotal:mytiempo];
        
        NSError *error = nil;
        if (![self.usuarioSeleccionado.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    else if ([self.nombreJuego isEqualToString:@"Emociones"]) {
        
        //Cumplimentamos los atributos del mismo
        JuegoEmociones *juegoEmociones = self.usuarioSeleccionado.usuario_juegoEmociones;
        
        if ([self.voztextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoEmociones setVoz: [NSNumber numberWithInt:0]];
        }else{
            [juegoEmociones setVoz:[NSNumber numberWithInt:1]];
        }
        
        
        
        if ([self.pictostextfield.text isEqualToString:@"NO"]||[self.voztextfield.text isEqualToString:@"no"] ) {
            [juegoEmociones setGuionPictos: [NSNumber numberWithInt:0]];
        }else{
            [juegoEmociones setGuionPictos:[NSNumber numberWithInt:1]];
        }
        
        
        NSNumberFormatter *fnivel = [[NSNumberFormatter alloc] init];
        fnivel.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mynivel = [fnivel numberFromString:self.num_niveltextfield.text];
        [juegoEmociones setNum_nivel:mynivel];
        
        NSNumberFormatter *ffalloss = [[NSNumberFormatter alloc] init];
        ffalloss.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallossel = [ffalloss numberFromString:self.numfallos_seleccionar.text];
        [juegoEmociones setNum_fallos_seleccionar:myfallossel];
        
        NSNumberFormatter *ffallose = [[NSNumberFormatter alloc] init];
        ffallose.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfallosem = [ffallose numberFromString:self.numfallos_emparejar.text];
        [juegoEmociones setNum_fallos_emparejar:myfallosem];
        
        NSNumberFormatter *ffalloso = [[NSNumberFormatter alloc] init];
        ffalloso.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myfalloso = [ffalloso numberFromString:self.numfallos_ordenar.text];
        [juegoEmociones setNum_fallos_ordenar:myfalloso];
        
        if ([self.num_dificultadtextfield.text isEqualToString:@"mayor"]||[self.num_dificultadtextfield.text isEqualToString:@"MAYOR"]) {
            
            [juegoEmociones setNum_dificultad:[NSNumber numberWithInt:3]];
        }else if([self.num_dificultadtextfield.text isEqualToString:@"media"]||[self.num_dificultadtextfield.text isEqualToString:@"MEDIA"]) {
            [juegoEmociones setNum_dificultad:[NSNumber numberWithInt:2]];
        }else{
            [juegoEmociones setNum_dificultad:[NSNumber numberWithInt:1]];
        }
        
        NSNumberFormatter *ftiempo = [[NSNumberFormatter alloc] init];
        ftiempo.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *mytiempo = [ftiempo numberFromString:self.tiempototaltextfield.text];
        [juegoEmociones setTiempoTotal:mytiempo];
        
        
        NSError *error = nil;
        if (![self.usuarioSeleccionado.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    configurarUsuarioViewController.context = self.context;
    configurarUsuarioViewController.nuevoUsuario = self.nuevoUsuario;
    configurarUsuarioViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuarioViewController animated:YES];
    
    
}


-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        
        
        /** mostramos el alert que pide la contraseña **/
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuración juego no guardada"
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"Aceptar"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    [super viewWillDisappear:animated];
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
