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

module derelict.purple.marshallers;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;

extern (C):

extern( C ) nothrow 
{
    alias da_purple_smarshal_VOID__POINTER_POINTER_OBJECT = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);			
    alias da_purple_smarshal_BOOLEAN__OBJECT_POINTER_STRING = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);		
    alias da_purple_smarshal_VOID__STRING_STRING = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);					
    alias da_purple_smarshal_VOID__STRING_STRING_DOUBLE = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);			
    alias da_purple_smarshal_VOID__ENUM_STRING_STRING = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);				
    alias da_purple_smarshal_VOID__ENUM_STRING_STRING_BOOLEAN = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);		
    alias da_purple_smarshal_VOID__FLAGS_FLAGS = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);					
    alias da_purple_smarshal_VOID__STRING_STRING_OBJECT_OBJECT = void function(GClosure* closure, GValue* return_value, guint n_param_values, const(GValue)* param_values, gpointer invocation_hint, gpointer marshal_data);	
}

__gshared
{
	da_purple_smarshal_VOID__POINTER_POINTER_OBJECT purple_smarshal_VOID__POINTER_POINTER_OBJECT;
	da_purple_smarshal_BOOLEAN__OBJECT_POINTER_STRING purple_smarshal_BOOLEAN__OBJECT_POINTER_STRING;
	da_purple_smarshal_VOID__STRING_STRING purple_smarshal_VOID__STRING_STRING;
	da_purple_smarshal_VOID__STRING_STRING_DOUBLE purple_smarshal_VOID__STRING_STRING_DOUBLE;
	da_purple_smarshal_VOID__ENUM_STRING_STRING purple_smarshal_VOID__ENUM_STRING_STRING;
	da_purple_smarshal_VOID__ENUM_STRING_STRING_BOOLEAN purple_smarshal_VOID__ENUM_STRING_STRING_BOOLEAN;
	da_purple_smarshal_VOID__FLAGS_FLAGS purple_smarshal_VOID__FLAGS_FLAGS;
	da_purple_smarshal_VOID__STRING_STRING_OBJECT_OBJECT purple_smarshal_VOID__STRING_STRING_OBJECT_OBJECT;
}