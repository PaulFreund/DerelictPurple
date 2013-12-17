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

module derelict.purple.status;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.glist;
import derelict.purple.value;
import derelict.purple.account;
import derelict.purple.conversation;
import derelict.purple.blist;
import core.stdc.time;
import std.c.stdarg;

extern (C):

alias _PurpleStatusType PurpleStatusType;
alias _PurpleStatusAttr PurpleStatusAttr;
alias _PurplePresence PurplePresence;
alias _PurpleStatus PurpleStatus;
alias _PurpleMood PurpleMood;
alias _Anonymous_0 PurplePresenceContext;
alias _Anonymous_1 PurpleStatusPrimitive;

enum _Anonymous_0
{
	PURPLE_PRESENCE_CONTEXT_UNSET = 0,
	PURPLE_PRESENCE_CONTEXT_ACCOUNT = 1,
	PURPLE_PRESENCE_CONTEXT_CONV = 2,
	PURPLE_PRESENCE_CONTEXT_BUDDY = 3
}

enum _Anonymous_1
{
	PURPLE_STATUS_UNSET = 0,
	PURPLE_STATUS_OFFLINE = 1,
	PURPLE_STATUS_AVAILABLE = 2,
	PURPLE_STATUS_UNAVAILABLE = 3,
	PURPLE_STATUS_INVISIBLE = 4,
	PURPLE_STATUS_AWAY = 5,
	PURPLE_STATUS_EXTENDED_AWAY = 6,
	PURPLE_STATUS_MOBILE = 7,
	PURPLE_STATUS_TUNE = 8,
	PURPLE_STATUS_MOOD = 9,
	PURPLE_STATUS_NUM_PRIMITIVES = 10
}

struct _PurpleMood
{
	const(char)* mood;
	const(char)* description;
	gpointer* padding;
}

struct _PurpleStatus;


struct _PurpleStatusAttr;


struct _PurplePresence;


struct _PurpleStatusType;


extern( C ) nothrow 
{
    alias da_purple_primitive_get_id_from_type = const(char)* function(PurpleStatusPrimitive type);																																																
    alias da_purple_primitive_get_name_from_type = const(char)* function(PurpleStatusPrimitive type);																																															
    alias da_purple_primitive_get_type_from_id = PurpleStatusPrimitive function(const(char)* id);																																																
    alias da_purple_status_type_new_full = PurpleStatusType* function(PurpleStatusPrimitive primitive, const(char)* id, const(char)* name, gboolean saveable, gboolean user_settable, gboolean independent);																					
    alias da_purple_status_type_new = PurpleStatusType* function(PurpleStatusPrimitive primitive, const(char)* id, const(char)* name, gboolean user_settable);																																	
    alias da_purple_status_type_new_with_attrs = PurpleStatusType* function(PurpleStatusPrimitive primitive, const(char)* id, const(char)* name, gboolean saveable, gboolean user_settable, gboolean independent, const(char)* attr_id, const(char)* attr_name, PurpleValue* attr_value, ...);	
    alias da_purple_status_type_destroy = void function(PurpleStatusType* status_type);																																																			
    alias da_purple_status_type_set_primary_attr = void function(PurpleStatusType* status_type, const(char)* attr_id);																																											
    alias da_purple_status_type_add_attr = void function(PurpleStatusType* status_type, const(char)* id, const(char)* name, PurpleValue* value);																																				
    alias da_purple_status_type_add_attrs = void function(PurpleStatusType* status_type, const(char)* id, const(char)* name, PurpleValue* value, ...);																																			
    alias da_purple_status_type_add_attrs_vargs = void function(PurpleStatusType* status_type, va_list args);																																													
    alias da_purple_status_type_get_primitive = PurpleStatusPrimitive function(const(PurpleStatusType)* status_type);																																											
    alias da_purple_status_type_get_id = const(char)* function(const(PurpleStatusType)* status_type);																																															
    alias da_purple_status_type_get_name = const(char)* function(const(PurpleStatusType)* status_type);																																															
    alias da_purple_status_type_is_saveable = gboolean function(const(PurpleStatusType)* status_type);																																															
    alias da_purple_status_type_is_user_settable = gboolean function(const(PurpleStatusType)* status_type);																																														
    alias da_purple_status_type_is_independent = gboolean function(const(PurpleStatusType)* status_type);																																														
    alias da_purple_status_type_is_exclusive = gboolean function(const(PurpleStatusType)* status_type);																																															
    alias da_purple_status_type_is_available = gboolean function(const(PurpleStatusType)* status_type);																																															
    alias da_purple_status_type_get_primary_attr = const(char)* function(const(PurpleStatusType)* type);																																														
    alias da_purple_status_type_get_attr = PurpleStatusAttr* function(const(PurpleStatusType)* status_type, const(char)* id);																																									
    alias da_purple_status_type_get_attrs = GList* function(const(PurpleStatusType)* status_type);																																																
    alias da_purple_status_type_find_with_id = const(PurpleStatusType)* function(GList* status_types, const(char)* id);																																											
    alias da_purple_status_attr_new = PurpleStatusAttr* function(const(char)* id, const(char)* name, PurpleValue* value_type);																																									
    alias da_purple_status_attr_destroy = void function(PurpleStatusAttr* attr);																																																				
    alias da_purple_status_attr_get_id = const(char)* function(const(PurpleStatusAttr)* attr);																																																	
    alias da_purple_status_attr_get_name = const(char)* function(const(PurpleStatusAttr)* attr);																																																
    alias da_purple_status_attr_get_value = PurpleValue* function(const(PurpleStatusAttr)* attr);																																																
    alias da_purple_status_new = PurpleStatus* function(PurpleStatusType* status_type, PurplePresence* presence);																																												
    alias da_purple_status_destroy = void function(PurpleStatus* status);																																																						
    alias da_purple_status_set_active = void function(PurpleStatus* status, gboolean active);																																																	
    alias da_purple_status_set_active_with_attrs = void function(PurpleStatus* status, gboolean active, va_list args);																																											
    alias da_purple_status_set_active_with_attrs_list = void function(PurpleStatus* status, gboolean active, GList* attrs);																																										
    alias da_purple_status_set_attr_boolean = void function(PurpleStatus* status, const(char)* id, gboolean value);																																												
    alias da_purple_status_set_attr_int = void function(PurpleStatus* status, const(char)* id, int value);																																														
    alias da_purple_status_set_attr_string = void function(PurpleStatus* status, const(char)* id, const(char)* value);																																											
    alias da_purple_status_get_type = PurpleStatusType* function(const(PurpleStatus)* status);																																																	
    alias da_purple_status_get_presence = PurplePresence* function(const(PurpleStatus)* status);																																																
    alias da_purple_status_get_id = const(char)* function(const(PurpleStatus)* status);																																																			
    alias da_purple_status_get_name = const(char)* function(const(PurpleStatus)* status);																																																		
    alias da_purple_status_is_independent = gboolean function(const(PurpleStatus)* status);																																																		
    alias da_purple_status_is_exclusive = gboolean function(const(PurpleStatus)* status);																																																		
    alias da_purple_status_is_available = gboolean function(const(PurpleStatus)* status);																																																		
    alias da_purple_status_is_active = gboolean function(const(PurpleStatus)* status);																																																			
    alias da_purple_status_is_online = gboolean function(const(PurpleStatus)* status);																																																			
    alias da_purple_status_get_attr_value = PurpleValue* function(const(PurpleStatus)* status, const(char)* id);																																												
    alias da_purple_status_get_attr_boolean = gboolean function(const(PurpleStatus)* status, const(char)* id);																																													
    alias da_purple_status_get_attr_int = int function(const(PurpleStatus)* status, const(char)* id);																																															
    alias da_purple_status_get_attr_string = const(char)* function(const(PurpleStatus)* status, const(char)* id);																																												
    alias da_purple_status_compare = gint function(const(PurpleStatus)* status1, const(PurpleStatus)* status2);																																													
    alias da_purple_presence_new = PurplePresence* function(PurplePresenceContext context);																																																		
    alias da_purple_presence_new_for_account = PurplePresence* function(PurpleAccount* account);																																																
    alias da_purple_presence_new_for_conv = PurplePresence* function(PurpleConversation* conv);																																																	
    alias da_purple_presence_new_for_buddy = PurplePresence* function(PurpleBuddy* buddy);																																																		
    alias da_purple_presence_destroy = void function(PurplePresence* presence);																																																					
    alias da_purple_presence_add_status = void function(PurplePresence* presence, PurpleStatus* status);																																														
    alias da_purple_presence_add_list = void function(PurplePresence* presence, GList* source_list);																																															
    alias da_purple_presence_set_status_active = void function(PurplePresence* presence, const(char)* status_id, gboolean active);																																								
    alias da_purple_presence_switch_status = void function(PurplePresence* presence, const(char)* status_id);																																													
    alias da_purple_presence_set_idle = void function(PurplePresence* presence, gboolean idle, time_t idle_time);																																												
    alias da_purple_presence_set_login_time = void function(PurplePresence* presence, time_t login_time);																																														
    alias da_purple_presence_get_context = PurplePresenceContext function(const(PurplePresence)* presence);																																														
    alias da_purple_presence_get_account = PurpleAccount* function(const(PurplePresence)* presence);																																															
    alias da_purple_presence_get_conversation = PurpleConversation* function(const(PurplePresence)* presence);																																													
    alias da_purple_presence_get_chat_user = const(char)* function(const(PurplePresence)* presence);																																															
    alias da_purple_presence_get_buddy = PurpleBuddy* function(const(PurplePresence)* presence);																																																
    alias da_purple_presence_get_statuses = GList* function(const(PurplePresence)* presence);																																																	
    alias da_purple_presence_get_status = PurpleStatus* function(const(PurplePresence)* presence, const(char)* status_id);																																										
    alias da_purple_presence_get_active_status = PurpleStatus* function(const(PurplePresence)* presence);																																														
    alias da_purple_presence_is_available = gboolean function(const(PurplePresence)* presence);																																																	
    alias da_purple_presence_is_online = gboolean function(const(PurplePresence)* presence);																																																	
    alias da_purple_presence_is_status_active = gboolean function(const(PurplePresence)* presence, const(char)* status_id);																																										
    alias da_purple_presence_is_status_primitive_active = gboolean function(const(PurplePresence)* presence, PurpleStatusPrimitive primitive);																												                                	
    alias da_purple_presence_is_idle = gboolean function(const(PurplePresence)* presence);																																									                                	
    alias da_purple_presence_get_idle_time = time_t function(const(PurplePresence)* presence);																																								                                	
    alias da_purple_presence_get_login_time = time_t function(const(PurplePresence)* presence);																																								                                	
    alias da_purple_presence_compare = gint function(const(PurplePresence)* presence1, const(PurplePresence)* presence2);																																	                                	
    alias da_purple_status_get_handle = void* function();																																																	                                	
    alias da_purple_status_init = void function();																																																			                                	
    alias da_purple_status_uninit = void function();

}

__gshared
{
	da_purple_primitive_get_id_from_type purple_primitive_get_id_from_type;
	da_purple_primitive_get_name_from_type purple_primitive_get_name_from_type;
	da_purple_primitive_get_type_from_id purple_primitive_get_type_from_id;
	da_purple_status_type_new_full purple_status_type_new_full;
	da_purple_status_type_new purple_status_type_new;
	da_purple_status_type_new_with_attrs purple_status_type_new_with_attrs;
	da_purple_status_type_destroy purple_status_type_destroy;
	da_purple_status_type_set_primary_attr purple_status_type_set_primary_attr;
	da_purple_status_type_add_attr purple_status_type_add_attr;
	da_purple_status_type_add_attrs purple_status_type_add_attrs;
	da_purple_status_type_add_attrs_vargs purple_status_type_add_attrs_vargs;
	da_purple_status_type_get_primitive purple_status_type_get_primitive;
	da_purple_status_type_get_id purple_status_type_get_id;
	da_purple_status_type_get_name purple_status_type_get_name;
	da_purple_status_type_is_saveable purple_status_type_is_saveable;
	da_purple_status_type_is_user_settable purple_status_type_is_user_settable;
	da_purple_status_type_is_independent purple_status_type_is_independent;
	da_purple_status_type_is_exclusive purple_status_type_is_exclusive;
	da_purple_status_type_is_available purple_status_type_is_available;
	da_purple_status_type_get_primary_attr purple_status_type_get_primary_attr;
	da_purple_status_type_get_attr purple_status_type_get_attr;
	da_purple_status_type_get_attrs purple_status_type_get_attrs;
	da_purple_status_type_find_with_id purple_status_type_find_with_id;
	da_purple_status_attr_new purple_status_attr_new;
	da_purple_status_attr_destroy purple_status_attr_destroy;
	da_purple_status_attr_get_id purple_status_attr_get_id;
	da_purple_status_attr_get_name purple_status_attr_get_name;
	da_purple_status_attr_get_value purple_status_attr_get_value;
	da_purple_status_new purple_status_new;
	da_purple_status_destroy purple_status_destroy;
	da_purple_status_set_active purple_status_set_active;
	da_purple_status_set_active_with_attrs purple_status_set_active_with_attrs;
	da_purple_status_set_active_with_attrs_list purple_status_set_active_with_attrs_list;
	da_purple_status_set_attr_boolean purple_status_set_attr_boolean;
	da_purple_status_set_attr_int purple_status_set_attr_int;
	da_purple_status_set_attr_string purple_status_set_attr_string;
	da_purple_status_get_type purple_status_get_type;
	da_purple_status_get_presence purple_status_get_presence;
	da_purple_status_get_id purple_status_get_id;
	da_purple_status_get_name purple_status_get_name;
	da_purple_status_is_independent purple_status_is_independent;
	da_purple_status_is_exclusive purple_status_is_exclusive;
	da_purple_status_is_available purple_status_is_available;
	da_purple_status_is_active purple_status_is_active;
	da_purple_status_is_online purple_status_is_online;
	da_purple_status_get_attr_value purple_status_get_attr_value;
	da_purple_status_get_attr_boolean purple_status_get_attr_boolean;
	da_purple_status_get_attr_int purple_status_get_attr_int;
	da_purple_status_get_attr_string purple_status_get_attr_string;
	da_purple_status_compare purple_status_compare;
	da_purple_presence_new purple_presence_new;
	da_purple_presence_new_for_account purple_presence_new_for_account;
	da_purple_presence_new_for_conv purple_presence_new_for_conv;
	da_purple_presence_new_for_buddy purple_presence_new_for_buddy;
	da_purple_presence_destroy purple_presence_destroy;
	da_purple_presence_add_status purple_presence_add_status;
	da_purple_presence_add_list purple_presence_add_list;
	da_purple_presence_set_status_active purple_presence_set_status_active;
	da_purple_presence_switch_status purple_presence_switch_status;
	da_purple_presence_set_idle purple_presence_set_idle;
	da_purple_presence_set_login_time purple_presence_set_login_time;
	da_purple_presence_get_context purple_presence_get_context;
	da_purple_presence_get_account purple_presence_get_account;
	da_purple_presence_get_conversation purple_presence_get_conversation;
	da_purple_presence_get_chat_user purple_presence_get_chat_user;
	da_purple_presence_get_buddy purple_presence_get_buddy;
	da_purple_presence_get_statuses purple_presence_get_statuses;
	da_purple_presence_get_status purple_presence_get_status;
	da_purple_presence_get_active_status purple_presence_get_active_status;
	da_purple_presence_is_available purple_presence_is_available;
	da_purple_presence_is_online purple_presence_is_online;
	da_purple_presence_is_status_active purple_presence_is_status_active;
	da_purple_presence_is_status_primitive_active purple_presence_is_status_primitive_active;
	da_purple_presence_is_idle purple_presence_is_idle;
	da_purple_presence_get_idle_time purple_presence_get_idle_time;
	da_purple_presence_get_login_time purple_presence_get_login_time;
	da_purple_presence_compare purple_presence_compare;
	da_purple_status_get_handle purple_status_get_handle;
	da_purple_status_init purple_status_init;
	da_purple_status_uninit purple_status_uninit;
}