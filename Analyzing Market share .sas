proc import datafile= "H:\SAS files\Assignment 4\pims.csv"
OUT = pims
dbms = csv;
run;

/* 2SLS */

PROC SYSLIN 2SLS SIMPLE plots = None;
ENDOGENOUS ms qual price plb dc;
INSTRUMENTS  pion ef phpf plpf psc papc ncomp mktexp tyrp pnp custtyp ncust custsize penew cap rbvi emprody union;
model MS=qual plb price pion ef phpf plpf psc papc ncomp mktexp;
model QUAL=price dc pion ef tyrp mktexp pnp;
model PLB=dc pion tyrp ef pnp custtyp ncust custsize;
model PRICE=MS qual dc pion ef tyrp mktexp pnp;
model DC=MS qual pion ef tyrp penew cap rbvi emprody union; 
RUN;

proc reg data = pims plots = None;
model MS=qual plb price pion ef phpf plpf psc papc ncomp mktexp;
run;

/* 3SLS*/
PROC SYSLIN 3SLS SIMPLE plots = None;
ENDOGENOUS ms qual price plb dc;
INSTRUMENTS  pion ef phpf plpf psc papc ncomp mktexp tyrp pnp custtyp ncust custsize penew cap rbvi emprody union;
model MS=qual plb price pion ef phpf plpf psc papc ncomp mktexp;
model QUAL=price dc pion ef tyrp mktexp pnp;
model PLB=dc pion tyrp ef pnp custtyp ncust custsize;
model PRICE=MS qual dc pion ef tyrp mktexp pnp;
model DC=MS qual pion ef tyrp penew cap rbvi emprody union; 
RUN;
