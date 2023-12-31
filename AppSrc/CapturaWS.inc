Define SRCCOPY           for |CI$00CC0020
Define CF_BITMAP         for |CI2

Enum_List   //Enum DEVCAP_INDEX As Integer  
   Define DRIVERVERSION for 0 
   Define TECHNOLOGY for 2 
   Define HORZSIZE for 4 
   Define VERTSIZE for 6 
   Define HORZRES for 8 
   Define VERTRES for 10 
   Define BITSPIXEL for 12 
   Define PLANES for 14 
   Define NUMBRUSHES for 16 
   Define NUMPENS for 18 
   Define NUMMARKERS for 20 
   Define NUMFONTS for 22 
   Define NUMCOLORS for 24 
   Define PDEVICESIZE for 26 
   Define CURVECAPS for 28 
   Define LINECAPS for 30 
   Define POLYGONALCAPS for 32 
   Define TEXTCAPS for 34 
   Define CLIPCAPS for 36 
   Define RASTERCAPS for 38 
   Define ASPECTX for 40 
   Define ASPECTY for 42 
   Define ASPECTXY for 44 
   Define SHADEBLENDCAPS for 45 
   //Define LOGPIXELSX for 88    ahora en wingdi.pkg
   //Define LOGPIXELSY for 90 
   Define SIZEPALETTE for 104 
   Define NUMRESERVED for 106 
   Define COLORRES for 108 
   Define PHYSICALWIDTH for 110 
   Define PHYSICALHEIGHT for 111 
   Define PHYSICALOFFSETX for 112 
   Define PHYSICALOFFSETY for 113 
   Define SCALINGFACTORX for 114 
   Define SCALINGFACTORY for 115 
   Define VREFRESH for 116 
   Define DESKTOPVERTRES for 117 
   Define DESKTOPHORZRES for 118 
   Define BLTALIGNMENT for 119 
End_Enum_List  

Enum_List   //Enum compression
   Define bi_rgb for 0       //- none (also identified by bi_rgb)
   Define bi_rle4 for 1      //- rle 8-bit / pixel (also identified by bi_rle4)
   Define bi_rle8 for 2      //- rle 4-bit / pixel (also identified by bi_rle8)
   Define bi_bitfields for 3 //- bitfields (also identified by bi_bitfields)
End_Enum_List  

Define GENERIC_WRITE          for 1073741824 //= 0x40000000 
Define CREATE_ALWAYS          for 2          //= 0x2 
Define FILE_ATTRIBUTE_NORMAL  for 128        //= 0x80 

Define DIB_PAL_COLORS for 1
Define DIB_RGB_COLORS for 0

#IFNDEF _STRUCT_RECT_TYPE
Struct RECT_TYPE
   Integer ileft
   Integer itop
   Integer iright
   Integer ibottom
End_Struct
#ENDIF

#IFNDEF _STRUCT_BITMAPINFOHEADER
Struct BITMAPINFOHEADER
  DWORD biSize                    // DWORD=integer
  Integer biWidth                    // LONG =integer
  Integer biHeight                   // LONG 
  short biPlanes                   // WORD =short
  short biBitCount                 // WORD 
  DWORD biCompression             // DWORD
  DWORD biSizeImage               // DWORD
  Integer biXPelsPerMeter            // LONG 
  Integer biYPelsPerMeter            // LONG 
  DWORD biClrUsed                 // DWORD
  DWORD biClrImportant            // DWORD
end_struct
#ENDIF

#IFNDEF _STRUCT_RGBQUAD
struct RGBQUAD
  CHAR rgbBlue            //BYTE=CHAR
  CHAR rgbGreen
  CHAR rgbRed
  CHAR rgbReserved
end_struct
#ENDIF

#IFNDEF _STRUCT_BITMAPINFO 
struct BITMAPINFO 
  BITMAPINFOHEADER bmiHeader 
  RGBQUAD[] bmiColors
end_struct
#ENDIF

#IFNDEF _STRUCT_BITMAPFILEHEADER
struct BITMAPFILEHEADER
  Short bfType         //WORD  //BM (0x4D42)
  DWord bfSize        //DWORD
  Short bfReserved1    //WORD 
  Short bfReserved2    //WORD 
  DWord bfOffBits     //DWORD
end_struct
#ENDIF

#IFNDEF _STRUCT_BITMAP 
Struct BITMAP 
  Integer   bmType
  Integer   bmWidth
  Integer   bmHeight
  Integer   bmWidthBytes
  Short   bmPlanes
  Short   bmBitsPixel
  Pointer bmBits
end_struct
#ENDIF

#IFNDEF _STRUCT_DIBSECTION 
Struct DIBSECTION 
  BITMAP           dsBm
  BITMAPINFOHEADER dsBmih
  DWord[3]         dsBitfields
  Handle           dshSection
  DWord            dsOffset
end_struct
#ENDIF
