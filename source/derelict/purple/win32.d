/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/ 

module derelict.purple.win32;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.giochannel;
import core.stdc.time;
import core.stdc.config;

extern (C):

alias int function () FARPROC;

struct timeval
{
	c_long tv_sec;
	c_long tv_usec;
}

struct timezone
{
	int tz_minuteswest;
	int tz_dsttime;
}

struct hostent
{
	char* h_name;
	char** h_aliases;
	short h_addrtype;
	short h_length;
	char** h_addr_list;
}

struct in_addr
{
	union
	{
		struct
		{
			ubyte s_b1;
			ubyte s_b2;
			ubyte s_b3;
			ubyte s_b4;
		}
		struct
		{
			ushort s_w1;
			ushort s_w2;
		}
		c_ulong S_addr;
	}
}

struct sockaddr
{
	ushort sa_family;
	char[14] sa_data;
}

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        const(char)* wpurple_get_timezone_abbreviation(const(tm)* tm);
        int wpurple_socket(int domain, int style, int protocol);
        int wpurple_connect(int socket, sockaddr* addr, c_ulong length);
        int wpurple_getsockopt(int socket, int level, int optname, void* optval, int* optlenptr);
        int wpurple_setsockopt(int socket, int level, int optname, const(void)* optval, int optlen);
        int wpurple_getsockname(int socket, sockaddr* addr, int* lenptr);
        int wpurple_bind(int socket, sockaddr* addr, int length);
        int wpurple_listen(int socket, uint n);
        int wpurple_sendto(int socket, const(void)* buf, size_t len, int flags, const(sockaddr)* to, int tolen);
        int wpurple_recv(int fd, void* buf, size_t len, int flags);
        int wpurple_send(int fd, const(void)* buf, uint size, int flags);
        int wpurple_inet_aton(const(char)* name, in_addr* addr);
        const(char)* wpurple_inet_ntop(int af, const(void)* src, char* dst, int cnt);
        int wpurple_inet_pton(int af, const(char)* src, void* dst);
        hostent* wpurple_gethostbyname(const(char)* name);
        char* wpurple_strerror(int errornum);
        int wpurple_fcntl(int socket, int command, ...);
        int wpurple_ioctl(int fd, int command, void* opt);
        int wpurple_gettimeofday(timeval* p, timezone* z);
        tm* wpurple_localtime_r(const(time_t)* time, tm* resultp);
        int wpurple_read(int fd, void* buf, uint size);
        int wpurple_write(int fd, const(void)* buf, uint size);
        int wpurple_close(int fd);
        int wpurple_gethostname(char* name, size_t size);
        int wpurple_rename(const(char)* oldname, const(char)* newname);
        FARPROC wpurple_find_and_loadproc(const(char)* dllname, const(char)* procedure);
        gboolean wpurple_read_reg_dword(void* rootkey, const(char)* subkey, const(char)* valname, c_ulong* result);
        char* wpurple_read_reg_string(void* rootkey, const(char)* subkey, const(char)* valname);
        gboolean wpurple_write_reg_string(void* rootkey, const(char)* subkey, const(char)* valname, const(char)* value);
        char* wpurple_escape_dirsep(const(char)* filename);
        GIOChannel* wpurple_g_io_channel_win32_new_socket(int socket);
        gchar* wpurple_get_special_folder(int folder_type);
        const(char)* wpurple_install_dir();
        const(char)* wpurple_lib_dir();
        const(char)* wpurple_locale_dir();
        const(char)* wpurple_data_dir();
        void wpurple_init();
        void wpurple_cleanup();
        c_long wpurple_get_tz_offset();
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_wpurple_get_timezone_abbreviation = const(char)* function(const(tm)* tm);															
        alias da_wpurple_socket = int function(int domain, int style, int protocol);																
        alias da_wpurple_connect = int function(int socket, sockaddr* addr, c_ulong length);														
        alias da_wpurple_getsockopt = int function(int socket, int level, int optname, void* optval, int* optlenptr);								
        alias da_wpurple_setsockopt = int function(int socket, int level, int optname, const(void)* optval, int optlen);							
        alias da_wpurple_getsockname = int function(int socket, sockaddr* addr, int* lenptr);														
        alias da_wpurple_bind = int function(int socket, sockaddr* addr, int length);																
        alias da_wpurple_listen = int function(int socket, uint n);																					
        alias da_wpurple_sendto = int function(int socket, const(void)* buf, size_t len, int flags, const(sockaddr)* to, int tolen);				
        alias da_wpurple_recv = int function(int fd, void* buf, size_t len, int flags);																
        alias da_wpurple_send = int function(int fd, const(void)* buf, uint size, int flags);														
        alias da_wpurple_inet_aton = int function(const(char)* name, in_addr* addr);																
        alias da_wpurple_inet_ntop = const(char)* function(int af, const(void)* src, char* dst, int cnt);											
        alias da_wpurple_inet_pton = int function(int af, const(char)* src, void* dst);																
        alias da_wpurple_gethostbyname = hostent* function(const(char)* name);																		
        alias da_wpurple_strerror = char* function(int errornum);																					
        alias da_wpurple_fcntl = int function(int socket, int command, ...);																		
        alias da_wpurple_ioctl = int function(int fd, int command, void* opt);																		
        alias da_wpurple_gettimeofday = int function(timeval* p, timezone* z);																		
        alias da_wpurple_localtime_r = tm* function(const(time_t)* time, tm* resultp);																
        alias da_wpurple_read = int function(int fd, void* buf, uint size);																			
        alias da_wpurple_write = int function(int fd, const(void)* buf, uint size);																	
        alias da_wpurple_close = int function(int fd);																								
        alias da_wpurple_gethostname = int function(char* name, size_t size);																		
        alias da_wpurple_rename = int function(const(char)* oldname, const(char)* newname);															
        alias da_wpurple_find_and_loadproc = FARPROC function(const(char)* dllname, const(char)* procedure);										
        alias da_wpurple_read_reg_dword = gboolean function(void* rootkey, const(char)* subkey, const(char)* valname, c_ulong* result);				
        alias da_wpurple_read_reg_string = char* function(void* rootkey, const(char)* subkey, const(char)* valname);								
        alias da_wpurple_write_reg_string = gboolean function(void* rootkey, const(char)* subkey, const(char)* valname, const(char)* value);		
        alias da_wpurple_escape_dirsep = char* function(const(char)* filename);																		
        alias da_wpurple_g_io_channel_win32_new_socket = GIOChannel* function(int socket);															
        alias da_wpurple_get_special_folder = gchar* function(int folder_type);																		
        alias da_wpurple_install_dir = const(char)* function();																						
        alias da_wpurple_lib_dir = const(char)* function();																							
        alias da_wpurple_locale_dir = const(char)* function();																						
        alias da_wpurple_data_dir = const(char)* function();																						
        alias da_wpurple_init = void function();																									
        alias da_wpurple_cleanup = void function();																									
        alias da_wpurple_get_tz_offset = c_long function();	
    }

    __gshared
    {
        da_wpurple_get_timezone_abbreviation wpurple_get_timezone_abbreviation; 
        da_wpurple_socket wpurple_socket; 
        da_wpurple_connect wpurple_connect; 
        da_wpurple_getsockopt wpurple_getsockopt; 
        da_wpurple_setsockopt wpurple_setsockopt; 
        da_wpurple_getsockname wpurple_getsockname; 
        da_wpurple_bind wpurple_bind; 
        da_wpurple_listen wpurple_listen; 
        da_wpurple_sendto wpurple_sendto; 
        da_wpurple_recv wpurple_recv; 
        da_wpurple_send wpurple_send; 
        da_wpurple_inet_aton wpurple_inet_aton; 
        da_wpurple_inet_ntop wpurple_inet_ntop; 
        da_wpurple_inet_pton wpurple_inet_pton; 
        da_wpurple_gethostbyname wpurple_gethostbyname; 
        da_wpurple_strerror wpurple_strerror; 
        da_wpurple_fcntl wpurple_fcntl; 
        da_wpurple_ioctl wpurple_ioctl; 
        da_wpurple_gettimeofday wpurple_gettimeofday; 
        da_wpurple_localtime_r wpurple_localtime_r; 
        da_wpurple_read wpurple_read; 
        da_wpurple_write wpurple_write; 
        da_wpurple_close wpurple_close; 
        da_wpurple_gethostname wpurple_gethostname; 
        da_wpurple_rename wpurple_rename; 
        da_wpurple_find_and_loadproc wpurple_find_and_loadproc; 
        da_wpurple_read_reg_dword wpurple_read_reg_dword; 
        da_wpurple_read_reg_string wpurple_read_reg_string; 
        da_wpurple_write_reg_string wpurple_write_reg_string; 
        da_wpurple_escape_dirsep wpurple_escape_dirsep; 
        da_wpurple_g_io_channel_win32_new_socket wpurple_g_io_channel_win32_new_socket; 
        da_wpurple_get_special_folder wpurple_get_special_folder; 
        da_wpurple_install_dir wpurple_install_dir; 
        da_wpurple_lib_dir wpurple_lib_dir; 
        da_wpurple_locale_dir wpurple_locale_dir; 
        da_wpurple_data_dir wpurple_data_dir; 
        da_wpurple_init wpurple_init; 
        da_wpurple_cleanup wpurple_cleanup; 
        da_wpurple_get_tz_offset wpurple_get_tz_offset; 
    }
}
