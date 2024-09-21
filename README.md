
# 演示
部署在Serv00，偶尔可能抽风😂   
https://imgs.vwwv.eu.org

演示图片：

![tgState](https://imgs.vwwv.eu.org/d/CAACAgUAAxkDAANJZu6ELCirivGdotUx9HbfV-mjxHoAAjcSAAKb_XBX5KYKF29fU8g2BA)  

# 参数说明

必填参数

 - target
 - token

可选参数

 - pass
 - mode
 - url
 - PORT
 - background

## target

目标可为频道、群组、个人

当目标为频道时，需要将Bot拉入频道作为管理员，公开频道并自定义频道Link，target值填写Link，如@xxxx

当目标为群组时，需要将Bot拉入群组，公开群组并自定义群组Link，target值填写Link，如@xxxx

当目标为个人时，则为telegram id(@getmyid_bot获取)

## token

填写你的bot token

## pass

填写访问密码，如不需要，留空即可

## mode

 - ```p``` 代表网盘模式运行，不限制上传后缀
 - ```m``` 在p模式的基础上关闭网页上传，可私聊进行上传（如果target是个人，则只支持指定用户进行私聊上传
 - 留空以纯图床模式运行

## url

bot获取FileID的前置域名地址自动补充及api返回完整url的补充

## PORT

自定义运行端口

## background

背景图片,填入图片url,留空纯色   
如需开启轮播，多张图片url以","分隔

# 管理

## 获取FIleID

对bot聊天中的文件引用并回复```get```可以获取FileID，搭建地址+获取的path即可访问资源

如果配置了url参数，会直接返回完整的地址

![image](https://github.com/csznet/tgState/assets/127601663/5b1fd6c0-652c-41de-bb63-e2f20b257022)

# 二进制部署

## 手动

Linux amd64下载

```
wget https://github.com/kyleyh838/tgState/releases/latest/download/tgState_linux_amd64.zip && unzip tgState_linux_amd64.zip && rm tgState_linux_amd64.zip
wget https://raw.githubusercontent.com/kyleyh838/tgState/refs/heads/edit/.env
```

Linux arm64下载

```
wget https://github.com/kyleyh838/tgState/releases/latest/download/tgState_linux_arm64.zip && unzip tgState_linux_arm64.zip && rm tgState_linux_arm64.zip
wget https://raw.githubusercontent.com/kyleyh838/tgState/refs/heads/edit/.env
```
FreeBSD amd64下载

```
wget https://github.com/kyleyh838/tgState/releases/latest/download/tgState_freebsd_amd64.zip && unzip tgState_freebsd_amd64.zip && rm tgState_freebsd_amd64.zip
wget https://raw.githubusercontent.com/kyleyh838/tgState/refs/heads/edit/.env
```

**使用方法**

填写参数
```
vim .env
```

运行程序
```
./tgState
```

**后台运行**

```
nohup ./tgState &
```

***

## 一键脚本

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/kyleyh838/tgState/refs/heads/edit/get.sh)"
```

# API说明

POST方法到路径```/api```

表单传输，字段名为image，内容为二进制数据  

当设置访问密码时，直接将密码加入url参数pass中，如密码为123：

```
/api?pass=123
```

返回示例:  

```json
{"code": 1, "message": "/d/xxx","url":"xxx"}
```

json格式的`url`默认返回tgState的`url`参数+访问路径，如果只得到了路径则需要自行设置`url`参数

picgo-plugin-web-uploader填写说明：  

POST参数名：`image`  

JSON路径：`url`

![image](https://github.com/csznet/tgState/assets/127601663/d70e6a42-1f21-4cbb-8ba5-1e9f7d9660a4)


