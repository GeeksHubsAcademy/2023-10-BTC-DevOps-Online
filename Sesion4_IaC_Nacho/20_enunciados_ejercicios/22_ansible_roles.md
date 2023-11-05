# Ansible en Roles

# 1. Rol "common"
Creamos un rol llamado common que gestione los siguientes elementos:
- El usuario administrador, sus grupos y la clave ssh.
- Actualizar el sistema de paquetes y los paquetes

# 3. Playbook
Crearemos otro playbook diferente al del ejercicio anterior que aplique el rol "common" sobre el grupo "webservers" y ejecutaremos este playbook en ansible.

# 4. Rol "webserver"
Creamos un rol llamado webserver que gestione los siguientes elementos:
- El paquete nginx instalado
- El servicio nginx creado y arrancado
- Suba el fichero index.html a su la localización correspondiente (`/var/www/html`)

Nota: después de modificar el fichero el servicio nginx tiene que reiniciarse

Lo añadimos al playbook como rol nuevo y probaremos a lanzarlo y ver que funciona. Luego cambiaremos el html local y lo volveremos a lanzar para ver que hay cambios.

# 5. Templates
- Modificaremos el fichero index.html para que sea un template.
- Cambiaremos algún valor por una variable. Por ejemplo, el nombre en el título y el párrafo como variable "author_name"
- Crearemos un valor por defecto para esa variable a "Anonymous"

Probaremos a desplegar y veremos que el template ha sido desplegado con la variable por defecto

Sobreescribiremos esa variable con otra con nuestro nombre, una variable de grupo por ejemplo, y relanzamos.

# 6. Varios templates
- Copiaremos el template y lo modificaremos para tener un segundo HTML (por ejemplo "second.html"). Podemos vincularlos con un `<a>` si nos apetece.
- Subiremos los templates en la misma tarea
- Además, ya preocupados por la seguridad, haremos que el fichero no se copie como `root:root` sino como `www-data:www-data` (el usuario y grupo que usa el worker de nginx por defecto)
