# Tenda AIC8800 驱动

基于 [官方驱动 1.0.13 版本](https://www.tenda.com.cn/material/show/690938082103365?proPath=w311miv60) 做 patch，修复了因 `in_irq()` 在高版本内核被移除导致的无法安装问题

## 安装

下载 [Release 中的 deb 包](https://github.com/SherkeyXD/Tenda-AIC8800DC/releases/download/1.0.13/ax300-wifi-adapter-linux-driver_1.0.13+kernel6.19-1.deb) 到本地，然后执行

```bash
sudo apt install ./ax300-wifi-adapter-linux-driver_1.0.13+kernel6.19-1.deb
```

## 编译

### 编译为 deb 包

```bash
chmod +x ./build-deb/build-deb.sh
./build-deb/build-deb.sh
```

### 本机编译安装

```bash
cd drivers/aic8800
make clean
make all
sudo make install
```
