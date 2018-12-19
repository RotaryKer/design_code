#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h> // ソケット API を利用するため。
#include <unistd.h> // close() を利用するため。

#define BUFSIZE 32 // 受信バッファのサイズ

void RaiseError(char *msg) {
    // #include <errno.h> および
    // printf("%d\n", errno); で確認できる
    // エラー番号に対応するメッセージを標準エラー出力に書き出します。
    perror(msg);
    exit(1);
}

int main(int argc, char *argv[]) {

    int sock; // ソケットディスクリプタ

    // サーバアドレス
    struct sockaddr_in servAddr;
    char *servIp;
    unsigned short servPort; // 65535個までを想定

    // サーバに送信する文字列
    char *sendStr;
    int sendStrLen;

    // サーバからの受信時に利用するバッファ等
    char buf[BUFSIZE];
    int bytesRcvd, totalBytesRcvd;

    // 引数を検証
    if((argc < 3) || (4 < argc)) {
        fprintf(stderr, "Usage: %s <Server IP> <Message> [<Server Port>]\n", argv[0]);
        exit(1);
    }
    servIp = argv[1];
    sendStr = argv[2];
    if(argc == 4) {
        servPort = atoi(argv[3]);
    }
    else {
        servPort = 7; // Echo サーバのウェルノウンポート番号
    }

    // TCP による信頼性の高いストリームソケットを作成します。
    if((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
        RaiseError("socket() failed");
    }

    // 作成したソケットを利用して、サーバに接続します。
    memset(&servAddr, 0, sizeof(servAddr));
    servAddr.sin_family = AF_INET;
    servAddr.sin_addr.s_addr = inet_addr(servIp);
    servAddr.sin_port = htons(servPort);
    if(connect(sock, (struct sockaddr*) &servAddr, sizeof(servAddr)) < 0) {
        RaiseError("connect() failed");
    }

    // メッセージを送信します。
    sendStrLen = strlen(sendStr);
    if(send(sock, sendStr, sendStrLen, 0) != sendStrLen) {
        RaiseError("send() sent a different number of bytes than expected");
    }

    // メッセージを受信して標準出力に書き出します。
    totalBytesRcvd = 0;
    printf("Received: ");
    while(totalBytesRcvd < sendStrLen) {
        if((bytesRcvd = recv(sock, buf, BUFSIZE - 1, 0)) <= 0) {
            RaiseError("recv() failed or connection closed prematurely");
        }
        totalBytesRcvd += bytesRcvd;
        buf[bytesRcvd] = '\0';
        printf("%s", buf);
    }
    printf("\n");

    // ソケットを閉じます。
    close(sock);
    return 0;
}
