///////////////////////////////////////////////////////////////////////////////////////////
// Simple Read Client for SiTCP 
// usage --
// $g++ simpleread.cpp -lrt on Linux (tested on CentOS6.0 x86_64)
// $time ./a.out
// read from server(192.168.10.16:24) 100000000 bytes
// ConnectTCP::Connected1(3) 192.168.10.16:24
// read bytes 100002700 /8476952 = 94.3761Mbps
// real    0m8.480s
// user    0m0.005s
// sys     0m0.352s
// Copyfight(C) Bee Beans Technologies, Co.LTD.
///////////////////////////////////////////////////////////////////////////////////////////

#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <time.h>

///////////////////////////////////////////////////////////////////////////////////////////
// connect to a server(SiTCP)
///////////////////////////////////////////////////////////////////////////////////////////
int ConnectTcp(const char *pszHost, unsigned short shPort, unsigned long &lConnectedIP )
{
	int sockTcp = -1;
	struct sockaddr_in addrTcp;
	sockTcp = socket(AF_INET, SOCK_STREAM, 0);
	if( sockTcp < 0 ){
		perror("socket");
		return -1;
	}
	addrTcp.sin_family = AF_INET;
	addrTcp.sin_port = htons(shPort);
	addrTcp.sin_addr.s_addr = inet_addr(pszHost);
	if( addrTcp.sin_addr.s_addr == 0xffffffff ){
		struct hostent *host = gethostbyname(pszHost);
		if( host == NULL ){
			if( h_errno == HOST_NOT_FOUND ){
				printf("ConnectTcp() host not found : %s\n",pszHost);
			}else{
				printf("ConnectTcp() %s : %s\n",hstrerror(h_errno),pszHost);
				fprintf(stderr,"%s : %s\n",hstrerror(h_errno),pszHost);
			}
			return -2;
		}
		unsigned int **addrptr = (unsigned int **)host->h_addr_list;
		while( *addrptr != NULL){
			addrTcp.sin_addr.s_addr = *(*addrptr);
			if(connect(sockTcp,(struct sockaddr *)&addrTcp,sizeof(addrTcp)) ==0 )
			{
				
				lConnectedIP = (unsigned long )addrTcp.sin_addr.s_addr;
				break;
			}
			addrptr++;
		}
		if( addrptr == NULL) {
			perror("ConnectTCP()::connect(1)");
			printf("ERROR:ConnectTCP:: host not found (%d) to %s:%u\n",sockTcp,pszHost,shPort);
			return -3;
		}else{
			printf("ConnectTCP::Connected0(%d) to %s:%u\n",sockTcp,pszHost,shPort);
		}
	}else{
		if(connect(sockTcp,(struct sockaddr *)&addrTcp,sizeof(addrTcp)) !=0 )
		{
			perror("ConnectTCP()::connect(2)");
			printf("ERROR:ConnectTCP:: can't connect not found (%d) to %08X %s:%u\n",addrTcp.sin_addr.s_addr,sockTcp,pszHost,shPort);
			sockTcp = -1;
			close(sockTcp);
			return -4;
		}else{
			lConnectedIP = (unsigned long )addrTcp.sin_addr.s_addr;
			printf("ConnectTCP::Connected1(%d) %s:%d\n",sockTcp,pszHost,shPort);
		}
	}
	return( sockTcp );
}


///////////////////////////////////////////////////////////////////////////////////////////
// time calc
///////////////////////////////////////////////////////////////////////////////////////////
#define TIME_SEC2NSEC	1000000000 
unsigned long long GetRealTimeInterval(const  struct timespec *pFrom, const struct timespec *pTo)
{
	unsigned long long  llStart = (unsigned long long )((unsigned long long )pFrom->tv_sec*TIME_SEC2NSEC + (unsigned long long )pFrom->tv_nsec);
	unsigned long long  llEnd = (unsigned long long )((unsigned long long )pTo->tv_sec*TIME_SEC2NSEC + (unsigned long long )pTo->tv_nsec);
	return( (llEnd - llStart)/1000 );
}


///////////////////////////////////////////////////////////////////////////////////////////
// time calc
///////////////////////////////////////////////////////////////////////////////////////////
unsigned char __g_buff[65535];//receive buffer
///////////////////////////////////////////////////////////////////////////////////////////
// main program
///////////////////////////////////////////////////////////////////////////////////////////

int main(int argc, char *argv[])
{
	
	const char* pszAddr ="192.168.10.16"; //IP Address of SiTCP Module.
	unsigned short shPort = 24;           //TCP data port number
	unsigned long lConnected = 0;         //connected client IPv4 address
	unsigned long lReadBytes = 100000000; //data size to read.
	
	printf("read from server(%s:%u) %u bytes\n",pszAddr,shPort,lReadBytes);
	
	int sock = ConnectTcp(pszAddr,shPort,lConnected);
	
	if( sock >= 0 )
	{
		memset(__g_buff,0,sizeof(__g_buff));
		
		fd_set fds;
		FD_ZERO(&fds);
		FD_SET(sock, &fds);
		struct timeval tv;
		tv.tv_sec = 1;
		tv.tv_usec = 10000;
		int n= 0;
		unsigned llRead = 0;
		struct timespec tsStart,tsEnd;
		
		clock_gettime(CLOCK_REALTIME,&tsStart);
		for(;;)
		{
			if( llRead >= lReadBytes ) break;
			int nSelect = select(sock+1, &fds, NULL, NULL,&tv);
			if( nSelect > 0 )
			{
				if( FD_ISSET(sock, &fds) ){
					for(;;)
					{
						int n = read( sock,&__g_buff[0],sizeof(__g_buff));
						if( n> 0 )
						{
							llRead += (unsigned long)n;
							if( llRead >= lReadBytes ) break;
						}else if( n == 0 ){
						}else{
							break;
						}
					}
				}
			}
		}
		clock_gettime(CLOCK_REALTIME,&tsEnd);
		unsigned long long llusec = GetRealTimeInterval(&tsStart,&tsEnd);
		printf("read bytes %u /%llu = %gMbps\n",llRead,llusec,(double)(llRead*8)/llusec);
	}else{
		printf("can't connect to servert\n");
	}
}
///////////////////////////////////////////////////////////////////////////////////////////
// END
///////////////////////////////////////////////////////////////////////////////////////////
