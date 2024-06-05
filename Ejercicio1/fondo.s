.ifndef fondo_s
.equ fondo_s, 0
.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480


hacerfondo:
    stur lr, [sp]
    sub sp,sp,8

	movz x10, 0x75, lsl 16
	movk x10, 0xDCFF, lsl 00

	mov x11, 640 // mov x11 nos va a permitir utilizar el registo x11 para guardar 640, constante para calcular direccion de pixel.
fondopantalla:    
	mov x3,2

loop2:
	mov x2, SCREEN_HEIGH         // Y Size
	sub x3,x3,1

loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // w10, agarra 32bits (32 bits de argb) de su registro de 64 bits. Stur lo carga en la direccion guardada en el registro x0
	add x0,x0,4  // add x0,4 apunta hacia 4 bytes distancia de x0 (es decir, el proximo pixel)
	sub x1,x1,1   // disminuyo x1 en 1 (x1-1) ya que representa la cantidad de pixeles por pintar a lo ancho de la pantalla.
	cbnz x1,loop0  // cnbz comprueba que x1 =/ 0 y branchea a la linea llamada loop0. si es 0 skipea a la siguiente instruccion.
	sub x2,x2,2    // disminuye x2 en 1 (x2-1) y representa las filas por pintar
	cbnz x2,loop1 // cnbz comprueba que x2 =/ 0 y branchea a la linea llamada loop1. si es 0 skipea y concluye con el loop.
	
//eb7a21
    movz x10, 0xEB, lsl 16
    movk x10, 0x7A21, lsl 00
    cbnz x3,loop2


hacernube:

nube:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,190     //es la coordenada x del cuadrado 
	mov x3,20     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10, 0xF0, lsl 16  //Color que quiero pintar 
	movk x10, 0xF1F2, lsl 00 
reset_nube:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube1:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube1             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube1:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube1	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube         // if not last row, jump
// hasta aca
nubepart2:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,140    //es la coordenada x del cuadrado 
	mov x3,50     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

    movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube2:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube2:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube2             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube2:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube2	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube2        // if not last row, jump

nubepart3:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,240    //es la coordenada x del cuadrado 
	mov x3,50     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube3:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube3:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube3           //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube3:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube3	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube3        // if not last row, jump

nube4:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,190     //es la coordenada x del cuadrado 
	mov x3,80    //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15
//f0f1f2
	movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube4:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube4:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube4            //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube4:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube4	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube4         // if not last row, jump




//

nube2:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,490     //es la coordenada x del cuadrado 
	mov x3,20     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10, 0xF0, lsl 16  //Color que quiero pintar 
	movk x10, 0xF1F2, lsl 00 
reset_nubeder:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnubeder:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnubeder             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnubeder:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnubeder	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nubeder         // if not last row, jump
// hasta aca
nubepart2der:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,440    //es la coordenada x del cuadrado 
	mov x3,50     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

    movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube2der:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube2der:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube2der           //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube2der:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube2der	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube2der        // if not last row, jump

nubepart3der:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,540    //es la coordenada x del cuadrado 
	mov x3,50     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube3der:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube3der:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube3der          //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube3der:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube3der	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube3der       // if not last row, jump

nube4der:
	mov x0, x20

	mov x2,80    //Alto del circulo 
	mov x15,490     //es la coordenada x del cuadrado 
	mov x3,80    //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15
//f0f1f2
	movz x10,0xF0,lsl 16  //Color que quiero pintar 
	movk x10,0xF1F2, lsl 00 
reset_nube4der:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loopnube4der:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,2100            //1600 =r² 
	b.gt loopnextnube4der           //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loopnextnube4der:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loopnube4der	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_nube4der        // if not last row, jump

//

cactus_drawing:

	movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00

	mov x12, 190 // y 
	mov x4, 160

base_rectangular:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 100
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,50 //Anchen
loop4: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop4
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_rectangular




roundedheadlft:
	mov x0, x20

	mov x2,30     //Alto del circulo 
	mov x15,82     //es la coordenada x del cuadrado 
	mov x3,135     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
reset_rdheadlft:
	mov x15,x16
	add x3,x3,1
	mov x1,70 // Ancho del circulo 
looproundedheadlft:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,940         //1600 =r² 
	b.gt looproundedheadnextlft             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
looproundedheadnextlft:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,looproundedheadlft	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_rdheadlft        // if not last row, jump

frutocactus:

    //#BD3C37
    movz x10, 0xBD, lsl 16
	movk x10, 0x3C37, lsl 00
    
	mov x12, 30	
	mov x4, 150

basefruto:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0,80 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,30 //Anchen

loopfruto:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopfruto
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basefruto

brazoizq_cactus:

    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
    
	mov x12, 45	
	mov x4, 190

basebrazoizq:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 100 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,110 //Anchen

loopbrazo:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazo
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazoizq


brazosuperior:

    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
    
	mov x12, 50	
	mov x4, 140

basebrazoizqsup:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0,170 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,40 //Anchen

loopbrazosup:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazosup
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazoizqsup

//
brazoder_cactus:

    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
    
	mov x12, 40
	mov x4, 190

basebrazoder:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 30 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,80 //Anchen

loopbrazoder:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazoder
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazoder

// si lee esto profe tuve una instancia dislexica y mezcle derecha con izquierda
//

brazosuperiorder:
 
    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00

	mov x12, 60
	mov x4, 190

basebrazosuperiorder:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 30 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,30 //Anchen

loopbrazodersup:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazodersup
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazosuperiorder


cactus_drawing2:

	movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00

	mov x12, 250 // modifica el ejey del cactus (en tamaño)
	mov x4, 95 // modifica el ejey del cactus (en posicion)

base_rectangular2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 550 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,60 //Anchen
loop5: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop5
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_rectangular2

roundedheadrgt:
	mov x0, x20

	mov x2,80     //Alto del circulo 
	mov x15,540     //es la coordenada x del cuadrado 
	mov x3,65     //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,40
	add x6,x3,40
	mov x16,x15

	movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
reset_rdheadrgt:
	mov x15,x16
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
looproundedhead:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,940         //1600 =r² 
	b.gt looproundedheadnext             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
looproundedheadnext:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,looproundedhead	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_rdheadrgt        // if not last row, jump
	
brazoizq_cactus2:

    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
    
	mov x12, 40
	mov x4, 140

basebrazoizq2:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 475 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,80 //Anchen

loopbrazoizq2:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazoizq2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazoizq2

frutocactus2:

    //#BD3C37
    movz x10, 0xBD, lsl 16
	movk x10, 0x3C37, lsl 00
    
	mov x12, 30	
	mov x4, 75

basefruto2:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0,540 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,30 //Anchen

loopfruto2:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopfruto2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basefruto2

brazosuperiorizq2:
 
    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00

	mov x12, 60
	mov x4, 100

basebrazosuperiorizq2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 475 // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,30 //Anchen

loopbrazoizqsup2:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazoizqsup2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazosuperiorizq2

brazoder_cactus2:

    movz x10, 0x69, lsl 16
	movk x10, 0xB81F, lsl 00
    
	mov x12, 40
	mov x4, 140

basebrazoder2:

    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 570  // Distribuye en el eje x el cactus
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,80 //Anchen

loopbrazoder2:
    stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopbrazoder2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, basebrazoder2

     add sp,sp,8
	 ldur lr, [sp]
	 br lr
	
.endif
