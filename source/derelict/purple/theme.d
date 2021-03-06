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

module derelict.purple.theme;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;

extern (C):

alias _PurpleTheme PurpleTheme;
alias _PurpleThemeClass PurpleThemeClass;

struct _PurpleTheme
{
	GObject parent;
	gpointer priv;
}

struct _PurpleThemeClass
{
	GObjectClass parent_class;
}


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        GType purple_theme_get_type();
        const(gchar)* purple_theme_get_name(PurpleTheme* theme);
        void purple_theme_set_name(PurpleTheme* theme, const(gchar)* name);
        const(gchar)* purple_theme_get_description(PurpleTheme* theme);
        void purple_theme_set_description(PurpleTheme* theme, const(gchar)* description);
        const(gchar)* purple_theme_get_author(PurpleTheme* theme);
        void purple_theme_set_author(PurpleTheme* theme, const(gchar)* author);
        const(gchar)* purple_theme_get_type_string(PurpleTheme* theme);
        const(gchar)* purple_theme_get_dir(PurpleTheme* theme);
        void purple_theme_set_dir(PurpleTheme* theme, const(gchar)* dir);
        const(gchar)* purple_theme_get_image(PurpleTheme* theme);
        gchar* purple_theme_get_image_full(PurpleTheme* theme);
        void purple_theme_set_image(PurpleTheme* theme, const(gchar)* img);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_purple_theme_get_type = GType function();															
        alias da_purple_theme_get_name = const(gchar)* function(PurpleTheme* theme);								
        alias da_purple_theme_set_name = void function(PurpleTheme* theme, const(gchar)* name);						
        alias da_purple_theme_get_description = const(gchar)* function(PurpleTheme* theme);							
        alias da_purple_theme_set_description = void function(PurpleTheme* theme, const(gchar)* description);		
        alias da_purple_theme_get_author = const(gchar)* function(PurpleTheme* theme);								
        alias da_purple_theme_set_author = void function(PurpleTheme* theme, const(gchar)* author);					
        alias da_purple_theme_get_type_string = const(gchar)* function(PurpleTheme* theme);							
        alias da_purple_theme_get_dir = const(gchar)* function(PurpleTheme* theme);									
        alias da_purple_theme_set_dir = void function(PurpleTheme* theme, const(gchar)* dir);						
        alias da_purple_theme_get_image = const(gchar)* function(PurpleTheme* theme);								
        alias da_purple_theme_get_image_full = gchar* function(PurpleTheme* theme);									
        alias da_purple_theme_set_image = void function(PurpleTheme* theme, const(gchar)* img);		
    }

    __gshared
    {
	    da_purple_theme_get_type purple_theme_get_type;
	    da_purple_theme_get_name purple_theme_get_name;
	    da_purple_theme_set_name purple_theme_set_name;
	    da_purple_theme_get_description purple_theme_get_description;
	    da_purple_theme_set_description purple_theme_set_description;
	    da_purple_theme_get_author purple_theme_get_author;
	    da_purple_theme_set_author purple_theme_set_author;
	    da_purple_theme_get_type_string purple_theme_get_type_string;
	    da_purple_theme_get_dir purple_theme_get_dir;
	    da_purple_theme_set_dir purple_theme_set_dir;
	    da_purple_theme_get_image purple_theme_get_image;
	    da_purple_theme_get_image_full purple_theme_get_image_full;
	    da_purple_theme_set_image purple_theme_set_image;
    }
}
