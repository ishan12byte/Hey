# Hey
Hey download and Setup

wget https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
chmod +x hey_linux_amd64
sudo mv hey_linux_amd64 /usr/local/bin/hey

hey -h
chmod +x load.sh

hey -z 17h -q 10 http://SERVER_A_PRIVATE_OR_PUBLIC_IP:8000/

ps aux | grep load.sh
tail -f load.log
tail -f load.log
