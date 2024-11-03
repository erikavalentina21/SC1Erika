#! /bin/bash
declare -A colores
fich=$1
for color in $(cat $fich); do
	read -p "dime el cod RGB del color $color: " cod
	colores[$color]=$cod
	echo "el codigo de $color es ${colores[$color]}"

done
echo "numero de colores introducidos: $#"
echo " codigo de posibles colores: ${colores[@]}"
echo "nombre de posibles colores: $@ "
read -p "dime el color del background" back
colorback=${colores[$back]}
read -p "dime el color del parrafo" par
colorpar=${colores[$par]}
read -p "dime el color del texto" texto
colortexto=${colores[$texto]}
archivo="index.html"
contenido='
<!DOCTIPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name"viewport" content="width=device, initial-scale=1.0">
	<title>Mi Página HTML</title>
	<style>
		body {
			background-color: #'$colorback';
			color: #'$colortexto';
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 20px;
	}
	p {
		color: #'$colorpar';
		font-size: 16px;
		line-height: 1.5;
	}
	</style>
</head>
<body>
	<h1>Hola, mundo!</h1>

	<p>Este es un ejemplo de htlm<p>
	<img src="/home/usuario/Descargas/imagen">
<body>
</html>
'

echo $contenido > $archivo
echo "se ha creado el archivo html: $archivo"

