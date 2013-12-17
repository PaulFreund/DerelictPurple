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

module derelict.purple.privacy;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.purple.account;
extern (C):

alias _PurplePrivacyType PurplePrivacyType;
alias _Anonymous_0 PurplePrivacyUiOps;

enum _PurplePrivacyType
{
	PURPLE_PRIVACY_ALLOW_ALL = 1,
	PURPLE_PRIVACY_DENY_ALL = 2,
	PURPLE_PRIVACY_ALLOW_USERS = 3,
	PURPLE_PRIVACY_DENY_USERS = 4,
	PURPLE_PRIVACY_ALLOW_BUDDYLIST = 5
}

struct _Anonymous_0
{
	void function (PurpleAccount*, const(char)*) permit_added;
	void function (PurpleAccount*, const(char)*) permit_removed;
	void function (PurpleAccount*, const(char)*) deny_added;
	void function (PurpleAccount*, const(char)*) deny_removed;
	void function () _purple_reserved1;
	void function () _purple_reserved2;
	void function () _purple_reserved3;
	void function () _purple_reserved4;
}

extern( C ) nothrow 
{
	alias da_purple_privacy_permit_add = gboolean function(PurpleAccount* account, const(char)* name, gboolean local_only);			
    alias da_purple_privacy_permit_remove = gboolean function(PurpleAccount* account, const(char)* name, gboolean local_only);		
    alias da_purple_privacy_deny_add = gboolean function(PurpleAccount* account, const(char)* name, gboolean local_only);			
    alias da_purple_privacy_deny_remove = gboolean function(PurpleAccount* account, const(char)* name, gboolean local_only);		
    alias da_purple_privacy_allow = void function(PurpleAccount* account, const(char)* who, gboolean local, gboolean restore);		
    alias da_purple_privacy_deny = void function(PurpleAccount* account, const(char)* who, gboolean local, gboolean restore);		
    alias da_purple_privacy_check = gboolean function(PurpleAccount* account, const(char)* who);									
    alias da_purple_privacy_set_ui_ops = void function(PurplePrivacyUiOps* ops);													
    alias da_purple_privacy_get_ui_ops = PurplePrivacyUiOps* function();															
    alias da_purple_privacy_init = void function();		
}

__gshared
{
	da_purple_privacy_permit_add purple_privacy_permit_add;
	da_purple_privacy_permit_remove purple_privacy_permit_remove;
	da_purple_privacy_deny_add purple_privacy_deny_add;
	da_purple_privacy_deny_remove purple_privacy_deny_remove;
	da_purple_privacy_allow purple_privacy_allow;
	da_purple_privacy_deny purple_privacy_deny;
	da_purple_privacy_check purple_privacy_check;
	da_purple_privacy_set_ui_ops purple_privacy_set_ui_ops;
	da_purple_privacy_get_ui_ops purple_privacy_get_ui_ops;
	da_purple_privacy_init purple_privacy_init;
}