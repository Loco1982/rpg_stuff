#The Marshal starts the first game session with a pot of 10 blue,
# 25 red, and 50 white chips.

import random

remaining_white = 50 - int(input("¿Cuántas fichas blancas tienen los jugadores? "))
remaining_red = 25 - int(input("¿Cuántas fichas rojas tienen los jugadores? "))
remaining_blue = 10 - int(input("¿Cuántas fichas azules tienen los jugadores? "))

def select_chips(white, red, blue):
  range = white + red + blue
  selection = random.randint(1, range)
  white_plus_red = white + red

  print("La selection es", selection, "y el range es", range)
  if selection == 0:
    print("No hay mas fichas")
  else:
    global remaining_white
    if selection <= remaining_white:
        print("1 ficha blanca")
        remaining_white = remaining_white - 1
        print("Quedan", remaining_white, "fichas blancas")
        print()
    else:
      global remaining_red
      if selection <= white_plus_red:
        print("1 ficha roja")
        remaining_red = remaining_red - 1
        print("Quedan", remaining_red, "fichas rojas")
        print()
      else:
        print("1 ficha azul")
        global remaining_blue
        remaining_blue = remaining_blue - 1
        print("Quedan", remaining_blue, "fichas azules")
        print()

def menu():
  print()
  print("¿Qué querés hacer?")
  print("1. Agarrar fichas iniciales")
  print("2. Agarrar fichas al azar")
  print("3. Ver fichas totales")
  print("0. Salir")
  print()
  selection = input()
  return selection

def main():
    selection = menu()
    while selection != "0": 
        if selection == "1":
            i = 0
            while i in range(3):
                select_chips(remaining_white, remaining_red, remaining_blue)
                i = i + 1
            selection = menu()
        else:
            if selection == "2":
                print("¿Cuántas random chips?")
                how_many_rolls = int(input())
                i = 0
                while i in range(how_many_rolls):
                    select_chips(remaining_white, remaining_red, remaining_blue)
                    i = i + 1
                selection = menu()
            else:
               print()
               print("Quedan", remaining_white, "fichas blancas")
               print("Quedan", remaining_red, "fichas rojas")
               print("Quedan", remaining_blue, "fichas azules.")
               print()
               selection = menu()
main()