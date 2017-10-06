# CentOS 7 based image to run a Django app using NGINX Unit

## How to run
1. Build your container
```
docker run -itd --name django_unit -p 8000:8000 shumbashi/nginx_unit_django
```
2. Verify NGINX Unit is running
```
docker exec django_unit curl --unix-socket /run/control.unit.sock http://localhost
```
Output:
```
{
	"listeners": {},
	"applications": {}
}
```
3. Move wsgi.py file to the root of the project
```
docker exec django_unit mv /srv/app/app/wsgi.py /srv/app/wsgi.py
```
4. Configure a python based application in NGINX Unit
```
docker exec django_unit curl -X PUT -d @/srv/app/config.json --unix-socket /run/control.unit.sock http://localhost
```
5. Open http://localhost:8000, you should see the 'It Worked!' default Django page.