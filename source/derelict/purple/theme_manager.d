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

module derelict.purple.theme_manager;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.purple.theme;
import derelict.purple.theme_loader;

extern (C):

alias void function (_PurpleTheme*) PTFunc;
alias _PurpleThemeManager PurpleThemeManager;
alias _PurpleThemeManagerClass PurpleThemeManagerClass;

struct _PurpleThemeManager
{
	GObject parent;
}

struct _PurpleThemeManagerClass
{
	GObjectClass parent_class;
}


extern( C ) nothrow 
{
    alias da_purple_theme_manager_get_type = GType function();																
    alias da_purple_theme_manager_init = void function();																	
    alias da_purple_theme_manager_uninit = void function();																	
    alias da_purple_theme_manager_refresh = void function();																
    alias da_purple_theme_manager_find_theme = PurpleTheme* function(const(gchar)* name, const(gchar)* type);				
    alias da_purple_theme_manager_add_theme = void function(PurpleTheme* theme);											
    alias da_purple_theme_manager_remove_theme = void function(PurpleTheme* theme);											
    alias da_purple_theme_manager_register_type = void function(PurpleThemeLoader* loader);									
    alias da_purple_theme_manager_unregister_type = void function(PurpleThemeLoader* loader);								
    alias da_purple_theme_manager_for_each_theme = void function(PTFunc func);												
    alias da_purple_theme_manager_load_theme = PurpleTheme* function(const(gchar)* theme_dir, const(gchar)* type);		
}

__gshared
{
	da_purple_theme_manager_get_type purple_theme_manager_get_type;
	da_purple_theme_manager_init purple_theme_manager_init;
	da_purple_theme_manager_uninit purple_theme_manager_uninit;
	da_purple_theme_manager_refresh purple_theme_manager_refresh;
	da_purple_theme_manager_find_theme purple_theme_manager_find_theme;
	da_purple_theme_manager_add_theme purple_theme_manager_add_theme;
	da_purple_theme_manager_remove_theme purple_theme_manager_remove_theme;
	da_purple_theme_manager_register_type purple_theme_manager_register_type;
	da_purple_theme_manager_unregister_type purple_theme_manager_unregister_type;
	da_purple_theme_manager_for_each_theme purple_theme_manager_for_each_theme;
	da_purple_theme_manager_load_theme purple_theme_manager_load_theme;
}