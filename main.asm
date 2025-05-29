
.data
DISPLAY: .space  1048576 #4*512*256



.text 0x00400000
  j main
  .include "compiled.asm"

