-- (type body)
/*Se auto to .sql arxeio ginetai oi ulopoihsh twn methodwn tou object complex_number*/

/* Se merikes sunarthseis dulwnw 2 metavlites pou einai aparaithtes gia na kanw prajeis ta fantastika me ta fantastika kai pragmatika me ta pragmatika merh twn 2 arithmwn pou upolgizoun oi member functions*/
/* Alliws an exoume ena mono stigmiotupo (self) to opoio kai kalese thn sugekrimenh methodo den xreiazetai na kanw xrhsh voh8htikwn metavlitwn */
CREATE OR REPLACE TYPE body complex_number AS 

    /*a. Function gia th prosthesh 2 migadikwn*/
    MEMBER FUNCTION athroisma(migadikos IN complex_number) RETURN complex_number IS 
        pragmatiko number;
        fantastiko number;
    BEGIN
        pragmatiko  := self.real_number + migadikos.real_number;
        fantastiko := self.imaginary_number + migadikos.imaginary_number;
        return complex_number(pragmatiko , fantastiko);  -- Epistrofh enos migadikou arithmou pou einai to athroisma twn pramgatikwn kai fantastikwn 'part' twn dothentwn migadikwn antistoixa
    END athroisma;
    
    /* b. Function gia thn afairesh 2 migadikwn*/
    MEMBER FUNCTION afairesh(migadikos IN complex_number) RETURN complex_number IS
        pragmatiko number;
        fantastiko number;
        BEGIN
          pragmatiko  := self.real_number - migadikos.real_number;
          fantastiko := self.imaginary_number - migadikos.imaginary_number;
          return complex_number(pragmatiko , fantastiko); -- Epistrofh enos migadikou arithmou opws sthn function ahtroismatos alla me afairesh 
    END afairesh;
    
    /* c. Function gia to pollaplasiasmo 2 migadikwn*/
    MEMBER FUNCTION pollaplasiasmos(migadikos IN complex_number) RETURN complex_number IS
        pragmatiko number;
        fantastiko number;
        BEGIN 
            pragmatiko := (self.real_number * migadikos.real_number) - (self.imaginary_number * migadikos.imaginary_number);
            fantastiko := (self.real_number * migadikos.imaginary_number) + (self.imaginary_number * migadikos.real_number);
            return complex_number(pragmatiko , fantastiko); -- Epistrofh enos migadikou arithmou pou prokuptei apo tis aparaithtes prajeis gia ton ypologismo 2 migadikwn arithmwn
    END pollaplasiasmos; 
    
    /* d. Function gia diairesh 2 migadikwn*/
    MEMBER FUNCTION diairesh(migadikos IN complex_number) RETURN complex_number IS
        pragmatiko number;
        fantastiko number;
        BEGIN                               -- to POW dhlwnei u4wsh se dunamh
            pragmatiko := ( (self.real_number * migadikos.real_number) + (self.imaginary_number * migadikos.imaginary_number) ) / ( POWER(migadikos.real_number , 2) + POWER(migadikos.imaginary_number , 2) );
            fantastiko := ( (self.imaginary_number * migadikos.real_number) -(self.real_number * migadikos.imaginary_number) ) / ( POWER(migadikos.real_number , 2) + POWER(migadikos.imaginary_number , 2) );
            return complex_number(pragmatiko , fantastiko);
        END diairesh; -- Paromoiws me thn member function pollaplasiasmou apla me prajeis katallhles gia to apotelesma ths diaireshs 2 migadikwn
        
    /* e. Ypologismos antithetou */
    MEMBER FUNCTION antitheto RETURN complex_number IS
    BEGIN
        return complex_number(- (self.real_number),  - (self.imaginary_number)); -- Epistrofh tou migadikou pou kalese thn methodo me antitheta proshma 
    END antitheto;
    
    /* f. Ypologismos suzugh */
    MEMBER FUNCTION suzugh RETURN complex_number IS
    BEGIN
        return complex_number(self.real_number, - (self.imaginary_number)); -- Epistrofh tou suzugh migadikou pou kalese thn methodo 
    END suzugh;
        
    /* g. Elegxos gia suzugh */
    MEMBER FUNCTION check_suzugh (migadikos IN complex_number) RETURN BOOLEAN IS 
    BEGIN
        /* Sugrish twn 2 migadikwn(self kai migadikos IN ) kai epistrofh True h False gia to an einai suzugoi h oxi */
        IF (self.real_number = migadikos.real_number) AND (self.imaginary_number = -(migadikos.imaginary_number)) THEN
            return True;
        ELSE
            return False;
        END IF;
    END check_suzugh;
    
    /* h. Dunamh migadikou*/
    MEMBER FUNCTION pow(dunamh IN NUMBER) RETURN complex_number IS
    BEGIN 
        return complex_number(POWER(self.real_number, dunamh) , POWER(self.imaginary_number, dunamh)); -- Ypswsh twn 2 merwn tou migadikou sth dunamh pou pairnei ws parametro h member function thn opoia kalese
    END pow;
    
    /* i. Ypologismos metrou migadikou*/
    MEMBER FUNCTION metro RETURN NUMBER IS
    BEGIN   -- SQRT upologismos rizas
        return (SQRT( POWER(self.real_number, 2)+POWER(self.imaginary_number, 2))); --Epistrofh enos thetikou arithmou  pou einai to metro tou migadikou arithmou pou kalese auth th methodo
    END metro;
END;