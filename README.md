# 容器
使用*容器*來建立虛擬環境，這個容器包含了作業系統、開發用的程式語言以及所需使用到的libraries。\
這可以使在開發時環境達到統一，避免了開發時因不同編譯環境而導致錯誤。\

# Docker
使用Docker協助建立虛擬環境，而具體的流程如下
1. 安裝Docker。
2. 下載或建立自己的映像檔。
3. 使用準備好的映像檔

### 1. 安裝Docker
- [在這裡安裝Docker](https://docs.docker.com/get-docker/)
- 接著可以在命令提示字元中輸入以下指令來確認是否安裝，若有輸出Docker版本則代表安裝成功。

```
docker -v
```

### 2. 映像檔

#### 2.1 建立自己的映像檔
1. 需要準備一個名為Dockerfile的檔案，這個檔案並不需要附檔名，\
其內容則包含作業系統(windows or Linux)、開發用的程式語言以及需要使用的libraries。\
可以下載此project中的[Dockerfile](./Dockerfile)作為練習的範本。
2. 準備一份requirements.txt檔案，這份檔案包含了你所要安裝的libraries，這可以依照你的需求而做更改\
也可以下載此project中的[requirements.txt](./requirements.txt)作為練習的範本。

3. 將Dockerfile及requirements.txt存至同一路徑

3. 打開命令提示字元，並透過以下指令切換路徑至Dockerfile及requirements.txt的存放路徑
```
cd YOUR_FILE_PATH
```
4. 建立映像檔

```
docker build -t author/imagename .
```
其中，\
author為建立映像檔的作者\
imagename為該映像檔的名稱\
請注意author與imagename請全部使用小寫，這是Docker的規則

5. 完成
這裡提供自己在build image中常遇到的錯誤參考，一般常見的是requirements.txt中的版本套件版本找不到，\
這可能是因為該版本並不支援docker。
解決方法有二
- 方法1. 將版本指定為錯誤提示裡的版本: 在錯誤提示中，它會提示支援的版本，將該套件的版本指定為支援的版本
- 方法2. 移除requirements.txt內套件的版本指定，讓pip自動選擇兼容的版本
  
若沒有其他錯誤則代表建立完成，也可以在docker desktop中看到以建立的映像檔。


#### 2.2 下載他人建立好的映像檔
您也可以在[Docker Hub](https://hub.docker.com/)中下載他人建立好的映像檔。\
在命令提示字元中輸入以下指令取得此project中的映像檔
```
docker pull ggaryyy/mypython-app 
```

### 3. 使用映像檔
使用以下指令來執行映像檔，以本project的映像檔為例
```
docker run -it --rm ggaryyy/mypython-app:latest bash
```

若想要將程式在此映像檔環境下執行，則以下方程式碼將程式掛載在此映像檔環境，\
本project提供[hello.py](./hello.py)測試
```
docker run -it --rm -v yourPath/:/app ggaryyy/mypython-app:latest bash
```

執行後再輸入以下程式碼來執行hello.py
```
python hello.py
```

# 其他議題
這部分主要探討資安議題
1. 容器: 容器本身是隔離於本地主機外的，在掛載資料夾給容器時就會跳出授權訪問的同意通知，除此之外沒有同意授權的資料夾或資料則無法被容器存取。
2. 映像檔: 映像檔的安全性取決於來源的可靠，並免使用未知或不可靠的映像檔
3. 網路安全: 根據配置，容器內的程式可能訪問外部網路，謹慎配置並免未授權的網路訪問。
4. 數據: 存於容器內的數據應去識別化避免包含敏感資訊。


