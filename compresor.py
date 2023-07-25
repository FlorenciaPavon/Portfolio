from PIL import Image
import os
import PySimpleGUI as sg

sg.theme('DarkAmber')
layout = [
    [sg.Text('IMAGE COMPRESSOR - .jpg .jpeg .png -', font=("Helvetica", 16), text_color='pink')],
    [sg.Button('Choose Origin Folder', size=(18, 1), button_color=('black', 'pink')), sg.InputText(key='-FOLDER-', size=(50, 1))],
    [sg.Text('Save compressed images to:', font=("Helvetica", 10), text_color='white'), sg.InputText(key='-SAVE-', size=(50, 1)), sg.FolderBrowse()],
    [sg.Button('Compress', size=(10, 1), button_color=('black', 'pink')), sg.Button('Cancel', size=(10, 1), button_color=('black', 'pink'))],
]

window = sg.Window('Image Compressor', layout, element_justification='c')

def compress_images(origin_folder, save_folder):
    compressed_files = []
    for filename in os.listdir(origin_folder):
        name, extension = os.path.splitext(filename)
        if extension.lower() in [".jpg", ".jpeg", ".png"]:
            image = Image.open(os.path.join(origin_folder, filename))
            compressed_path = os.path.join(save_folder, "compressed_" + filename)
            image.save(compressed_path, optimized=True, quality=60)
            compressed_files.append(compressed_path)
            print(name + ": " + extension)
    return compressed_files

def main():
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Cancel':
            break

        if event == 'Choose Origin Folder':
            origin_folder = sg.popup_get_folder("Select the folder containing the images to compress", title="Select Origin Folder")

            
            if origin_folder:
                window['-FOLDER-'].update(origin_folder)

        elif event == 'Compress':
            origin_folder = str(values['-FOLDER-'])
            save_folder = str(values['-SAVE-'])

            if not origin_folder or not save_folder:
                sg.popup("Please provide both origin and save folders!", title='Error', font=("Helvetica", 12), text_color='white', grab_anywhere=True)
            else:
                compressed_files = compress_images(origin_folder, save_folder)
                if compressed_files:
                    compressed_files_str = '\n'.join(compressed_files)
                    sg.popup(f"Files compressed! Check the following folder(s):\n\n{compressed_files_str}", title='Info', font=("Helvetica", 12), text_color='white', grab_anywhere=True)

    window.close()

if __name__ == '__main__':
    main()



