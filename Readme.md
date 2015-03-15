# owncloud 8

Thanks to jchaney / owncloud

## Features
 ubuntu 14:04
 mysql
 http only
 for test purpose only, if you want to make it live change autoconfig and implement https.
 
 autoconfig.php >
  "adminlogin"    => "root",
  "directory"     => "/var/www/owncloud/data",
  "dbtype"        => "mysql",
  "dbname"        => "owncloud",
  "dbuser"        => "root",
  "dbpass"        => "",
  "dbhost"        => "localhost",
  "dbtableprefix" => "",

## Authors

  - Aries4

## Examples

docker run -p 80:80 -v /home/ubuntu/files:/var/www/owncloud/data -d aries4/owncloud
