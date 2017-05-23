# sawoodTest
dockerfile の中に、CentOSの仮想マシンを構築
作った仮想マシンにsshの公開鍵認証で、ログイン出来るようになるからssh user もつくた,
username : docker 公開鍵認証:12345678
仮想マシンの中に、apache,mysqlをインストール　しました。
docker.conf に　apache の　root folder　の 設定 /var/www/html/public/　しました。
test folder に　　laravel の　application が　あります。
Data folder に　database の　ファイル　が　あります。
docker-compose.yml に　port とか　volume を　setを　しました。
docker-compose.yml　から　dockerfile run を　します。 command:　docker-compose up 


