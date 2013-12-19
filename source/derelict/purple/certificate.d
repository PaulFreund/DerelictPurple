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

module derelict.purple.certificate;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.glist;
import derelict.glib.gslist;
import derelict.glib.garray;
import core.stdc.time;

extern (C):

alias _Anonymous_0 PurpleCertificateVerificationStatus;
alias _PurpleCertificate PurpleCertificate;
alias _PurpleCertificatePool PurpleCertificatePool;
alias _PurpleCertificateScheme PurpleCertificateScheme;
alias _PurpleCertificateVerifier PurpleCertificateVerifier;
alias _PurpleCertificateVerificationRequest PurpleCertificateVerificationRequest;
alias void function (_Anonymous_0, void*) PurpleCertificateVerifiedCallback;

enum _Anonymous_0
{
	PURPLE_CERTIFICATE_INVALID = 0,
	PURPLE_CERTIFICATE_VALID = 1
}

struct _PurpleCertificate
{
	PurpleCertificateScheme* scheme;
	gpointer data;
}

struct _PurpleCertificatePool
{
	gchar* scheme_name;
	gchar* name;
	gchar* fullname;
	gpointer data;
	gboolean function () init;
	void function () uninit;
	gboolean function (const(gchar)*) cert_in_pool;
	PurpleCertificate* function (const(gchar)*) get_cert;
	gboolean function (const(gchar)*, PurpleCertificate*) put_cert;
	gboolean function (const(gchar)*) delete_cert;
	GList* function () get_idlist;
	void function () _purple_reserved1;
	void function () _purple_reserved2;
	void function () _purple_reserved3;
	void function () _purple_reserved4;
}

struct _PurpleCertificateScheme
{
	gchar* name;
	gchar* fullname;
	PurpleCertificate* function (const(gchar)*) import_certificate;
	gboolean function (const(gchar)*, PurpleCertificate*) export_certificate;
	PurpleCertificate* function (PurpleCertificate*) copy_certificate;
	void function (PurpleCertificate*) destroy_certificate;
	gboolean function (PurpleCertificate*, PurpleCertificate*) signed_by;
	GByteArray* function (PurpleCertificate*) get_fingerprint_sha1;
	gchar* function (PurpleCertificate*) get_unique_id;
	gchar* function (PurpleCertificate*) get_issuer_unique_id;
	gchar* function (PurpleCertificate*) get_subject_name;
	gboolean function (PurpleCertificate*, const(gchar)*) check_subject_name;
	gboolean function (PurpleCertificate*, time_t*, time_t*) get_times;
	GSList* function (const(gchar)*) import_certificates;
	void function () _purple_reserved1;
	void function () _purple_reserved2;
	void function () _purple_reserved3;
}

struct _PurpleCertificateVerifier
{
	gchar* scheme_name;
	gchar* name;
	void function (PurpleCertificateVerificationRequest*) start_verification;
	void function (PurpleCertificateVerificationRequest*) destroy_request;
	void function () _purple_reserved1;
	void function () _purple_reserved2;
	void function () _purple_reserved3;
	void function () _purple_reserved4;
}

struct _PurpleCertificateVerificationRequest
{
	PurpleCertificateVerifier* verifier;
	PurpleCertificateScheme* scheme;
	gchar* subject_name;
	GList* cert_chain;
	gpointer data;
	PurpleCertificateVerifiedCallback cb;
	gpointer cb_data;
}

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        void purple_certificate_verify(PurpleCertificateVerifier* verifier, const(gchar)* subject_name, GList* cert_chain, PurpleCertificateVerifiedCallback cb, gpointer cb_data);
        void purple_certificate_verify_complete(PurpleCertificateVerificationRequest* vrq, PurpleCertificateVerificationStatus st);
        PurpleCertificate* purple_certificate_copy(PurpleCertificate* crt);
        GList* purple_certificate_copy_list(GList* crt_list);
        void purple_certificate_destroy(PurpleCertificate* crt);
        void purple_certificate_destroy_list(GList* crt_list);
        gboolean purple_certificate_signed_by(PurpleCertificate* crt, PurpleCertificate* issuer);
        gboolean purple_certificate_check_signature_chain_with_failing(GList* chain, PurpleCertificate** failing);
        gboolean purple_certificate_check_signature_chain(GList* chain);
        PurpleCertificate* purple_certificate_import(PurpleCertificateScheme* scheme, const(gchar)* filename);
        GSList* purple_certificates_import(PurpleCertificateScheme* scheme, const(gchar)* filename);
        gboolean purple_certificate_export(const(gchar)* filename, PurpleCertificate* crt);
        GByteArray* purple_certificate_get_fingerprint_sha1(PurpleCertificate* crt);
        gchar* purple_certificate_get_unique_id(PurpleCertificate* crt);
        gchar* purple_certificate_get_issuer_unique_id(PurpleCertificate* crt);
        gchar* purple_certificate_get_subject_name(PurpleCertificate* crt);
        gboolean purple_certificate_check_subject_name(PurpleCertificate* crt, const(gchar)* name);
        gboolean purple_certificate_get_times(PurpleCertificate* crt, time_t* activation, time_t* expiration);
        gchar* purple_certificate_pool_mkpath(PurpleCertificatePool* pool, const(gchar)* id);
        gboolean purple_certificate_pool_usable(PurpleCertificatePool* pool);
        PurpleCertificateScheme* purple_certificate_pool_get_scheme(PurpleCertificatePool* pool);
        gboolean purple_certificate_pool_contains(PurpleCertificatePool* pool, const(gchar)* id);
        PurpleCertificate* purple_certificate_pool_retrieve(PurpleCertificatePool* pool, const(gchar)* id);
        gboolean purple_certificate_pool_store(PurpleCertificatePool* pool, const(gchar)* id, PurpleCertificate* crt);
        gboolean purple_certificate_pool_delete(PurpleCertificatePool* pool, const(gchar)* id);
        GList* purple_certificate_pool_get_idlist(PurpleCertificatePool* pool);
        void purple_certificate_pool_destroy_idlist(GList* idlist);
        void purple_certificate_init();
        void purple_certificate_uninit();
        gpointer purple_certificate_get_handle();
        PurpleCertificateScheme* purple_certificate_find_scheme(const(gchar)* name);
        GList* purple_certificate_get_schemes();
        gboolean purple_certificate_register_scheme(PurpleCertificateScheme* scheme);
        gboolean purple_certificate_unregister_scheme(PurpleCertificateScheme* scheme);
        PurpleCertificateVerifier* purple_certificate_find_verifier(const(gchar)* scheme_name, const(gchar)* ver_name);
        GList* purple_certificate_get_verifiers();
        gboolean purple_certificate_register_verifier(PurpleCertificateVerifier* vr);
        gboolean purple_certificate_unregister_verifier(PurpleCertificateVerifier* vr);
        PurpleCertificatePool* purple_certificate_find_pool(const(gchar)* scheme_name, const(gchar)* pool_name);
        GList* purple_certificate_get_pools();
        gboolean purple_certificate_register_pool(PurpleCertificatePool* pool);
        gboolean purple_certificate_unregister_pool(PurpleCertificatePool* pool);
        void purple_certificate_display_x509(PurpleCertificate* crt);
        void purple_certificate_add_ca_search_path(const(char)* path);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_purple_certificate_verify = void function(PurpleCertificateVerifier* verifier, const(gchar)* subject_name, GList* cert_chain, PurpleCertificateVerifiedCallback cb, gpointer cb_data);				
        alias da_purple_certificate_verify_complete = void function(PurpleCertificateVerificationRequest* vrq, PurpleCertificateVerificationStatus st);																
        alias da_purple_certificate_copy = PurpleCertificate* function(PurpleCertificate* crt);																														
        alias da_purple_certificate_copy_list = GList* function(GList* crt_list);																																	
        alias da_purple_certificate_destroy = void function(PurpleCertificate* crt);																																
        alias da_purple_certificate_destroy_list = void function(GList* crt_list);																																	
        alias da_purple_certificate_signed_by = gboolean function(PurpleCertificate* crt, PurpleCertificate* issuer);																								
        alias da_purple_certificate_check_signature_chain_with_failing = gboolean function(GList* chain, PurpleCertificate** failing);																				
        alias da_purple_certificate_check_signature_chain = gboolean function(GList* chain);																														
        alias da_purple_certificate_import = PurpleCertificate* function(PurpleCertificateScheme* scheme, const(gchar)* filename);																					
        alias da_purple_certificates_import = GSList* function(PurpleCertificateScheme* scheme, const(gchar)* filename);																							
        alias da_purple_certificate_export = gboolean function(const(gchar)* filename, PurpleCertificate* crt);																										
        alias da_purple_certificate_get_fingerprint_sha1 = GByteArray* function(PurpleCertificate* crt);																											
        alias da_purple_certificate_get_unique_id = gchar* function(PurpleCertificate* crt);																														
        alias da_purple_certificate_get_issuer_unique_id = gchar* function(PurpleCertificate* crt);																													
        alias da_purple_certificate_get_subject_name = gchar* function(PurpleCertificate* crt);																														
        alias da_purple_certificate_check_subject_name = gboolean function(PurpleCertificate* crt, const(gchar)* name);																								
        alias da_purple_certificate_get_times = gboolean function(PurpleCertificate* crt, time_t* activation, time_t* expiration);																					
        alias da_purple_certificate_pool_mkpath = gchar* function(PurpleCertificatePool* pool, const(gchar)* id);																									
        alias da_purple_certificate_pool_usable = gboolean function(PurpleCertificatePool* pool);																													
        alias da_purple_certificate_pool_get_scheme = PurpleCertificateScheme* function(PurpleCertificatePool* pool);																								
        alias da_purple_certificate_pool_contains = gboolean function(PurpleCertificatePool* pool, const(gchar)* id);																								
        alias da_purple_certificate_pool_retrieve = PurpleCertificate* function(PurpleCertificatePool* pool, const(gchar)* id);																						
        alias da_purple_certificate_pool_store = gboolean function(PurpleCertificatePool* pool, const(gchar)* id, PurpleCertificate* crt);																			
        alias da_purple_certificate_pool_delete = gboolean function(PurpleCertificatePool* pool, const(gchar)* id);																									
        alias da_purple_certificate_pool_get_idlist = GList* function(PurpleCertificatePool* pool);																													
        alias da_purple_certificate_pool_destroy_idlist = void function(GList* idlist);																																
        alias da_purple_certificate_init = void function();																																							
        alias da_purple_certificate_uninit = void function();																																						
        alias da_purple_certificate_get_handle = gpointer function();																																				
        alias da_purple_certificate_find_scheme = PurpleCertificateScheme* function(const(gchar)* name);																											
        alias da_purple_certificate_get_schemes = GList* function();																																				
        alias da_purple_certificate_register_scheme = gboolean function(PurpleCertificateScheme* scheme);																											
        alias da_purple_certificate_unregister_scheme = gboolean function(PurpleCertificateScheme* scheme);																											
        alias da_purple_certificate_find_verifier = PurpleCertificateVerifier* function(const(gchar)* scheme_name, const(gchar)* ver_name);																			
        alias da_purple_certificate_get_verifiers = GList* function();																																				
        alias da_purple_certificate_register_verifier = gboolean function(PurpleCertificateVerifier* vr);																											
        alias da_purple_certificate_unregister_verifier = gboolean function(PurpleCertificateVerifier* vr);																											
        alias da_purple_certificate_find_pool = PurpleCertificatePool* function(const(gchar)* scheme_name, const(gchar)* pool_name);																				
        alias da_purple_certificate_get_pools = GList* function();																																					
        alias da_purple_certificate_register_pool = gboolean function(PurpleCertificatePool* pool);																													
        alias da_purple_certificate_unregister_pool = gboolean function(PurpleCertificatePool* pool);																												
        alias da_purple_certificate_display_x509 = void function(PurpleCertificate* crt);																															
        alias da_purple_certificate_add_ca_search_path = void function(const(char)* path);		
    }

    __gshared
    {
	    da_purple_certificate_verify purple_certificate_verify;
	    da_purple_certificate_verify_complete purple_certificate_verify_complete;
	    da_purple_certificate_copy purple_certificate_copy;
	    da_purple_certificate_copy_list purple_certificate_copy_list;
	    da_purple_certificate_destroy purple_certificate_destroy;
	    da_purple_certificate_destroy_list purple_certificate_destroy_list;
	    da_purple_certificate_signed_by purple_certificate_signed_by;
	    da_purple_certificate_check_signature_chain_with_failing purple_certificate_check_signature_chain_with_failing;
	    da_purple_certificate_check_signature_chain purple_certificate_check_signature_chain;
	    da_purple_certificate_import purple_certificate_import;
	    da_purple_certificates_import purple_certificates_import;
	    da_purple_certificate_export purple_certificate_export;
	    da_purple_certificate_get_fingerprint_sha1 purple_certificate_get_fingerprint_sha1;
	    da_purple_certificate_get_unique_id purple_certificate_get_unique_id;
	    da_purple_certificate_get_issuer_unique_id purple_certificate_get_issuer_unique_id;
	    da_purple_certificate_get_subject_name purple_certificate_get_subject_name;
	    da_purple_certificate_check_subject_name purple_certificate_check_subject_name;
	    da_purple_certificate_get_times purple_certificate_get_times;
	    da_purple_certificate_pool_mkpath purple_certificate_pool_mkpath;
	    da_purple_certificate_pool_usable purple_certificate_pool_usable;
	    da_purple_certificate_pool_get_scheme purple_certificate_pool_get_scheme;
	    da_purple_certificate_pool_contains purple_certificate_pool_contains;
	    da_purple_certificate_pool_retrieve purple_certificate_pool_retrieve;
	    da_purple_certificate_pool_store purple_certificate_pool_store;
	    da_purple_certificate_pool_delete purple_certificate_pool_delete;
	    da_purple_certificate_pool_get_idlist purple_certificate_pool_get_idlist;
	    da_purple_certificate_pool_destroy_idlist purple_certificate_pool_destroy_idlist;
	    da_purple_certificate_init purple_certificate_init;
	    da_purple_certificate_uninit purple_certificate_uninit;
	    da_purple_certificate_get_handle purple_certificate_get_handle;
	    da_purple_certificate_find_scheme purple_certificate_find_scheme;
	    da_purple_certificate_get_schemes purple_certificate_get_schemes;
	    da_purple_certificate_register_scheme purple_certificate_register_scheme;
	    da_purple_certificate_unregister_scheme purple_certificate_unregister_scheme;
	    da_purple_certificate_find_verifier purple_certificate_find_verifier;
	    da_purple_certificate_get_verifiers purple_certificate_get_verifiers;
	    da_purple_certificate_register_verifier purple_certificate_register_verifier;
	    da_purple_certificate_unregister_verifier purple_certificate_unregister_verifier;
	    da_purple_certificate_find_pool purple_certificate_find_pool;
	    da_purple_certificate_get_pools purple_certificate_get_pools;
	    da_purple_certificate_register_pool purple_certificate_register_pool;
	    da_purple_certificate_unregister_pool purple_certificate_unregister_pool;
	    da_purple_certificate_display_x509 purple_certificate_display_x509;
	    da_purple_certificate_add_ca_search_path purple_certificate_add_ca_search_path;
    }
}
