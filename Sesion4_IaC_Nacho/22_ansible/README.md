# Ansible

# 0. Preparación
Crearemos un fichero de cloud-config que solamente cree el usuario de "administrator" (o el que quiera usar) con las capacidades mencionadas en el ejercicio anterior:
- Darle capacidad de hacer sudo sin password
- Meterle en los grupos "users" y "admin"
- Asignarle una clave ssh autorizada.

La instancia la generaremos con TF y esta cloud-config.

# 1. Inventario
Creamos un inventario que contenga:
- Un grupo llamado "webservers"
- Un servidor de ese grupo con la IP de la instancia levantada con TF.

Pista: Probablemente haya que configurar el usuario y la clave ssh a usar

Comprobamos que podemos hacer ping a los servidores del grupo "webservers" con ansible usando un comando ad-hoc

# 2. Playbook
Crearemos un playbook con un único play que se encargue de las siguientes tareas sobre el grupo "webservers":
- El usuario administrador, sus grupos y la clave ssh.
- Actualizar el sistema de paquetes y los paquetes
- El paquete nginx instalado
- El servicio nginx creado y arrancado
- Suba el fichero index.html a su la localización correspondiente (`/var/www/html`)

Nota: después de modificar el fichero el servicio nginx tiene que reiniciarse
