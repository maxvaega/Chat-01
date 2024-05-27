# Riepilogo delle API implementate:                                                                                       
   1 Inviare Messaggio (/send-message)                                                                                                                      
      • Tipo di richiesta: POST                                                                                                                             
      • Descrizione: Invia un messaggio a Open Interpreter e ottiene una risposta. Al primo messaggio, avvia automaticamente una nuova sessione di interpreter                                                                          
   2 Stream dei Messaggi (/stream-messages)                                                                                                                 
      • Tipo di richiesta: GET                                                                                                                              
      • Descrizione: Fornisce uno stream dei messaggi di Open Interpreter.  







### per testare con Postman                                                                   
                                                                                                                                                            
**Iniziare una Sessione**                                                                    
                                                                                                                                                            
   1 Apri Postman.                                                                                                                                          
   2 Crea una nuova richiesta.                                                                                                                              
   3 Seleziona POST dal menu a discesa.                                                                                                                     
   4 Inserisci l'URL: http://127.0.0.1:5000/start-session.                                                                                                  
   5 Fai clic su Send.                                                                                                                                      
                                                                                                                                                            
**Inviare un Messaggio**                                                                    
                                                                                                                                                            
   1 Crea una nuova richiesta.                                                                                                                              
   2 Seleziona POST dal menu a discesa.                                                                                                                     
   3 Inserisci l'URL: http://127.0.0.1:5000/send-message.                                                                                                   
   4 Vai alla scheda Body, seleziona raw e JSON (application/json).                                                                                         
   5 Inserisci il seguente JSON:                                                                                                                            
                                                                                                                                                            
                                                                                                                                                            
       {                                                                                                                                                    
           "message": "Ciao, come stai?"                                                                                                                    
       }                                                                                                                                                    
       ```                                                                                                                                                  
   6. Fai clic su `Send`.                                                                                                                                   
                                                                                                                                                            
   #### Stream dei Messaggi                                                                                                                                 
   1. Crea una nuova richiesta.                                                                                                                             
   2. Seleziona `GET` dal menu a discesa.                                                                                                                   
   3. Inserisci l'URL: `http://127.0.0.1:5000/stream-messages`.                                                                                             
   4. Fai clic su `Send`.                                               
