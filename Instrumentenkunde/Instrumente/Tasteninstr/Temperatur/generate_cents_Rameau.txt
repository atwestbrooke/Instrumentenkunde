import numpy as np
import pandas as pd

# Constants
et_semitone = 100.0
fifth_et = 700.0
pure_fifth = 701.955  # 3:2 ratio
syntonic_comma = 21.506
quarter_comma = syntonic_comma / 4
sixth_comma = syntonic_comma / 6

# Fifth structure:
# Bb–F–C–G–D–A–E–B: all -1/4 comma
# B–F#: pure
# F#–C#: pure
# C#–G#: -1/6 comma
# D#/Eb placed so that Bb–Eb and G#–D# are widened equally from pure

note_positions = {"B♭": 0.0}
current_note = "B♭"
current_cents = 0.0
for next_note in ["F", "C", "G", "D", "A", "E", "B"]:
    current_cents += fifth_et - quarter_comma
    note_positions[next_note] = current_cents

note_positions["F♯"] = note_positions["B"] + pure_fifth
note_positions["C♯"] = note_positions["F♯"] + pure_fifth
note_positions["G♯"] = note_positions["C♯"] + fifth_et - sixth_comma

# Symmetrical positioning of Eb/D#
e_flat_val = (note_positions["B♭"] + pure_fifth + note_positions["G♯"] + pure_fifth) / 2
note_positions["E♭"] = e_flat_val
note_positions["D♯"] = e_flat_val  # Enharmonic

# Align C = 0
c_et_pos = note_positions["C"]
note_deviations = {note: round(pos - c_et_pos, 4) for note, pos in note_positions.items()}

# Fill in chromatic order
chromatic_order = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
enharmonics = {"C♯": "C♯", "D♯": "D♯", "E♭": "D♯", "F♯": "F♯", "G♯": "G♯", "A♯": "B♭", "B♭": "B♭"}

# Map enharmonics
for enh_note, base_note in enharmonics.items():
    if enh_note not in note_deviations and base_note in note_deviations:
        note_deviations[enh_note] = note_deviations[base_note]

# Output
data = [(note, note_deviations.get(note, None)) for note in chromatic_order]
df = pd.DataFrame(data, columns=["Note", "Deviation from ET (cents)"])
print(df)

