defmodule RandomChanges do

  @set [
    {"Escrutador de Chak", true},
    {"Roger Boothe", false},
    {"Tommy Jackwell", false},
    {"Hernández/PAF Erni", true},
    {"Eli Parker", true},
    {"Joe Martínez", true},
    {"Roper Jones", true},
    {"Elton Bradbury", true},
    {"Brit Hammer", true},
    {"Mikio Chiyo", true},
    {"Yannick Doerr", false},
    {"Ross Geoff Evered", true},
    {"Dudley Johnson", true},
    {"Bruria Segalowitz", false},
    {"Jack Hughman", false},
    {"Cain Smith", false},
    {"Steve Griswold", false},
    {"Hans Grüber", true},
    {"Elkia M'bokolo", true},
    {"Jia Zhang Ke", true},
    {"German Gumbo", false},
    {"Susan Parker", true},
    {"Brad Parker", false},
    {"Trisha Oggay", false},
    {"Maggie Shuman", true},
    {"Ibrahima Dawara", true},
    {"Johnny Sinclair", true},
    {"Richard Bayless, BIPN Head Honcho", true},
    {"Gilbert Milner, BIPN alien specialist", true},
    {"Ida Davidson, BIPN clerk", true},
    {"Robert Windsor, Committee Headmaster", true},
    {"Orwell Marshal, bad writer", true},
  ]

  # Public functions

  def main({character, alive}) do
    status = alive?(character, alive, Enum.random(1..100))
    changes = changes?(Enum.random(1..100))
    "#{status} #{changes}"
  end

  def couple_chars() do
    result = inspect(Enum.map(@set, fn x -> main(x) end), pretty: true)
    save_file = String.trim(IO.gets("Save file name:\n"))
    File.write("saves//#{save_file}", result)
  end

  # Private functions

  # Test if a character is alive sorting if it was dead or alive in main timeline
  defp alive?(character, true, integer) do
    if integer >= 16 do
      "#{character} está vivo."
    else
      "#{character} está muerto."
    end
  end

  defp alive?(character, false, integer) do
    if integer >= 16 do
      "#{character} está muerto."
    else
      "#{character} está vivo."
    end
  end

  # Receives a random number from 1..100 and checks for changes
  defp changes?(integer) when integer <= 10, do: "Sin cambios."
  defp changes?(integer) when integer >= 11 and integer <= 20, do: aesthetic(Enum.random(1..100))
  defp changes?(integer) when integer >= 21 and integer <= 30, do: "Cambia trasfondo social."
  defp changes?(integer) when integer >= 31 and integer <= 40, do: gender(Enum.random(1..100), Enum.random(1..100))
  defp changes?(integer) when integer >= 41 and integer <= 50, do: "Cambia estado civil."
  defp changes?(integer) when integer >= 51 and integer <= 60, do: "Cambia detalle de la historia: Tiene un nuevo enemigo."
  defp changes?(integer) when integer >= 61 and integer <= 70, do: "Cambia detalle de la historia: Tiene un nuevo aliado."
  defp changes?(integer) when integer >= 71 and integer <= 80, do: "Nueva complicación de personalidad."
  defp changes?(integer) when integer >= 81 and integer <= 90, do: "Cambia su sexo de nacimiento."
  defp changes?(integer) when integer >= 91, do: changes?(Enum.random(1..100), Enum.random(1..100))

  # Function to handle repeated dice throws in changes? table
  defp changes?(integer_1, integer_2) do
    first_value = changes?(integer_1)
    second_value = changes?(integer_2)
    "#{first_value} #{second_value}"
  end

  # Function to handle aesthetic changes
  defp aesthetic(integer) when integer <= 15, do: "Parche en el ojo(pierde un ojo pero gana en estilo)."
  defp aesthetic(integer) when integer >= 16 and integer <= 30, do: "Adopta el estilo de una tribu urbana(metalero, punk, hippster, etc)."
  defp aesthetic(integer) when integer >= 31 and integer <= 45, do: "Cambia radicalmente el estilo del pelo."
  defp aesthetic(integer) when integer >= 46 and integer <= 60, do: "Usa un artículo en la cabeza(pañuelo, sombrero, gorra)."
  defp aesthetic(integer) when integer >= 61 and integer <= 75, do: "Tiene un tatuaje visible u otra modificación significativa en la piel."
  defp aesthetic(integer) when integer >= 76 and integer <= 90, do: "Cambia contextura física (más petizo, más alto, gordo, flaco)."
  defp aesthetic(integer) when integer >= 91, do: "Cambia fenotipo."

  # Function to handle gender changes
  defp gender(gender, sex_orientation) do
    new_gender = new_gender(gender)
    new_sex_orientation = sex_orientation(sex_orientation)
    "Es #{new_gender} y su orientación sexual es #{new_sex_orientation}."
  end

  # Function to handle new gender
  defp new_gender(gender) when gender <= 50, do: "cis"
  defp new_gender(gender) when gender >= 51 and gender <= 70, do: "transgénero"
  defp new_gender(gender) when gender >= 71 and gender <= 90, do: "transexual"
  defp new_gender(gender) when gender >= 91 and gender <= 95, do: "género fluido (roleate esa mandarina)"
  defp new_gender(gender) when gender >= 96, do: "agénero"

  # Function to handle new sex orientation
  defp sex_orientation(sex_orientation) when sex_orientation <= 40, do: "heterosexual"
  defp sex_orientation(sex_orientation) when sex_orientation >= 41 and sex_orientation <= 70 , do: "homosexual"
  defp sex_orientation(sex_orientation) when sex_orientation >= 71 and sex_orientation <= 90 , do: "bisexual"
  defp sex_orientation(sex_orientation) when sex_orientation >= 91 and sex_orientation <= 95 , do: "pansexual"
  defp sex_orientation(sex_orientation) when sex_orientation >= 96 and sex_orientation <= 99 , do: "asexual"
  defp sex_orientation(sex_orientation) when sex_orientation == 100, do: "Furry"

end
