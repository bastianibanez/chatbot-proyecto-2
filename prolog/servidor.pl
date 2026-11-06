:- encoding(utf8).
:- ensure_loaded(chatbot).
:- use_module(library(filesex)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_path)).

% Calculamos la carpeta web a partir de este archivo, no de la terminal.
:- prolog_load_context(directory,D), directory_file_path(D,'../web',Web),
   asserta(user:file_search_path(web,Web)).
:- http_handler(root(api/chat), consultar, []).
:- http_handler(root(.), archivos, [prefix]).

iniciar :- iniciar(8000).
iniciar(Puerto) :- http_server(http_dispatch,[port(localhost:Puerto)]),
    format('Abre http://localhost:~d en tu navegador.~n',[Puerto]).
archivos(Request) :- http_reply_from_files(web(.), [indexes(['index.html'])], Request).
consultar(Request) :-
    (memberchk(method(post),Request) ->
        catch(http_read_json_dict(Request,D),_,D=invalid),
        (is_dict(D),get_dict(pregunta,D,P),string(P),string_length(P,N),N>0,N=<500 ->
            catch(responder(P,R),_,R=_{respuesta:"Ocurrió un error al consultar la base.",estado:error,intencion:ninguna}),
            reply_json_dict(R);
            reply_json_dict(_{error:"Envía una pregunta de 1 a 500 caracteres."},[status(400)]));
        reply_json_dict(_{error:"Usa POST."},[status(405)])).
