import pandas as pd
import streamlit as st
import altair as alt
from PIL import Image

#Title

image = Image.open('dna.jpg')

st.image(image, use_column_width=True)

st.write ("""
# :violet[DNA count app]
                    
### :violet[Let's see how many nucleotides of each type there are!!]
"""
)

example = st.expander('Ejample Inputs')
example.markdown("example inputs in nucleotides.txt file")


st.header ('(INPUT) Enter DNA Sequence:')

sequence_input = "> Enter the DNA sequence query...\nAGCTGATCGATCGATCGATC\nTTAGCCGTTAGCGTACGCTA\nCAGGTACATGCATGATGCTA\nGCTATCGTAGCTCGATCGTA\nATCGATCGATCGTAGCTAGC \nCGTAGCTAGCTAGCTAGCTA"

sequence = st.text_area("Sequence input", sequence_input, height=250)
sequence = sequence.splitlines()
sequence = sequence[1:]
sequence = ''.join(sequence)

st.header('Your sequence input is: ')
sequence

st.header('(Output) Nucleotide Count: ')

##Dictionary to group the nucleotides

def nucleotides_group(seq):
    group = dict ([
                ('A', seq.count('A')),
                ('T', seq.count ('T')),
                ('C', seq.count ('C')),
                ('G', seq.count ('G')),
                ])
    return group

name = nucleotides_group(sequence)

##dispay in text
st.subheader('This is what you got: ')
st.write ('There are: ')
st.write (str(name['A']) + ' Adenine (A)')
st.write (str(name['T']) + ' Thymine (T)')
st.write (str(name['C']) + ' Cytosine (C)')
st.write (str(name['G']) + ' Guanine (G)')

##display in dataframe

st.subheader('Results in Table')
df = pd.DataFrame.from_dict(name, orient='index')
df = df.rename ({0:'Count'}, axis='columns')
df.reset_index(inplace=True)
df = df.rename (columns={'index': 'Nucleotide'})
st.write(df)

#used Altair to modify the bars width

st.subheader ('Bar Chart')
p = alt.Chart(df).mark_bar().encode(
    x = 'Nucleotide',
    y = 'Count'
)

p = p.properties (
    width = alt.Step(60)
)

st.write(p)