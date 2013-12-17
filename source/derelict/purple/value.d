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

module derelict.purple.value;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import core.stdc.config;

extern (C):

alias _Anonymous_0 PurpleType;
alias _Anonymous_1 PurpleSubType;
alias _Anonymous_2 PurpleValue;

enum _Anonymous_0
{
	PURPLE_TYPE_UNKNOWN = 0,
	PURPLE_TYPE_SUBTYPE = 1,
	PURPLE_TYPE_CHAR = 2,
	PURPLE_TYPE_UCHAR = 3,
	PURPLE_TYPE_BOOLEAN = 4,
	PURPLE_TYPE_SHORT = 5,
	PURPLE_TYPE_USHORT = 6,
	PURPLE_TYPE_INT = 7,
	PURPLE_TYPE_UINT = 8,
	PURPLE_TYPE_LONG = 9,
	PURPLE_TYPE_ULONG = 10,
	PURPLE_TYPE_INT64 = 11,
	PURPLE_TYPE_UINT64 = 12,
	PURPLE_TYPE_STRING = 13,
	PURPLE_TYPE_OBJECT = 14,
	PURPLE_TYPE_POINTER = 15,
	PURPLE_TYPE_ENUM = 16,
	PURPLE_TYPE_BOXED = 17
}

enum _Anonymous_1
{
	PURPLE_SUBTYPE_UNKNOWN = 0,
	PURPLE_SUBTYPE_ACCOUNT = 1,
	PURPLE_SUBTYPE_BLIST = 2,
	PURPLE_SUBTYPE_BLIST_BUDDY = 3,
	PURPLE_SUBTYPE_BLIST_GROUP = 4,
	PURPLE_SUBTYPE_BLIST_CHAT = 5,
	PURPLE_SUBTYPE_BUDDY_ICON = 6,
	PURPLE_SUBTYPE_CONNECTION = 7,
	PURPLE_SUBTYPE_CONVERSATION = 8,
	PURPLE_SUBTYPE_PLUGIN = 9,
	PURPLE_SUBTYPE_BLIST_NODE = 10,
	PURPLE_SUBTYPE_CIPHER = 11,
	PURPLE_SUBTYPE_STATUS = 12,
	PURPLE_SUBTYPE_LOG = 13,
	PURPLE_SUBTYPE_XFER = 14,
	PURPLE_SUBTYPE_SAVEDSTATUS = 15,
	PURPLE_SUBTYPE_XMLNODE = 16,
	PURPLE_SUBTYPE_USERINFO = 17,
	PURPLE_SUBTYPE_STORED_IMAGE = 18,
	PURPLE_SUBTYPE_CERTIFICATEPOOL = 19,
	PURPLE_SUBTYPE_CHATBUDDY = 20
}

struct _Anonymous_2
{
	PurpleType type;
	ushort flags;
	union
	{
		char char_data;
		ubyte uchar_data;
		gboolean boolean_data;
		short short_data;
		ushort ushort_data;
		int int_data;
		uint uint_data;
		c_long long_data;
		c_ulong ulong_data;
		gint64 int64_data;
		guint64 uint64_data;
		char* string_data;
		void* object_data;
		void* pointer_data;
		int enum_data;
		void* boxed_data;
	}
	union
	{
		uint subtype;
		char* specific_type;
	}
}


extern( C ) nothrow 
{
	alias da_purple_value_new = PurpleValue* function(PurpleType type, ...);											
    alias da_purple_value_new_outgoing = PurpleValue* function(PurpleType type, ...);									
    alias da_purple_value_destroy = void function(PurpleValue* value);													
    alias da_purple_value_dup = PurpleValue* function(const(PurpleValue)* value);										
    alias da_purple_value_get_type = PurpleType function(const(PurpleValue)* value);									
    alias da_purple_value_get_subtype = uint function(const(PurpleValue)* value);										
    alias da_purple_value_get_specific_type = const(char)* function(const(PurpleValue)* value);							
    alias da_purple_value_is_outgoing = gboolean function(const(PurpleValue)* value);									
    alias da_purple_value_set_char = void function(PurpleValue* value, char data);										
    alias da_purple_value_set_uchar = void function(PurpleValue* value, ubyte data);									
    alias da_purple_value_set_boolean = void function(PurpleValue* value, gboolean data);								
    alias da_purple_value_set_short = void function(PurpleValue* value, short data);									
    alias da_purple_value_set_ushort = void function(PurpleValue* value, ushort data);									
    alias da_purple_value_set_int = void function(PurpleValue* value, int data);										
    alias da_purple_value_set_uint = void function(PurpleValue* value, uint data);										
    alias da_purple_value_set_long = void function(PurpleValue* value, c_long data);									
    alias da_purple_value_set_ulong = void function(PurpleValue* value, c_ulong data);									
    alias da_purple_value_set_int64 = void function(PurpleValue* value, gint64 data);									
    alias da_purple_value_set_uint64 = void function(PurpleValue* value, guint64 data);									
    alias da_purple_value_set_string = void function(PurpleValue* value, const(char)* data);							
    alias da_purple_value_set_object = void function(PurpleValue* value, void* data);									
    alias da_purple_value_set_pointer = void function(PurpleValue* value, void* data);									
    alias da_purple_value_set_enum = void function(PurpleValue* value, int data);										
    alias da_purple_value_set_boxed = void function(PurpleValue* value, void* data);									
    alias da_purple_value_get_char = char function(const(PurpleValue)* value);											
    alias da_purple_value_get_uchar = ubyte function(const(PurpleValue)* value);										
    alias da_purple_value_get_boolean = gboolean function(const(PurpleValue)* value);									
    alias da_purple_value_get_short = short function(const(PurpleValue)* value);										
    alias da_purple_value_get_ushort = ushort function(const(PurpleValue)* value);										
    alias da_purple_value_get_int = int function(const(PurpleValue)* value);											
    alias da_purple_value_get_uint = uint function(const(PurpleValue)* value);											
    alias da_purple_value_get_long = c_long function(const(PurpleValue)* value);										
    alias da_purple_value_get_ulong = c_ulong function(const(PurpleValue)* value);										
    alias da_purple_value_get_int64 = gint64 function(const(PurpleValue)* value);										
    alias da_purple_value_get_uint64 = guint64 function(const(PurpleValue)* value);										
    alias da_purple_value_get_string = const(char)* function(const(PurpleValue)* value);								
    alias da_purple_value_get_object = void* function(const(PurpleValue)* value);										
    alias da_purple_value_get_pointer = void* function(const(PurpleValue)* value);										
    alias da_purple_value_get_enum = int function(const(PurpleValue)* value);											
    alias da_purple_value_get_boxed = void* function(const(PurpleValue)* value);
}

__gshared
{
	da_purple_value_new purple_value_new;
	da_purple_value_new_outgoing purple_value_new_outgoing;
	da_purple_value_destroy purple_value_destroy;
	da_purple_value_dup purple_value_dup;
	da_purple_value_get_type purple_value_get_type;
	da_purple_value_get_subtype purple_value_get_subtype;
	da_purple_value_get_specific_type purple_value_get_specific_type;
	da_purple_value_is_outgoing purple_value_is_outgoing;
	da_purple_value_set_char purple_value_set_char;
	da_purple_value_set_uchar purple_value_set_uchar;
	da_purple_value_set_boolean purple_value_set_boolean;
	da_purple_value_set_short purple_value_set_short;
	da_purple_value_set_ushort purple_value_set_ushort;
	da_purple_value_set_int purple_value_set_int;
	da_purple_value_set_uint purple_value_set_uint;
	da_purple_value_set_long purple_value_set_long;
	da_purple_value_set_ulong purple_value_set_ulong;
	da_purple_value_set_int64 purple_value_set_int64;
	da_purple_value_set_uint64 purple_value_set_uint64;
	da_purple_value_set_string purple_value_set_string;
	da_purple_value_set_object purple_value_set_object;
	da_purple_value_set_pointer purple_value_set_pointer;
	da_purple_value_set_enum purple_value_set_enum;
	da_purple_value_set_boxed purple_value_set_boxed;
	da_purple_value_get_char purple_value_get_char;
	da_purple_value_get_uchar purple_value_get_uchar;
	da_purple_value_get_boolean purple_value_get_boolean;
	da_purple_value_get_short purple_value_get_short;
	da_purple_value_get_ushort purple_value_get_ushort;
	da_purple_value_get_int purple_value_get_int;
	da_purple_value_get_uint purple_value_get_uint;
	da_purple_value_get_long purple_value_get_long;
	da_purple_value_get_ulong purple_value_get_ulong;
	da_purple_value_get_int64 purple_value_get_int64;
	da_purple_value_get_uint64 purple_value_get_uint64;
	da_purple_value_get_string purple_value_get_string;
	da_purple_value_get_object purple_value_get_object;
	da_purple_value_get_pointer purple_value_get_pointer;
	da_purple_value_get_enum purple_value_get_enum;
	da_purple_value_get_boxed purple_value_get_boxed;
}