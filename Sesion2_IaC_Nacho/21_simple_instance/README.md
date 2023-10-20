# 1. Simple Instance

## Crear una instancia EC2
Vamos a empezar por el final (en la vida real no sabremos lo que nos hace falta) y buscaremos en la documentación del provider el recurso que modela una instancia.

(pista: se llama `aws_instance` que no cumple con el patrón de `aws_<servicio>_<recurso>`)

Te recomiendo mirar qué argumentos son **required**. Parece que ninguno pero en realidad algunos dependen de si existen otros o no.

Vas a ver que, como no tenemos un `launch_template` son dos:
- `instance_type` -> te la digo yo que si no les subimos los costes: `t3.micro`
- `ami` -> fíjate en si requiere un nombre o un id u otro. En este caso no lo dice pero los simpáticos de ellos nos han puesto un ejemplo. Ahí se ve que espera un id.

Te recomiendo mirar los ejemplos que suelen ser útiles.

Verás que para buscar la ami usa un bloque data. Búscalo y abre la documentación del bloque data `aws_ami`. OJO del bloque data, no del recurso. No queremos crear una ami, queremos buscarla.

En la documentación te enseña cómo poner filtros y diferentes opciones. Te doy pistas:
- Queremos poner la AMI de nginx de Bitnami. Para ello queremos que el owner de la AMI sean ellos. A mí me gusta usar el id más que el alias: "979382823631"
- Filtraremos por nombre de la ami "bitnami-nginx-1.23.3-7*"
- Queremos la más reciente.

Con esto modelamos la instancia y la ami como aparece en el ejemplo y ya estaría, ¿no?

Pues falla, necesita una VPC. Normalmente no fallaría pero justo nuestra infra no tiene VPC default.

Tenemos dos opciones: crear los recursos o usas los dados

## Usar los recuros VPC dados

Tendras que crear data blocks para buscar la VPC.

Si miras la documentación de la instancia lo que necesitamos es una subnet así que necesitas un bloque de data para buscar la subnet en cuestión. Sin embargo, lo habitual es que te digan es la subnet de una VPC y como se llama. Busca la subnet que:
- su nombre de subnet (es un tag): "GeeksHubs-DevOps"
- su VPC: "vpc-07a69de4c06d6cc13"

## El security group
Por último AWS tiene unos componentes para permitir el tráfico (o no). Por defecto no permite nada a las instancias así que se lo tenemos que explicitar. Por no crear 20 security groups idénticos he generado yo uno.

Tendrás que usar otro data block para buscarlo. Se llama "allow-http-inbound-traffic" y pertenece a la misma VPC que la subnet.

## Final
Añade los argumentos necesarios para que:
- La instancia se genere en la subnet que hemos buscado
- Utilize los security groups adecuados (en este caso es uno)
- Que tenga una IP externa!

Y por último si creamos un bloque output para sacar la IP por consola, lo tenemos todo hecho. En la documentación puedes ver que los recursos tienen atributos.

## Crear recursos VPC
Este caso lo veremos en clase o con los ejemplos

