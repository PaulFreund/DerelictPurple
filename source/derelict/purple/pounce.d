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

module derelict.purple.pounce;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.ghash;
import derelict.glib.glist;
import derelict.purple.account;
import derelict.purple.blist;

extern (C):

alias _PurplePounce PurplePounce;
alias _Anonymous_0 PurplePounceEvent;
alias _Anonymous_1 PurplePounceOption;
alias void function (_PurplePounce*, _Anonymous_0, void*) PurplePounceCb;

enum _Anonymous_0
{
	PURPLE_POUNCE_NONE = 0,
	PURPLE_POUNCE_SIGNON = 1,
	PURPLE_POUNCE_SIGNOFF = 2,
	PURPLE_POUNCE_AWAY = 4,
	PURPLE_POUNCE_AWAY_RETURN = 8,
	PURPLE_POUNCE_IDLE = 16,
	PURPLE_POUNCE_IDLE_RETURN = 32,
	PURPLE_POUNCE_TYPING = 64,
	PURPLE_POUNCE_TYPED = 128,
	PURPLE_POUNCE_TYPING_STOPPED = 256,
	PURPLE_POUNCE_MESSAGE_RECEIVED = 512
}

enum _Anonymous_1
{
	PURPLE_POUNCE_OPTION_NONE = 0,
	PURPLE_POUNCE_OPTION_AWAY = 1
}

struct _PurplePounce
{
	char* ui_type;
	PurplePounceEvent events;
	PurplePounceOption options;
	PurpleAccount* pouncer;
	char* pouncee;
	GHashTable* actions;
	gboolean save;
	void* data;
}


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
	    PurplePounce* purple_pounce_new(const(char)* ui_type, PurpleAccount* pouncer, const(char)* pouncee, PurplePounceEvent event, PurplePounceOption option);
        void purple_pounce_destroy(PurplePounce* pounce);
        void purple_pounce_destroy_all_by_account(PurpleAccount* account);
        void purple_pounce_destroy_all_by_buddy(PurpleBuddy* buddy);
        void purple_pounce_set_events(PurplePounce* pounce, PurplePounceEvent events);
        void purple_pounce_set_options(PurplePounce* pounce, PurplePounceOption options);
        void purple_pounce_set_pouncer(PurplePounce* pounce, PurpleAccount* pouncer);
        void purple_pounce_set_pouncee(PurplePounce* pounce, const(char)* pouncee);
        void purple_pounce_set_save(PurplePounce* pounce, gboolean save);
        void purple_pounce_action_register(PurplePounce* pounce, const(char)* name);
        void purple_pounce_action_set_enabled(PurplePounce* pounce, const(char)* action, gboolean enabled);
        void purple_pounce_action_set_attribute(PurplePounce* pounce, const(char)* action, const(char)* attr, const(char)* value);
        void purple_pounce_set_data(PurplePounce* pounce, void* data);
        PurplePounceEvent purple_pounce_get_events(const(PurplePounce)* pounce);
        PurplePounceOption purple_pounce_get_options(const(PurplePounce)* pounce);
        PurpleAccount* purple_pounce_get_pouncer(const(PurplePounce)* pounce);
        const(char)* purple_pounce_get_pouncee(const(PurplePounce)* pounce);
        gboolean purple_pounce_get_save(const(PurplePounce)* pounce);
        gboolean purple_pounce_action_is_enabled(const(PurplePounce)* pounce, const(char)* action);
        const(char)* purple_pounce_action_get_attribute(const(PurplePounce)* pounce, const(char)* action, const(char)* attr);
        void* purple_pounce_get_data(const(PurplePounce)* pounce);
        void purple_pounce_execute(const(PurpleAccount)* pouncer, const(char)* pouncee, PurplePounceEvent events);
        PurplePounce* purple_find_pounce(const(PurpleAccount)* pouncer, const(char)* pouncee, PurplePounceEvent events);
        gboolean purple_pounces_load();
        void purple_pounces_register_handler(const(char)* ui, PurplePounceCb cb, void function (PurplePounce*) new_pounce, void function (PurplePounce*) free_pounce);
        void purple_pounces_unregister_handler(const(char)* ui);
        GList* purple_pounces_get_all();
        GList* purple_pounces_get_all_for_ui(const(char)* ui);
        void* purple_pounces_get_handle();
        void purple_pounces_init();
        void purple_pounces_uninit();
    }
}
else
{
    extern( C ) nothrow 
    {
	    alias da_purple_pounce_new = PurplePounce* function(const(char)* ui_type, PurpleAccount* pouncer, const(char)* pouncee, PurplePounceEvent event, PurplePounceOption option);				
        alias da_purple_pounce_destroy = void function(PurplePounce* pounce);																														
        alias da_purple_pounce_destroy_all_by_account = void function(PurpleAccount* account);																										
        alias da_purple_pounce_destroy_all_by_buddy = void function(PurpleBuddy* buddy);																											
        alias da_purple_pounce_set_events = void function(PurplePounce* pounce, PurplePounceEvent events);																							
        alias da_purple_pounce_set_options = void function(PurplePounce* pounce, PurplePounceOption options);																						
        alias da_purple_pounce_set_pouncer = void function(PurplePounce* pounce, PurpleAccount* pouncer);																							
        alias da_purple_pounce_set_pouncee = void function(PurplePounce* pounce, const(char)* pouncee);																								
        alias da_purple_pounce_set_save = void function(PurplePounce* pounce, gboolean save);																										
        alias da_purple_pounce_action_register = void function(PurplePounce* pounce, const(char)* name);																							
        alias da_purple_pounce_action_set_enabled = void function(PurplePounce* pounce, const(char)* action, gboolean enabled);																		
        alias da_purple_pounce_action_set_attribute = void function(PurplePounce* pounce, const(char)* action, const(char)* attr, const(char)* value);												
        alias da_purple_pounce_set_data = void function(PurplePounce* pounce, void* data);																											
        alias da_purple_pounce_get_events = PurplePounceEvent function(const(PurplePounce)* pounce);																								
        alias da_purple_pounce_get_options = PurplePounceOption function(const(PurplePounce)* pounce);																								
        alias da_purple_pounce_get_pouncer = PurpleAccount* function(const(PurplePounce)* pounce);																									
        alias da_purple_pounce_get_pouncee = const(char)* function(const(PurplePounce)* pounce);																									
        alias da_purple_pounce_get_save = gboolean function(const(PurplePounce)* pounce);																											
        alias da_purple_pounce_action_is_enabled = gboolean function(const(PurplePounce)* pounce, const(char)* action);																				
        alias da_purple_pounce_action_get_attribute = const(char)* function(const(PurplePounce)* pounce, const(char)* action, const(char)* attr);													
        alias da_purple_pounce_get_data = void* function(const(PurplePounce)* pounce);																												
        alias da_purple_pounce_execute = void function(const(PurpleAccount)* pouncer, const(char)* pouncee, PurplePounceEvent events);																
        alias da_purple_find_pounce = PurplePounce* function(const(PurpleAccount)* pouncer, const(char)* pouncee, PurplePounceEvent events);														
        alias da_purple_pounces_load = gboolean function();																																			
        alias da_purple_pounces_register_handler = void function(const(char)* ui, PurplePounceCb cb, void function (PurplePounce*) new_pounce, void function (PurplePounce*) free_pounce);			
        alias da_purple_pounces_unregister_handler = void function(const(char)* ui);																												
        alias da_purple_pounces_get_all = GList* function();																																		
        alias da_purple_pounces_get_all_for_ui = GList* function(const(char)* ui);																													
        alias da_purple_pounces_get_handle = void* function();																																		
        alias da_purple_pounces_init = void function();																																				
        alias da_purple_pounces_uninit = void function();
    }

    __gshared
    {
	    da_purple_pounce_new purple_pounce_new;
	    da_purple_pounce_destroy purple_pounce_destroy;
	    da_purple_pounce_destroy_all_by_account purple_pounce_destroy_all_by_account;
	    da_purple_pounce_destroy_all_by_buddy purple_pounce_destroy_all_by_buddy;
	    da_purple_pounce_set_events purple_pounce_set_events;
	    da_purple_pounce_set_options purple_pounce_set_options;
	    da_purple_pounce_set_pouncer purple_pounce_set_pouncer;
	    da_purple_pounce_set_pouncee purple_pounce_set_pouncee;
	    da_purple_pounce_set_save purple_pounce_set_save;
	    da_purple_pounce_action_register purple_pounce_action_register;
	    da_purple_pounce_action_set_enabled purple_pounce_action_set_enabled;
	    da_purple_pounce_action_set_attribute purple_pounce_action_set_attribute;
	    da_purple_pounce_set_data purple_pounce_set_data;
	    da_purple_pounce_get_events purple_pounce_get_events;
	    da_purple_pounce_get_options purple_pounce_get_options;
	    da_purple_pounce_get_pouncer purple_pounce_get_pouncer;
	    da_purple_pounce_get_pouncee purple_pounce_get_pouncee;
	    da_purple_pounce_get_save purple_pounce_get_save;
	    da_purple_pounce_action_is_enabled purple_pounce_action_is_enabled;
	    da_purple_pounce_action_get_attribute purple_pounce_action_get_attribute;
	    da_purple_pounce_get_data purple_pounce_get_data;
	    da_purple_pounce_execute purple_pounce_execute;
	    da_purple_find_pounce purple_find_pounce;
	    da_purple_pounces_load purple_pounces_load;
	    da_purple_pounces_register_handler purple_pounces_register_handler;
	    da_purple_pounces_unregister_handler purple_pounces_unregister_handler;
	    da_purple_pounces_get_all purple_pounces_get_all;
	    da_purple_pounces_get_all_for_ui purple_pounces_get_all_for_ui;
	    da_purple_pounces_get_handle purple_pounces_get_handle;
	    da_purple_pounces_init purple_pounces_init;
	    da_purple_pounces_uninit purple_pounces_uninit;
    }
}
