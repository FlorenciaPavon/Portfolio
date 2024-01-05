import mysql.connector
# self.conn = mysql.connector.connect(user='root', password='', host='localhost', database='bank', port=3306)

class Card():
    def __init__(self, loginId):
        self.__loginId = loginId
        self.__type= None


    def conect(self):
        conn = mysql.connector.connect(user='root', password='', host='localhost', database='bank', port=3306)        
        cursor = conn.cursor() 
        query = "CREATE DATABASE IF NOT EXISTS bank;"
        cursor.execute(query)
        conn.commit()
        return conn 

    def getCardId(self):
        conn = self.conect()
        cursor = conn.cursor()
       
        
        #SELECT accounts.idAccount FROM login INNER JOIN clients ON login.idLogin = clients.idLogIn INNER JOIN accounts ON clients.idClient = accounts.idClient INNER JOIN cards ON accounts.idAccount= cards.idAccount WHERE login.idLogin = %s
        query ="SELECT cards.idCard FROM cards INNER JOIN accounts ON cards.idAccount=accounts.idAccount INNER JOIN clients ON accounts.idClient =clients.idClient INNER JOIN login ON clients.idLogin = login.idLogIn WHERE login.idLogin=%s"
       
        cursor.execute(query, (self.__loginId,))        
        result =  cursor.fetchone()
        
        if result:
            res= result[0]
            return res
        else:
            return None

    def getInfo(self):
        ccID= self.getCardId()

        conn = self.conect()
        cursor = conn.cursor()

        query = "SELECT vendor, idTypeCard FROM cards WHERE idCard = %s"
        cursor.execute(query, (ccID,))
        result = cursor.fetchone()

        if result:
            if result[1]==1:
                res = result[0]
                print(f"{res} Credit Card")
            elif result[1]==2:
                res = result[0]
                print(f"{res} Debit Card")
        else:
            return None
        
    def getLimit(self):
        conn=self.conect()
        cursor= conn.cursor() 
        ccID= self.getCardId()

        query = "SELECT cardLimit FROM cards WHERE idCard=%s"
        cursor.execute(query, (ccID,))
        result= cursor.fetchone()

        if result:
            res= result[0]
            return res 
        else:
            return None
'''
c=Card(2)
c.getLimit()'''
