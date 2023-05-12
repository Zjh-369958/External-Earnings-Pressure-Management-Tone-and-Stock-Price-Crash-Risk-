use "D:\..Basic Data",replace
///Descriptive statistics(Table2)
global xlist "Size Growth EM EPS"
logout, save(Descriptive statistics) word replace:sum NCSKEW Pressure $xlist	
///Correlation analysis
logout,save (Correlation analysis) word replace: pwcorr_a NCSKEW Pressure $xlist
///Baseline regression(Table3)
reg NCSKEW Pressure i.year i.indus1
reg NCSKEW Pressure $xlist 
reg NCSKEW Pressure $xlist i.year 
reg NCSKEW Pressure $xlist i.year i.indus1
///Threshold regression--a single threshold(Table4, Table5, Table6)
xtset Stkcd year
xthreg NCSKEW $xlist ,rx(Pressure) qx(Tone) bs(300 300 300) trim(0.01 0.01 0.05) thnum(3)
xthreg NCSKEW $xlist ,rx(Pressure) qx(Tone) bs(300 300) trim(0.01 0.05) thnum(2)
xthreg NCSKEW $xlist ,rx(Pressure) qx(Tone) bs(300) trim(0.01) thnum(1)
///Fig.1
estat plot
///Robustness test--Baseline regression(Table7)
reg DUVOL Pressure i.year i.indus1
reg DUVOL Pressure $xlist 
reg DUVOL Pressure $xlist i.year 
reg DUVOL Pressure $xlist i.year i.indus1
///Robustness test--Threshold regression(Table8)
xtset Stkcd year
xthreg NCSKEW $xlist Institution ,rx(Pressure) qx(Tone) bs(300 300 300) trim(0.01 0.01 0.05) thnum(3)
xthreg NCSKEW $xlist Institution ,rx(Pressure) qx(Tone) bs(300 300) trim(0.01 0.05) thnum(2)
xthreg NCSKEW $xlist Institution ,rx(Pressure) qx(Tone) bs(300) trim(0.01) thnum(1)
///Heterogeneity test(Table9)
 reg NCSKEW Pressure $xlist i.year i.indus1 if Shareholding==1
 reg NCSKEW Pressure $xlist i.year i.indus1 if Shareholding==0
