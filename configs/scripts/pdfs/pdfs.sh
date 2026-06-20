#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
pinkCoulour="\e[0;35m\033[1m"
purpleColour="\e[1;37m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c() {
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  tput cnorm && exit 1
}

# Ctrl+C
trap ctrl_c INT

# functions
helpPanel() {
  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Herramienta para convertir imagenes a PDF o unir PDFs${endColour}"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Uso:${endColour}"
  echo -e "\t${turquoiseColour}pdfx -c -o [nombre] [imagenes...]${endColour}"
  echo -e "\t${turquoiseColour}pdfx -u -o [nombre] [pdfs...]${endColour}"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Opciones:${endColour}"
  echo -e "\t${purpleColour}-c${endColour} Convertir imagenes a PDF"
  echo -e "\t${purpleColour}-u${endColour} Unir varios PDFs en uno solo"
  echo -e "\t${purpleColour}-o${endColour} Definir el nombre del archivo de salida"
  echo -e "\t${purpleColour}-h${endColour} Mostrar este panel de ayuda"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Orden correcto:${endColour}"
  echo -e "\t${grayColour}Primero escribe la opcion principal (-c o -u)${endColour}"
  echo -e "\t${grayColour}Luego el nombre de salida con -o${endColour}"
  echo -e "\t${grayColour}Y al final los archivos a procesar${endColour}"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Ejemplos para convertir imagenes:${endColour}"
  echo -e "\t${turquoiseColour}pdfx -c -o documento imagen1.jpg imagen2.jpg imagen3.jpg${endColour}"
  echo -e "\t${turquoiseColour}pdfx -c -o documento *.jpg${endColour}"
  echo -e "\t${grayColour}Esto genera:${endColour} documento.pdf"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Ejemplos para unir PDFs:${endColour}"
  echo -e "\t${turquoiseColour}pdfx -u -o combinado archivo1.pdf archivo2.pdf archivo3.pdf${endColour}"
  echo -e "\t${turquoiseColour}pdfx -u -o combinado *.pdf${endColour}"
  echo -e "\t${grayColour}Esto genera:${endColour} combinado.pdf"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Valores por defecto:${endColour}"
  echo -e "\t${grayColour}Si no usas -o al convertir, se genera:${endColour} output.pdf"
  echo -e "\t${grayColour}Si no usas -o al unir PDFs, se genera:${endColour} merge.pdf"

  echo -e "\n${yellowColour}[+]${endColour}${purpleColour} Notas:${endColour}"
  echo -e "\t${grayColour}- Puedes escribir los archivos uno por uno.${endColour}"
  echo -e "\t${grayColour}- Tambien puedes usar comodines como ${purpleColour}*.jpg${endColour} o ${purpleColour}*.pdf${endColour}"
  echo -e "\t${grayColour}- No escribas ${purpleColour}.pdf${endColour} en ${purpleColour}-o${endColour}, el script lo agrega automaticamente.${endColour}"
}

convertirPDF() {
  local finalName

  if [ "$outputName" = "default" ]; then
    finalName="output.pdf"
  else
    finalName="${outputName}.pdf"
  fi

  img2pdf "$@" -o "$finalName"
}

unirPDF() {
  local finalName

  if [ "$outputName" = "default" ]; then
    finalName="merge.pdf"
  else
    finalName="${outputName}.pdf"
  fi

  pdfunite "$@" "$finalName"
}

# Indicadores
declare -i parameter_counter=0
outputName="default"

while getopts "cuho:" arg; do
  case $arg in
  c)
    let parameter_counter+=1
    ;;
  u)
    let parameter_counter+=2
    ;;
  o)
    outputName="${OPTARG%.pdf}"
    ;;
  h)
    helpPanel
    exit 0
    ;;
  esac
done

shift $((OPTIND - 1))

if [ $parameter_counter -eq 1 ]; then
  convertirPDF "$@"
elif [ $parameter_counter -eq 2 ]; then
  unirPDF "$@"
else
  helpPanel
fi
