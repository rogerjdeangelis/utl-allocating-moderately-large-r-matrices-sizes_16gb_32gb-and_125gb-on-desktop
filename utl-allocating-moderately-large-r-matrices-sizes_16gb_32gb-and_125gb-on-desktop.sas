%let pgm=utl-utl-allocating-moderately-large-r-matrices-sizes_16gb_32gb-and_125gb-on-desktop;

Allocating moderately large r matrices sizes 16gb 32gb and 125gb on desktop

github
https://tinyurl.com/4nemdb8m
https://github.com/rogerjdeangelis/utl-allocating-moderately-large-r-matrices-sizes_16gb_32gb-and_125gb-on-desktop

Allocate

    mat[46340,46340]
    mat[65537,65537]
    mat[125000,125000]

Seems to be espcially fast becaus my $00 desktop has 128gb ram, note I do need the bigmemory package
because the rows is limited to 2^32. Very little overflow to the files?

SOAPBOX ON

  For matrices over 256gb consider AWS and maybe the ALtair SLC or SAS.
  The only problem will be reasonable performace and reasonable cost.
  I suspect the cost to very high?
  I can expand my $600 desktop to 256gb ram.

SOAPBOX OFF

/*               _          _
 _ __  _ __ ___ | |__   ___| |_ __ ___
| `_ \| `__/ _ \| `_ \ / _ \ | `_ ` _ \
| |_) | | | (_) | |_) |  __/ | | | | | |
| .__/|_|  \___/|_.__/ \___|_|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                        |                                     |                                         */
/*            INPUT                       |        PROCESS                      |              OUTPUT                     */
/*                                        |                                     |                                         */
/* nrow=46340  ncol= 46340 type ='double' | %macro doem(arg,ret=siz1);          | mat[ 46340, 46340] SIZ1= 17,179,164,800 */
/* nrow=65537  ncol= 65537 type ='double' |                                     | mat[ 65537, 65537] SIZ2= 34,360,786,952 */
/* nrow=125000 ncol=125000 type ='double' |  %utlfkil(c:/temp/mat.bin);         | mat[125000,125000] SIZ3=125,000,000,000 */
/*                                        |  %utlfkil(c:/temp/mat.dsc);         |                                         */
/* backingfile = 'mat.bin'                |                                     | 16gb                                    */
/* backingpath = 'c:/temp'                |   %utl_submit_r64x("                | 32gb                                    */
/* descriptorfile='mat.dsc');             |   library(bigmemory);               | 125gb                                   */
/*                                        |   mat <- filebacked.big.matrix(     |                                         */
/*                                        |     nrow =&arg                      |                                         */
/*                                        |   , ncol =&arg                      |                                         */
/*                                        |   , type ='double'                  |                                         */
/*                                        |   , backingfile = 'mat.bin'         |                                         */
/*                                        |   , backingpath = 'c:/temp'         |                                         */
/*                                        |   , descriptorfile='mat.dsc');      |                                         */
/*                                        |     mat[&arg,&arg];                 |                                         */
/*                                        |   mat[&arg,&arg]=123456789;         |                                         */
/*                                        |   mat[&arg,&arg];                   |                                         */
/*                                        |   siz=&arg * &arg * 8;              |                                         */
/*                                        |   siz;                              |                                         */
/*                                        |   writeClipboard(as.character(siz));|                                         */
/*                                        |   ",return=&ret);                   |                                         */
/*                                        |                                     |                                         */
/*                                        |  %mend doem;                        |                                         */
/*                                        |                                     |                                         */
/*                                        |  %utlnopts;                         |                                         */
/*                                        |  %doem(46340,ret=siz1);             |                                         */
/*                                        |  %doem(65537,ret=siz2);             |                                         */
/*                                        |  %doem(125000,ret=siz3);            |                                         */
/*                                        |                                     |                                         */
/*                                        |  %put &=siz1;                       |                                         */
/*                                        |  %put &=siz2;                       |                                         */
/*                                        |  %put &=siz3;                       |                                         */
/*                                        |                                     |                                         */
/**************************************************************************************************************************/

/*         _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| `_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

*/

%macro doem(arg,ret=siz1);

 %utlfkil(c:/temp/mat.bin);
 %utlfkil(c:/temp/mat.dsc);

  %utl_submit_r64x("
  library(bigmemory);
  mat <- filebacked.big.matrix(
    nrow =&arg
  , ncol =&arg
  , type ='double'
  , backingfile = 'mat.bin'
  , backingpath = 'c:/temp'
  , descriptorfile='mat.dsc');
    mat[&arg,&arg];
  mat[&arg,&arg]=123456789;
  mat[&arg,&arg];
  siz=&arg * &arg * 8;
  siz;
  writeClipboard(as.character(siz));
  ",return=&ret);

 %mend doem;

 %utlnopts;
 %doem(46340,ret=siz1);
 %doem(65537,ret=siz2);
 %doem(125000,ret=siz3);

 %put &=siz1;
 %put &=siz2;
 %put &=siz3;

 /*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/
 library(bigmemory);  mat <- filebacked.big.matrix(    nrow =46340  , ncol =46340
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptorfile
 'mat.dsc');    mat[46340,46340];  mat[46340,46340]=123456789;  mat[46340,46340];
siz=46340 * 46340 * 8;  siz;  writeClipboard(as.character(siz));
 > library(bigmemory);  mat <- filebacked.big.matrix(    nrow =46340  , ncol =46340
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptorfi
 e='mat.dsc');    mat[46340,46340];  mat[46340,46340]=123456789;  mat[46340,46340];
siz=46340 * 46340 * 8;  siz;  writeClipboard(as.character(siz));
 [1] 0
 [1] 123456789
 [1] 17179164800
 >
 library(bigmemory);  mat <- filebacked.big.matrix(    nrow =65537  , ncol =65537
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptorfile
 'mat.dsc');    mat[65537,65537];  mat[65537,65537]=123456789;  mat[65537,65537];
siz=65537 * 65537 * 8;  siz;  writeClipboard(as.character(siz));
 > library(bigmemory);  mat <- filebacked.big.matrix(    nrow =65537  , ncol =65537
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptorfi
 e='mat.dsc');    mat[65537,65537];  mat[65537,65537]=123456789;  mat[65537,65537];
siz=65537 * 65537 * 8;  siz;  writeClipboard(as.character(siz));
nrow = 46340  ncol = 46340  type ='double'   %macro doem(arg,ret=siz1);
 [1] 0
 [1] 123456789
 [1] 34360786952
 >
 library(bigmemory);  mat <- filebacked.big.matrix(    nrow =125000  , ncol =125000
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptorfi
 e='mat.dsc');    mat[125000,125000];  mat[125000,125000]=123456789;  mat[125000,125000];
siz=125000 * 125000 * 8;  siz;  writeClipboard(as.character(siz));
 > library(bigmemory);  mat <- filebacked.big.matrix(    nrow =125000  , ncol =125000
, type ='double'  , backingfile = 'mat.bin'  , backingpath = 'c:/temp'  , descriptor
 ile='mat.dsc');    mat[125000,125000];  mat[125000,125000]=123456789;  mat[125000,125000];
siz=125000 * 125000 * 8;  siz;  writeClipboard(as.character(siz));
 [1] 0
 [1] 123456789
 [1] 1.25e+11
 >
 SIZ1=17179164800
 SIZ2=34360786952
 SIZ3=1.25e+11

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
