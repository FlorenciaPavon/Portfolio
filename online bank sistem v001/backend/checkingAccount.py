import mysql.connector
from account import Account


class Checking():
    def __init__(self, loginId):
        self.account = Account(loginId)
        self.__checkingBalance= ""
        self.__paymentLimit= 0
        self.__fee= 0.2
        self.__rejectedTax= 0.8

        
    def getPaymentLimit(self):        
        self.getCheckingBalance()
        self.__paymentLimit = self.__checkingBalance * 1.1
        return self.__paymentLimit
    
    def getCheckingBalance(self):
        self.__checkingBalance = self.account.getBalance()
        print ("The current balance for the Checking Account is: ", self.__checkingBalance)
        return self.__checkingBalance
    
    def checkDeposit(self, amount):
        self.account.deposit(amount)
        self.__checkingBalance = self.account.getBalance()
    
    def payment(self, amount):
        limit = self.getPaymentLimit()
        print("Current limit is: {:.2f}".format(limit))
        originalBalance = self.account.getBalance()       
       
        if amount <= limit or originalBalance != 0:
            total= amount * (1+self.__fee)
            totalDep= -1 * total
            self.account.deposit(totalDep)
            
        else:
            newBalance = originalBalance - (amount * (1+self.__rejectedTax))
            self.account.withdraw(amount)
        
    
'''
c1=Checking(15)
c1.payment(20000)

'''