" Vim syntax file
" Lenguaje: ensamblador PIC14 (MPASM / gpasm)
" Archivo:  ~/.config/nvim/syntax/pic14asm.vim

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comentarios: todo lo que sigue al punto y coma
syn match picComment ";.*$" contains=@Spell

" Preprocesador de gpasm
syn match picPreProc "^\s*#\s*\%(include\|define\|undef\|ifdef\|ifndef\|else\|endif\|error\|pragma\)\>"
syn match picInclude "^\s*#\s*include\s*[<\"][^>\"]*[>\"]" contains=picPreProc
syn match picString "[<\"]\zs[^>\"]*\ze[>\"]" contained

" Directivas
syn keyword picDirective LIST PROCESSOR ORG END EQU SET CBLOCK ENDC
syn keyword picDirective INCLUDE __CONFIG __IDLOCS __MAXRAM __BADRAM
syn keyword picDirective EXPAND NOEXPAND ERROR ERRORLEVEL MESSG TITLE SUBTITLE
syn keyword picDirective RADIX FILL RES CODE DATA UDATA IDATA
syn keyword picDirective PAGESEL BANKSEL MACRO ENDM
syn keyword picDirective IF IFDEF IFNDEF ELSE ENDIF WHILE REPEAT UNTIL

" Instrucciones PIC16 (línea media y línea mejorada)
syn keyword picMnemonic ADDWF ANDWF CLRF CLRW COMF DECF DECFSZ GOTO INCF
syn keyword picMnemonic INCFSZ IORWF MOVF MOVWF NOP RLF RRF SUBWF SWAPF XORWF
syn keyword picMnemonic BCF BSF BTFSC BTFSS
syn keyword picMnemonic ADDLW ANDLW CALL CLRWDT IORLW MOVLW RETFIE RETLW
syn keyword picMnemonic RETURN SLEEP SUBLW XORLW
syn keyword picMnemonic OPTION TRIS
syn keyword picMnemonic ADDFSR ADDWFC ASRF BRA BRW CALLW LSLF LSRF MOVLB MOVLP
syn keyword picMnemonic RESET SUBWFB

" Registros de función especial más usados
syn keyword picRegister INDF PCL STATUS FSR PCLATH INTCON OPTION_REG
syn keyword picRegister TMR0 TMR1L TMR1H T1CON TMR2 T2CON PR2
syn keyword picRegister PORTA PORTB PORTC PORTD PORTE
syn keyword picRegister TRISA TRISB TRISC TRISD TRISE
syn keyword picRegister PIR1 PIR2 PIE1 PIE2 PCON
syn keyword picRegister SSPBUF SSPCON SSPCON2 SSPSTAT SSPADD
syn keyword picRegister CCPR1L CCPR1H CCP1CON CCPR2L CCPR2H CCP2CON
syn keyword picRegister RCSTA TXSTA SPBRG BAUDCTL
syn keyword picRegister ADRESH ADRESL ADCON0 ADCON1
syn keyword picRegister EEDATA EEADR EECON1 EECON2
syn keyword picRegister ANSEL ANSELH OSCCON OSCTUNE VRCON SRCON WPUB IOCB
syn keyword picRegister W F

" Bits de los registros de control
syn keyword picBit RP0 RP1 IRP GIE PEIE T0IE INTE RBIE T0IF INTF RBIF
syn keyword picBit Z DC C TO PD PS0 PS1 PS2
syn keyword picBit TMR0IE TMR0IF TMR1IE TMR1IF TMR2IE TMR2IF
syn keyword picBit SSPIE SSPIF CCP1IE CCP1IF CCP2IE CCP2IF
syn keyword picBit TXIE TXIF RCIE RCIF ADIE ADIF EEIE EEIF
syn keyword picBit BRGH TXEN RCEN PEN SSPEN CREN SPEN
syn keyword picBit RBPU NOT_RBPU

" Símbolos de configuración: _CP_OFF, _WDT_ON, _HS_OSC, _LVP_OFF...
syn match picConfig "\<_[A-Z][A-Z0-9_]*\>"

" Números: 0x1F, H'1F', B'1010', D'25', decimales y punto decimal
syn match picNumber "\<\%(0x\x\+\|[Hh]'[0-9A-Fa-f]\+'\|[Bb]'[01]\+'\|[Dd]'[0-9]\+'\|[0-9]\+\|\.\d\+\)\>"

" Etiquetas al inicio de línea y símbolos definidos con EQU
syn match picLabel "^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*:"
syn match picSymbol "^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s\+[Ee][Qq][Uu]\>"

syn sync fromstart

" Colores
hi def link picComment   Comment
hi def link picPreProc   PreProc
hi def link picInclude   Include
hi def link picString    String
hi def link picDirective Statement
hi def link picMnemonic  Keyword
hi def link picRegister  Identifier
hi def link picBit       Constant
hi def link picConfig    Define
hi def link picNumber    Number
hi def link picLabel     Function
hi def link picSymbol    Type

let b:current_syntax = "pic14asm"
