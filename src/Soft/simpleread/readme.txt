簡単なソケット読み出し用サンプルソースです。接続して100000000byte読むと終了してレートを表示します。

# g++ simpleread.cpp -lrt
# ls
a.out simpleread.cpp
# time ./a.out
read from server(192.168.10.16:24) 100000000 bytes
ConnectTCP::Connected1(3) 192.168.10.16:24
read bytes 100002700 /8476952 = 94.3761Mbps

real 0m8.480s
user 0m0.005s
sys 0m0.352s
# time ./a.out
read from server(192.168.10.16:24) 100000000 bytes
ConnectTCP::Connected1(3) 192.168.10.16:24
read bytes 100002100 /8498906 = 94.1317Mbps

real 0m8.501s
user 0m0.007s
sys 0m0.369s
# time ./a.out
read from server(192.168.10.16:24) 100000000 bytes
ConnectTCP::Connected1(3) 192.168.10.16:24
read bytes 100001240 /8503242 = 94.0829Mbps

real 0m8.505s
user 0m0.002s
sys 0m0.304s
