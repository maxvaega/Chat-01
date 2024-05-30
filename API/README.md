# ATTENZIONE: le API sviluppate non sono in uso



# Riepilogo delle API implementate:                                                                                       
   1 Inviare Messaggio (/send-message)                                                                                                                      
      • Tipo di richiesta: POST                                                                                                                             
      • Descrizione: Invia un messaggio a Open Interpreter e ottiene una risposta. Al primo messaggio, avvia automaticamente una nuova sessione di interpreter                                                                          
   2 Stream dei Messaggi (/stream-messages)                                                                                                                 
      • Tipo di richiesta: GET                                                                                                                              
      • Descrizione: Fornisce uno stream dei messaggi di Open Interpreter.  







### per testare                                                           
                                                                                                                                                            
** POST URL: http://127.0.0.1:5000/start-session **                                                                                                                  
                                                                                                                                                            
** POST URL: http://127.0.0.1:5000/send-message JSON **                                                                                                                                                            
       {                                                                                                                                                    
           "message": "Ciao, come stai?"                                                                                                                    
       }                                                                                                                                                    
       ```                                                                                                                                                  
                                                                                                                                   
                                                                                                                                                            
   #### Stream dei Messaggi                                                                                                                                 
                                                                                                                            
** GET URL: `http://127.0.0.1:5000/stream-messages`
** non funziona
