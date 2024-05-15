
/*!!!!! Einai shmantiko na anaferw pws xreiazetai na allaxtoun xeirokinita oi metavlites pou theloume na tupwthoun MESA STA ORISMATA twn dbms output opote prepei na uparxei megalh prosoxh  !!!!!! */

/*Sto block auto kanw dhlwsh twn metavlhtwn*/
DECLARE 
    /*Oi metavlites a,b,c einai stigmiotipa tou object complex_number ta opoia xrhsimopoiountai gia na kalesw tis methodous pou exoun ti dunatothta na xrhsimopoihsoun*/
    a complex_number; 
    b complex_number;
    c complex_number;
    /**/
    
    apotelesma complex_number; -- se auth th metavliti epistrefw ta return twn member function pou kaloun ta stigmiotupa
    flag boolean; --h sugekrimenh metavliti xreiazetai gia tin sugrish ean 2 migadikoi einai suzugoi
    dunamh NUMBER; -- h sugekrimenh metavliti upodilwnei th dunamh sthn opoia tha upsothei o migadikos 
   
    arithmos NUMBER(4,3); /* H sugekrimenh metavliti exei to metro tou migadikou (teleutaio erwtima). O arithmos einai type NUMBER(4,3) afou to metro
    einai thetiko kai epeidh exei riza h diadikasia upologismou tou mporei na exei dekadika 4hfia ta opoia periorizw sta 3*/
   

/* Se auto to block dhmiourgountai stigmiotupa complex_number kai kalountai oi me8odoi (member functions)*/
BEGIN 
    /* Dhmiourgeia 2 stigmiotupwn tupou complex_number */
    a := complex_number(3,4); 
    b := complex_number(5,-6);
    /*  */
     --nea stigmiotupa dhmiourgountai kai stis grammes 41-42
     
    /* a. Klhsh methodou prostheshs twn a kai b */
    apotelesma := a.athroisma(b);
    dbms_output.put_line('To a8roisma twn: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || b.real_number || '+(' || b.imaginary_number || ')i einai: ' || apotelesma.real_number ||'+('|| apotelesma.imaginary_number || ')i');
    /**/
    
    /* b. Klhsh methodou afaireshs twn a - b */
    apotelesma := a.afairesh(b);
    dbms_output.put_line('H afairesh twn: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || b.real_number || '+(' || b.imaginary_number || ')i einai: ' || apotelesma.real_number ||'+('|| apotelesma.imaginary_number || ')i');
    /**/
    
    /* c. Klhsh methodou pollaplasiasmou twn a * b */
    apotelesma := a.pollaplasiasmos(b);
    dbms_output.put_line('O pollaplasiasmos twn: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || b.real_number || '+(' || b.imaginary_number || ')i einai: ' || apotelesma.real_number ||'+('|| apotelesma.imaginary_number || ')i');
    /**/
   
     
     a := complex_number(2,1);
     b := complex_number(1,-3);
  
    /* d. Klhsh methodou diaireshs twn a / b */   
    apotelesma := a.diairesh(b);
    dbms_output.put_line('H diairesh twn: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || b.real_number || '+(' || b.imaginary_number || ')i einai: ' || apotelesma.real_number ||'+('|| apotelesma.imaginary_number || ')i');
    /**/

    /* e. Klhsh methodou gia ton upologismou tou antithetou migadikou tou b */
    apotelesma := b.antitheto();
    dbms_output.put_line('O antithetos tou : ' || b.real_number || '+(' || b.imaginary_number || ')i einai o : ' || apotelesma.real_number || '+(' || apotelesma.imaginary_number || ')i' );
    /**/
    
    /* f. Klhsh methodou gia ton upologismo tou suzugh tou migadikou a */
    apotelesma := a.suzugh();
    dbms_output.put_line('O suzughs tou : ' || a.real_number || '+(' || a.imaginary_number || ')i einai o : ' || apotelesma.real_number || '+(' || apotelesma.imaginary_number || ')i' );
    /**/
    
    /* g. Elegxos gia to an o a kai o c einai suzugoi */
    c := complex_number(2,-1);
    flag := a.check_suzugh(c);
    IF (flag = TRUE) THEN
        dbms_output.put_line('Oi migadikoi: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || c.real_number || '+(' || c.imaginary_number || ')i einai suzugh');
    ELSE 
        dbms_output.put_line('Oi migadikoi: ' || a.real_number || '+(' || a.imaginary_number || ')i kai ' || c.real_number || '+(' || c.imaginary_number || ')i den einai suzugh');
    END IF;
    /**/
    
    /* h. ypologismos u4wshs se dunamh tou migadikou a */
    dunamh := 2; -- H dunamh sthn opoia 8a u4w8ei o migadikos
    apotelesma := a.pow(dunamh); 
    dunamh := MOD(dunamh , 4); -- Sumfwna me tis shmeiwseis tou bibliou twn ma8hmatikwn ths B lukeiou otan h dunamh diairethei me to 4 pairnoume to ypoloipo kai exoume tis parakatw 4 kathgories 
    IF ( dunamh = 0) THEN
        dbms_output.put_line('H upswsh tou migadikou ' || a.real_number || '+(' || a.imaginary_number || ')i sthn ' || dunamh || ' einai to athroisma : ' || apotelesma.real_number || '+(' || apotelesma.imaginary_number || ')' );
    ELSIF (dunamh = 1) THEN
        dbms_output.put_line('H upswsh tou migadikou ' || a.real_number || '+(' || a.imaginary_number || ')i sthn ' || dunamh || ' einai o : ' || apotelesma.real_number || '+(' || apotelesma.imaginary_number || ')i' );
    ELSIF (dunamh = 2) THEN
        dbms_output.put_line('H upswsh tou migadikou ' || a.real_number || '+(' || a.imaginary_number || ')i sthn ' || dunamh || ' einai to athroisma : ' || apotelesma.real_number || '+(' || -apotelesma.imaginary_number || ')' );
    ELSIF (dunamh = 3) THEN
        dbms_output.put_line('H upswsh tou migadikou ' || a.real_number || '+(' || a.imaginary_number || ')i sthn ' || dunamh || ' einai o : ' || apotelesma.real_number || '+(' || apotelesma.imaginary_number || ')(-i)' );
    END IF;
    /**/
    
    /* i. Klhsh methodou gia metro migadikou a*/    
    arithmos := a.metro(); 
    dbms_output.put_line('To metro tou migadikou ' || a.real_number || '+(' || a.imaginary_number || ')i einai to: ' || arithmos );
    /**/
END;
