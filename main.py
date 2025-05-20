import os

for name in os.listdir("."):
  if not name.endswith(".typ"): continue
  if name.startswith("2025"): continue
  if name.startswith("ex"): continue
  os.system(f"git mv {name} {name[6:10]}-{name[3:5]}-{name[0:2]}{name[10:]}")