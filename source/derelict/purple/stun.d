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

module derelict.purple.stun;

import core.stdc.time;

extern (C):

alias _PurpleStunNatDiscovery PurpleStunNatDiscovery;
alias _Anonymous_0 PurpleStunStatus;
alias _Anonymous_1 PurpleStunNatType;
alias void function (_PurpleStunNatDiscovery*) StunCallback;

enum _Anonymous_0
{
	PURPLE_STUN_STATUS_UNDISCOVERED = -1,
	PURPLE_STUN_STATUS_UNKNOWN = 0,
	PURPLE_STUN_STATUS_DISCOVERING = 1,
	PURPLE_STUN_STATUS_DISCOVERED = 2
}

enum _Anonymous_1
{
	PURPLE_STUN_NAT_TYPE_PUBLIC_IP = 0,
	PURPLE_STUN_NAT_TYPE_UNKNOWN_NAT = 1,
	PURPLE_STUN_NAT_TYPE_FULL_CONE = 2,
	PURPLE_STUN_NAT_TYPE_RESTRICTED_CONE = 3,
	PURPLE_STUN_NAT_TYPE_PORT_RESTRICTED_CONE = 4,
	PURPLE_STUN_NAT_TYPE_SYMMETRIC = 5
}

struct _PurpleStunNatDiscovery
{
	PurpleStunStatus status;
	PurpleStunNatType type;
	char[16] publicip;
	char* servername;
	time_t lookup_time;
}


extern( C ) nothrow 
{
	alias da_purple_stun_discover = PurpleStunNatDiscovery* function(StunCallback cb);		
    alias da_purple_stun_init = void function();		
}

__gshared
{
	da_purple_stun_discover purple_stun_discover;
	da_purple_stun_init purple_stun_init;
}