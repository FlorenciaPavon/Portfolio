import mysql.connector
from account import Account
from passlib.hash import sha256_crypt


class Access:
    def __init__(self, username, password):
        self.__username= username
        self.__password= password       
        self.__newClient =None
        self.__idLogin = None
        self.__account=Account(self.__idLogin)
        
        

    def conect(self):
        conn = mysql.connector.connect(user='root', password='', host='localhost', database='bank', port=3306)       
        cursor = conn.cursor() 
        query = "CREATE DATABASE IF NOT EXISTS bank;"
        cursor.execute(query)
        conn.commit()
        return conn
    
   
    def createUser(self): 
        iduser=2       
        conn= self.conect() 
        cursor = conn.cursor() 

        hashed_password = sha256_crypt.hash(self.__password)
        query = "INSERT INTO login (name, password, idUser) VALUES (%s, %s, %s)"
        try:            
            cursor.execute(query, (self.__username, hashed_password, iduser))
            conn.commit()                                            
            print("User created succesfully") 
            self.getId()         
        except mysql.connector.IntegrityError as e:
            print(f"Error: {e}")
            print("User creation failed due to duplicate username")
            
    
    def verify_password(self, stored_password, provided_password):
    # Verifica si la contraseña proporcionada coincide con la contraseña almacenada después de desencriptarla
        return sha256_crypt.verify(provided_password, stored_password)
    
    def changePassword(self, newPass):
        conn = self.conect()
        cursor = conn.cursor()
        
        
        hashed_password = sha256_crypt.hash(str(newPass))
        
        query = "UPDATE bank.login SET password = %s WHERE name=%s"
        
        
        cursor.execute(query, (hashed_password, self.__username))
        conn.commit()
        print("Password changed succesfully!")
        

    def login(self):
        conn= self.conect()    
        cursor = conn.cursor()       

        try:
            query = "SELECT password FROM login WHERE name = %s"
            cursor.execute(query, (self.__username,))
            result = cursor.fetchone()
            

            if result:
                stored_password = str(result[0])
                if self.verify_password(stored_password, self.__password):
                    print("Login successful!")         
                    res = True
                    self.getId()                  
                else:
                    res = "Incorrect password. Please try again."                    
            else:
                res= "User not found."           
            conn.close()
            return res            
        except mysql.connector.Error as err:
            print(f"Error connecting to MySQL: {err}") 


    def typeOfUser(self):
        #logica para determinar permisos segun usuarios 
        idInformation= self.login()
        if idInformation[1]==1: 
           print("admin")
        elif idInformation[1]==3:
            print("cashier")  

    
    def getClientInstance(self):
        self.__newClient=self
        return self.__newClient   
                     
    def getId(self):        
        self.conect()
        conn= self.conect()    
        cursor = conn.cursor() 

        query= "SELECT idLogin, idUser FROM login WHERE name = %s"
        cursor.execute(query, (self.__username,))
        idInformation= cursor.fetchone()  
                    
        if  idInformation[1]==2:
            idLogin= idInformation[0]
            self.__idLogin = idLogin 
            return self.__idLogin         

#c1=Access("user123", "1234")
#c1.login() 
#c1.changePassword(1234)

'''username = "akaneAdmin"
password= "prueba"
pass2= "prueba"
idUser= 1

username = "user123"
password= "password123"
pass2= "password123"
idUser= 2

username = "johndoe"
password= "pass123"
pass2= "pass123"
idUser= 3


username = "cooluser"
password= "mypass"
pass2= "mypass"
idUser= 1


username = "testuser"
password= "mypass123"
pass2= "mypass123"
idUser= 2


username = "random123"
password= "pass"
pass2= "pass"
idUser= 3

username = "abc"
password= "abc"
pass2= "abc"
idUser= 1

username = "user123"
password= "password123"
pass2= "password123"
idUser= 2


username = "newuser"
password= "newpass"
pass2= "newpass"
idUser= 2

username = "someonelse"
password= "somepass"
pass2= "somepass"
idUser= 3

username = "blackcat"
password= "blackpass"
pass2= "blackpass"
idUser= 1

username = "whitedog"
password= "whitepass"
pass2= "whitepass"
idUser= 2

username = "randomuser"
password= "randompass"
pass2= "randompass"
idUser= 3

username = "test"
password= "testpass"
pass2= "testpass"
idUser= 1

username = "new"
password= "otherpass"
pass2= "otherpass"
idUser= 2

rname = "dontknow"
password= "dontknow"
pass2= "dontknow"
idUser= 3

username = "accessuser"
password= "password"
pass2= "password"
idUser= 1

username = "securelogin"
password= "secret"
pass2= "secret"
idUser= 2

username = "secretuser"
password= "sh123"
pass2= "sh123"
idUser= 3
username = "akanecashier"
password= "1234"
pass2= "1234"
idUser= 3

username = "akaneadmin"
password= "1234"
pass2= "1234"
idUser= 1
'''