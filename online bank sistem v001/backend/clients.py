
import mysql.connector


class Client:
    def __init__(self, loginId):
        self.__userId= loginId
        
    
    def conect(self):
        conn = mysql.connector.connect(user='root', password='', host='localhost', database='bank', port=3306)
        
        cursor = conn.cursor() 
        query = "CREATE DATABASE IF NOT EXISTS bank;"
        cursor.execute(query)
        conn.commit()
        return conn   
    
    def getInfo(self):
        conn = self.conect()
        cursor= conn.cursor()

        query= "SELECT name, lastName FROM clients WHERE idLogin= %s"
        cursor.execute(query, (self.__userId,))
        result = cursor.fetchone()        
        if result:
            name, lastName = result
            print (f"Name: {name} \nLast Name: {lastName}")
        else:
            return None

    def userVerification(self): #only the clients with userId=2 can create an account
        try:
            conn = self.conect()
            cursor = conn.cursor()

            # Verify clients with idUser = 2 in login table
            check_query = "SELECT COUNT(*) FROM login WHERE idUser = 2"
            cursor.execute(check_query)
            user_exists = cursor.fetchone()[0]
            
            if user_exists:
                # INNER JOIN
                inner_join_query = "SELECT * FROM login INNER JOIN users ON login.idUser = users.idUser WHERE login.idUser = 2"
                cursor.execute(inner_join_query)
                inner_join_result = cursor.fetchall()                
                
                if inner_join_result:
                    self.addClient()                    
                else:
                    print("No client found in the join.")
            else:
                print("No user with idUser = 2 in login.")

        except mysql.connector.Error as e:
            print(f"Error: {e}")
        finally:
            cursor.close()
            conn.close()


    def addClient(self, data):       
        try:            
            data.append(self.__userId)
            print(data)
            tupData=tuple(data)
            print(tupData)

            conn = self.conect()
            cursor = conn.cursor()

       
            insert_query = "INSERT INTO clients (name, lastName, birthDate, email, phone, street, streetNumber, apartment, floor, state, city, country, identification, idLogin) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            client_data = (tupData)
            cursor.execute(insert_query, client_data)
            conn.commit()
            print("Client added successfully!")

        except mysql.connector.Error as e:
            print(f"Error: {e}")
        finally:
            cursor.close()
            conn.close()



  
        
     
    
    
   
  
        
     
    
    
   
  
        
     
    
    
   
  
        
     
    
    
   
  
  
 
 
 
 
 
 

 
 
 
 
 

 
 
 
 

 
 
 
 


















