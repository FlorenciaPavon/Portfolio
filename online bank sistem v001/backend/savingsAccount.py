from account import Account
from datetime import datetime, timedelta


class Savings():
    def __init__(self, loginId):
        self.account= Account(loginId)
        self.__savingBalance= 0
        self.__interest = 0.5
        self.__accountCreationDate = datetime.now() 
    
    def getSavingBalance(self):
        balance= self.account.getBalance()
        print("The total amount for the account is: ", balance)
        print("The current Saving Account balance is: ", self.__savingBalance)

    def newFixedTermDeposit(self, amount):
        self.account.withdraw(amount)
        self.__savingBalance += amount
        print("The savings amount is: ", self.__savingBalance)

    def interestDeposit(self):
        current_date = datetime.now()
        days_passed = (current_date - self.__accountCreationDate).days
        
       
        if days_passed >= 30 and self.__savingBalance !=0:
            interestAdd = self.__savingBalance * (1 + self.__interest)
            self.account.deposit(interestAdd) 
            print("Interest has been deposited")
        else:
            print("The interest will be deposited after 30 days from the saving account creation")


'''
c1=Savings(2)
# Simular que han pasado más de 30 días
# Cambiar la fecha de creación de la cuenta a 31 días en el pasado
c1._Savings__accountCreationDate = datetime.now() - timedelta(days=29)
c1.interestDeposit()  # Debería mostrar "Interest has been deposited."
'''


