//
//  JuegoSeleccionarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoSeleccionarViewController.h"

@implementation JuegoSeleccionarViewController

@synthesize usuarioSeleccionado, nombreJuego, context, numDificultad, nombreNivel, juegoCasa, juegoCotidianas, juegoEmociones, juegoModales;
@synthesize imagenRating, imagenTony, areaJuego, guionPictograma;
@synthesize imagenCentral, imagenCinco, imagenCuatro, imagenDos, imagenTres, imagenUno;
@synthesize numAciertos,numFallos,numImagenTocada;
@synthesize temporizadorBordeRojo, temporizadorTony, temporizadorEntreToques,tiempoImagenFinNivel, contadorTiempoTotal, tiempoTotal;

-(void)viewDidLoad
{
    
    [self cargarBotonesNavigation];
    
    self.contadorTiempoTotal = 0;
    
    self.tiempoTotal = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countup) userInfo:nil repeats:YES];
   
    self.numImagenTocada = -1;
    self.numFallos =0;
    self.numAciertos=0;
    
    
    self.areaJuego.layer.borderColor = [UIColor yellowColor].CGColor;
    self.areaJuego.layer.borderWidth = 5.0f;
    self.areaJuego.layer.cornerRadius = 15;
    self.areaJuego.layer.masksToBounds = YES;
    
    
    [self cargarVistaDelJuego];
    
        
        [super viewDidLoad];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
}

-(void)countup
{
    //metodo para contabilizar el tiempo de juego
    self.contadorTiempoTotal = self.contadorTiempoTotal+1;
}

-(void)cargarVistaDelJuego
{
    self.temporizadorEntreToques = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToques)
                                                                  userInfo:nil
                                                                   repeats:NO];
    
    
    
    /** cargar datos segun el juego **/
    if ([nombreJuego isEqualToString:@"casa"]) {
        
        if (self.usuarioSeleccionado.usuario_juegoCasa.voz.intValue == 0) {
            // QUITAR SONIDO
        }
        if (self.usuarioSeleccionado.usuario_juegoCasa.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCasa.num_dificultad.intValue;
        
        
        switch (self.juegoCasa.num_nivel.intValue) {
            case 1:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelRopa numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelBarrer numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelMesa numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
        
    }else if([nombreJuego isEqualToString:@"cotidianas"])
    {
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.voz.intValue == 0) {
            // QUITAR SONIDO
        }
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCotidianas.num_dificultad.intValue;
        
        
        switch (self.juegoCotidianas.num_nivel.intValue) {
            case 1:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelMaleta numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelDientes numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelCine numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        if (self.usuarioSeleccionado.usuario_juegoModales.voz.intValue == 0) {
            // QUITAR SONIDO
        }
        if (self.usuarioSeleccionado.usuario_juegoModales.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoModales.num_dificultad.intValue;
        
        
        switch (self.juegoModales.num_nivel.intValue) {
            case 1:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelLavarManos numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelMocos numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelPapel numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
    }else if([nombreJuego isEqualToString:@"emociones"])
    {
        if (self.usuarioSeleccionado.usuario_juegoEmociones.voz.intValue == 0) {
            // QUITAR SONIDO
        }
        if (self.usuarioSeleccionado.usuario_juegoEmociones.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoEmociones.num_dificultad.intValue;
        
        
        switch (self.juegoEmociones.num_nivel.intValue) {
            case 1:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelContento numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelTriste numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelAsustado numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
    }
    
    
    
}


#pragma mark metodos de control de toques


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
            UITouch *touch = [[event allTouches] anyObject];
            CGPoint location = [touch locationInView:self.view];
            CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
            if(CGRectContainsPoint(self.imagenUno.frame, location)|| CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
            {
                NSLog(@"imagen uno tocada.....");
                self.numImagenTocada = 1;
                
                
            }else if(CGRectContainsPoint(self.imagenDos.frame, location)|| CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
            {
                NSLog(@"imagen dos tocada.....");
                self.numImagenTocada = 2;
            }else if(CGRectContainsPoint(self.imagenTres.frame, location)|| CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
            {
                NSLog(@"imagen tres tocada.....");
                self.numImagenTocada = 3;
            }else if(CGRectContainsPoint(self.imagenCuatro.frame, location)|| CGRectContainsPoint(self.imagenCuatro.frame, locationAreaJuego))
            {
                NSLog(@"imagen cuatro tocada.....");
                self.numImagenTocada = 4;
            }else if(CGRectContainsPoint(self.imagenCinco.frame, location)|| CGRectContainsPoint(self.imagenCinco.frame, locationAreaJuego))
            {
                NSLog(@"imagen cinco tocada.....");
                self.numImagenTocada = 5;
            }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
    NSString *imagenTocadaNombre = @"";
    
    if(CGRectContainsPoint(self.imagenUno.frame, location) || CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
    {
        NSLog(@"imagen uno tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:0];
        
    }else if(CGRectContainsPoint(self.imagenDos.frame, location) || CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
    {
        NSLog(@"imagen dos tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:1];
    }else if(CGRectContainsPoint(self.imagenTres.frame, location) || CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
    {
        NSLog(@"imagen tres tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:2];
    }else if(CGRectContainsPoint(self.imagenCuatro.frame, location) ||CGRectContainsPoint(self.imagenCuatro.frame, locationAreaJuego))
    {
        NSLog(@"imagen cuatro tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:3];
    }else if(CGRectContainsPoint(self.imagenCinco.frame, location) || CGRectContainsPoint(self.imagenCinco.frame, locationAreaJuego))
    {
        NSLog(@"imagen cinco tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:4];
    }
    
    
    
    NSLog(@"imagen tocada = %@", imagenTocadaNombre);
    [self comprobarAccion:imagenTocadaNombre];
}

-(void)comprobarAccion:(NSString *)imagenTocada
{
    //comprobamos que la imagen tocada es una de las opciones del array de opciones correctas.
    
    if ([self.seleccionarObject.arrayCorrectas containsObject: imagenTocada])
    {
        
        /** accion correcta **/
        [self.temporizadorEntreToques invalidate];
        self.temporizadorEntreToques=nil;
        
     
        //imagen tony
        UIImage *imagTony = [UIImage imageNamed:@"tonyContento.png"];
        [self.imagenTony setImage:imagTony];
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorTony = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                      target:self
                                                                    selector:@selector(cambiarImagenTony)
                                                                    userInfo:nil
                                                                     repeats:NO];
        
                
        
        switch (self.numImagenTocada) {
            case 1:
                self.imagenUno.hidden =YES;
                break;
            case 2:
                self.imagenDos.hidden =YES;
                break;
            case 3:
                self.imagenTres.hidden=YES;
                break;
            case 4:
                self.imagenCuatro.hidden=YES;
                break;
            case 5:
                self.imagenCinco.hidden=YES;
                break;
            default:
                break;
        }
       
        self.numAciertos++;
        switch (self.numAciertos) {
            case 1:
            {
                //imagen rating
                UIImage *imagRating = [UIImage imageNamed:@"ratinguno.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
            case 2:
            {
                //imagen rating
                UIImage *imagRating = [UIImage imageNamed:@"ratingdos.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
            case 3:
            {
                //imagen rating
                UIImage *imagRating = [UIImage imageNamed:@"ratingtres.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
            default:
                break;
        }
        
        
        if (self.numAciertos == 3) {
            //ha finalizado el nivel REALIZAR UNA DETERMINADA ACCION: cambio de nivel o juego
            
            
            //guardamos datos
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
          

            /**  cambio de nivel el usuario lo ha superado correctamente**/
            self.tiempoImagenFinNivel = [NSTimer scheduledTimerWithTimeInterval:4.0
                                                                         target:self
                                                                       selector:@selector(cambioDeNivelAccion)
                                                                       userInfo:nil
                                                                        repeats:NO];

          
            
           
        }
    }else
    {
        /** accion incorrecta **/
        self.numFallos++;
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorBordeRojo = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                             target:self
                                                           selector:@selector(quitarBorde)
                                                           userInfo:nil
                                                            repeats:NO];
        switch (self.numImagenTocada) {
            case 1:
                self.imagenUno.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenUno.layer.borderWidth = 5.0f;
                self.imagenUno.layer.cornerRadius = 15;
                self.imagenUno.layer.masksToBounds = YES;
                break;
            case 2:
                
                self.imagenDos.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenDos.layer.borderWidth = 5.0f;
                self.imagenDos.layer.cornerRadius = 15;
                self.imagenDos.layer.masksToBounds = YES;
                break;
            case 3:
                
                self.imagenTres.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenTres.layer.borderWidth = 5.0f;
                self.imagenTres.layer.cornerRadius = 15;
                self.imagenTres.layer.masksToBounds = YES;
                break;
            case 4:
               
                self.imagenCuatro.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenCuatro.layer.borderWidth = 5.0f;
                self.imagenCuatro.layer.cornerRadius = 15;
                self.imagenCuatro.layer.masksToBounds = YES;
                break;
            case 5:
               
                self.imagenCinco.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenCinco.layer.borderWidth = 5.0f;
                self.imagenCinco.layer.cornerRadius = 15;
                self.imagenCinco.layer.masksToBounds = YES;
                break;
            default:
                break;
        }

        if (numFallos == 5) { //Se permiten 5 fallos antes de cambiar de dificultad automaticamente
            
            if (self.numDificultad>1) {
                self.numDificultad--;
               
            }
            
            
            
            [self.temporizadorEntreToques invalidate];
            self.temporizadorEntreToques=nil;
            
           
            
            if ([self.nombreJuego isEqualToString:@"casa"]) {
                 int numfallostotales = self.juegoCasa.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoCasa setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoCasa setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
               
            }
            else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
                int numfallostotales = self.juegoCotidianas.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoCotidianas setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                

            }
            else if ([self.nombreJuego isEqualToString:@"emociones"]) {
                int numfallostotales = self.juegoEmociones.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoEmociones setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoEmociones setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                

            }
            else if ([self.nombreJuego isEqualToString:@"modales"]) {
                int numfallostotales = self.juegoModales.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoModales setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoModales setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                

            }
            
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
          //  if (self.numDificultad>1) {
                [self cargarVistaDelJuego];
           // }
            
        
        }
        
        //REALIZAR ACCION CORRESPONDIENTE
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
        
        
        
    }
    
    
}


#pragma mark cambio de nivel metodos

-(void)cambioDeNivelAccion
{
    
    [self.tiempoImagenFinNivel invalidate];
    self.tiempoImagenFinNivel=nil;
    
        UIImageView *brickAnim = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finNivelBien.png"]];
        brickAnim.frame = self.view.frame;
        [self.view addSubview:brickAnim];
        
    
        [self.tiempoImagenFinNivel invalidate];
        self.tiempoImagenFinNivel = nil;
       self.tiempoImagenFinNivel = [NSTimer scheduledTimerWithTimeInterval:4.0
                                                                        target:self
                                                                       selector:@selector(fincambioDeNivelAccion)
                                                                      userInfo:nil
                                                                       repeats:NO];

    
}

-(void)fincambioDeNivelAccion
{
    if (self.tiempoImagenFinNivel) {
    [self.tiempoImagenFinNivel invalidate];
    self.tiempoImagenFinNivel = nil;
    }
    
    
    [self.tiempoTotal invalidate];
    self.tiempoTotal =nil;
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    
    
    if ([self.nombreJuego isEqualToString:@"casa"]) {
        intermediaViewController.numJuego =1;
        self.juegoCasa.tiempoTotal =[NSNumber numberWithInt:([self.juegoCasa.tiempoTotal intValue]+ self.contadorTiempoTotal)];
        NSLog(@"tiempo total.... = %d", [self.juegoCasa.tiempoTotal intValue]);
        
    }
    else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
        intermediaViewController.numJuego =2;
        self.juegoCotidianas.tiempoTotal =[NSNumber numberWithInt:([self.juegoCotidianas.tiempoTotal intValue]+ self.contadorTiempoTotal)];
       
    }
    else if ([self.nombreJuego isEqualToString:@"modales"]) {
        intermediaViewController.numJuego =3;
         self.juegoModales.tiempoTotal =[NSNumber numberWithInt:([self.juegoModales.tiempoTotal intValue]+ self.contadorTiempoTotal)];
      
    }
    else if ([self.nombreJuego isEqualToString:@"emociones"]) {
        intermediaViewController.numJuego =4;
         self.juegoEmociones.tiempoTotal =[NSNumber numberWithInt:([self.juegoEmociones.tiempoTotal intValue]+ self.contadorTiempoTotal)];
     
    }
    
    
    
    [self.temporizadorEntreToques invalidate];
    self.temporizadorEntreToques=nil;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    intermediaViewController.context = self.context;
    intermediaViewController.nombreNivel = @"Emparejar";
 
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];

}

#pragma mark metodos shake imagenes
-(void)shakeView:(UIImageView *)imagen {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.2];
    [shake setRepeatCount:7];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(imagen.center.x - 5,imagen.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(imagen.center.x + 5, imagen.center.y)]];
    [imagen.layer addAnimation:shake forKey:@"position"];
}

#pragma mark metodos de los temporizadores

-(void)tiempoExcedidoEntreToques{
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;
    
    
    self.numFallos++;
    

    
    if (self.numFallos<5) {
  
        NSLog(@"tiempo entre toques excedido seleccionar view controller...");
    self.temporizadorEntreToques = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToques)
                                                                  userInfo:nil
                                                                   repeats:NO];
        
        //movemos imagenes a tocar correctas
        for (NSString *correcta in self.seleccionarObject.arrayPosibilidadesIndices) {
           
            if ([correcta isEqualToString:@"1"]) {
               [self shakeView:self.imagenUno];
                
            }
            if ([correcta isEqualToString:@"2"]) {
                [self shakeView:self.imagenDos];
            }
            if ([correcta isEqualToString:@"3"]) {
                [self shakeView:self.imagenTres];
            }
            if ([correcta isEqualToString:@"4"]) {
                [self shakeView:self.imagenCuatro];
            }
            if ([correcta isEqualToString:@"5"]) {
                [self shakeView:self.imagenCinco];
            }
           
        }

        
    }else if(self.numFallos==5)
    {
        [self.temporizadorBordeRojo invalidate];
        self.temporizadorBordeRojo =nil;
        NSLog(@"tiempo entre toques excedido y maximo numero de fallos cumplido");
       
        if (numFallos == 5) { //Se permiten 5 fallos antes de cambiar de dificultad automaticamente
            
            if (self.numDificultad>1) {
                self.numDificultad--;
                
            }
            
            [self.temporizadorEntreToques invalidate];
            self.temporizadorEntreToques=nil;
           
            
            
            if ([self.nombreJuego isEqualToString:@"casa"]) {
                [self.juegoCasa setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoCasa.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoCasa setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
                [self.juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoCotidianas.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoCotidianas setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"modales"]) {
                [self.juegoModales setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoModales.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoModales setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"emociones"]) {
                [self.juegoEmociones setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoEmociones.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoEmociones setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            
           
            
             self.numFallos =0;
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            if (self.numDificultad>1) {
                [self cargarVistaDelJuego];
            }
           
            
        }
        
        //REALIZAR ACCION CORRESPONDIENTE
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
        
    }
    
}

-(void)quitarBorde
{
    

    
    switch (self.numImagenTocada) {
        case 1:
            self.imagenUno.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenUno.layer.masksToBounds = YES;
            break;
        case 2:
            
            self.imagenDos.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenDos.layer.masksToBounds = YES;
            break;
        case 3:
            
            self.imagenTres.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenTres.layer.masksToBounds = YES;
            break;
        case 4:
            
            self.imagenCuatro.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenCuatro.layer.masksToBounds = YES;
            break;
        case 5:
            
            self.imagenCinco.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenCinco.layer.masksToBounds = YES;
            break;
        default:
            break;
    }
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;

}

-(void)cambiarImagenTony
{
    
    self.temporizadorEntreToques = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToques)
                                                                  userInfo:nil
                                                                   repeats:NO];
    
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorTony invalidate];
    self.temporizadorTony =nil;

    //imagen tony
    UIImage *imagTony = [UIImage imageNamed:@"tonyPregunta.png"];
    [self.imagenTony setImage:imagTony];
}


#pragma mark metodos de carga de pantalla

-(void)cargarBotonesNavigation
{
    /** FIJAR BOTON GAMES EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"games.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToDashViewController:)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    /** FIJAR BOTON HOME EN BARRA DE NAVEGACIÓN **/
    UIButton *buttonHome =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonHome setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [buttonHome addTarget:self action:@selector(goToSeleccionarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonHome setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonH = [[UIBarButtonItem alloc] initWithCustomView:buttonHome];
    self.navigationItem.leftBarButtonItem = barButtonH;
}

-(void)cargarImagenesJuego
{
    
    //imagen central
    UIImage *imagencentral = [UIImage imageNamed:self.seleccionarObject.nombreImagenCentral];
    [self.imagenCentral setImage:imagencentral];
    
    
    //imagen posibilidad uno
    NSString *imagen_uno = [self.seleccionarObject.arrayPosibilidades objectAtIndex:0];
    UIImage *imagenuno = [UIImage imageNamed:imagen_uno];
    [self.imagenUno setImage:imagenuno];
     
    //imagen posibilidad dos
    NSString *imagen_dos=[self.seleccionarObject.arrayPosibilidades objectAtIndex:1];
    UIImage *imagendos = [UIImage imageNamed:imagen_dos];
    [self.imagenDos setImage:imagendos];
     
    //imagen posibilidad tres
    NSString *imagen_tres=[self.seleccionarObject.arrayPosibilidades objectAtIndex:2];
    UIImage *imagentres = [UIImage imageNamed:imagen_tres];
    [self.imagenTres setImage:imagentres];
    
    //imagen posibilidad cuatro
     if (numDificultad==2 || numDificultad==3) {
    NSString *imagen_cuatro=[self.seleccionarObject.arrayPosibilidades objectAtIndex:3];
    UIImage *imagencuatro = [UIImage imageNamed:imagen_cuatro];
    [self.imagenCuatro setImage:imagencuatro];
     }
    
    //imagen posibilidad cinco
    if (self.numDificultad==3) {
        NSString *imagen_cinco=[self.seleccionarObject.arrayPosibilidades objectAtIndex:4];
        UIImage *imagencinco = [UIImage imageNamed:imagen_cinco];
        [self.imagenCinco setImage:imagencinco];
    }

  
    if(self.numDificultad == 2)
    {
        if (!self.imagenCinco.hidden) {
            self.imagenCinco.hidden = YES;
        }
        
        
    }else if (self.numDificultad ==1) //dificultad menor
    {
        if (!self.imagenCinco.hidden) {
            self.imagenCinco.hidden = YES;
        }
        if (!self.imagenCuatro.hidden) {
            self.imagenCuatro.hidden = YES;
        }
        
        
    }
    

}

#pragma mark metodos botones navigation bar

-(void)goToDashViewController:(id)sender
{
    
    NSLog(@"go to configurar usuarios view controller...");
    
    /** mostramos el alert que pide la contraseña **/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Introduce la contraseña:"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles:nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];
}

-(void)goToSeleccionarUsuariosViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    SeleccionUsuariosViewController *seleccionUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
    seleccionUsuariosViewController.context = self.context;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:seleccionUsuariosViewController animated:YES];
}


#pragma mark alertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    
    NSLog(@"password introducida: %@", inputText);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    
    //si la clave coincide pasamos a la siguiente pantalla
    if ([inputText isEqualToString:password]) {
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
        dashboardViewController.context = self.context;
        dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
    }
    
    
    
}


@end
