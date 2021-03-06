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

module derelict.purple.log;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.ghash;
import derelict.glib.glist;
import derelict.purple.conversation;
import derelict.purple.account;
import core.stdc.time;
import core.stdc.config;
import core.stdc.stdio;

extern (C):

alias _PurpleLog PurpleLog;
alias _PurpleLogLogger PurpleLogLogger;
alias _PurpleLogCommonLoggerData PurpleLogCommonLoggerData;
alias _PurpleLogSet PurpleLogSet;
alias _Anonymous_0 PurpleLogType;
alias _Anonymous_1 PurpleLogReadFlags;
alias void function (_GHashTable*, _PurpleLogSet*) PurpleLogSetCallback;

enum _Anonymous_0
{
	PURPLE_LOG_IM = 0,
	PURPLE_LOG_CHAT = 1,
	PURPLE_LOG_SYSTEM = 2
}

enum _Anonymous_1
{
	PURPLE_LOG_READ_NO_NEWLINE = 1
}

struct _PurpleLogLogger
{
	char* name;
	char* id;
	void function (PurpleLog*) create;
	gsize function (PurpleLog*, PurpleMessageFlags, const(char)*, time_t, const(char)*) write;
	void function (PurpleLog*) finalize;
	GList* function (PurpleLogType, const(char)*, PurpleAccount*) list;
	char* function (PurpleLog*, PurpleLogReadFlags*) read;
	int function (PurpleLog*) size;
	int function (PurpleLogType, const(char)*, PurpleAccount*) total_size;
	GList* function (PurpleAccount*) list_syslog;
	void function (PurpleLogSetCallback, GHashTable*) get_log_sets;
	gboolean function (PurpleLog*) remove;
	gboolean function (PurpleLog*) is_deletable;
	void function () _purple_reserved1;
	void function () _purple_reserved2;
	void function () _purple_reserved3;
	void function () _purple_reserved4;
}

struct _PurpleLog
{
	PurpleLogType type;
	char* name;
	PurpleAccount* account;
	PurpleConversation* conv;
	time_t time;
	PurpleLogLogger* logger;
	void* logger_data;
	core.stdc.time.tm* tm;
}

struct _PurpleLogCommonLoggerData
{
	char* path;
	FILE* file;
	void* extra_data;
}

struct _PurpleLogSet
{
	PurpleLogType type;
	char* name;
	PurpleAccount* account;
	gboolean buddy;
	char* normalized_name;
}

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        PurpleLog* purple_log_new(PurpleLogType type, const(char)* name, PurpleAccount* account, PurpleConversation* conv, time_t time, const(tm)* tm);
        void purple_log_free(PurpleLog* log);
        void purple_log_write(PurpleLog* log, PurpleMessageFlags type, const(char)* from, time_t time, const(char)* message);
        char* purple_log_read(PurpleLog* log, PurpleLogReadFlags* flags);
        GList* purple_log_get_logs(PurpleLogType type, const(char)* name, PurpleAccount* account);
        GHashTable* purple_log_get_log_sets();
        GList* purple_log_get_system_logs(PurpleAccount* account);
        int purple_log_get_size(PurpleLog* log);
        int purple_log_get_total_size(PurpleLogType type, const(char)* name, PurpleAccount* account);
        int purple_log_get_activity_score(PurpleLogType type, const(char)* name, PurpleAccount* account);
        gboolean purple_log_is_deletable(PurpleLog* log);
        gboolean purple_log_delete(PurpleLog* log);
        char* purple_log_get_log_dir(PurpleLogType type, const(char)* name, PurpleAccount* account);
        gint purple_log_compare(gconstpointer y, gconstpointer z);
        gint purple_log_set_compare(gconstpointer y, gconstpointer z);
        void purple_log_set_free(PurpleLogSet* set);
        void purple_log_common_writer(PurpleLog* log, const(char)* ext);
        GList* purple_log_common_lister(PurpleLogType type, const(char)* name, PurpleAccount* account, const(char)* ext, PurpleLogLogger* logger);
        int purple_log_common_total_sizer(PurpleLogType type, const(char)* name, PurpleAccount* account, const(char)* ext);
        int purple_log_common_sizer(PurpleLog* log);
        gboolean purple_log_common_deleter(PurpleLog* log);
        gboolean purple_log_common_is_deletable(PurpleLog* log);
        PurpleLogLogger* purple_log_logger_new(const(char)* id, const(char)* name, int functions, ...);
        void purple_log_logger_free(PurpleLogLogger* logger);
        void purple_log_logger_add(PurpleLogLogger* logger);
        void purple_log_logger_remove(PurpleLogLogger* logger);
        void purple_log_logger_set(PurpleLogLogger* logger);
        PurpleLogLogger* purple_log_logger_get();
        GList* purple_log_logger_get_options();
        void purple_log_init();
        void* purple_log_get_handle();
        void purple_log_uninit();
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_purple_log_new = PurpleLog* function(PurpleLogType type, const(char)* name, PurpleAccount* account, PurpleConversation* conv, time_t time, const(tm)* tm);			
        alias da_purple_log_free = void function(PurpleLog* log);																													
        alias da_purple_log_write = void function(PurpleLog* log, PurpleMessageFlags type, const(char)* from, time_t time, const(char)* message);									
        alias da_purple_log_read = char* function(PurpleLog* log, PurpleLogReadFlags* flags);																						
        alias da_purple_log_get_logs = GList* function(PurpleLogType type, const(char)* name, PurpleAccount* account);																
        alias da_purple_log_get_log_sets = GHashTable* function();																													
        alias da_purple_log_get_system_logs = GList* function(PurpleAccount* account);																								
        alias da_purple_log_get_size = int function(PurpleLog* log);																												
        alias da_purple_log_get_total_size = int function(PurpleLogType type, const(char)* name, PurpleAccount* account);															
        alias da_purple_log_get_activity_score = int function(PurpleLogType type, const(char)* name, PurpleAccount* account);														
        alias da_purple_log_is_deletable = gboolean function(PurpleLog* log);																										
        alias da_purple_log_delete = gboolean function(PurpleLog* log);																												
        alias da_purple_log_get_log_dir = char* function(PurpleLogType type, const(char)* name, PurpleAccount* account);															
        alias da_purple_log_compare = gint function(gconstpointer y, gconstpointer z);																								
        alias da_purple_log_set_compare = gint function(gconstpointer y, gconstpointer z);																							
        alias da_purple_log_set_free = void function(PurpleLogSet* set);																											
        alias da_purple_log_common_writer = void function(PurpleLog* log, const(char)* ext);																						
        alias da_purple_log_common_lister = GList* function(PurpleLogType type, const(char)* name, PurpleAccount* account, const(char)* ext, PurpleLogLogger* logger);				
        alias da_purple_log_common_total_sizer = int function(PurpleLogType type, const(char)* name, PurpleAccount* account, const(char)* ext);										
        alias da_purple_log_common_sizer = int function(PurpleLog* log);																											
        alias da_purple_log_common_deleter = gboolean function(PurpleLog* log);																										
        alias da_purple_log_common_is_deletable = gboolean function(PurpleLog* log);																								
        alias da_purple_log_logger_new = PurpleLogLogger* function(const(char)* id, const(char)* name, int functions, ...);															
        alias da_purple_log_logger_free = void function(PurpleLogLogger* logger);																									
        alias da_purple_log_logger_add = void function(PurpleLogLogger* logger);																									
        alias da_purple_log_logger_remove = void function(PurpleLogLogger* logger);																									
        alias da_purple_log_logger_set = void function(PurpleLogLogger* logger);																									
        alias da_purple_log_logger_get = PurpleLogLogger* function();																												
        alias da_purple_log_logger_get_options = GList* function();																													
        alias da_purple_log_init = void function();																																	
        alias da_purple_log_get_handle = void* function();																															
        alias da_purple_log_uninit = void function();			
    }

    __gshared
    {
	    da_purple_log_new purple_log_new;
	    da_purple_log_free purple_log_free;
	    da_purple_log_write purple_log_write;
	    da_purple_log_read purple_log_read;
	    da_purple_log_get_logs purple_log_get_logs;
	    da_purple_log_get_log_sets purple_log_get_log_sets;
	    da_purple_log_get_system_logs purple_log_get_system_logs;
	    da_purple_log_get_size purple_log_get_size;
	    da_purple_log_get_total_size purple_log_get_total_size;
	    da_purple_log_get_activity_score purple_log_get_activity_score;
	    da_purple_log_is_deletable purple_log_is_deletable;
	    da_purple_log_delete purple_log_delete;
	    da_purple_log_get_log_dir purple_log_get_log_dir;
	    da_purple_log_compare purple_log_compare;
	    da_purple_log_set_compare purple_log_set_compare;
	    da_purple_log_set_free purple_log_set_free;
	    da_purple_log_common_writer purple_log_common_writer;
	    da_purple_log_common_lister purple_log_common_lister;
	    da_purple_log_common_total_sizer purple_log_common_total_sizer;
	    da_purple_log_common_sizer purple_log_common_sizer;
	    da_purple_log_common_deleter purple_log_common_deleter;
	    da_purple_log_common_is_deletable purple_log_common_is_deletable;
	    da_purple_log_logger_new purple_log_logger_new;
	    da_purple_log_logger_free purple_log_logger_free;
	    da_purple_log_logger_add purple_log_logger_add;
	    da_purple_log_logger_remove purple_log_logger_remove;
	    da_purple_log_logger_set purple_log_logger_set;
	    da_purple_log_logger_get purple_log_logger_get;
	    da_purple_log_logger_get_options purple_log_logger_get_options;
	    da_purple_log_init purple_log_init;
	    da_purple_log_get_handle purple_log_get_handle;
	    da_purple_log_uninit purple_log_uninit;	
    }
}
