import os

for name in os.listdir("."):
  if not name.endswith(".typ"): continue
  os.system(f"typst compile {name} --font-path fonts")