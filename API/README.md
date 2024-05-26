#A. Riepilogo delle API implementate:   
   
   1 Iniziare una Sessione (/start-session)                                                                                                                 
      • Tipo di richiesta: POST                                                                                                                             
      • Descrizione: Inizia una nuova sessione con Open Interpreter.                                                                                        
   2 Inviare Messaggio (/send-message)                                                                                                                      
      • Tipo di richiesta: POST                                                                                                                             
      • Descrizione: Invia un messaggio a Open Interpreter e ottiene una risposta.                                                                          
   3 Stream dei Messaggi (/stream-messages)                                                                                                                 
      • Tipo di richiesta: GET                                                                                                                              
      • Descrizione: Fornisce uno stream dei messaggi di Open Interpreter.  







#B. Utilizzo di Postman                                                                   
                                                                                                                                                            
                                                                   Iniziare una Sessione                                                                    
                                                                                                                                                            
   1 Apri Postman.                                                                                                                                          
   2 Crea una nuova richiesta.                                                                                                                              
   3 Seleziona POST dal menu a discesa.                                                                                                                     
   4 Inserisci l'URL: http://127.0.0.1:5000/start-session.                                                                                                  
   5 Fai clic su Send.                                                                                                                                      
                                                                                                                                                            
                                                                    Inviare un Messaggio                                                                    
                                                                                                                                                            
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
