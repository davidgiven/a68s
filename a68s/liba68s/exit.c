#include <stdio.h>

cleenup()
  {
    FILE *iop ;
    extern FILE *_lastbuf ;

    for ( iop = _iob ; iop < _lastbuf ; iop ++ )
      fclose( iop ) ;
  }

exit(n)
int n;
  { cleenup() ; _exit(n) ; }
