from access import Access
from clients import Client
from account import Account
from cards import Card
from checkingAccount import Checking
from savingsAccount import Savings


#interaction menu, will be adapted to the frontend with Flask

def main():
    
    #loginverification diferenciado por login y signin
    #login
    
    user=input("Please enter the username: ") 
    password=input("Please enter the password: ") 
    
    c1=Access(user,password)
    c1.login()
    idLogin = c1.getId()  
    
    
    #sigin menu 
    '''
    print("Welcome to HannaCo Bank")
    user=input("Please enter a username: ")
    password=input("Please enter a password: ") 
    password2=input("Please enter the password again: ")

    if password == password2:
        c2=Access(user, password)
        print(c2)
        c2.createUser()
        idNewClient= c2.getId()        
        client_instance = c2.getClientInstance()        
        
        if client_instance:
            c2= Client(idNewClient)
            #creo el cliente en la bbdd, en pantalla con un formulario
            fields=["Name: ", "Last Name: ", "Birth Date (YYYY-MM-DD): ", "Email: ", "Phone: ", "Street: ", "Street Number: ", "Apartment: ", "Floor: ","State: ", "City: ", "Conutry: ", "Identification Number: "]
            data=[]
            print("Enter the following information: ")
            print()

            for field in fields:
                ClientData= input(field)
                data.append(ClientData)
            print(data)
            c2.addClient(data)
        else:
            print("No se creó un cliente.")
    else:
        print("Passwords do not match, please try again")'''
    
    #if Access: #loginId is available for most of the classes
          
    print("Welcome, please enter the number for the desired option")
    print("1: Deposit")
    print("2: Withdraw")
    print("3: Transfer")
    print("4:  View Current Balance")
    print("5: Change Password")         
    print("6: Information about the account") # more options in this option
    
    option=int(input("Your option is: ")) # for testing see userPasswordsTest.txt. Example: user123 password123
    if option==1:                          # o new otherpass
        acc=Account(idLogin)
        acc.getBalance()         
        amount=float(input("Enter the ammount to deposit: "))
        acc.deposit(amount)
            
    elif option==2:
        acc=Account(idLogin)
        print(acc.getBalance())        
        amount=float(input("Enter the ammount to withdraw: "))
        acc.withdraw(amount)     
            
    elif option==3:
        acc=Account(idLogin)
        print(acc.getBalance()) 
        amount=float(input("Enter the ammount to transfer: "))
        accountNo= int(input("Enter the account number: "))               
        acc.transfer(amount, accountNo)   # 516983820 id7   
            
    elif option==4:
        acc=Account(idLogin)
        balance= acc.getBalance()
        print(f"The current balance for the accoun is : {balance}")
        
    elif option==5:        
        flag= True
        while flag:
            newPass=input("Please enter the new password: ")
            newPass2=input("Please enter the new password again: ")
            if newPass==newPass2:
                c1.changePassword(newPass)
                flag=False
            else:
                print("Passwords do not match please try again")
                
    elif option==6:
        acc=Account(idLogin)
        c1=Client(idLogin)       
        c1.getInfo()
        acc.getInfo()
        balance = acc.getBalance()
        print(f"Balance: {balance} ")
        c1=Card(idLogin)
        c1.getInfo()
        
        accType= acc.getType()

        if accType==1:
            acc=Savings(idLogin)
            print()
            print("-"*20)
            print("Select the option: ")
            print()
            print("1 - View Fixed-Term Balance") 
            print("2 - Create a Fixed-Term account")
            print("3 - Cancel and deposit Fixed-Term account")
            opt=int(input("Enter the option number: "))
            if opt==1:
                acc.getSavingBalance()
            elif opt==2:
                amount = float(input("Enter the amount to save: "))
                acc.newFixedTermDeposit(amount)
            elif opt==3: 
                acc.interestDeposit()
        elif accType==2:
            acc=Checking(idLogin)
            print()
            print("-"*20)
            print("Select the option: ")
            print()
            print("1 - View Checking Account Balance") 
            print("2 - Account Limit")
            print("3 - Deposit a Check")
            print("4 - Pay with check")
            opt=int(input("Enter the option number: "))
            if opt==1:
                acc.getCheckingBalance()

            elif opt==2:
                limit= acc.getPaymentLimit()
                print("The payment limit is: ", limit)
            elif opt==3:
                amount = float(input("Please enter the amount to deposited: "))
                acc.checkDeposit(amount)
            elif opt==4:
                amount = float(input("Please enter the payment amount: "))
                acc.payment(amount)
        else:
            "Please enter a valid number"
    else:
            "Please enter a valid number"
main()

