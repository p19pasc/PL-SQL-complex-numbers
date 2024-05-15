-- (type specification)
/* Dhlwsh tupou antikeimenou me tis methodous tou */
CREATE OR REPLACE TYPE complex_number AS OBJECT
( 
    /* To antikeimeno apoteleitai apo 2 merh. To prwto to pragmatiko meros kai to deutero to fantastiko meros enos migadikou arithmou */
    real_number NUMBER, --dhlwsh tou a
    imaginary_number NUMBER, --dhlwsh tou b xwris to i
    /**/
    /* Parakatw orizontai oi methodoi pou mporoun na kleithoun apo ta stigmiotupa tou antikeimenou */
    MEMBER FUNCTION athroisma(migadikos IN complex_number) RETURN complex_number, 
    MEMBER FUNCTION afairesh(migadikos IN complex_number) RETURN complex_number,
    MEMBER FUNCTION pollaplasiasmos(migadikos IN complex_number) RETURN complex_number,
    MEMBER FUNCTION diairesh(migadikos IN complex_number) RETURN complex_number,
    MEMBER FUNCTION antitheto RETURN complex_number,
    MEMBER FUNCTION suzugh RETURN complex_number,
    MEMBER FUNCTION check_suzugh(migadikos IN complex_number) RETURN BOOLEAN,
    MEMBER FUNCTION pow(dunamh IN NUMBER) RETURN complex_number,
    MEMBER FUNCTION metro RETURN NUMBER
); 
