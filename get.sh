#!/bin/bash

ARCH=$(uname -m)
OS=$(uname -s)

if [[ "$OS" == "Linux" ]]; then
    if [[ "$ARCH" == "x86_64" ]]; then
        File="tgState_linux_amd64.zip"
    elif [[ "$ARCH" == "aarch64" ]]; then
        File="tgState_linux_arm64.zip"
    else
        echo "Unsupported architecture: $OS $ARCH"
        exit 1
    fi
elif [[ "$OS" == "FreeBSD" ]]; then
    if [[ "$ARCH" == "amd64" ]]; then
        File="tgState_freebsd_amd64.zip"
    else
        echo "Unsupported architecture: $OS $ARCH"
        exit 1
    fi
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Download and unzip
wget "https://github.com/kyleyh838/tgState/releases/latest/download/$File" && unzip "$File" && rm "$File"

# Set permissions
chmod +x tgState

# Set Env
read -p "输入Target(必填)：" TARGET
read -p "输入Telegram Bot Token(必填)：" BOT_TOKEN
read -p "输入访问密码(可选)：" PASSWORD
read -p "输入运行模式(可选)：" MODE
read -p "输入访问URL(可选)：" URL
read -p "输入运行端口(可选，默认8088)：" PORT
read -p "输入背景图片URL(可选)：" BACKGROUND

cat > .env << EOF
export target=$TARGET
export token=$BOT_TOKEN
export pass=$PASSWORD
export mode=$MODE
export url=$URL
export PORT=$PORT
export background=\"$BACKGROUND\"
EOF

nohup ./tgState &

echo "程序部署完成，请输入 http://IP:PORT 访问网站！"
