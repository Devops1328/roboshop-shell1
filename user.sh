dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp user.service /etc/systemd/system/user.service

useradd roboshop
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable user
systemctl start user