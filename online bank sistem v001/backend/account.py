import mysql.connector

class BalanceException(Exception):
    pass


class Account():    
    def __init__(self, loginId):        
        self.__initialBalance = 0
        self.__extractionLimit = 100000
        self.__LoginId= loginId
        self.__accountId= None
        self.__typeAccount= ""
    
    def conect(self):
        conn = mysql.connector.connect(user='root', password='', host='localhost', database='bank', port=3306)        
        cursor = conn.cursor() 
        query = "CREATE DATABASE IF NOT EXISTS bank;"
        cursor.execute(query)
        conn.commit()
        return conn 

    def getType(self):
        return self.__typeAccount           

    def getClientId(self):        
        conn = self.conect()
        cursor=conn.cursor()
        try:
            query = "SELECT accounts.idAccount FROM login INNER JOIN clients ON login.idLogin = clients.idLogIn INNER JOIN accounts ON clients.idClient = accounts.idClient WHERE login.idLogin = %s"
            
            cursor.execute(query, (self.__LoginId,))
            result = cursor.fetchone()[0]  # Obtener el resultado de la consulta
            if result:
                self.__accountId = result 
                return self.__accountId 
            else:
                return None 
        except mysql.connector.Error as err:
           print(f"Error connecting to MySQL: {err}") 

    def getInfo(self):
        conn = self.conect()
        cursor = conn.cursor()
        clientId = self.getClientId()

        query="SELECT accountNumber, idTypeAccount FROM accounts WHERE idClient= %s"
        cursor.execute(query, (clientId,))
        result = cursor.fetchone()
        
        if result:
            if result[1]==1:
                res = result[0]
                self.__typeAccount = 1
                print (f"Savings Account number: {res}")                
            elif result[1]==2:
                res = result[0]
                self.__typeAccount = 2
                print(f"Checking Account number: {res}")
                
        else: 
            return None

    def getBalance(self):        
        conn = self.conect()
        cursor = conn.cursor()
        self.getClientId()
        try:
            query= "SELECT balance FROM accounts WHERE idClient=%s"
            cursor.execute(query, (self.__accountId,))            
            result = cursor.fetchone()
           
            if result is not None:
                self.__initialBalance = float(result[0])
                return self.__initialBalance
            else:
                return "No balance found for this client"
        except mysql.connector.Error as err:
           print(f"Error connecting to MySQL: {err}") 



    def setBalance(self, newBalance):
        conn=self.conect()
        cursor= conn.cursor()
        self.__initialBalance = newBalance
        
        try: 
            query= "UPDATE bank.accounts SET accounts.balance = %s WHERE accounts.idClient = %s"
            cursor.execute(query, (self.__initialBalance, self.__accountId,))
            conn.commit()            
        except mysql.connector.Error as err:
           print(f"Error connecting to MySQL: {err}")  

    
    def deposit(self, amount):        
        try:            
            current_balance = self.getBalance()           
            print("Current balance is ", current_balance)
            new_balance = current_balance + amount            
            self.setBalance(new_balance)
            print(f"Deposit of ${amount} completed. Total balance: {new_balance}")
        except mysql.connector.Error as err:
            print(f"Error with deposit: {err}")    
        
    
    def verification(self, withdrawal):
        initBalance= self.getBalance()
        self.getClientId()
        print("Current balance is ", initBalance)      
        if initBalance >= withdrawal:            
            newAmount = initBalance - withdrawal
            self.setBalance(newAmount)
        else:
            raise BalanceException ("Sorry not enough funds in account, current balance is", self.__initialBalance)
        
    def withdraw(self, amount):           
        try:
            self.verification(amount)                    
            self.getBalance()
            print(f"Withdrawal complete. Total balance: {self.__initialBalance}" )    
            print()
        except BalanceException as error:
            print(f"There is an error with this transaction: \n{error}") 

    def transfer(self, amount, accNumber):
        #fromAcc read balance, withdraw 
        #toAcc deposit, with acc number   
        try:
            print("... transfering, please hold")
            self.withdraw(amount)

            conn=self.conect()
            cursor= conn.cursor()
            query= "UPDATE accounts SET balance = balance + %s WHERE accountNumber= %s"
            cursor.execute(query,(amount, accNumber,))
            conn.commit()
            print("Transfer complete")
            print("Balance for current account is: ", self.getBalance())
            
            
        except BalanceException as error:
            print(f"Something went wrong with this transfer, {error}")
    
#user123 password123 325017.00 
'''         
c1=Account(15)
c1.withdraw(40)

'''