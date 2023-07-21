from bs4 import BeautifulSoup
import requests
import datetime
from datetime import timedelta
import time
import os
import PySimpleGUI as sg

######----- FUNCTIONALITY --------### 
url = "https://www.empleosit.com.ar/search-results-jobs/?searchId=1689874355.4589&action=refine&vi"

def time_limit(days):
    t1= days    
    days_ago= timedelta(days=int(t1))
    now = datetime.datetime.now().date()
    res = now - days_ago
    return res

def extract_info(days):        
    limit_date = time_limit(days)
    date_run= now = datetime.datetime.now()
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')
    divs = soup.find_all('div', class_="listing-title")
    span = soup.find_all('span', class_="captions-field posted-ico")
    info_list= []
    
    for div, date_span in zip(divs, span):
        date = date_span.text.strip()
        date_format = datetime.datetime.strptime(date, "%d/%m/%Y").date()
        if limit_date is None or date_format >= limit_date:                   
            # the second anchor has the data I need (link and title)
            second_a = div.a.next_sibling.next_sibling
            title = second_a.text
            link = second_a['href']
            info_list.append([date_run, title, link, date])
    return info_list 
  
def find_next_file_index():
    i = 1
    while os.path.exists(f"jobs{i}.txt"):
        i += 1
    return i

def save_info(job_list):
    i = find_next_file_index()
    name = f"jobs{i}.txt"
    with open(name, "w") as file:
        for job in job_list:
            file.write("Running now: {}\nJob Title: {}\nLink: {}\nDate: {}\n".format(job[0], job[1], job[2], job[3]))
            file.write("\n")         
    print ("File name {} correctly saved".format(name))
    return name   

def main():
###### Create the GUI window  ########
    sg.theme('DarkAmber') 
    layout = [
        [sg.Text('App to extract data from www.empleosit.com.ar', font=("Helvetica", 16), text_color='pink')],
        [sg.Text('Jobs published how many days ago?', font=("Helvetica", 10), text_color='white'), sg.InputText(key='-DAYS-', size=(15, 1))],
        [sg.Text('Do you wish to save this information in a file? Yes/No:', font=("Helvetica", 10), text_color='white'), sg.InputText(key='-SAVE-', size=(5, 1))],  
        [sg.Button('Ok', size=(10, 1), button_color=('black', 'pink')), sg.Button('Cancel', size=(10, 1),button_color=('black', 'pink'))],
    ]
    window = sg.Window('Finding Jobs Bot', layout, element_justification='c')

    # Event Loop to process "events" and get the "values" of the inputs
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Cancel': 
            break

        days = int(values['-DAYS-'])  
        save_info_option = values['-SAVE-'].lower() in ["yes", "y"]  

        if event == 'Ok':
            job_list = extract_info(days)

            output_text = ''
            for job in job_list:
                output_text += f"{'Running now:':<15}{job[0]}\n{'Job Title:':<15}{job[1]}\n{'Link:':<15}{job[2]}\n{'Date:':<15}{job[3]}\n\n"

            sg.popup(output_text, title='Job Information', font=("Helvetica", 12), text_color='white', grab_anywhere=True)
            name= save_info(job_list)
            if save_info_option:
                save_info(job_list)
                sg.popup("Information saved to this file:", name, title='Info', font=("Helvetica", 12), text_color='white')
            else:
                sg.popup("Information not saved.", title='Info', font=("Helvetica", 12), text_color='black')
            
            time.sleep(2)  # Show the information in the GUI for 2 seconds
            window['-DAYS-'].update('') 
            window['-SAVE-'].update('') 
            print("=" * 60)
            print("Waiting 6 hours...")
            print("=" * 60)
            time.sleep(21600)  # 6 hours in seconds

    window.close()

if __name__ == "__main__":
    main()