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

module derelict.purple.savedstatuses;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.glist;
import derelict.purple.status;
import derelict.purple.account;
import core.stdc.time;

extern (C):

alias _PurpleSavedStatus PurpleSavedStatus;
alias _PurpleSavedStatusSub PurpleSavedStatusSub;

struct _PurpleSavedStatus;


struct _PurpleSavedStatusSub;


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
	    PurpleSavedStatus* purple_savedstatus_new(const(char)* title, PurpleStatusPrimitive type);
        void purple_savedstatus_set_title(PurpleSavedStatus* status, const(char)* title);
        void purple_savedstatus_set_type(PurpleSavedStatus* status, PurpleStatusPrimitive type);
        void purple_savedstatus_set_message(PurpleSavedStatus* status, const(char)* message);
        void purple_savedstatus_set_substatus(PurpleSavedStatus* status, const(PurpleAccount)* account, const(PurpleStatusType)* type, const(char)* message);
        void purple_savedstatus_unset_substatus(PurpleSavedStatus* saved_status, const(PurpleAccount)* account);
        gboolean purple_savedstatus_delete(const(char)* title);
        void purple_savedstatus_delete_by_status(PurpleSavedStatus* saved_status);
        GList* purple_savedstatuses_get_all();
        GList* purple_savedstatuses_get_popular(uint how_many);
        PurpleSavedStatus* purple_savedstatus_get_current();
        PurpleSavedStatus* purple_savedstatus_get_default();
        PurpleSavedStatus* purple_savedstatus_get_idleaway();
        gboolean purple_savedstatus_is_idleaway();
        void purple_savedstatus_set_idleaway(gboolean idleaway);
        PurpleSavedStatus* purple_savedstatus_get_startup();
        PurpleSavedStatus* purple_savedstatus_find(const(char)* title);
        PurpleSavedStatus* purple_savedstatus_find_by_creation_time(time_t creation_time);
        PurpleSavedStatus* purple_savedstatus_find_transient_by_type_and_message(PurpleStatusPrimitive type, const(char)* message);
        gboolean purple_savedstatus_is_transient(const(PurpleSavedStatus)* saved_status);
        const(char)* purple_savedstatus_get_title(const(PurpleSavedStatus)* saved_status);
        PurpleStatusPrimitive purple_savedstatus_get_type(const(PurpleSavedStatus)* saved_status);
        const(char)* purple_savedstatus_get_message(const(PurpleSavedStatus)* saved_status);
        time_t purple_savedstatus_get_creation_time(const(PurpleSavedStatus)* saved_status);
        gboolean purple_savedstatus_has_substatuses(const(PurpleSavedStatus)* saved_status);
        PurpleSavedStatusSub* purple_savedstatus_get_substatus(const(PurpleSavedStatus)* saved_status, const(PurpleAccount)* account);
        const(PurpleStatusType)* purple_savedstatus_substatus_get_type(const(PurpleSavedStatusSub)* substatus);
        const(char)* purple_savedstatus_substatus_get_message(const(PurpleSavedStatusSub)* substatus);
        void purple_savedstatus_activate(PurpleSavedStatus* saved_status);
        void purple_savedstatus_activate_for_account(const(PurpleSavedStatus)* saved_status, PurpleAccount* account);
        void* purple_savedstatuses_get_handle();
        void purple_savedstatuses_init();
        void purple_savedstatuses_uninit();
    }
}
else
{
    extern( C ) nothrow 
    {
	    alias da_purple_savedstatus_new = PurpleSavedStatus* function(const(char)* title, PurpleStatusPrimitive type);																
        alias da_purple_savedstatus_set_title = void function(PurpleSavedStatus* status, const(char)* title);																		
        alias da_purple_savedstatus_set_type = void function(PurpleSavedStatus* status, PurpleStatusPrimitive type);																
        alias da_purple_savedstatus_set_message = void function(PurpleSavedStatus* status, const(char)* message);																	
        alias da_purple_savedstatus_set_substatus = void function(PurpleSavedStatus* status, const(PurpleAccount)* account, const(PurpleStatusType)* type, const(char)* message);	
        alias da_purple_savedstatus_unset_substatus = void function(PurpleSavedStatus* saved_status, const(PurpleAccount)* account);												
        alias da_purple_savedstatus_delete = gboolean function(const(char)* title);																									
        alias da_purple_savedstatus_delete_by_status = void function(PurpleSavedStatus* saved_status);																				
        alias da_purple_savedstatuses_get_all = GList* function();																													
        alias da_purple_savedstatuses_get_popular = GList* function(uint how_many);																									
        alias da_purple_savedstatus_get_current = PurpleSavedStatus* function();																									
        alias da_purple_savedstatus_get_default = PurpleSavedStatus* function();																									
        alias da_purple_savedstatus_get_idleaway = PurpleSavedStatus* function();																									
        alias da_purple_savedstatus_is_idleaway = gboolean function();																												
        alias da_purple_savedstatus_set_idleaway = void function(gboolean idleaway);																								
        alias da_purple_savedstatus_get_startup = PurpleSavedStatus* function();																									
        alias da_purple_savedstatus_find = PurpleSavedStatus* function(const(char)* title);																							
        alias da_purple_savedstatus_find_by_creation_time = PurpleSavedStatus* function(time_t creation_time);																		
        alias da_purple_savedstatus_find_transient_by_type_and_message = PurpleSavedStatus* function(PurpleStatusPrimitive type, const(char)* message);								
        alias da_purple_savedstatus_is_transient = gboolean function(const(PurpleSavedStatus)* saved_status);																		
        alias da_purple_savedstatus_get_title = const(char)* function(const(PurpleSavedStatus)* saved_status);																		
        alias da_purple_savedstatus_get_type = PurpleStatusPrimitive function(const(PurpleSavedStatus)* saved_status);																
        alias da_purple_savedstatus_get_message = const(char)* function(const(PurpleSavedStatus)* saved_status);																	
        alias da_purple_savedstatus_get_creation_time = time_t function(const(PurpleSavedStatus)* saved_status);																	
        alias da_purple_savedstatus_has_substatuses = gboolean function(const(PurpleSavedStatus)* saved_status);																	
        alias da_purple_savedstatus_get_substatus = PurpleSavedStatusSub* function(const(PurpleSavedStatus)* saved_status, const(PurpleAccount)* account);							
        alias da_purple_savedstatus_substatus_get_type = const(PurpleStatusType)* function(const(PurpleSavedStatusSub)* substatus);													
        alias da_purple_savedstatus_substatus_get_message = const(char)* function(const(PurpleSavedStatusSub)* substatus);															
        alias da_purple_savedstatus_activate = void function(PurpleSavedStatus* saved_status);																						
        alias da_purple_savedstatus_activate_for_account = void function(const(PurpleSavedStatus)* saved_status, PurpleAccount* account);											
        alias da_purple_savedstatuses_get_handle = void* function();																												
        alias da_purple_savedstatuses_init = void function();																														
        alias da_purple_savedstatuses_uninit = void function();	
    }

    __gshared
    {
	    da_purple_savedstatus_new purple_savedstatus_new;
	    da_purple_savedstatus_set_title purple_savedstatus_set_title;
	    da_purple_savedstatus_set_type purple_savedstatus_set_type;
	    da_purple_savedstatus_set_message purple_savedstatus_set_message;
	    da_purple_savedstatus_set_substatus purple_savedstatus_set_substatus;
	    da_purple_savedstatus_unset_substatus purple_savedstatus_unset_substatus;
	    da_purple_savedstatus_delete purple_savedstatus_delete;
	    da_purple_savedstatus_delete_by_status purple_savedstatus_delete_by_status;
	    da_purple_savedstatuses_get_all purple_savedstatuses_get_all;
	    da_purple_savedstatuses_get_popular purple_savedstatuses_get_popular;
	    da_purple_savedstatus_get_current purple_savedstatus_get_current;
	    da_purple_savedstatus_get_default purple_savedstatus_get_default;
	    da_purple_savedstatus_get_idleaway purple_savedstatus_get_idleaway;
	    da_purple_savedstatus_is_idleaway purple_savedstatus_is_idleaway;
	    da_purple_savedstatus_set_idleaway purple_savedstatus_set_idleaway;
	    da_purple_savedstatus_get_startup purple_savedstatus_get_startup;
	    da_purple_savedstatus_find purple_savedstatus_find;
	    da_purple_savedstatus_find_by_creation_time purple_savedstatus_find_by_creation_time;
	    da_purple_savedstatus_find_transient_by_type_and_message purple_savedstatus_find_transient_by_type_and_message;
	    da_purple_savedstatus_is_transient purple_savedstatus_is_transient;
	    da_purple_savedstatus_get_title purple_savedstatus_get_title;
	    da_purple_savedstatus_get_type purple_savedstatus_get_type;
	    da_purple_savedstatus_get_message purple_savedstatus_get_message;
	    da_purple_savedstatus_get_creation_time purple_savedstatus_get_creation_time;
	    da_purple_savedstatus_has_substatuses purple_savedstatus_has_substatuses;
	    da_purple_savedstatus_get_substatus purple_savedstatus_get_substatus;
	    da_purple_savedstatus_substatus_get_type purple_savedstatus_substatus_get_type;
	    da_purple_savedstatus_substatus_get_message purple_savedstatus_substatus_get_message;
	    da_purple_savedstatus_activate purple_savedstatus_activate;
	    da_purple_savedstatus_activate_for_account purple_savedstatus_activate_for_account;
	    da_purple_savedstatuses_get_handle purple_savedstatuses_get_handle;
	    da_purple_savedstatuses_init purple_savedstatuses_init;
	    da_purple_savedstatuses_uninit purple_savedstatuses_uninit;
    }
}
